const { environment } = require('@rails/webpacker')
const webpack = require('webpack');

module.exports = {
    module: {
        rules: [
            {
                test: /\.css$/,
                use: ["style-loader", "css-loader", "postcss-loader"]
            }
        ]
    }
}

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = {
    parser: 'sugarss',
    plugins: {
        'postcss-import': {},
        'postcss-preset-env': {},
        'cssnano': {}
    }
}

module.exports = environment
