_ = require('lodash')

module.exports = ->
  app = angular.module('dmcAttributeWeights', [])
  
  app.directive 'attributeWeights', ->
    return {
      restrict: 'E'
      templateUrl: 'partials/attribute-weights.html'
    }
  
  app.directive 'attributeWeightsEditor', ->
    return {
      restrict: 'E'
      templateUrl: 'partials/attribute-weights-editor.html'
      controller: ->
        @percentageWeight = (attribute, allAttributes) ->
          return attribute.getAbsoluteWeight(allAttributes) * 100
        
        return
      controllerAs: 'weightsCtrl'
    }
  
  app.directive 'attributeWeightSlider', ->
    return {
      restrict: 'E'
      templateUrl: 'partials/attribute-weight-slider.html'
      require: 'ngModel'
      scope: {
        granularity: '='
      }
      link: (scope, element, attrs, ngModelCtrl) ->
        $inputElement = element.children('input')
        
        $inputElement.prop('step', 1 / scope.granularity)
        
        $inputElement.on 'input', (event) ->
          newValue = $inputElement.prop('value')
          ngModelCtrl.$setViewValue(newValue)
          return
        
        ngModelCtrl.$render = ->
          $inputElement.prop('value', ngModelCtrl.$viewValue)
          return
        
        return
    }
  
  return
