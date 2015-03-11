#the view-model tracks a running list of todos,
#stores a description for new todos before they are created
#and takes care of the logic surrounding when adding is permitted
#and clearing the input after adding a todo to the list

Todo = require('./todo-model')
TodoList = require('./todo-list-model')

vm = {}

vm.init = ->
  #a running list of todos
  vm.list = new (TodoList)
  vm.list.push new (Todo)(description: 'example todo')
  
  #a slot to store the name of a new todo before it is created
  vm.description = m.prop('')
  
  #adds a todo to the list, and clears the description field for user convenience
  vm.add = ->
    if vm.description()
      vm.list.push new (Todo)(description: vm.description())
      vm.description ''
    return
  return

module.exports = vm
