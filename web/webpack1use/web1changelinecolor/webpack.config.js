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
   plugins: [htmlPlugin] //通过plugins节点，使htmlPlugin生效
}