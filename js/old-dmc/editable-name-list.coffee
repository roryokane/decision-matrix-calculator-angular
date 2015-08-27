module.exports = ->
  models = {}

  models.Item = (data) ->
    @name = m.prop(data.name)
    return

  models.ItemList = Array


  vm = {}

  vm.init = ->
    vm.list = new models.ItemList
    vm.list.push new models.Item(name: "Item One")
    vm.list.push new models.Item(name: "Item Two")
    
    vm.add = ->
      vm.list.push new models.Item(name = "")
      return
    return


  controller = ->
    vm.init()
    return


  view = (ctrl, itemListClassName) ->
    m 'ul', {className: itemListClassName}, [
      vm.list.map (item) ->
        m 'li', [
          m 'input[type=text]', value: item.name()
          m 'input.delete[type=button][value="Delete"]'
        ]
      .concat m 'li', [
        m 'input.add[type=button][value="Add"]'
      ]
    ]
  
  
  editableNameList =
    models: models
    vm: vm
    controller: controller
    view: view
  return editableNameList
