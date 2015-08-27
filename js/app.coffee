app = angular.module('dmc', [])

app.controller 'ChoicesController', ->
  @choices = choices
  @addChoice = ->
    choices.push({name: ""})
    return
  @deleteChoice = (choice) ->
    # somehow find that choice in choices
    # without a linear search
    foundIndex = 0 # TODO
    choices.splice(foundIndex, 1)
    return
  return

app.controller 'AttributesController', ->
  @attributes = attributes
  return

#app.controller 'EditableNamesController', ->
#  return

app.controller 'ShowHideController', ->
  @show = true
  @toggle = ->
    @show = !@show
    return
  @showHideLabel = ->
    return if @show then "hide" else "show"
  return

app.controller 'AttributeWeightsController', ->
  return

choices = [{
  name: "Left"
}, {
  name: "Right"
}]

attributes = [{
  name: "Price"
  relativeWeight: 1
}, {
  name: "Quality"
  relativeWeight: 1
}]

choiceAttributeRatings = [
  [2, 4]
  [1, 4]
]

#require('./ChoicesController')
