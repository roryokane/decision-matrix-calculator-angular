module.exports = ->
	app = angular.module('dmcAttributeWeights', [])

	app.directive 'attributeWeights', ->
		return {
			restrict: 'E'
			templateUrl: 'attribute-weights.html'
		}

	app.directive 'attributeWeightsEditor', ->
		return {
			restrict: 'E'
			templateUrl: 'attribute-weights-editor.html'
			controller: ->
				@percentageWeight = (attribute, allAttributes) ->
					_ = require('lodash')
					totalRelativeWeight = _(allAttributes).pluck('relativeWeight').sum()
					return attribute.relativeWeight / totalRelativeWeight * 100
				
				@sliderWeight = @percentageWeight
				# Works because the default slider is from 0 to 100.
				# I will increase the slider scale later, and have to change this.
				
				return
			controllerAs: 'weightsCtrl'
		}
