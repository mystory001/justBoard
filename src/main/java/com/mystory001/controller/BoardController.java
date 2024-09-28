package com.mystory001.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mystory001.domain.BoardDTO;
import com.mystory001.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	private BoardService boardService;
	
	/* 게시판 글 들고오기 */
	@GetMapping("/")
	public String main(HttpServletRequest request, Model model) {
		System.out.println("BoardController main()");
		
		List<BoardDTO> boardList = boardService.getBoardList(); //게시물
		
		
		return "/";
	}
	
	/* 글쓰기 */
	@GetMapping("/insert")
	public String insert() {
		System.out.println("BoardController");
		return "board/insert";
	}
	
	@PostMapping("/insertPro")
	public String insertPro() {
		return "";
	}

}
