window.todo = window.todo || {}
todo = window.todo

#the controller defines what part of the model is relevant for the current page
#in our case, there's only one view-model that handles everything

todo.controller = ->
  todo.vm.init()
  return
