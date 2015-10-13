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
  
  # The below might be the right design.
  # But maybe an editor that depends on multiple values should be a
  # controller or service or something, instead of
  # something that uses ngModel.
  # The problem with this is that it automatically watches only the given model, but it should be watching all attributes’ relativeWeights.
  app.directive 'attributeWeightSlider', ->
    return {
      restrict: 'E'
      templateUrl: 'partials/attribute-weight-slider.html'
      require: 'ngModel'
      scope: {
        granularity: '='
      }
      link: (scope, element, attrs, ngModelCtrl) ->
        scope.stepSize = 1 / scope.granularity
        
        fromAbsoluteWeight = (absoluteWeight) ->
          console.log "slider converting fromAbsoluteWeight", absoluteWeight
          return absoluteWeight
        ngModelCtrl.$formatters.push(fromAbsoluteWeight)
        
        toAbsoluteWeight = (sliderValue) ->
          console.log "slider converting toAbsoluteWeight from", sliderValue
          return sliderValue
        ngModelCtrl.$parsers.push(toAbsoluteWeight)
        
        scope.$watch 'absoluteWeight', (newValue, oldValue) ->
          ngModelCtrl.$setViewValue(newValue)
          console.log("updating slider view from changed absoluteWeight", scope.absoluteWeight)
          return
        
        # On page load, the value is being rounded up to the nearest whole number,
        # making it 1 instead of its default 0.5.
        # Why does that happen? How can I stop it?
        # I found part of the reason. It only happens when the template uses a variable for step, `stepSize`.
        # So when the value is first set by ngModel, at that time, the step is its default 1.
        # Only after that does stepSize get set.
        # Why does it get initialized in that order?
        # I just probably have to move the step from the post-link stage to within the compile stage.
        # Just look in that book I downloaded about how and when to use link and compile.
        #ngModelCtrl.$setViewValue(scope.absoluteWeight)
        
        ngModelCtrl.$render = ->
          console.log("rendering slider with $viewValue", ngModelCtrl.$viewValue)
          if ngModelCtrl.$viewValue
            scope.absoluteWeight = ngModelCtrl.$viewValue
          else
            scope.absoluteWeight = 0
          console.log("rendered slider so scope.absoluteWeight is", scope.absoluteWeight)
          return
        
        # TODO tell all other sliders to update when one slider is changed,
        # even though their relativeWeights stay the same
        # What I really want is watching multiple values. Look for the standard way
        # to do something equivalent to that without sacrificing performance.
        
        # But first, fix that the slider value doesn’t change when attribute.relativeWeight changes.
        # Nor does dragging the slider change the relativeWeight. It doesn’t even run
        #  the input parser from the slider value toAbsoluteWeight.
        # Is ngModel set up wrong? I’m passing an `ng-model` attribute…
        # Do I have to explicitly change the `value` of the `input` or something?
        return
    }
  
  return
