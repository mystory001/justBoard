package com.mystory001.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mystory001.domain.MemberDTO;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.mystory001.mappers.memberMapper";

	public void joinPro(MemberDTO memberDTO) {
		System.out.println("MemberDAO joinPro()");
		sqlSession.insert(namespace+".joinPro",memberDTO);
	}

	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO userCheck()");
		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
	}

	public String pwCheck(String id) {
		System.out.println("MemberDAO pwCheck()");
		return sqlSession.selectOne(namespace+".pwCheck", id);
	}

	
}
