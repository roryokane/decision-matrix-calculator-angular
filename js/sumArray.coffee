module.exports = (array, initial) ->
	summingFunction = (acc, current) ->
		acc + current
	
	if initial?
		return array.reduce(summingFunction, initial)
	else
		return array.reduce(summingFunction)
