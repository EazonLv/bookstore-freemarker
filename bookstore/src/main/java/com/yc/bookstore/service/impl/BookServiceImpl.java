package com.yc.bookstore.service.impl;

import com.yc.bookstore.entity.Book;
import com.yc.bookstore.entity.BookExample;
import com.yc.bookstore.mapper.BookMapper;
import com.yc.bookstore.service.BookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.crypto.Data;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BookServiceImpl implements BookService {

    @Resource
    private BookMapper bookMapper;

    /**
     * 查询所有书籍
     * @return
     */
    @Override
    public List<Book> findAllBook() {
        BookExample example = new BookExample();
        return bookMapper.selectByExample(example);
    }

    /**
     * 查询所有有效的书籍
     *
     * @return
     */
    @Override
    public List<Book> findAllBookActive() {
        BookExample example = new BookExample();
        BookExample.Criteria criteria = example.createCriteria();
        criteria.andIsActiveEqualTo("Y");
        return bookMapper.selectByExample(example);
    }

    /**
     * 按种类查询书籍
     *
     * @return
     */
    @Override
    public List<Book> findBookBySort(Integer sortid) {
        BookExample example = new BookExample();
        BookExample.Criteria criteria = example.createCriteria();
        criteria.andIsActiveEqualTo("Y");
        criteria.andSortidEqualTo(sortid);
        return bookMapper.selectByExample(example);
    }

    /**
     * 按条件查询书籍
     * @param map1
     * @return
     */

    @Override
    public HashMap<String, Object> findBookByCon(Map<String,Object> map1) {


        HashMap<String,Object> map = new HashMap<>();
        if (map1.get("bookname")!=null)
        map.put("bookname",map1.get("bookname"));
        if (map1.get("price")!=null)
        map.put("price",map1.get("price"));
        if (map1.get("sale_amount")!=null)
        map.put("sale_amount",map1.get("sale_amount"));
        if (map1.get("createtime")!=null)
        map.put("createtime",map1.get("createtime"));
        if (map1.get("updatetime")!=null)
        map.put("updatetime",map1.get("updatetime"));
        if (map1.get("is_active")!=null)
        map.put("is_active",map1.get("is_active"));
        if (map1.get("sortname")!=null)
        map.put("sortname",map1.get("sortname"));
        return bookMapper.selectByCon(map);
    }
}
