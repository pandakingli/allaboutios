//
//  RootVC.swift
//  ProjectSwift
//
//  Created by pandakingli on 2024/3/29.
//

import UIKit

class RootVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        //asciiStringToBytes(str: "012345abcde")
        //let result = Solution().detectCapitalUse("abcdeA")
        //print(result)
        
        //var teststr = "test😈"
        //let arr = Array(teststr)
        //print(arr)
        
        var s = Solution().isValidSerialization("9,3,4,#,#,1,#,#,2,#,6,#,#")
    }
}

class Solution {
    
    //2810. 故障键盘
    //https://leetcode.cn/problems/faulty-keyboard/description/
    func finalString(_ s: String) -> String {
           
        if !s.contains("i") {
            return s
        }
        let sArray = Array(s)
        var resultString = ""
        var resultArray = [String]()
        
        for index in 0...sArray.count - 1 {
            if sArray[index] != "i" {
                resultArray.append(String(sArray[index]))
            } else {
                resultArray.reverse()
            }
        }
        
        resultString = resultArray.joined()
        return resultString
    }
    
    
    //331. 验证二叉树的前序序列化
    //https://leetcode.cn/problems/verify-preorder-serialization-of-a-binary-tree/description/
    func isValidSerialization(_ preorder: String) -> Bool {
        if preorder == "#" {
            return true
        }
        
        var result = true

        var arr = preorder.split(separator: ",")
        
        if arr.isEmpty {
            return false
        }
        
        var firstItem = arr[0]
        
        if firstItem == "#" {
            return false
        }
        
        if arr.count < 3 {
            return false
        }
    
        
        var lastItem = arr[arr.count - 1]
        var secLastItem = arr[arr.count - 2]
        
        if lastItem != "#" || secLastItem != "#" {
            return false
        }
        
        if (arr.count + 1) % 2 != 0 {
            return false
        }
        
        var stackArr = [Substring]()
        stackArr.append(arr[0])
        
        for index in 1...arr.count - 1 {
            
            if arr[index] == "#" && stackArr.last == "#" {
                
                //进入一个叶子节点
                stackArr.removeLast()
                
                if stackArr.count > 0 {
                    stackArr[stackArr.count - 1] = "#"
                }
                
                if stackArr.count == 1 {
                    if stackArr.last == "#" && index == arr.count - 1 {
                        result = true //遍历到最后一个
                        break
                    } else  if stackArr.last == "#" && index != arr.count - 1 {
                        result = false //还没结束，但是二叉树终结了
                        break
                    }
                }
                
                var iRun = true
                while iRun {
                    if stackArr.count > 2 {
                        
                        if stackArr[stackArr.count - 2] == "#" && stackArr[stackArr.count - 1] == "#"{
                            stackArr.removeLast()
                            stackArr.removeLast()
                            stackArr[stackArr.count - 1] = "#"
                        } else {
                            iRun = false
                        }
                        
                    } else {
                        if stackArr.count == 1 {
                            if stackArr.last == "#" && index == arr.count - 1 {
                                result = true //遍历到最后一个
                                
                            } else  if stackArr.last == "#" && index != arr.count - 1 {
                                result = false //还没结束，但是二叉树终结了
                                
                            }
                        }
                        
                        iRun = false
                    }
                }
                
                
            } else {
                stackArr.append(arr[index])
            }
                
        }
        
        
        
        
        return result
    }
    
    //2908. 元素和最小的山形三元组 I
    //https://leetcode.cn/problems/minimum-sum-of-mountain-triplets-i/description/
    //https://leetcode.cn/problems/minimum-sum-of-mountain-triplets-i/solutions/2493551/on-zuo-fa-mei-ju-numsjqian-hou-zhui-fen-xweo4/
    func minimumSum(_ nums: [Int]) -> Int {

        var result = -1
        
        if nums.count < 3 {
            return result
        }
        
        if nums.count == 3 {
            if nums[1] > nums[0] && nums[1] > nums[2] {
                result = nums[0] + nums[1] + nums[2]
            }
            return result
        }
        
        for index_i in 0 ..< nums.count-2 {
            
            for index_j in index_i + 1 ..< nums.count - 1 {
                
                if nums[index_j] > nums[index_i] {
                    
                    for index_k in index_j + 1 ..< nums.count {
                        
                        if nums[index_k] < nums[index_j] {
                            let temp = nums[index_i] + nums[index_j] + nums[index_k]
                            if result == -1 {
                                result = temp
                            } else {
                                if temp < result {
                                    result = temp
                                }
                            }
                        }
                        
                    } //for index_k
                }
                
            } //for index_j
            
        } //for index_i
        
        return result
        
    }
    
    func minimumSum2(_ nums: [Int]) -> Int {
        var result = -1
        
        if nums.count < 3 {
            return result
        }
        
        if nums.count == 3 {
            if nums[1] > nums[0] && nums[1] > nums[2] {
                result = nums[0] + nums[1] + nums[2]
            }
            return result
        }
        
        let arrayCount = nums.count
        var preArray = [Int](repeating: -1, count: arrayCount)
        var postArray = [Int](repeating: -1, count: arrayCount)
        preArray[0] = nums.first!
        postArray[arrayCount - 1] = nums.last!
        
        for i in 1...nums.count - 1 {
            preArray[i] = min(preArray[i-1], nums[i])
            postArray[nums.count - 1 - i] = min(postArray[nums.count - i], nums[nums.count - 1 - i])
        }
        
        for j in 1...nums.count - 2 {
            if nums[j] > preArray[j - 1] && nums[j] > postArray[j + 1] {
                let temp = preArray[j - 1] + nums[j] + postArray[j + 1]
                if result == -1 {
                    result = temp
                } else {
                    result = min(result, temp)
                }
            }
        }
        return result
    }
    
    //520. 检测大写字母
    //https://leetcode.cn/problems/detect-capital/description/
    func detectCapitalUse(_ word: String) -> Bool {
        if word.count < 1 {
            return false
        }
        
        var upperCount = 0
        var downCount = 0
        
        var totalLen = word.unicodeScalars.count
        var firstL = word.unicodeScalars.first!
        
        for character in word.unicodeScalars {
            
            if character.value >= 65 && character.value <= 90 {
                upperCount = upperCount + 1
            }
            if character.value >= 97 && character.value <= 122 {
                downCount = downCount + 1
            }
        }
        
        if upperCount == totalLen {
            //全部大写
            return true
        }
        
        if downCount == totalLen {
            //全部小写
            return true
        }
        if upperCount == 1 {
            if firstL.value >= 65 && firstL.value <= 90 {
                //首字母大写
                return true
            }
        }
        
        return false
        
    }
    
    //其他题解
    func detectCapitalUse_qita(_ word: String) -> Bool {
        let chars = Array(word);
        var i = 1
        
        if chars.count > 1, chars[0].isLowercase, chars[1].isUppercase {
            return false
        }

        while i < chars.count-1 {
            if chars[i].isLowercase != chars[i+1].isLowercase { return false }
            i += 1
        }
        return true
    }

}

func asciiStringToBytes(str: String) -> [UInt8]{
    
    var bytes: [UInt8] = []
    
    for character in str.unicodeScalars {
        print(String(character) + " ASCII:" + String(character.value))
        print(character.value)
    }
    
    return bytes
}
