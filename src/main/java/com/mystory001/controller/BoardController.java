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
import com.mystory001.domain.PageDTO;
import com.mystory001.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	private BoardService boardService;
	
	/* 게시판 글 들고오기 */
	@GetMapping("/list")
	public String main(HttpServletRequest request, Model model, PageDTO pageDTO) {
		System.out.println("BoardController main()");
		
		String search = request.getParameter("search"); //검색어 가져오기
		
		//페이지
		int pageSize = 5; //화면에 보여줄 글의 개수
		String pageNum = request.getParameter("pageNum");
		if(pageNum ==null) {
			pageNum = "1";
		}
		int currentPage =Integer.parseInt(pageNum);	//int형 currentPage 변수명에 pageNum을 정수형으로 변경	
		
		//pageDTO에 저장
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setSearch(search);
		
		List<BoardDTO> boardList = boardService.getBoardList(pageDTO); //게시물
		
		int count = boardService.getBoardCount(pageDTO); //전체 글의 개수 구하기
		int pageBlock = 5; //한 화면에 보여 줄 페이지 개수 설정
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1; //한 화면에 보여 줄 시작 페이지(1~10 -> 1, 11~20 -> 11,...)
		int endPage = startPage + pageBlock - 1; //한 화면에 보여 줄 끝 페이지
		int pageCount = count / pageSize + (count%pageSize==0? 0:1); //전체 페이지 개수
		if(endPage>pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("pageDTO",pageDTO);
		
		return "board/list";
	}
	
	@GetMapping("/content")
	public String content(BoardDTO boardDTO, Model model) {
		System.out.println("BoardController content()");
		boardDTO = boardService.getBoard(boardDTO); //글에 대한 정보
		boardService.readCount(boardDTO); //조회수
		model.addAttribute("boardDTO",boardDTO);
		return "board/content";
	}
	
	/* 글쓰기 */
	@GetMapping("/insert")
	public String insert() {
		System.out.println("BoardController insert()");
		return "board/insert";
	}
	
	@PostMapping("/insertPro")
	public String insertPro(BoardDTO boardDTO) {
		System.out.println("BoardController insertPro()");
		boardService.insert(boardDTO);
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/update")
	public String update(BoardDTO boardDTO, Model model) {
		System.out.println("BoardController update()");
		boardDTO = boardService.getBoard(boardDTO);
		
		model.addAttribute("boardDTO", boardDTO);
		return "board/update";
	}
	
	@PostMapping("/updatePro")
	public String updatePro(BoardDTO boardDTO) {
		System.out.println("BoardController update()");
		boardService.update(boardDTO);
		return "redirect:/board/list";
	}
	
	@GetMapping("delete")
	public String delete(BoardDTO boardDTO) {
		System.out.println("BoardController delete()");
		boardService.delete(boardDTO);
		return "redirect:/board/list";
	}

}
