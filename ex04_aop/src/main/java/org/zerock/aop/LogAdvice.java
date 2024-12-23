package org.zerock.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
@Aspect
public class LogAdvice {

//	@Before( "execution(* org.zerock.service.SampleService*.*(..))")
	public void logBefore() {
		log.info("=====================================");
	}
	
//	@Before("execution(* org.zerock.service.SampleService*.doAdd(String ,String )) && args(str3, str4)")
	public void logBeforeWithParam(String str3, String str4) {
		log.info("str1 : " + str3);
		log.info("str2 : " + str4);
	}

//	@AfterThrowing(pointcut = "execution(* org.zerock.service.SampleService*.*(..))", throwing = "exception")
	public void logException(Exception exception) {
		log.info("Exception............");
		log.info("exception : " + exception);
	}
	
//	@After( "execution(* org.zerock.service.SampleService*.*(..))")
	public void logAfter() {
		log.info("+++++++++++++++++++++++++++++++++++++++");
	}

//	@AfterReturning( "execution(* org.zerock.service.SampleService*.*(..))")
	public void logReturning() {
		log.info("---------------@AfterReturning----------------");
	}
	
	@Around("execution(* org.zerock.service.SampleService*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		
		long start = System.nanoTime();
		
		log.info("Target : " + pjp.getTarget());
		log.info("Param : " + Arrays.toString(pjp.getArgs()));
		
		log.info("Name : " + pjp.getSignature().getName());
		
		Object result = null;
		
		try {
			result = pjp.proceed();
		}catch(Throwable e) {
			e.printStackTrace();
		}
		
		long end = System.nanoTime();
		
		log.info("TIME : " + (end- start));
		
		
		if(result instanceof Integer) {
			return (Integer)result +10000;
		}else if(result instanceof String) {
			return result + "10000";
		}else {
			return String.valueOf(result) + "10000";
		}
		
	}
	
	
}
