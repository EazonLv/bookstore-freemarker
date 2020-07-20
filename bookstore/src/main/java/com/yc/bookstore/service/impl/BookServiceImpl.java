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
     *
     * @param bookname
     * @param price
     * @param sale_amount
     * @param createtime
     * @param updatetime
     * @param is_active
     * @param sortname
     * @return
     */
    @Override
    public HashMap<String, Object> findBookByCon(String bookname, float price, int sale_amount, Data createtime, Data updatetime, String is_active, String sortname) {
        HashMap<String,Object> map = new HashMap<>();
        map.put("bookname",bookname);
        map.put("price",price);
        map.put("sale_amount",sale_amount);
        map.put("createtime",createtime);
        map.put("updatetime",updatetime);
        map.put("is_active",is_active);
        map.put("sortname",sortname);
        return bookMapper.selectByCon(map);
    }
}
