package com.restApi.service;

import java.util.List;
import java.util.Map;

import com.restApi.dto.Board;

public interface BoardService {
	/* 게시글 작성 */
	void addBoard(Board board);
	/* 게시글 변경 */
	void modifyBoard(Board board);
	/* 게시글 삭제 */
	void removeBoard(int no);
	/* 게시글 조회 */
	List<Board> getBoardList(Map<String, Object> map);
	
	/* 게시글 개수 조회 */
	int getBoardCount();
	/* 특정 게시글 조회 */
	Board getBoard(int no);
}
