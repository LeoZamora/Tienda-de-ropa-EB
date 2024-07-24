const { defineConfig } = require('@vue/cli-service');
const webpack = require('webpack');

module.exports = defineConfig({
  transpileDependencies: true,
  devServer: {
    port: process.env.PORT || 3002
  },
  configureWebpack: {
    plugins: [
      new webpack.DefinePlugin({
        '__VUE_PROD_HYDRATION_MISMATCH_DETAILS__': JSON.stringify(process.env.VUE_APP_PROD_HYDRATION_MISMATCH_DETAILS)
      })
    ]
  }
})
