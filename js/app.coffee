#app = app || {}
#
#m.module(document, {controller: todo.controller, view: todo.view});
#
#m.route.mode = 'hash'
#m.route(document.getElementById('todoapp'), '/', {
#    '/': app,
#    '/:filter': app
#})


#this application only has one module: todo
document.todo = document.todo || {}
todo = document.todo

# initialize the application
element = document.getElementById("app-section")
m.module(element, {controller: todo.controller, view: todo.view});
