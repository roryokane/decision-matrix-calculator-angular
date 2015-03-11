vm = require('./dmc-view-model')

module.exports = (ctrl) ->
  m '#app-section', [
    m 'h1', "Decision Matrix Calculator"
    m 'h2', "Choices"
    m 'ul.choices', [
      vm.list.map (choice) ->
        m 'li', [
          m 'input[type=text]', value: choice.name()
          m 'input.delete[type=button][value="Delete"]'
        ]
      .concat m 'li', [
        m 'input.add[type=button][value="Add"]'
      ]
    ]
    m 'h2', "Attributes"
    m 'ul.attributes', [
      "TODO use the same list widget with a different data source"
    ]
  ]
