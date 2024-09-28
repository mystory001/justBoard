package com.mystory001.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mystory001.domain.MemberDTO;
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
	@GetMapping("member/join")
	public String join() {
		System.out.println("MemberController join()");
		return "member/join"; //주소 변경 없이 이동하는 방식(forward)
	}
	
	/* 회원가입처리 */
	@PostMapping("member/joinPro")
	public String joinPro(MemberDTO memberDTO) {
		System.out.println("MemberController joinPro()");
		memberService.joinPro(memberDTO); //join.jsp에서 입력한 데이터 → request → memberDTO 변수에 전달 → DB 작업 
		return "redirect:/"; //main으로 주소 변경하면서 이동
	}
	
	/* 로그인 → 회원 확인 */
	@PostMapping("/loginPro")
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro()");
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO); //폼에서 입력받은 데이터가 존재하는지 확인
		
		if(memberDTO2 != null) {
			session.setAttribute("id", memberDTO2.getId());
			session.setAttribute("name", memberDTO2.getName());
			return "redirect:/";
		} else {
			return "member/loginmsg";
		}
	}
	
	/* 로그아웃 */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		session.invalidate();
		return "redirect:/";
	}
	
	/* 내 정보 확인 */
	@GetMapping("member/check")
	public String check(HttpSession session) {
		System.out.println("MemberController check()");
		//로그인이 되지 않았을 때 → 세션이 없음 → 페이지 접근 X
		//로그인이 되었을 때 → 세션이 있음 → 페이지 접근 O
		if(session.getAttribute("id")==null) {
			return "/member/loginmsg2";
		}
		return "/member/check";
	}
	
	/* 내 정보 확인 절차 */
	@PostMapping("member/checkPro")
	public String checkPro(@RequestParam("pw") String inputPw, HttpSession session, MemberDTO memberDTO) {
		System.out.println("MemberController checkPro()");
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		String pw = memberService.pwCheck(id);
		
		if(pw!=null && pw.equals(inputPw)) {
			return "/member/mypage";
		} else {
			return "/member/checkmsg";
		}
	}
	
	@GetMapping("member/checkmsg")
	public String checkmsg() {
		System.out.println("MemberController checkmsg()");
		return "/member/check";
	}
	
	@PostMapping("member/mypage")
	public String mypage(HttpSession session) {
		System.out.println("MemberController mypage()");
		return "/member/mypage";
	}
	
	@PostMapping("member/updatePro")
	public String updatePro(MemberDTO memberDTO) {
		System.out.println("MemberController updatePro()");
		memberService.update(memberDTO);
		return "redirect:/";
	}
	
	@PostMapping("member/deletePro")
	public String deletePro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController deletePro()");
		memberService.delete(memberDTO);
		session.invalidate();
		return "redirect:/";
	}
	
	/* 아이디 중복확인 */
	@GetMapping("member/idCheck")
	@ResponseBody
	public String idCheck(MemberDTO memberDTO, HttpServletResponse response){
		System.out.println("MemberController idCheck()");
		MemberDTO memberDTO1 = memberService.idCheck(memberDTO.getId());
		String result = "";
		if(memberDTO1!=null) {
			result = "iddup";
		} else {
			result = "idOk";
		}
		System.out.println(result);
		return result;
	}
	
}
