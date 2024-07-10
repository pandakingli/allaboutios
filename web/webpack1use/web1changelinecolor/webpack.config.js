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

// 创建html插件的实例对象
const htmlPlugin = new HtmlPlugin({
     template: './src/index.html', //指定原文件的存放路径
     filename: './index.html' //指定生成的文件的存放路径
})

module.exports = {

   //webpack的运行模式，development开发模式，production
   mode: 'development',

   devServer: {
     // contentBase: "./public",
    // static: './src',
     open: true,//初次打包完成后，自动打开浏览器
     host: '127.0.0.1',//实时打包所使用的主机地址，可以使用localhost或者IP地址
     port: '8099', //实时打包所使用的端口号，如果是80就可以省略
    // allowedHosts: "all"
   },

   plugins: [htmlPlugin], //通过plugins节点，使htmlPlugin生效
  
   module:{
     rules:[
          {test:/\.css$/,use:['style-loader',"css-loader"]},
          {test:/\.less$/,use:['style-loader',"css-loader","less-loader"]}
        ]
   }
   // /\.css$/ 正则表达式，\转译字符.
   //test表示匹配的文件类型，npm i style-loader@3.0.0 css-loader@5.2.6 -D
   //use数组中指定的loader顺序是固定的
   //多个loader的调用顺序是从后往前调用

}

