package com.mystory001.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mystory001.domain.BoardDTO;
import com.mystory001.domain.PageDTO;
import com.mystory001.domain.ReplyDTO;
import com.mystory001.domain.ReplyPageDTO;

@Repository
public class BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.mystory001.mappers.boardMapper";

	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("BoardDAO getBoardList()");
		return sqlSession.selectList(namespace+".getBoardList", pageDTO);
	}

	public void insert(BoardDTO boardDTO) {
		System.out.println("BoardDAO insert()");
		sqlSession.insert(namespace+".insertBoard", boardDTO);
	}
	
	public int getMaxNo() {
		System.out.println("BoardDAO getMaxNo()");
		return sqlSession.selectOne(namespace+".getMaxNo");
	}

	public BoardDTO getBoard(BoardDTO boardDTO) {
		System.out.println("BoardDAO getBoard()");
		return sqlSession.selectOne(namespace+".getBoard",boardDTO);
	}

	public void readCount(BoardDTO boardDTO) {
		System.out.println("BoardDAO readCount()");
		sqlSession.update(namespace+".readCount", boardDTO);
	}

	public void update(BoardDTO boardDTO) {
		System.out.println("BoardDAO update()");
		sqlSession.update(namespace+".update", boardDTO);
	}
	
	public void delete(BoardDTO boardDTO) {
		System.out.println("BoardDAO delete()");
		sqlSession.delete(namespace+".delete", boardDTO);
	}

	public int getBoardCount(PageDTO pageDTO) {
		System.out.println("BoardDAO getBoardCount()");
		return sqlSession.selectOne(namespace+".getBoardCount", pageDTO);
	}

	public void replyInsert(ReplyDTO replyDTO) {
		System.out.println("BoardDAO replyInsert()");
		sqlSession.insert(namespace+".replyInsert", replyDTO);
	}

	public List<ReplyDTO> getReplyList(int boardNo, ReplyPageDTO replyPageDTO) {
		System.out.println("BoardDAO getReplyList()");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("boardNo", boardNo);
		params.put("startRow", replyPageDTO.getStartRow());
		params.put("pageSize", replyPageDTO.getPageSize());
		return sqlSession.selectList(namespace+".getReplyList", params);
	}

	public int getReplyCount(int boardNo) {
		System.out.println("BoardDAO getReplyCount()");
		return sqlSession.selectOne(namespace+".getReplyCount", boardNo);
	}
	
}
