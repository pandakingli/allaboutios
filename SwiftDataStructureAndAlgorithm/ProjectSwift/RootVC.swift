//
//  RootVC.swift
//  ProjectSwift
//
//  Created by pandakingli on 2024/3/29.
//

import UIKit


 // Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }
 

// Definition for a binary tree node.
 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }



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
        
       // var s = Solution().isValidSerialization("9,3,4,#,#,1,#,#,2,#,6,#,#")
        
        //var s = Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1])
        //var s2 = Solution().trap([4,2,0,3,2,5])
       // print(s,s2)
        
       // print(Solution().maxPower("leetcode"))
       // print(Solution().threeSum([-1,0,1,2,-1,-4]))
        /*
        let nums = [96,241,77,121,216,167,41,176,201,136,231,106,335,171,166,199,218,210,205,175,258,22,315,213,138,199,312,132,8,201,136,128,209,282,55,227,110,9,328,314,23,4,110,227,4,41,296,6,109,228,256,81,317,20,64,273,210,127,112,225,122,215,204,321,16,295,42,286,51,303,23,314,175,144,193,116,128,226,36,288,42,295,54,283,329,207,130,10,333,135,202,131,206,303,274,63,260,222,320,17,233,155,182,171,166,230,334,3,276,61,68,11,326,57,169,168,32,124,174,163,277,60,224,207,17,320,211,308,84,253,74,200,137,159,214,123,137,235,102,62,275,208,129,332,5,219,118,140,197,34,106,97,198,139,233,104,197,140,54,300,216,121,278,255,82,139,198,21,275,192,145,294,262,75,296,163,189,114,223,7,184,325,243,94,270,11,326,233,9,149,244,93,220,117,218,306,14,233,104,316,273,217,120,200,311,26,305,216,317,107,479,663,585,560,543,462,726,775,192,924,75,393,661,458,657,230,20,121,32,137,124,213,89,248,305,32,28,309,64,21,323,317,20,31,119,236,101,188,328,104,67,264,73,12,153,330,83,254,148,174,320,17,166,171,41,320,17,200,137,162,175,33,304,43,146,191,62,247,90,316,3,334,59,88,249,37,128,209,201,136,259,78,283,4,333,73,264,147,190,44,293,279,58,240,231,133,204,107,230,303,118,219,35,302,200,252,85,178,301,36,263,240,97,29,126,130,315,22,113,213,305,80,257,184,153,280,269,107,208,129,104,115,171,166,77,234,103,259,78,34,4,335,2,327,8,194,143,177,160,129,208,183,154,49,24,313,301,111,209,221,78,259,162,34,61,276,331,6,283,54,326,11,133,223,114,10,327,331,333,333,34,303,269,68,329,205,25,72,265,116,221,124,53,284,11,326,103,234,79,162,132,127,151,186,119,77,260,138,95,242,2,161,296,207,130,170,260]
        
        let nums2 = [1,1,1,1,1,1,2,1,1,2]
        let now = Date()
        let result = Solution().maxOperations2(nums)
        let now2 = Date()
        print(now2.timeIntervalSince1970 - now.timeIntervalSince1970)
        print(result)
         */
        /*
        let nums = [8, 8, 9]
        let ss = Solution()
        let now = Date()
        let e = ss.maxCoins(nums)
        print(e)
       // print(ss.myQDic)
        let now2 = Date()
        print(now2.timeIntervalSince1970 - now.timeIntervalSince1970)
         */
    }
}

class Solution {
    
    func maxCoins(_ nums: [Int]) -> Int {
        var result = 0
        
        
        
        
        
        return result
    }
    
    
    var myQDic = [String:Int]()
    //312. 戳气球
    //https://leetcode.cn/problems/burst-balloons/?envType=daily-question&envId=2024-06-09
    func maxCoins2(_ nums: [Int]) -> Int {
        
        var newnums = nums.filter({$0 > 0}) //过滤掉0
        
        var result = 0
        
        if newnums.count < 1 {
            return 0
        }
        
        if newnums.count == 1 {
            return nums[0]
        }
        
        let rnums = newnums.reversed()
        let rstr = rnums.map { String($0) }.joined(separator: ", ")
        let sStr = newnums.map { String($0) }.joined(separator: ", ")
        
        if myQDic[sStr] != nil {
            return myQDic[sStr]!
        }
        
        if myQDic[rstr] != nil {
            return myQDic[rstr]!
        }
        
        if newnums.count == 2 {
            result = newnums[0]*newnums[1] + max(newnums[0], newnums[1])
            myQDic[sStr] = result
            return result
        }
        
        var isallsame = true
        let firstitem = newnums[0]
        for item in newnums {
            if item != firstitem {
                isallsame = false
                break
            }
        }
        
        if isallsame {
            var count3 = newnums.count - 3 + 1
            result = count3 * (firstitem * firstitem * firstitem) + firstitem * firstitem + firstitem
            return result
        }
        
        var tempresult = 0
        var tempgoodarray = [Int]()
        var temp_k = 0
        if newnums.count >= 3  {
            
            
            for k in 0...newnums.count - 1 {
               
                var kleft = 1
                if k - 1 >= 0 {
                    kleft = newnums[k-1]
                }
                
                var kright = 1
                if k + 1 <= newnums.count - 1 {
                    kright = newnums[k+1]
                }
                
                let ksum = kleft * kright * newnums[k]
                
                var temparray = newnums
                temparray.remove(at: k)
                
                var kksum = ksum + maxCoins(temparray)
                
                if kksum > tempresult {
                    tempresult = kksum
                    tempgoodarray = temparray
                    temp_k = k
                }
            }
            
            print("\n")
            print(newnums)
            print("tempresult = " + String(tempresult) + " index = " + String(temp_k))
            print(tempgoodarray)
            print("\n")
            
            result = tempresult
            myQDic[sStr] = result
        }
        
        return result
        
    }
       
    /*
        var min_j = 0
        var c_j = 0
        var tempxx = 0
        for j in 0...newnums.count - 1 {
            
            var left = 1
            if j - 1 >= 0 {
                left = newnums[j-1]
            }
            
            var right = 1
            if j + 1 <= newnums.count - 1 {
                right = newnums[j+1]
            }
            
            let add = newnums[j]*left*right
            
            if min_j == 0 {
                min_j = newnums[j]
                tempxx = add
                c_j = j
            } else if newnums[j] < min_j {
                min_j = newnums[j]
                tempxx = add
                c_j = j
            }
            
        }
        
        var tempkk = newnums
        tempkk.remove(at: c_j)
        result = tempxx + maxCoins(tempkk)
        myQDic[sStr] = result
        
        return result
         */
  //  }
    
    //3040. 相同分数的最大操作数目 II
    //https://leetcode.cn/problems/maximum-number-of-operations-with-the-same-score-ii/description/?envType=daily-question&envId=2024-06-09
    var maxoDic = [String:Int]()
    func maxOperations2(_ nums: [Int]) -> Int {

        var result = 0
        if nums.count < 2 {
            return 0
        }
        if nums.count == 2 {
            return 1
        }
        
        let first = nums.first!
        var isallsame = true
        for item in nums {
            if item != first {
                isallsame = false
                break
            }
        }
        
        if isallsame {
            return nums.count / 2
        }
        
        let fronttarget = nums[0] + nums[1]
        let front = 1 + maxOperations3target(nums, 2, nums.count-1, fronttarget)
        
        let backtarget = nums[nums.count - 1] + nums[nums.count - 2]
        let back = 1 + maxOperations3target(nums, 0, nums.count-3, backtarget)
        
        let centertarget = nums[0] + nums[nums.count - 1]
        let center = 1 + maxOperations3target(nums, 1, nums.count - 2, centertarget)
        
        result = max(front, back, center)
        
        return result
        
    }
    
    func maxOperations3target(_ nums: [Int], _ from: Int, _ to: Int,_ target: Int) -> Int {
        var result = 0
        let nowcount = to - from + 1
        if nowcount < 2 {
            return 0
        }
        
        if nowcount == 2 {
            if nums[from] + nums[to] == target {
                return 1
            }
            return 0
        }
        
        let numtext = String(from) + "-" + String(to) + "-" + String(target);
        
        if maxoDic[numtext] != nil {
            return maxoDic[numtext]!
        }
        
        var front = 0
        if target == nums[from] + nums[from+1] {
            front = 1 + maxOperations3target(nums, from+2, to, target)
        }
        
        var back = 0
        if target == nums[to-1] + nums[to] {
            back = 1 + maxOperations3target(nums, from, to-2, target)
            
        }
        
        var center = 0
        if target == nums[from] + nums[to] {
            center = 1 + maxOperations3target(nums, from + 1, to-1, target)
        }
        
        result = max(front, back, center)
        maxoDic[numtext] = result
        return result
    }
        
    
    //2938. 区分黑球与白球
    //https://leetcode.cn/problems/separate-black-and-white-balls/description/?envType=daily-question&envId=2024-06-09
    func minimumSteps(_ s: String) -> Int {

        var result = 0
        
        if s.count <= 1 {
            return 0
        }
        var newarray = s.map({String($0)})
        newarray.reverse()
        
        var onecount = 0
        
        for i in 0...newarray.count - 1 {
            if newarray[i] == "1" {
                result = i - onecount + result
                onecount = onecount + 1
                
            } else {
                
            }
                
        }
        
        return result
    }
    
    //3038. 相同分数的最大操作数目 I
    //https://leetcode.cn/problems/maximum-number-of-operations-with-the-same-score-i/description/?envType=daily-question&envId=2024-06-07
    func maxOperations(_ nums: [Int]) -> Int {

        var result = 0
        
        if nums.count < 2 {
            return 0
        }
        
        if nums.count == 2 {
            return 1
        }
        var tempSum = 0
        var isFirst = true
        for i in 1...nums.count - 1 {
            if i % 2 == 0 {
                continue
            }
            if isFirst {
                tempSum = nums[i - 1] + nums[i]
                isFirst = false
                result = result + 1
               
            } else {
                if tempSum == nums[i - 1] + nums[i] {
                    result = result + 1
                 
                } else {
                    break
                }
            }
        }
        
        
        return result
    }
    
    //662. 二叉树最大宽度
    //https://leetcode.cn/problems/maximum-width-of-binary-tree/description/
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        var result = 0
        if root == nil {
            return result
        }
        
        if root!.left == nil && root!.right == nil {
            return 1
        }
        var maxwidth = 1
        var nodearray = [(TreeNode,Int)]()
        nodearray.append((root!,1))
        
        while nodearray.isEmpty == false {
            
            
            var temparray = nodearray
            nodearray.removeAll()
            var start = 1
            for item in temparray {
                if let lnode = item.0.left {
                    if nodearray.count == 0 {
                        start = item.1
                    }
                    nodearray.append((lnode, 2&*(item.1 &- start) &+ 1))
                }
                
                if let rnode = item.0.right {
                    if nodearray.count == 0 {
                        start = item.1
                    }
                    nodearray.append((rnode, 2&*(item.1 &- start) &+ 2))
                }
            }
            
            if nodearray.count > 1 {
                let width = nodearray.last!.1 &- nodearray.first!.1 &+ 1
                if width > maxwidth {
                    maxwidth = width
                }
            }
        }
        result = maxwidth
        
        return result
    }
    
    //2385. 感染二叉树需要的总时间
    //https://leetcode.cn/problems/amount-of-time-for-binary-tree-to-be-infected/description/?envType=daily-question&envId=2024-04-24
    func amountOfTime(_ root: TreeNode?, _ start: Int) -> Int {
        var result = 0
        
        if let gen = root {
            
            if gen.left == nil && gen.right == nil {
                return result
            }
            
        } else {
            return result
        }
        
        
        var numTu = [Int:[Int]]()
        var nums = [Int]()
        if let lleftnode = root!.left {
            nums.append(lleftnode.val)
        }
        if let rrightnode = root!.right {
            nums.append(rrightnode.val)
        }
        numTu[root!.val] = nums
        
        var ssArray = [TreeNode]()
        ssArray.append(root!)
        
        while ssArray.count > 0 {
            var temp = ssArray
            ssArray.removeAll()
            
            for node in temp {

                if let lleftnode = node.left {
                    
                    var nodenums = [Int]()
                    nodenums.append(node.val)
                    
                    if let llnode = lleftnode.left {
                        nodenums.append(llnode.val)
                    }
                    if let rrnode = lleftnode.right {
                        nodenums.append(rrnode.val)
                    }
                    numTu[lleftnode.val] = nodenums
                    ssArray.append(lleftnode)
                }
                
                if let rrightnode = node.right {
                    var nodenums = [Int]()
                    nodenums.append(node.val)
                    
                    if let llnode = rrightnode.left {
                        nodenums.append(llnode.val)
                    }
                    if let rrnode = rrightnode.right {
                        nodenums.append(rrnode.val)
                    }
                    numTu[rrightnode.val] = nodenums
                    ssArray.append(rrightnode)
                }
                
            }
        }
        
        
        var q = numTu[start]!
        numTu[start] = nil
        while numTu.isEmpty == false {
            result = result + 1
            var tmp = q
            q.removeAll()
            for k in tmp {
                if let shuzu = numTu[k] {
                    q.append(contentsOf: shuzu)
                    numTu[k] = nil
                }
            }
        }
        
        
        return result
    }
    
    func amountOfTime2(_ root: TreeNode?, _ start: Int) -> Int {
     if let gen = root {
               if gen.left == nil && gen.right == nil {
                   return 0
               }
           } else {
               return 0
           }
           var result = 0
           
           if root!.val == start {
               var ssArray = [TreeNode]()
               ssArray.append(root!)
               var arrayCount = 1
               while ssArray.count > 0 {
                   var tempArray = ssArray
                   ssArray.removeAll()
                   
                   for node in tempArray {
                       if let lleftnode = node.left {
                           ssArray.append(lleftnode)
                       }
                       if let rrightnode = node.right {
                           ssArray.append(rrightnode)
                       }
                   }
                   if ssArray.count > 0 {
                      arrayCount = arrayCount + 1
                   }
                   
               }
               
               return arrayCount - 1
           } else {
               var ssArray = [TreeNode]()
               ssArray.append(root!)
               var arrayCount = 1
               var ssIndex = 1
               var allLeft = true

               while ssArray.count > 0 {
                   var tempArray = ssArray
                   ssArray.removeAll()
                   if tempArray.count > 1 {
                       allLeft = false
                   }
                   for node in tempArray {
                       if node.val == start {
                           ssIndex = arrayCount
                       }
                       if let lleftnode = node.left {
                           ssArray.append(lleftnode)
                       }
                       if let rrightnode = node.right {
                           ssArray.append(rrightnode)
                       }
                   }

                   if ssArray.count > 0 {
                      arrayCount = arrayCount + 1
                   }
               }
              if allLeft {
               return max(arrayCount-ssIndex, ssIndex-1)
              }
               
           }
           
           var ganranDic = [Int:Bool]()
           ganranDic[start] = true
           var isAll = false
           while !isAll {
               var nodeArray = [TreeNode]()
               var ganranArray = [TreeNode]()
               nodeArray.append(root!)
               while nodeArray.count > 0 {
                   var tem = nodeArray
                   nodeArray.removeAll()
                   for node in tem {
                       if ganranDic[node.val] == true {
                           //当前节点已经被感染，检查子节点
                           if let lleftnode = node.left {
                               if ganranDic[lleftnode.val] == true {
                               } else {
                                   ganranArray.append(lleftnode) //子节点未感染，加入数组
                               }
                           }
                           if let rrightnode = node.right {
                               if ganranDic[rrightnode.val] == true {
                                   
                               } else {
                                   ganranArray.append(rrightnode) //子节点未感染，加入数组
                               }
                           }
                       } else {
                           var hasOne = false
                           //当前节点没被感染，检查子节点
                           if let lleftnode = node.left {
                               if ganranDic[lleftnode.val] == true {
                                   // 子节点被感染
                                   hasOne = true
                               }
                           }
                           if let rrightnode = node.right {
                               if ganranDic[rrightnode.val] == true {
                                   // 子节点被感染
                                   hasOne = true
                               }
                           }
                           if hasOne {
                               ganranArray.append(node) //子节点感染，将父节点加入数组
                           }
                       }
                       
                       if let lleftnode = node.left {
                           nodeArray.append(lleftnode)
                       }
                       if let rrightnode = node.right {
                           nodeArray.append(rrightnode)
                       }
                   } //for node in tem
               } //while nodeArray.count > 0
               if ganranArray.count > 0 {
                   result = result + 1
                   for gNode in ganranArray {
                       ganranDic[gNode.val] = true
                   }
               } else {
                   isAll = true
               }
           } //while !isAll
           return result
       }
    
    //216. 组合总和 III
    //https://leetcode.cn/problems/combination-sum-iii/description/?envType=daily-question&envId=2024-04-21
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {

        var result = [[Int]]()
        
        let numArray = [1,2,3,4,5,6,7,8,9]
        
        if k < 1 {
            return []
        }
        
        if k == 1 && (n > 9 || n < 1) {
            return []
        }
        
        if k == 1 && (n >= 1 && n <= 9) {
            return [[n]]
        }
        
        if k > 9 {
            return []
        }
        
        if k == 9 && n != 45  {
            return []
        }
        
        if k == 9 && n == 45  {
            return [numArray]
        }
        

        
        var left = 0
        var right = left + k - 1
        
        var summin = 0
        var summax = 0
        
        var minArray = [Int]()
        var maxArray = [Int]()
        
        for i in 0...k - 1 {
            summin = summin + numArray[i]
            minArray.append(numArray[i])
        }
        
        for j in numArray.count - k...numArray.count - 1 {
            summax = summax + numArray[j]
            maxArray.append(numArray[j])
        }
        
        if n > summax || n < summin {
            return []
        }
        if n == summin {
            return [minArray]
        }
        
        if n == summax {
            return [maxArray]
        }
        
        var tempArray = [[Int]]()
        
        
        for i in 0...k-1 {
           var ttArray = tempArray
            if ttArray.count == 0 {
                for j in 0...numArray.count-k {
                    ttArray.append([numArray[j]])
                }
                tempArray = ttArray
            } else {
                var xArray = [[Int]]()
                
                for arr in ttArray {
                    for m in 0...numArray.count - 1 {
                        var nArr = arr
                        if let arrlast = arr.last {
                            if numArray[m] > arrlast{
                                nArr.append(numArray[m])
                                xArray.append(nArr)
                            }
                        }

                    }
                }
                
                tempArray = xArray
            }
            
        }
        
        
        for gArr in tempArray {
            if gArr.reduce(0,+) == n {
                result.append(gArr)
            }
        }
        
        if result.count == 0 {
            return []
        }
        
        return result
    }
    
    
    //17. 电话号码的字母组合
    //https://leetcode.cn/problems/letter-combinations-of-a-phone-number/description/
    func letterCombinations(_ digits: String) -> [String] {

        var result = [String]()
        if digits.count < 1 {
            return result
        }
        var strArray = digits.map({ String($0) })
        var zimuArr = [[String]]()
        for dStr in strArray {
            switch dStr {
            case "2":zimuArr.append(["a","b","c"])
            case "3":zimuArr.append(["d","e","f"])
            case "4":zimuArr.append(["g","h","i"])
            case "5":zimuArr.append(["j","k","l"])
            case "6":zimuArr.append(["m","n","o"])
            case "7":zimuArr.append(["p","q","r","s"])
            case "8":zimuArr.append(["t","u","v"])
            case "9":zimuArr.append(["w","x","y","z"])
            default: break
            }
        }
        
        if  zimuArr.count < 1 {
            return result
        }
        
        var indexArray = [Int](repeating: 0, count: strArray.count)
        var isOK = true
        
        while isOK {
            
            
            var tempStr = ""
            for i in 0...strArray.count-1 {
                let zimu = zimuArr[i]
                if indexArray[i] < zimu.count {
                    tempStr.append(zimu[indexArray[i]])
                }
            }
            
            result.append(tempStr)
            
            var isJinwei = false
            
            for j in 0...indexArray.count - 1 {
                let k = indexArray.count - 1 - j 
   
                let len = zimuArr[k].count
                var currentIndex = indexArray[k]
                
                if k == indexArray.count - 1 {
                    currentIndex = currentIndex + 1
                } else if isJinwei {
                    currentIndex = currentIndex + 1
                }
                
                
                if currentIndex >= len {
                    currentIndex = 0
                    isJinwei = true
                } else {
                    isJinwei = false
                }
                indexArray[k] = currentIndex
                
                if j == indexArray.count - 1 && isJinwei == true {
                    isOK = false
                }
            }
            
            
        }
        
        
        
        return result
    }
    
    
    //15. 三数之和
    //https://leetcode.cn/problems/3sum/description/
    func threeSum(_ nums: [Int]) -> [[Int]] {

        var result = [[Int]]()
        if nums.count < 3 {
            return result //少于3个，直接返回空
        }
        
        if nums.count == 3 {
            if nums[0] + nums[1] + nums[2] == 0 {
                return [[nums[0] , nums[1] , nums[2] ]] //3个正好
            } else {
                return result //返回空
            }
        }
        
        var isALlZero = true
        var zeroCount = 0
        var kindDict = [String:Int]()
        var kindNum = [Int]()
        
        for m in 0...nums.count - 1 {

            if nums[m] != 0 {
                isALlZero = false
            } else {
                zeroCount = zeroCount + 1
            }
            
            if let count = kindDict[String(nums[m])] {
                if count == 1 {
                    kindDict[String(nums[m])] = 2
                    kindNum.append(nums[m])
                }
                if count == 2 && nums[m] == 0 {
                    kindNum.append(0) //3个0
                }
            } else {
                kindDict[String(nums[m])] = 1
                kindNum.append(nums[m])
            }

        }
        
        if isALlZero {
            return [[0,0,0]] //全部是0，返回空
        }
        
        if kindNum.count < 3 {
            return result
        }
        
        var dict : [String : Bool] = [String : Bool]()
        let xinArray = kindNum.sorted()
        
        for i in 0...xinArray.count - 3 {
            
            var left = i + 1
            var right = xinArray.count - 1
            
            while left < right {
                let temp = xinArray[i] + xinArray[left] + xinArray[right]
                if temp == 0 {
                    let tempArr = [xinArray[i], xinArray[left], xinArray[right]]
                    let keystr = tempArr.map({String($0)}).joined()
                    if dict[keystr] == true {
                        
                    } else {
                        dict[keystr] = true
                        result.append(tempArr)
                    }
                    left = left + 1
                } else if temp > 0 {
                    right = right - 1
                } else {
                    left = left + 1
                }
            }
        }

        return result
    }
    
    
    //16. 最接近的三数之和
    //https://leetcode.cn/problems/3sum-closest/description/
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var result = 0
        
        
        if nums.count < 3 {
            return 0
        }
        
        var sortArray = nums
        sortArray = sortArray.sorted(by: <) //升序
        
        var tempSum:Int? = nil
        
        
        for i in 0...sortArray.count - 3 {
            
            
            var left = i + 1
            var right = sortArray.count - 1
            

            
            while left < right {
                
                var temp = sortArray[i] + sortArray[left] + sortArray[right]
                
                if temp == target {
                    return temp
                }
                
                if tempSum == nil {
                    tempSum = temp
                }
                
                if temp < target {
                    left = left + 1
                } else {
                    right = right - 1
                }
                
                var cCha = temp - target
                var temCha = tempSum! - target
                if cCha < 0 {
                    cCha = -cCha
                }
                if temCha < 0 {
                    temCha = -temCha
                }
                if temCha > cCha {
                    tempSum = temp
                }
                
                
            }
            
        }
        
        if tempSum == nil {
            
        } else {
            result = tempSum!
        }
        
        return result
    }
    
    //19. 删除链表的倒数第 N 个结点
    //https://leetcode.cn/problems/remove-nth-node-from-end-of-list/description/
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {

        if head == nil {
            return nil
        }
        
        if n <= 0 {
            return head
        }
        
        if head!.next == nil {
            //已经到了最后一个节点
            return nil
        }
        
        var firstP:ListNode? = nil
        var secondP:ListNode? = nil
        

        
        var start = 0
        while start < n {
            if firstP == nil {
                //刚开始进入
                firstP = head
            } else {
                if firstP!.next != nil {
                    //指向下一个节点
                    firstP = firstP!.next
                } else {
                    break //到了最后一个节点了
                }
            }
            start = start + 1
        }
        
        if firstP!.next == nil {
            secondP = head!.next
            head!.next = nil
            return secondP
        }
        
        while firstP!.next != nil {
            
            if secondP == nil {
                secondP = head!
            } else {
                if secondP!.next != nil {
                    secondP = secondP!.next!
                } else {
                    
                }
            }
            
            firstP = firstP!.next!
        }
        
        if secondP!.next != nil {
            secondP!.next = secondP!.next!.next
        }
        
        return head
    }
    
    //1446. 连续字符
    func maxPower(_ s: String) -> Int {

        var result = 0
        if s.count < 1 {
            return 0
        }
        
        let arr = Array(s)
        var tempLen = 0
        var tempChar = arr[0]
        for i in 0...arr.count-1 {
            if arr[i] == tempChar {
                tempLen = tempLen + 1
                result = max(result, tempLen)
            } else {
                tempChar = arr[i]
                tempLen = 1
            }
        }
        
        return result
    }
    
    
    
    
    //42. 接雨水
    //https://leetcode.cn/problems/trapping-rain-water/description/
    func trap(_ height: [Int]) -> Int {
        var result = 0
        var stackArray = [Int]()
        if height.count < 3 {
            return 0
        }
        
        
        var leftIndex = 0
        var leftNum = 0
        
        var rightIndex = 0
        var rightNum = 0
        
        var tempBig = 0
        var tempBigIndex = 0
        var isGoing = true
        
        while isGoing {
            tempBig = 0
            stackArray.removeAll()
            
            if leftIndex >= height.count {
                isGoing = false;
                break //循环结束
            }
            
            while height[leftIndex] <= 0 {
                leftIndex = leftIndex + 1
                if leftIndex >= height.count {
                    break //循环结束
                }
            }
            
            if leftIndex >= height.count {
                isGoing = false;
                break //循环结束
            }
            
            leftNum = height[leftIndex]
            rightIndex = leftIndex + 1
            
            
            if rightIndex >= height.count {
                isGoing = false
                break
            }
            
            
            while height[rightIndex] < leftNum {
                
                if height[rightIndex] >= tempBig {
                    tempBig = height[rightIndex]
                    tempBigIndex = rightIndex
                }
                
                stackArray.append(height[rightIndex])
                rightIndex = rightIndex + 1
                
                if rightIndex >= height.count {
                    //右边全部都是低的
                    
                    for iIndex in leftIndex..<tempBigIndex {
                        if tempBig >= height[iIndex] {
                            result = result + ( tempBig - height[iIndex])
                        }
                    }
                    
                    
                    break
                }
            }
            
            if rightIndex >= height.count {
                leftIndex = tempBigIndex
                continue
            } else {
              var min = min(leftNum, height[rightIndex])
                stackArray.map { item in
                    result = result + (min - item)
                }
                leftIndex = rightIndex
            }
            
        }
        
        
        
        return result
    }
    
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

