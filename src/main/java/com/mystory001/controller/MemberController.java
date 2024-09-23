package com.mystory001.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mystory001.service.MemberService;

@Controller
public class MemberController {
	
	//public @interface Controller {
		/**
		 * The value may indicate a suggestion for a logical component name,
		 * to be turned into a Spring bean in case of an autodetected component.
		 * @return the suggested component name, if any
		 */
		//String value() default "";
	//}
	
	@Inject
	private MemberService memberService;
	
	/* 회원가입 */
	@GetMapping
	String join() {
		System.out.println("MemberController join()");
		return "member/join";
	}
	
	/* 회원가입처리 */
	@PostMapping
	String joinPro() {
		System.out.println("MemberController joinPro()");
		
		memberService.join();
		
		
		return "main";
	}
	
	
	
}
