_ = require('lodash')

class WeightedAttribute
  constructor: (properties) ->
    propsToAssign = _(properties)
      .pick 'name', 'relativeWeight'
      .defaults {relativeWeight: 1}
      .value()
    _.assign(this, propsToAssign)
    return
  
  absoluteWeightProperty: (allAttributes) ->
    return (newValue) =>
      if newValue == undefined
        return @getAbsoluteWeight(allAttributes)
      else
        @setAbsoluteWeight(newValue, allAttributes); return
  
  getAbsoluteWeight: (allAttributes) ->
    totalRelativeWeight = _(allAttributes).pluck('relativeWeight').sum()
    result = @relativeWeight / totalRelativeWeight
    return result
  
  setAbsoluteWeight: (desiredFraction, allAttributes) ->
    infinityRelativeWeightReplacement = 999
    if desiredFraction < 1
      desiredFractionForOtherWeights = 1 - desiredFraction
      desiredMultipleOfOtherWeights = desiredFraction / desiredFractionForOtherWeights
      sum = @sumOfOtherRelativeWeights(allAttributes)
      @relativeWeight = _.round(sum * desiredMultipleOfOtherWeights, 2)
    else
      @relativeWeight = infinityRelativeWeightReplacement
    return
  
  sumOfOtherRelativeWeights: (allAttributes) ->
    totalRelativeWeight = _(allAttributes).pluck('relativeWeight').sum()
    return totalRelativeWeight - @relativeWeight

module.exports = WeightedAttribute
