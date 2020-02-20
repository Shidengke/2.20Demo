package com.shidengke.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shidengke.entity.Article;
import com.shidengke.service.ArticleService;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService service;
	
	@RequestMapping("list")
	public String getList(Model model,Article article,String choice,@RequestParam(defaultValue="1")int pageNum){
		 PageHelper.startPage(pageNum, 8);
		 List<Article> getlist = service.getList(article);
		 PageInfo<Article> page = new PageInfo<Article>(getlist);
		 model.addAttribute("getlist", getlist);
		 model.addAttribute("a", article);
		 model.addAttribute("page", page);
		 model.addAttribute("choice", choice);
		 
		 return "list";
	}
}
