//
//  ViewController.m
//  test
//
//  Created by Jz D on 2021/8/10.
//

#import "ViewController.h"

@interface ViewController ()



@property (atomic, strong , retain) NSString * name;




//  'copy' and 'strong',     不兼容


//  Property attributes 'copy' and 'strong' are mutually exclusive
//  @property (atomic, strong , copy) NSString * nick;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
