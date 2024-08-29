//使用ES6导入语法，导入jQuery
import $ from 'jquery'


// 定义jQuery的入口函数

//导入样式（在webpack中一切皆是模块，都可以通过ES6导入语法进行导入和使用）
import './css/index.css'
import './css/index.less'

import logotu from './images/tu0.png'

$('.imagebox').attr('src',logotu)

$(function(){
//实现奇数偶数行变颜色
$('li:odd').css('background-color','green')
$('li:even').css('background-color','red')
})


//1 定义名为info的装饰器
function info(target) {
    //2 为目标添加静态属性 info
    target.info = 'Person info'
}
//3 为person类应用info装饰器
@info
class Person {
}

console.log(Person.info)
