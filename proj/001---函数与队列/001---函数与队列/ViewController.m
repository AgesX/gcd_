//
//  ViewController.m
//  001---函数与队列
//
//  Created by Cooci on 2018/6/21.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 队列总共有几种 3 - 4
    // libdispatch.dylib - GCD 底层源码
    // 队列怎么创建 : DISPATCH_QUEUE_SERIAL / DISPATCH_QUEUE_CONCURRENT
    
    // OS_dispatch_queue_serial
    dispatch_queue_t serial = dispatch_queue_create("cooci", DISPATCH_QUEUE_SERIAL);
    // OS_dispatch_queue_concurrent
    // OS_dispatch_queue_concurrent
    dispatch_queue_t conque = dispatch_queue_create("cooci", DISPATCH_QUEUE_CONCURRENT);
    // DISPATCH_QUEUE_SERIAL max && 1
    // queue 对象 alloc init class
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    // 多个 - 集合
    dispatch_queue_t globQueue = dispatch_get_global_queue(0, 0);
    
    
    NSLog(@"%@-%@-%@-%@",serial,conque,mainQueue,globQueue);
    
    
    //
    
    /*
    // 1
    
    [self deng_wbinterDemo2];
    */
    
    
    
    //
    
    
    
    //
    
    
    
    /*
     
     // 2
   // [self testDemo_X];
    [self cp_testDemo_X];
    
    */
    
    
    //
    
    /*
    
    //  3
    
    
    [self jiang_testDemo1];
    //
    */
    
    
    /*
    // 4
    [self jiang_two_testDemo1];
    
    */
    
    
    /*
     
    // 5
    [self jiang_three_testDemo1];
    
     */
    
    
    
    
    
    
    
    /*
     
    // 6
    
    
    [self wbinterDemo_q_wei_bo];
     
      */
    
    
    
    
    [self wbinterDemo_q_wei_bo_two];
    
    
    
    //
    
    
    //
    
    
    //
    
    
    //
    
    
    
    // dispatch_async
    // block
    // block() 内部
    // block()
    // _dispatch_call_block_and_release
    // _dispatch_call_block_and_release()
    // 同步和异步函数
    
    
    /*
    dispatch_async(conque, ^{
        NSLog(@"12334");
    });
    
    [self textDemo2];
     */
}

/**
 主队列同步
 不会开线程
 */
- (void)mainSyncTest{
    
    NSLog(@"0");
    // 等
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"1");
    });
    NSLog(@"2");
}
/**
 主队列异步
 不会开线程 顺序
 */
- (void)mainAsyncTest{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"1");
    });
    NSLog(@"2");
}

/**
 全局异步
 全局队列:一个并发队列
 */
- (void)globalAsyncTest{
    
    for (int i = 0; i<20; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"%d-%@",i,[NSThread currentThread]);
        });
    }
    NSLog(@"hello queue");
}

/**
 全局同步
 全局队列:一个并发队列
 */
- (void)globalSyncTest{
    for (int i = 0; i<20; i++) {
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"%d-%@",i,[NSThread currentThread]);
        });
    }
    NSLog(@"hello queue");
}

#pragma mark - 队列函数的应用

- (void)textDemo2{
    // 同步队列
    dispatch_queue_t queue = dispatch_queue_create("cooci", NULL);
    NSLog(@"1");
    // 异步函数
    dispatch_async(queue, ^{
        NSLog(@"2");
        // 同步
        dispatch_sync(queue, ^{
            NSLog(@"3");
        });
        // NSLog(@"4");
    });
    NSLog(@"5");
    
    // 1 5 2 死锁
    //

}







- (void)jiang_testDemo1{
    
    dispatch_queue_t queue = dispatch_queue_create("cooci", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1");
    dispatch_async(queue, ^{
        NSLog(@"2");
        dispatch_sync(queue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");

}





- (void)jiang_two_testDemo1{
    
    dispatch_queue_t queue = dispatch_queue_create("cooci", NULL);
    //  此时，为串行队列
    //  NULL,  即 DISPATCH_QUEUE_SERIAL
    
    
    
    
    
    
    NSLog(@"1");
    dispatch_async(queue, ^{
        NSLog(@"2");
        
        
        // outer 匿名函数块
        
        // 死锁，互相等待
        dispatch_sync(queue, ^{
            
            //  Thread 4: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0)
            
            //  死锁，崩溃
            
            
            //
            
            //
            
            // inner 匿名函数块，
            // 等待的是， outer 匿名函数块
            
            NSLog(@"3");
        });
        NSLog(@"4");
        
        
        // 死锁，
        
        // 堆栈中，著名的 #1    0x000000010acfe65c in _dispatch_sync_f_slow ()

    });
    NSLog(@"5");
    
    
    
    // 152 挂
    
    

}






- (void)jiang_three_testDemo1{
    
    dispatch_queue_t queue = dispatch_queue_create("cooci", NULL);
    //  此时，为串行队列
    //  NULL,  即 DISPATCH_QUEUE_SERIAL
    
    
    
    
    
    
    NSLog(@"1");
    dispatch_async(queue, ^{
        NSLog(@"2");
        
        
        // outer 匿名函数块
        
        // 死锁，互相等待
        dispatch_sync(queue, ^{
            
            //  Thread 4: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0)
            
            //  死锁，崩溃
            
            
            //
            
            //
            
            // inner 匿名函数块，任务
            // 等待的是， outer 匿名函数块，任务
            
            NSLog(@"3");
        }); // 下面没代码，依旧死锁， dead lock

        
        
        // 死锁，
        
        // 堆栈中，著名的 #1    0x000000010acfe65c in _dispatch_sync_f_slow ()

    });
    NSLog(@"5");
    
    
    
    // 152 挂
    
    

}










- (void)testDemo_X{
    
    dispatch_queue_t queue = dispatch_queue_create("cooci", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1");
    // 耗时
    dispatch_async(queue, ^{
        
        // 进入耗时
        NSLog(@"2");
        dispatch_async(queue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    
    // 先走下面，不阻塞，不耗时
    
    
    NSLog(@"5");

    // 答案： 15243
}










- (void)cp_testDemo_X{
    
    dispatch_queue_t queue = dispatch_queue_create("cooci", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1");
    // 耗时
    dispatch_async(queue, ^{
        
        // 进入耗时
        NSLog(@"2");
        dispatch_async(queue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    
    // 先走下面，阻塞了
    sleep(1);               //  主线程，        卡顿、延迟，          回不来
    
    NSLog(@"5");

    // 答案： 15243
}











/**
 同步并发 : 堵塞 同步锁  队列 : resume supend   线程 操作, 队列挂起 任务能否执行
 */
- (void)concurrentSyncTest{

    //1:创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("Cooci", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i<20; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%d-%@",i,[NSThread currentThread]);
        });
    }
    NSLog(@"hello queue");
}


/**
 异步并发: 有了异步函数不一定开辟线程
 */
- (void)concurrentAsyncTest{
    //1:创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("Cooci", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i<20; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%d-%@",i,[NSThread currentThread]);
        });
    }
    NSLog(@"hello queue");
}

/**
 串行异步队列

 */
- (void)serialAsyncTest{
    //1:创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("Cooci", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i<20; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%d-%@",i,[NSThread currentThread]);
        });
    }
    
    NSLog(@"hello queue");
}

/**
 串行同步队列 : FIFO: 先进先出
 */
- (void)serialSyncTest{
    //1:创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("Cooci", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i<20; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%d-%@",i,[NSThread currentThread]);
        });
    }

}


/**
 * 还原最基础的写法,很重要
 */

- (void)syncTest{
    // 把任务添加到队列 --> 函数
    // 任务 _t ref c对象
    dispatch_block_t block = ^{
        NSLog(@"hello GCD");
    };
    //串行队列
    dispatch_queue_t queue = dispatch_queue_create("com.lg.cn", NULL);
    // 函数
    dispatch_async(queue, block);
    
    // 函数 队列
    // 函数队列
    // block () - GCD 下层封装
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        NSLog(@"%@",[NSThread currentThread]);
    });
}







- (void)wbinterDemo_q_wei_bo{//
    dispatch_queue_t queue = dispatch_queue_create("com.lg.cooci.cn", DISPATCH_QUEUE_CONCURRENT);
    
    //  并发队列，管子粗
    
    
    
    // 1 2 3
    //  0 (7 8 9)
    dispatch_async(queue, ^{ // 耗时
        NSLog(@"1");
    });
    dispatch_async(queue, ^{
        NSLog(@"2");
    });
    
    // 堵塞哪一行
    
    
    
    // 同步任务，具有阻塞的特性
    
    
    
    dispatch_sync(queue, ^{
        NSLog(@"3");
        
        
        //  同步任务，阻塞下面的 0
        
        //  他没有阻塞上面的, 也不会阻塞自己
    });
    
    NSLog(@"0");
    
    
    
    
    
    
    
    // 123 , 没有顺序
    // （ 虽然， 3 是同步 ）
    
    
    
    
    // 0
    
    
    
    
    // 789， 没有顺序
    
    
    
    

    dispatch_async(queue, ^{
        NSLog(@"7");
    });
    dispatch_async(queue, ^{
        NSLog(@"8");
    });
    dispatch_async(queue, ^{
        NSLog(@"9");
    });
    
    
    // 我的程序: 3120789
    
    
    
    
    
    // A: 1230789
    // B: 1237890
    // C: 3120798
    // D: 2137890
}





// 并发，真神奇，意想不到
- (void)wbinterDemo_q_wei_bo_two{//
    dispatch_queue_t queue = dispatch_queue_create("com.lg.cooci.cn", DISPATCH_QUEUE_CONCURRENT);
    
    //  并发队列，管子粗
    
    
    
    // 1 2 3
    //  0 (7 8 9)
    dispatch_async(queue, ^{ // 耗时
        NSLog(@"1");
    });
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"2");
    });
    
    // 堵塞哪一行
    
    
    
    // 同步任务，具有阻塞的特性
    
    
    
    dispatch_sync(queue, ^{
        NSLog(@"3");
        
        
        //  同步任务，阻塞下面的 0
        
        //  他没有阻塞上面的, 也不会阻塞自己
    });
    
    NSLog(@"0");
    
    
    
    
    
    
    
    // 123 , 没有顺序
    // （ 虽然， 3 是同步 ）
    
    
    
    
    // 0
    
    
    
    
    // 789， 没有顺序
    
    
    
    

    dispatch_async(queue, ^{
        NSLog(@"7");
    });
    dispatch_async(queue, ^{
        NSLog(@"8");
    });
    dispatch_async(queue, ^{
        NSLog(@"9");
    });
    
    
    // 我的程序: 3107892
    
    
    
    
    
    // A: 1230789， LG 的 OK
    
    // B: 1237890
    
    // C: 3120798， LG 的 OK
    
    // D: 2137890
}




void testMethod(void){
    sleep(3);
}









- (void)deng_wbinterDemo2{
    
    // 耗能问题 ---- 同步和异步函数
    // 用 ，可以解决 ---- 并发 多线程问题
    
    CFAbsoluteTime time = CFAbsoluteTimeGetCurrent();
    
    dispatch_queue_t queue = dispatch_queue_create("com.lgcooci.cn", DISPATCH_QUEUE_SERIAL);
   
    /*
    
    dispatch_async(queue, ^{
          // 异步慢, 20 毫米左右
     
          // 异步，消耗性能
     
     
          // 在某个时刻，依赖某个线程，来执行
     
          // CPU 需要时间，来调度执行
     
//        testMethod();
    });
//
    */
    
    
    
    
    
    
    dispatch_sync(queue, ^{
        // 同步快, 5 毫米左右
        
        
        //testMethod();
        
        
        
    });
    
    
    
//    testMethod();
        
    NSLog(@"性能耗时 %f  ms 毫秒",( CFAbsoluteTimeGetCurrent()-time ) * 1000);
}













- (void)wbinterDemo3{
    
    dispatch_queue_t queue1 = dispatch_queue_create("com.lgcooci2.cn", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(queue1, ^{
        NSLog(@"1");
    });
    dispatch_async(queue1, ^{
        NSLog(@"2");
    });

    dispatch_barrier_async(queue1, ^{
        NSLog(@"3");
    });
    dispatch_async(queue1, ^{
        NSLog(@"4");
    });
}


@end
