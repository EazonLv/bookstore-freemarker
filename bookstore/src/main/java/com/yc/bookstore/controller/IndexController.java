package com.yc.bookstore.controller;

import com.yc.bookstore.base.BaseController;
import com.yc.bookstore.service.BookService;
import com.yc.bookstore.service.SortService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class IndexController extends BaseController {
    @Resource
    BookService bookService;
    @Resource
    SortService sortService;

    @RequestMapping("login")
    public String login(){return "user/login";}

    @RequestMapping("index")
    public String index(Model model){
        model.addAttribute("book",bookService.findAllBookActive());
        model.addAttribute("sort",sortService.findAllSortsActive());
        return "user/index";
    }

}
