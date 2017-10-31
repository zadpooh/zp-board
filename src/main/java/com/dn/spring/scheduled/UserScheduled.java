package com.dn.spring.scheduled;

import org.springframework.stereotype.Component;

@Component
public class UserScheduled {
	/*
	@Autowired
	private UserService userService;
	
	// 매일 1시 0분 0초에 실행한다. 
	@Scheduled(cron = "0 0 1 * * *") 
	public void diapauseUser() {
		for( User userInfo : userService.selectUserDiapauseList()){
			userService.updateDiapauseUserInfo(userInfo);
		}
	}*/

	
//	Logger logger = LoggerFactory.getLogger(this.getClass());
//	private AtomicInteger loopCounter = new AtomicInteger();
//	   
//	@Autowired
//	private StopWatch watch;
//	   
//	@PostConstruct
//	public void init() {
//	   watch.start();
//	}
//	 
//	@Scheduled(fixedDelayString = "1000")
//	public void tick() throws InterruptedException{
//		watch.stop();
//		logger.info(watch.prettyPrint());
//	    String taskName = "task-";
//	    taskName = taskName + String.valueOf(loopCounter.getAndIncrement());
//	    watch.start(taskName);
//	}
//	 
//	@Bean
//	public StopWatch watch() {
//	    return new StopWatch();
//	}
	
	
}
