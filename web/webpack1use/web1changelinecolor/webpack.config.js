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

module.exports = {

   //webpack的运行模式，development开发模式，production
   mode: 'development'
}