exports.Choice = (data) ->
  @name = m.prop(data.name)
  return

exports.ChoiceList = Array

exports.Attribute = (data) ->
  @name = m.prop(data.name)
  @relativeWeight = m.prop(data.relativeWeight)
  return

exports.AttributeList = Array

exports.Matrix = (data) ->
  # implement this later
  return
