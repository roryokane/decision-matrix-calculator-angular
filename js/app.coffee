#app = app || {}
#
#m.module(document, {controller: todo.controller, view: todo.view});
#
#m.route.mode = 'hash'
#m.route(document.getElementById('todoapp'), '/', {
#    '/': app,
#    '/:filter': app
#})


# initialize the application
element = document.getElementById("app-section")

#todoModuleParts =
  #controller: require('./todos/todo-controller')
  #view: require('./todos/todos-view')
#m.module(element, todoModuleParts);

dmc = require('./dmc/everything-for-now')
m.module(element, {controller: dmc.controller, view: dmc.view});
