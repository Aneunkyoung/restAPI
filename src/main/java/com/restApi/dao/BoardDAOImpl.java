package com.restApi.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restApi.dto.Board;
import com.restApi.mapper.BoardMapper;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired 
	private SqlSession sqlSession;

	@Override
	public int insertBoard(Board board) {
		return sqlSession.getMapper(BoardMapper.class).insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.getMapper(BoardMapper.class).updateBoard(board);
	}

	@Override
	public int deleteBoard(int no) {
		return sqlSession.getMapper(BoardMapper.class).deleteBoard(no);
	}

	@Override
	public List<Board> selectBoardList(Map<String, Object> map) {
		return sqlSession.getMapper(BoardMapper.class).selectBoardList(map);
	}

	@Override
	public int selectBoardCount() {
		return sqlSession.getMapper(BoardMapper.class).selectBoardCount();
	}

	@Override
	public Board selectBoard(int no) {
		return sqlSession.getMapper(BoardMapper.class).selectBoard(no);
	}
}
