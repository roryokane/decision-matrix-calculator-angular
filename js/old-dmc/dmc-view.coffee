vm = require('./dmc-view-model')

module.exports = (ctrl) ->
  m '#app-section', [
    m 'h1', "Decision Matrix Calculator"
    m 'h2', "Choices"
    vm.choiceNameList.view(ctrl, 'choices')
    m 'h2', "Attributes"
    vm.attributeNameList.view(ctrl, 'attributes')
  ]
