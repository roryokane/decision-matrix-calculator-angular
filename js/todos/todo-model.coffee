#the Todo class has two properties
module.exports = (data) ->
  @description = m.prop(data.description)
  @done = m.prop(false)
  return
