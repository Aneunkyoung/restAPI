package com.restApi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String getAllBoard(){
		return "board/board"; 
	}  
}
