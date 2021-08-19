//
//  ViewController.m
//  operation
//
//  Created by Jz D on 2021/8/19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController





/**
 * 操作依赖
 * 使用方法：addDependency:
 */



// C trip ， face ， 瞎几把叫

- (void)addDependency {

    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];

    // 2.创建操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"A _ %d ---%@", i, [NSThread currentThread]); // 打印当前线程
        }
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"B  _ %d---%@", i, [NSThread currentThread]); // 打印当前线程
        }
    }];

    // 3.添加依赖
    [op2 addDependency:op1]; // 让op2 依赖于 op1，则先执行op1，在执行op2

    // 4.添加操作到队列中
    [queue addOperation:op1];
    [queue addOperation:op2];
}





- (void)viewDidLoad {
    [super viewDidLoad];


    NSLog(@"开始 \n\n\nha");
    [self addDependency];
    NSLog(@"ha \n\n\n结束");

}


@end
