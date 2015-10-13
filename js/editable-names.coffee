module.exports = ->
  app = angular.module('editableNames', [])
  
  app.directive 'editableNames', ->
    return {
      restrict: 'E'
      templateUrl: 'partials/editable-names.html'
      scope: {
        items: '=ngModel'
        newItemFactory: '='
      }
      link: (scope, element, attrs) ->
        scope.add = ->
          newItem = scope.newItemFactory()
          scope.items.push(newItem)
          return
        scope.delete = (index) ->
          scope.items.splice(index, 1)
          return
        return
    }
  
  return
