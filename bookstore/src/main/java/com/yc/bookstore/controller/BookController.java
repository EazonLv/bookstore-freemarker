package com.yc.bookstore.controller;

import com.alibaba.fastjson.JSONObject;
import com.yc.bookstore.base.BaseController;
import com.yc.bookstore.entity.Book;
import com.yc.bookstore.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("book")
public class BookController extends BaseController {
    @Resource
    BookService bookService;

    @RequestMapping(value = "/findBookBySortName",method = RequestMethod.POST)
    public String findBookBySortname(Model model, @RequestParam("JSONString") String JSONString){
        JSONObject object = JSONObject.parseObject(JSONString);

        String sortname = object.getString("sortname");
        HashMap<String,Object> map = new HashMap<>();
        map.put("sortname",sortname);

        HashMap<String,Object> books = bookService.findBookByCon(map);
        model.addAttribute("books",map);
        return "user/bookBySort";
    }
}
