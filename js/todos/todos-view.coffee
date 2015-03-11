vm = require('./todo-view-model')

module.exports = ->
  m '#app-section', [
    m 'input',
      onchange: m.withAttr('value', vm.description)
      value: vm.description()
    m 'button', onclick: vm.add, "Add"
    m 'table', [
      vm.list.map (task, index) ->
        m 'tr', {className: "row"}, [
          m 'label', [
            m 'td', [
              m 'input[type=checkbox]',
                onclick: m.withAttr('checked', task.done)
                checked: task.done()
            ]
            m 'td', {
              className: if task.done() then "todo done" else "todo"
            }, task.description()
          ]
        ]
    ]
  ]
