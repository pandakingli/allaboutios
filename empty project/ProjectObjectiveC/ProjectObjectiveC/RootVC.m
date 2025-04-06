//
//  RootVC.m
//  ProjectObjectiveC
//
//

#import "RootVC.h"
/*
 给定一个含有 n 个正整数的数组和一个正整数 target 。
 找出该数组中满足其总和大于等于 target 的长度最小的 子数组，并返回其长度。如果不存在符合条件的子数组，返回 0 。
 示例 1：
 输入：target = 7, nums = [2,3,1,2,4,3]
 输出：2
 解释：子数组
 [4,3]
  是该条件下的长度最小的子数组。
 示例 2：
 输入：target = 4, nums = [1,4,4]
 输出：1
 示例 3：
 输入：target = 11, nums = [1,1,1,1,1,1,1,1]
 输出：0
  
 提示：
 1 <= target <= 109
 1 <= nums.length <= 105
 1 <= nums[i] <= 104
 
 */





@interface bNode : NSObject
@property(nonatomic,assign) NSInteger nodeValue;

@property(nonatomic,strong) bNode * leftNode;

@property(nonatomic,strong) bNode * rightNode;
@end


@interface RootVC ()

@end

@implementation RootVC

-(NSInteger) calcuteMinSizeOfNums:(NSArray*) nums withTarget:(NSInteger)  target {
    
    if (nums.count == 0) {
        return 0;
    }
    
    NSInteger subLeft = 0;
    NSInteger subRight = nums.count - 1;
    NSInteger result = 0;
    while (subLeft < subRight) {
        NSInteger temp = 0;
        for (NSInteger i = subLeft; i ++ ; i<= subRight) {
            NSNumber * num = nums[i];
            temp = temp + num.intValue;
        }
        if (temp > target) {
            result = subRight - subLeft + 1;
            NSNumber *numleft = nums[subLeft];
            NSNumber * numright = nums[subRight];
            if (numleft.intValue >= numright) {
                subRight = subRight - 1;
            } else {
                subLeft = subLeft + 1;
            }
            
        } else {
            break;
        }
        
    }
    
    return  result;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
    
}


-(NSInteger) maxSumWihtMoney:(NSArray*)moneyArr {
    //NSInteger fisrtSum = 0;
    //Max{A3} = Max{A[2],A[1]}
    //Max{A}
    //A5 = Max[A4,A3]
    
    
    return 0;
}

-(BOOL)checkNodeListHasPath:(bNode*) nodelist withTarget:(NSInteger) targetNum{
    
    if (nodelist == nil) {
        return  false;
    }
    
    if (nodelist.leftNode == nil && nodelist.rightNode == nil) {
        if (nodelist.nodeValue == targetNum) {
            return true;
        }
        return  false;
    }
    
    //判断targetnum - nodeValue
    if (nodelist.leftNode != nil) {
        if ([self checkNodeListHasPath:nodelist.leftNode withTarget:targetNum - nodelist.nodeValue]) {
            return true;
        }
    }
    
    if (nodelist.rightNode != nil) {
        if ([self checkNodeListHasPath:nodelist.rightNode withTarget:targetNum - nodelist.nodeValue]) {
            return true;
        }
    }
    
    return  false;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
