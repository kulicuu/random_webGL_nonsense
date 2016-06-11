c = -> console.log.apply console, arguments

path = require 'path'
webpack = require 'webpack'

module.exports = config =
    # worker:
    #     output:
    #         filename: "hash.worker.js"
    #         chunkFilename: "[id].hash.worker.js"
    node:
        fs: "empty"
    context: __dirname
    cache: true
    debug: true
    entry:
        app: ['./src/index.coffee']
    stats:
        colors: on
        reasons: on
    module:
        loaders: [
            {
                test: /\.glsl$/
                loader: 'webpack-glsl'
            },
                # test: /\.glsl$/
                # include: SHADER_PATH
                # loader: 'webpack-glsl'
            {
                test: /\.coffee$/
                loaders: ['coffee-loader', 'source-map-loader']
            }
        ]
    externals:
        "react": "React",
        "react-dom": "ReactDOM"
    output:
        path: __dirname
        filename: "public/js/app.js"
    # plugins: [
    #     new webpack.DefinePlugin
    #         'process.env':
    #             NODE_ENV: '"production"'
    #         __CLIENT__: true
    #         __SERVER__: false
    #         __DEVELOPMENT__: false
    #         __DEVTOOLS__: false
    # ]
