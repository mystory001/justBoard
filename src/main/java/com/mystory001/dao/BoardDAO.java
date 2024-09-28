package com.mystory001.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mystory001.domain.BoardDTO;

@Repository
public class BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.mystory001.mappers.boardMapper";

	public List<BoardDTO> getBoardList() {
		System.out.println("BoardDAO getBoardList()");
		return sqlSession.selectList(namespace+".getBoardList");
	}
	
}
