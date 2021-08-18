
```



struct dispatch_queue_global_s _dispatch_root_queues[] = {









```



<hr>



<hr>



```

_DISPATCH_ROOT_QUEUE_ENTRY(MAINTENANCE, DISPATCH_PRIORITY_FLAG_OVERCOMMIT,
		.dq_label = "com.apple.root.maintenance-qos.overcommit",
		.dq_serialnum = 5,
	),
```



<hr>



<hr>



DQF



Dispatch Queue F

<hr>


<hr>



<hr>


<hr>




```



#define DISPATCH_QUEUE_WIDTH_POOL (DISPATCH_QUEUE_WIDTH_FULL - 1)	

	// global 全局并发队列
      //  4095



#define DISPATCH_QUEUE_WIDTH_MAX  (DISPATCH_QUEUE_WIDTH_FULL - 2)	


	// 普通并发队列,  自己创建的
      //  4094


```




<hr>


<hr>




<hr>


```

#define DISPATCH_QUEUE_WIDTH_FULL_BIT		0x0020000000000000ull



#define DISPATCH_QUEUE_WIDTH_FULL			0x1000ull           //  4096



```

<hr>
