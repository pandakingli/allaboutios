import UIKit

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
