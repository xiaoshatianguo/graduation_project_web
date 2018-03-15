const path = require('path');
const webpack = require('webpack');
const ExtractTextPlugin = require('extract-text-webpack-plugin'); // 将css代码单独打包出来

const ROOT_PATH = path.resolve(__dirname);
const APP_PATH = path.resolve(ROOT_PATH, 'app/view/pc');
const BUILD_PATH = path.resolve(ROOT_PATH, 'app/public/pc');

/**
 *
 * @param {Object} env webpack参数中设置的环境变量
 */
module.exports = function(env) {
  const {
    environment = 'localDev' /* localDev -- 本地开发环境；serverDev -- 测试服务器环境；pro -- 正式服务器环境 */,
  } = env;

  const isOpenSourceMap = environment === 'localDev';

  return {
    entry: {
      app: path.resolve(APP_PATH, 'main.js'),
    },

    output: {
      path: BUILD_PATH,
      publicPath: './',
      filename: '[name].js',
    },

    /* 开发环境下开启sourceMap技术 */
    devtool: isOpenSourceMap ? 'inline-source-map' : '',

    externals: getExternals(),

    module: {
      rules: getRules(),
    },

    plugins: getPlugins(environment),
  };
};

/**
 * 设置externals
 * @return {[Object]} externals
 */
const getExternals = () => {
  const externals = {};

  externals.jQuery = 'jQuery';

  return externals;
};

/**
 * rules
 * @return {[Array]} rules
 */
const getRules = () => {
  const rules = [];

  /* ES6、ES7，JSX转码 */
  rules.push({
    test: /\.jsx?$/,
    use: 'babel-loader',
    include: APP_PATH,
  });

  /* 图片loader */
  rules.push({
    test: /\.(png|jpg)$/,
    use: [
      {
        loader: 'url-loader',
        options: {
          limit: 10000,
          name: '[name].[ext]',
        },
      },
    ],
    include: APP_PATH,
  });

  /* Sass */
  rules.push({
    test: /\.scss$/,
    use: [ 'css-hot-loader' ].concat(
      ExtractTextPlugin.extract({
        fallback: 'style-loader',
        use: [ 'css-loader', 'sass-loader' ],
      })
    ),
    include: APP_PATH,
  });

  return rules;
};

/**
 * 获取配置
 * @return {[Array]} plugins
 */
const getPlugins = environment => {
  const plugins = [];

  /* 此插件将环境变量的值写入到js变量中 */
  plugins.push(
    new webpack.DefinePlugin({
      __ENV__: JSON.stringify(environment),
    })
  );

  /* 将css代码单独打包出来， */
  plugins.push(new ExtractTextPlugin('app.css'));

  return plugins;
};
