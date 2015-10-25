angular = require('angular')
_ = require('lodash')
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
  
  @normalizeWeights = ->
    weights = _.pluck(@attributes, 'relativeWeight')
    
    if _.all(weights, (weight) -> weight > 1)
      divideAllWeightsBy(_.min(weights))
    else if _.all(weights, (weight) -> weight < 1)
      divideAllWeightsBy(_.max(weights))
    
    return
  
  divideAllWeightsBy = (factor) =>
    @attributes.forEach (attribute) ->
      attribute.relativeWeight /= factor
  
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
