package com.restApi.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.restApi.dto.Board;

public interface BoardMapper {
	/* 게시글 작성 */
	int insertBoard(Board board);
	/* 게시글 변경 */
	int updateBoard(Board board);
	/* 게시글 삭제 */
	int deleteBoard(int no);
	/* 게시글 조회 */
	List<Board> selectBoardList(Map<String, Object> map);
	
	/* 게시물 개수 조회 */
	int selectBoardCount();
	/* 특정 게시물 조회 */
	Board selectBoard(int no);
}
