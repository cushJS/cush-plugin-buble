path = require 'path'
log = require 'lodge'

buble = require '@cush/buble'
buble.parse = require('acorn').parse

module.exports = ->
  transforms = Object.assign {modules: false}, @get('buble.transforms')
  @transform '.js', (asset) =>
    buble.transform asset.content,
      includeContent: false
      objectAssign: 'Object.assign'
      transforms: transforms
      source: @relative asset.path
