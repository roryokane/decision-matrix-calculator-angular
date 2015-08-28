app = angular.module('decisionMatrixCalculator', [])

defaultChoices = [{
  name: "Left"
}, {
  name: "Right"
}]

app.controller 'ChoicesController', ->
  @choices = defaultChoices
  @defaultNewChoice = {name: ""}
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
  @defaultNewAttribute = {name: "", relativeWeight: 1}
  return

app.directive 'editableNames', ->
  return {
    restrict: 'E'
    templateUrl: 'editable-names.html'
    scope: {
      items: '=ngModel'
      defaultNewItem: '='
    }
    link: (scope, iElement, iAttrs) ->
      scope.add = ->
        newItem = Object.create(scope.defaultNewItem)
        scope.items.push(newItem)
        return
      scope.delete = (index) ->
        scope.items.splice(index, 1)
        return
      return
  }

app.directive 'attributeWeights', ->
  return {
    restrict: 'E'
    templateUrl: 'attribute-weights.html'
  }

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
