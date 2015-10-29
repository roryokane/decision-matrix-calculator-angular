_ = require('lodash')

module.exports = ->
  app = angular.module('dmcMatrix', [])
  
  app.directive 'choiceAttributeMatrix', ->
    return {
      restrict: 'E'
      templateUrl: 'partials/matrix.html'
      scope: {
        choices: '='
        attributes: '='
        ratings: '='
      }
      link: (scope, element, attrs) ->
        scope.choicesAreRows = true
    }
  
  return
