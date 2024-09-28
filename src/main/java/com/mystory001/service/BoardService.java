package com.mystory001.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mystory001.dao.BoardDAO;
import com.mystory001.domain.BoardDTO;

@Service
public class BoardService {
	
	@Inject
	private BoardDAO boardDAO;

	public List<BoardDTO> getBoardList() {
		System.out.println("BoardService getBoardList()");
		return boardDAO.getBoardList();
	}

}
