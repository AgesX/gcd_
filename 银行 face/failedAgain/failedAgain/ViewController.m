//
//  ViewController.m
//  failedAgain
//
//  Created by Jz D on 2021/8/12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void) testOne{
    
    NSArray * one = @[@"123"];
    
    NSArray * two = [one copy];
    
    // NSLog(@"one  %p, \n two  %p", &one, &two);
    NSLog(@"\n  one  %p, \n  two  %p", one, two);
    
    //    浅拷贝， 回答错误， 一条， B 站， 比心
    
    //    因为其，不可变更
    
}


- (void) testTwo{
    
    NSArray * one = @[@"123"];
    
    NSArray * two = [one mutableCopy];
    
    NSLog(@"\n  one  %p, \n  two  %p", one, two);

    
}






- (void) testThree{
    
    NSMutableArray * one = [NSMutableArray arrayWithArray: @[@"123"]];
    
    NSMutableArray * two = [one mutableCopy];
    
    NSLog(@"\n  one  %p, \n  two  %p", one, two);

    
}




- (void) testFour{
    
    NSMutableArray * one = [NSMutableArray arrayWithArray: @[@"123"]];
    
    NSArray * two = [one copy];
    
    NSLog(@"\n  one  %p, \n  two  %p", one, two);

    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
   // [self testOne];
   // [self testTwo];
    [self testThree];
 //   [self testFour];
}


@end
