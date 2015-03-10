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
window.todo = window.todo || {}
todo = window.todo

# a test case to debug source maps with
missingVar.noSuchField = "an error"

# initialize the application
element = document.getElementById("app-section")
#m.module(element, {controller: todo.controller, view: todo.view});
m.module(element, {controller: dmc.controller, view: dmc.view});
