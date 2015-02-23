window.todo = window.todo || {}
todo = window.todo

#the view-model tracks a running list of todos,
#stores a description for new todos before they are created
#and takes care of the logic surrounding when adding is permitted
#and clearing the input after adding a todo to the list
todo.vm = do ->
  vm = {}

  vm.init = ->
    #a running list of todos
    vm.list = new (todo.TodoList)
    vm.list.push new (todo.Todo)(description: 'example todo')
    
    #a slot to store the name of a new todo before it is created
    vm.description = m.prop('')
    
    #adds a todo to the list, and clears the description field for user convenience
    vm.add = ->
      if vm.description()
        vm.list.push new (todo.Todo)(description: vm.description())
        vm.description ''
      return
    return
  
  return vm
