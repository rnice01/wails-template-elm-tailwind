const path = require('path');

module.exports = {
  entry: path.join(__dirname, 'src/js/app.js'),
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'main.js'
  },
  module: {
    rules: [
      {
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      use: [
        { loader: 'elm-hot-webpack-loader' },
        { loader: 'elm-webpack-loader' }
      ]
    },
    {
      test: /\.js$/,
      exclude: /(node_modules|dist|elm-stuff|wailsjs)/,
      use: {
        loader: 'babel-loader',
        options: {
          presets: ['@babel/preset-env']
        }
      }
    }
  ]
  }
};