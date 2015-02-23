document.todo = document.todo || {}
todo = document.todo

todo.view = ->
  m 'html', [
    m 'head', [
      m 'link[rel=stylesheet]', href: 'style/normalize.css'
      m 'link[rel=stylesheet]', href: 'style/style.css'
    ]
    m 'body', [
      m 'input',
        onchange: m.withAttr('value', todo.vm.description)
        value: todo.vm.description()
      m 'button', onclick: todo.vm.add, "Add"
      m 'table', [
        todo.vm.list.map (task, index) ->
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
  ]
