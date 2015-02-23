document.todo = document.todo || {}
todo = document.todo

#for simplicity, we use this module to namespace the model classes

#the Todo class has two properties
todo.Todo = (data) ->
  @description = m.prop(data.description)
  @done = m.prop(false)
  return
