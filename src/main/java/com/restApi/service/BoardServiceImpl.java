package com.restApi.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restApi.dao.BoardDAO;
import com.restApi.dto.Board;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO boardDAO;

	@Transactional
	@Override
	public void addBoard(Board board) {
		boardDAO.insertBoard(board);
	}

	@Transactional
	@Override
	public void modifyBoard(Board board) {
		boardDAO.updateBoard(board);
	}

	@Transactional
	@Override
	public void removeBoard(int no) {
		boardDAO.deleteBoard(no);
	}

	@Override
	public List<Board> getBoardList(Map<String, Object> map) {
		return boardDAO.selectBoardList(map);
	}

	@Override
	public int getBoardCount() {
		return boardDAO.selectBoardCount();
	}

	@Override
	public Board getBoard(int no) {
		return boardDAO.selectBoard(no);
	}
}
