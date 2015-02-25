window.dmc = window.dmc || {}
dmc = window.dmc


# models
dmc.Choice = (data) ->
  @name = m.prop(data.name)
  return

dmc.ChoiceList = Array

dmc.Attribute = (data) ->
  @name = m.prop(data.name)
  @relativeWeight = m.prop(data.relativeWeight)
  return

dmc.AttributeList = Array

dmc.Matrix = (data) ->
  # implement this later
  return


# view-model
dmc.vm = do ->
  vm = {}
  
  vm.init = ->
    vm.list = new dmc.ChoiceList
    vm.list.push new dmc.Choice(name: "Left")
    vm.list.push new dmc.Choice(name: "Right")
    
    vm.add = ->
      vm.list.push new dmc.Choice(name = "")
      return
    return
  
  return vm

# controller
dmc.controller = ->
  dmc.vm.init()
  return

# view
dmc.view = (ctrl) ->
  m '#app-section', [
    m 'h1', "Decision Matrix Calculator"
    m 'h2', "Choices"
    m 'ul.choices', [
      dmc.vm.list.map (choice) ->
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
