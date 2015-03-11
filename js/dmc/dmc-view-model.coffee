models = require('./dmc-models')

vm = {}

vm.init = ->
  vm.list = new models.ChoiceList
  vm.list.push new models.Choice(name: "Left")
  vm.list.push new models.Choice(name: "Right")
  
  vm.add = ->
    vm.list.push new models.Choice(name = "")
    return
  return

module.exports = vm
