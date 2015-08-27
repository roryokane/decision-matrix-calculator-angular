models = require('./dmc-models')
editableNameList = require('./editable-name-list')

vm = {}

vm.init = ->
  vm.choiceNameList = editableNameList()
  vm.attributeNameList = editableNameList()
  
  # TODO Where and when do I keep the editableNameLists in sync with choiceList and attributeList?
  # one option would be when I call editableNameList(), I pass callbacks to it. There is a callback for adding an item, renaming an item, and deleting an item. I would prefer one callback that passes the new list, but then I would need the object diff algorithm to change my choices and attributes while keeping their identities.
  # I wonder if I shouldn’t have an “Attribute” concept, and I should just have a list of attribute names and a separate list of attribute weights. … No, that concept would be useful when making calculations, or when making sure an attribute weight is deleted along with its name.
  # See where components written by others store their data, and how they expose it. Do they even define their own “model” classes?
  
  vm.choiceList = new models.ChoiceList
  vm.choiceList.push new models.Choice(name: "Left")
  vm.choiceList.push new models.Choice(name: "Right")
  
  vm.attributeList = new models.AttributeList
  vm.attributeList.push new models.Attribute(name: "Price", relativeWeight: 1)
  vm.attributeList.push new models.Attribute(name: "Quality", relativeWeight: 1)
  
  vm.updateAbsoluteWeights = ->
    # look at relative weights of attributes, and adjust sliders
    # (the absolute weights are not in the vm or the view yet)
    return
  return

module.exports = vm
