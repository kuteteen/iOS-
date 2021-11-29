//  by：十三哥 经过几天不断的努力终于将此源码完善。QQ350722326
//官网 https://iosgods.cn
// 和平精英滑条除草按钮天黑

#import "moni.h"
#import "HeeeNoScreenShotView.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <CFNetwork/CFNetwork.h>
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#import "ZSFakeTouch.h"
@implementation NSObject(hook)

//按钮赋值
- (void)toushi:(UISwitch *)swi{
    if (swi.isOn) {
        //开始点击
        [QQ350722326 beginTouchWithPoint:CGPointMake(100,200)];
        //移动
        [QQ350722326 moveTouchWithPoint:CGPointMake(100,100)];
        //结束点击
        [QQ350722326 endTouchWithPoint:CGPointMake(100,100)];
        NSLog(@"点击了开关-开启");
    }else{
        NSLog(@"点击了开关-关闭");
    }
    
}
- (void)cccc{
    NSLog(@"点击了隐私按钮2");
}

//定义hook
- (void)loadView {
   
   //创建开关========
   UISwitch * 开关 = [[UISwitch alloc] init];//天黑开关位置
   开关.transform = CGAffineTransformMakeScale(1,1);
   // 设置控件开启状态填充色
   开关.onTintColor = [UIColor purpleColor];
   // 设置控件关闭状态填充色
   开关.tintColor = [UIColor redColor];
   // 设置控件开关按钮颜色
   开关.thumbTintColor = [UIColor blueColor];
   [开关 setOn:NO animated:YES];
   [开关 addTarget:self action:@selector(toushi:) forControlEvents:UIControlEventValueChanged];
   
   //创建视图
   HeeeNoScreenShotView *开关隐藏视图 = [[HeeeNoScreenShotView alloc] initWithFrame:CGRectMake(300, 50, 50, 30)];
   开关隐藏视图.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0.5];
   UIWindow *开关根视图 = [[[UIApplication sharedApplication] delegate] window];
   //把开关添加到隐藏视图
   [开关隐藏视图 addSubview:开关];
   //再隐藏视图添加到根视图
   [开关根视图 addSubview:开关隐藏视图];

}


//加载hook
 + (void)load{
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 [self loadView];

 });
 }
//加载hook



@end
