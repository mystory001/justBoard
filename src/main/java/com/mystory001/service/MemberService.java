package com.mystory001.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mystory001.dao.MemberDAO;
import com.mystory001.domain.MemberDTO;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;
	
	public void joinPro(MemberDTO memberDTO) {
		System.out.println("MemberService joinPro()");
		memberDTO.setDate(new Timestamp(System.currentTimeMillis())); //가입 날짜 설정
		memberDAO.joinPro(memberDTO);
	}

	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberService userCheck()");
		return memberDAO.userCheck(memberDTO);
	}

	public String pwCheck(String id) {
		System.out.println("MemberService userPw()");
		return memberDAO.pwCheck(id);
	}

	public void update(MemberDTO memberDTO) {
		System.out.println("MemberService update()");
		memberDAO.update(memberDTO);
	}

	public void delete(MemberDTO memberDTO) {
		System.out.println("MemberService delete()");
		memberDAO.delete(memberDTO);
		
	}

	public MemberDTO idCheck(String id) {
		System.out.println("MemberService idCheck()");
		return memberDAO.idCheck(id);
	}
	
}
