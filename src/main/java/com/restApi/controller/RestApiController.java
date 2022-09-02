package com.restApi.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import com.restApi.dto.Board;
import com.restApi.service.BoardService;
import com.restApi.util.Pager;

@RestController
public class RestApiController {
	@Autowired
	BoardService boardService;
	
	/* 모든 게시글 조회 */
	@GetMapping("/board_list")
	public Map<String, Object> getAllBoardList(@RequestParam(defaultValue = "1") int pageNum) {
		int totalBoard=boardService.getBoardCount();
		int pageSize=5; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize); 
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		
		Map<String, Object> returnMap=new HashMap<String, Object>();
		returnMap.put("boardList", boardService.getBoardList(pagerMap));
		returnMap.put("commentCount", boardService.getBoardCount());
		returnMap.put("pager", pager);
		
		return returnMap;
	}
	
	
	/* 게시글 등록 */
	@PostMapping("/board_add")
	public String boardWrite(@RequestBody Board board) {
		board.setContent(HtmlUtils.htmlEscape(board.getContent()));
		boardService.addBoard(board);
		return "success"; 
	}
	
	/* 특정 게시글 정보 가져오기 */
	@GetMapping("/board_view")
	public Board boardView(int no) {
		return boardService.getBoard(no);
	}
	
	/* 게시글 변경 */
	@PutMapping("board_modify")
	public String boardModify(@RequestBody Board board) {
		boardService.modifyBoard(board);
		return "success";
	}
	
	/* 게시글 삭제 */
	@DeleteMapping("board_remove")
	public String boardRemove(int no) {
		boardService.removeBoard(no);
		return "success";
	}
}
