package com.mystory001.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mystory001.dao.BoardDAO;
import com.mystory001.domain.BoardDTO;
import com.mystory001.domain.PageDTO;
import com.mystory001.domain.ReplyDTO;
import com.mystory001.domain.ReplyPageDTO;

@Service
public class BoardService {
	
	@Inject
	private BoardDAO boardDAO;

	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("BoardService getBoardList()");
		
		//시작하는 행 번호 구하기(currentPage,pageSize)
		int currentPage = pageDTO.getCurrentPage();
		int pageSize = pageDTO.getPageSize();
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return boardDAO.getBoardList(pageDTO);
	}

	public void insert(BoardDTO boardDTO) {
		System.out.println("BoardService insert()");
		//글번호, 날짜, 조회수 작업
		boardDTO.setNo(boardDAO.getMaxNo()+1); //글 번호 -> 기본 글 번호 메소드 생성 후 호출 -> 글 번호 + 1로 처리
		boardDTO.setWritetime(new Timestamp(System.currentTimeMillis())); 
		boardDTO.setReadcount(0);
		
		boardDAO.insert(boardDTO);
	}

	public BoardDTO getBoard(BoardDTO boardDTO) {
		System.out.println("BoardService getBoard()");
		return boardDAO.getBoard(boardDTO);
	}

	public void readCount(BoardDTO boardDTO) {
		System.out.println("BoardService readCount()");
		int readcount = boardDTO.getReadcount() + 1;
		boardDTO.setReadcount(readcount);
		boardDAO.readCount(boardDTO);
	}

	public void update(BoardDTO boardDTO) {
		System.out.println("BoardService update()");
		boardDAO.update(boardDTO);
	}
	
	public void delete(BoardDTO boardDTO) {
		System.out.println("BoardService delete()");
		boardDAO.delete(boardDTO);
	}

	public int getBoardCount(PageDTO pageDTO) {
		System.out.println("BoardService getBoardCount()");
		return boardDAO.getBoardCount(pageDTO);
	}

	public void replyInsert(ReplyDTO replyDTO) {
		System.out.println("BoardService replyInsert()");
		replyDTO.setReplyHidden(false); //Boolean값으로 설정
		replyDTO.setReplyWriteTime(new Timestamp(System.currentTimeMillis())); //댓글 작성 시간
		boardDAO.replyInsert(replyDTO);
	}

	public List<ReplyDTO> getReplyList(int boardNo, ReplyPageDTO replyPageDTO) {
		System.out.println("BoardService getReplyList()");
		
		//시작하는 행 번호 구하기(currentPage,pageSize)
		int currentPage = replyPageDTO.getCurrentPage();
		int pageSize = replyPageDTO.getPageSize();
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
		replyPageDTO.setStartRow(startRow - 1);
		replyPageDTO.setEndRow(endRow);
		
		return boardDAO.getReplyList(boardNo, replyPageDTO);
	}
	
	public int getReplyCount(int boardNo) {
		System.out.println("BoardSerivce getReplyCount()");
		return boardDAO.getReplyCount(boardNo);
	}

}
