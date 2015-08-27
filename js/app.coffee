app = angular.module('dmc', [])

defaultChoices = [{
  name: "Left"
}, {
  name: "Right"
}]

app.controller 'ChoicesController', ->
  @choices = defaultChoices
  defaultNewChoice = {name: ""}
  @add = ->
    @choices.push(defaultNewChoice)
    return
  @delete = (index) ->
    @choices.splice(index, 1)
    return
  return

defaultAttributes = [{
  name: "Price"
  relativeWeight: 1
}, {
  name: "Quality"
  relativeWeight: 1
}]

app.controller 'AttributesController', ->
  @attributes = defaultAttributes
  defaultNewAttribute = {name: "", relativeWeight: 1}
  @add = ->
    @attributes.push(defaultNewAttribute)
    return
  @delete = (index) ->
    @attributes.splice(index, 1)
    return
  return

app.controller 'AttributeWeightsController', ->
  return

app.controller 'ShowHideController', ->
  @show = true
  @toggle = ->
    @show = !@show
    return
  @showHideLabel = ->
    return if @show then "hide" else "show"
  return

defaultChoiceAttributeRatings = [
  [2, 4]
  [1, 4]
]

# later, for organization, I can do this:
#require('./ChoicesController')
