# models
exports.Choice = (data) ->
  @name = m.prop(data.name)
  return

exports.ChoiceList = Array

exports.Attribute = (data) ->
  @name = m.prop(data.name)
  @relativeWeight = m.prop(data.relativeWeight)
  return

exports.AttributeList = Array

exports.Matrix = (data) ->
  # implement this later
  return


# view-model
exports.vm = do ->
  vm = {}
  
  vm.init = ->
    vm.list = new exports.ChoiceList
    vm.list.push new exports.Choice(name: "Left")
    vm.list.push new exports.Choice(name: "Right")
    
    vm.add = ->
      vm.list.push new exports.Choice(name = "")
      return
    return
  
  return vm

# controller
exports.controller = ->
  exports.vm.init()
  return

# view
exports.view = (ctrl) ->
  m '#app-section', [
    m 'h1', "Decision Matrix Calculator"
    m 'h2', "Choices"
    m 'ul.choices', [
      exports.vm.list.map (choice) ->
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
