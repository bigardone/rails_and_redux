var path = require("path");
var webpack = require('webpack');

module.exports = {
  context: __dirname,
  entry: {
    main:  "./app/frontend/application.cjsx",
  },
  output: {
    path: path.join(__dirname, 'app', 'assets', 'javascripts'),
    filename: "application_bundle.js",
    publicPath: "/js/",
    devtoolModuleFilenameTemplate: '[resourcePath]',
    devtoolFallbackModuleFilenameTemplate: '[resourcePath]?[hash]'
  },
  resolve: {
    extensions: ["", ".jsx", ".cjsx", ".coffee", ".js"]
  },
  module: {
    loaders: [
      { test  : /\.jsx?$/, loader: 'babel?stage=0',  exclude: /node_modules/ },
      { test: /\.cjsx$/, loaders: ["coffee", "cjsx"]},
      { test: /\.coffee$/,   loader: "coffee-loader"}
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      'React': 'react'
    })
  ]
}
