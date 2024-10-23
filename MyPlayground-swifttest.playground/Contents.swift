import UIKit

/*
var greeting = "Hello, playground"
let arrayOfInt = [2,3,4,5,4,7,2]
let newArr = arrayOfInt.map { $0 * 10 }
arrayOfInt.map ({ (someInt:Int) -> Int in return someInt * 10}) //1.闭包语法
arrayOfInt.map ({ (someInt:Int) in return someInt * 10}) //2.省略返回值
arrayOfInt.map ({ someInt in return someInt * 10}) //3.省略指定参数类型
arrayOfInt.map ({ someInt in someInt * 10}) //4.省略return
arrayOfInt.map { $0 * 10} //5.尾随闭包语法

print(newArr)
/*打印: [20, 30, 40, 50, 40, 70, 20] */

let bookAmount = ["harrypotter":100.0, "junglebook":100.0]
let returnFormatMap = bookAmount.map { (key: String, value: Double) in
    return key.capitalized
}
print(returnFormatMap)
/*打印: ["Junglebook", "Harrypotter"] */

var str1 = "Hello world!"
// 根据 " " 把 str 分割
var subStirngs = str1.split(separator: " ")
print("结果：\(subStirngs)")
print("类型：\(type(of: subStirngs))")

let str2 = "abcdefghijklmn"
let str3 = str2.prefix(2);
print(str3) // 打印 ab

for index in 1...5 {
    print(index) // 打印 1 2 3 4 5
}

for index in 1..<5 {
    print(index) //打印 1 2 3 4 不包含5
}
*/
/*
// range 截取
let str = "abcdefghijklmn"
let indexstart = str.index(str.startIndex, offsetBy: 3)
let indexend = str.index(str.startIndex, offsetBy: 5)
let strrange = str[indexstart...indexend]
print(strrange)
// 结果:def

let range = str.range(of: "jk")!
print(str[range])
//结果:jk
print(str[str.startIndex..<range.lowerBound])
// 结果:abcdefghi
print(str[str.startIndex..<range.upperBound])
// 结果:abcdefghijk


let someText = "hello"
let array = someText.map({ String($0) })
// [String] 输出应为["h", "e", "l", "l", "o"]

for item in someText {
    item.asciiValue
}
for item in array {
   // item.cha
}
var asciiarray = Array(someText.utf8);
print(asciiarray) //打印出字符串每一个字符对应的ASCII整数值
//大写字母 ASII 【65-90】
//小写字母 ASII 【97-122】

*/

/*
let str = "abcdefghijklmn"

let s_a = str.index(str.startIndex, offsetBy: 1)
let s_z = str.index(str.startIndex, offsetBy: str.count - 2)
print(str[s_a...s_z])
//print(str[1...2])
*/

var a = 1
let result = a << 1
print("Binary:", String(result, radix: 2))
//Binary: 10

var array = [5, 2, 10, 1, 0, 100, 46, 105]
/*
 array[3...5]
 array[3..<5]
 array[...6]
 array[..<6]
 array[2...]
 array[...]
 */
print(array[1...])
let kk = Double(array.reduce(0, +)) / Double(array.count)
print(kk)

let pp = 4.0 / 3

print(pp)
