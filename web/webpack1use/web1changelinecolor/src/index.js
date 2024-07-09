//使用ES6导入语法，导入jQuery
import $ from 'jquery'


// 定义jQuery的入口函数

//导入样式（在webpack中一切皆是模块，都可以通过ES6导入语法进行导入和使用）
import './css/index.css'



$(function(){
//实现奇数偶数行变颜色

$('li:odd').css('background-color','green')
$('li:even').css('background-color','red')

})