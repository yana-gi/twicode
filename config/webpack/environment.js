const { environment } = require('@rails/webpacker')

environment.loaders.get('sass').use.push('import-glob-loader')

module.exports = environment
