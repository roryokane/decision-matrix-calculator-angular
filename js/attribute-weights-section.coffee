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
        
        #@sliderWeight = (attribute, allAttributes) ->
        #  return fractionalWeight(attribute, allAttributes) * 100
        # Works because the default slider is from 0 to 100.
        # I will increase the slider scale later, and have to change this.
        
        # I have to pass in required values in a constructor somehow
        # No, using defineProperty won’t work after all.
        # It won’t support accepting the specific attribute as an argument.
        # And I can’t define separate properties for every attribute.
        # Will I have to go with $watch after all?
        #Object.defineProperty @prototype, 'sliderWeight',
        #  get: ->
        #    return fractionalWeight(attribute, allAttributes) * 100
        #  set: (newVal) ->
        #    # set attribute.relativeWeight
        
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
