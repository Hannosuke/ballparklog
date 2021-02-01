const { environment } = require('@rails/webpacker')

const webpack = require("webpack");

environment.config.externals = {
  jquery: "$",
};

environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    "window.$": "jquery",
  })
);

module.exports = environment
