package com.shidengke.service.impI;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shidengke.entity.Article;
import com.shidengke.mapper.ArticleMapper;
import com.shidengke.service.ArticleService;

@Service
public class ArticleServiceimpI implements ArticleService {

	@Autowired
	private ArticleMapper mapper;
	
	
	@Override
	public List<Article> getList(Article article) {
		System.out.println(article);
		return mapper.getList(article);
	}

}
