angular = require('angular')
_ = require('lodash')
app = angular.module('decisionMatrixCalculator', ['dmcAttributeWeights', 'dmcMatrix', 'editableNames'])
do require('./attribute-weights-section')
do require('./matrix')
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

defaultChoiceAttributeRatings = [
  [2, 4]
  [1, 4]
]


app.controller 'DMCController', ($scope) ->
  @choices                = defaultChoices
  @attributes             = defaultAttributes
  @choiceAttributeRatings = defaultChoiceAttributeRatings
  return


app.controller 'ChoicesController', ($scope) ->
  @choices = $scope.dmcCtrl.choices
  
  @newChoiceFactory = ->
    Object.create({name: ""})
  
  return


app.controller 'AttributesController', ($scope) ->
  @attributes = $scope.dmcCtrl.attributes
  
  @newAttributeFactory = ->
    new WeightedAttribute({name: ""})
  
  @normalizeWeights = ->
    threshholdForNormalization = 10
    while _.all(@attributes, (attribute) -> attribute.relativeWeight > threshholdForNormalization)
      divideAllWeightsBy(threshholdForNormalization)
    while _.all(@attributes, (attribute) -> attribute.relativeWeight < 1/threshholdForNormalization && attribute.relativeWeight > 0)
      divideAllWeightsBy(1/threshholdForNormalization)
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


# later, for organization, I can do this:
#require('./ChoicesController')
