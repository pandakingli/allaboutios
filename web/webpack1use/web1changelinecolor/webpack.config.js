//使用Node.js中的导出语法，向外导出一个webpack的配置对象
/*
const path = require('path')

module.exports = {
     entry: path.join(__dirname, './src/index.js'),
     output: {
          path: path.join(__dirname, './dist'),
          filename: 'bundle.js'
     },
    //webpack的运行模式，development开发模式，production
    mode: 'development'
}
*/

//导入html插件，得到构造函数
const HtmlPlugin = require('html-webpack-plugin')

const { CleanWebpackPlugin } = require('clean-webpack-plugin');

// 创建html插件的实例对象
const htmlPlugin = new HtmlPlugin({
     template: './src/index.html', //指定原文件的存放路径
     filename: './index.html' //指定生成的文件的存放路径
})

const path = require('path')
module.exports = {
     
     entry: path.join(__dirname, './src/index.js'),
     output: {
          path: path.join(__dirname, './dist'),
          filename: 'js/bundle.js'
     },
     
   //webpack的运行模式，development开发模式，production
   mode: 'development',
   devtool: 'eval-source-map', //在发布项目的时候出于安全性考虑建议关闭SourceMap
   //devtool: 'nosources-source-map',
   devServer: {
     // contentBase: "./public",
    // static: './src',
     host: '0.0.0.0', // 关键！允许局域网访问
     open: true,//初次打包完成后，自动打开浏览器
     host: '127.0.0.1',//实时打包所使用的主机地址，可以使用localhost或者IP地址
     port: '8080', //实时打包所使用的端口号，如果是80就可以省略
     allowedHosts: "all"
   },

   plugins: [htmlPlugin, new CleanWebpackPlugin()], //通过plugins节点，使htmlPlugin生效
  
   module:{
     rules:[
          {test:/\.css$/,use:['style-loader',"css-loader"]},
          {test:/\.less$/,use:['style-loader',"css-loader","less-loader"]},
         // {test:/\.jpg|jpeg|png|gif$/,use:'url-loader?limit=22229&outputpath=images'}, //小于limit会被转成base64
         {
          test: /\.(jpe?g|png|gif|svg)$/i,
          type: 'asset/resource',
          parser: {
               dataUrlCondition: {
                   maxSize: 10 * 1024
               }
           },
          generator: {
            filename: "img/assetmodule.[name][ext]", // 对复制后的资源重命名
            publicPath: './'
          },
        },
        {
          test: /\.html$/,
          // 处理html文件的img图片（负责引入img，从而能被url-loader处理）
          // webpack5中使用 html-withimg-loader代替
          // loader: 'html-loader'
          loader: 'html-withimg-loader'
        },
        
       {test:/\.js$/,use:'babel-loader',exclude: /node_modules/} // babel-loader处理高级js语法
        ]
   },
   resolve: {
     
     alias: {
          //告诉webpack 代码中@代表src这个目录
          '@': path.join(__dirname, './src/')
     }
   }
   // /\.css$/ 正则表达式，\转译字符.
   //test表示匹配的文件类型，npm i style-loader@3.0.0 css-loader@5.2.6 -D
   //use数组中指定的loader顺序是固定的
   //多个loader的调用顺序是从后往前调用

}

