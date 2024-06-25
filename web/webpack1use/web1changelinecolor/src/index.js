//使用ES6导入语法，导入jQuery
import $ from 'jquery'

// 定义jQuery的入口函数

$(function(){
//实现奇数偶数行变颜色

$('li:odd').css('background-color','yellow')
$('li:even').css('background-color','red')

})