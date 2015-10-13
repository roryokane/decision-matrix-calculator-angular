angular = require('angular')
app = angular.module('decisionMatrixCalculator', ['dmcAttributeWeights', 'editableNames'])
do require('./attribute-weights-section')
do require('./editable-names')
WeightedAttribute = require('./weighted-attribute')

defaultChoices = [{
  name: "Left"
}, {
  name: "Right"
}]

defaultAttributes = [
  new WeightedAttribute {name: "Price"}
  new WeightedAttribute {name: "Quality"}
]

app.controller 'ChoicesController', ->
  @choices = defaultChoices
  @newChoiceFactory = ->
    Object.create({name: ""})
  return

app.controller 'AttributesController', ->
  @attributes = defaultAttributes
  @newAttributeFactory = ->
    new WeightedAttribute({name: ""})
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
