package com.restApi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.restApi.service.BoardService;

@Controller
public class HomeController {
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String getAllBoard(Model model){
		model.addAttribute("commentCount", boardService.getBoardCount());
		return "board/board"; 
	}  
}