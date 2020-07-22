package com.yc.bookstore.service;

import com.yc.bookstore.entity.Book;

import javax.xml.crypto.Data;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BookService {

    /**
     * 查询所有书籍
     * @return
     */
    public List<Book> findAllBook();

    /**
     * 查询所有有效的书籍
     * @return
     */
    public List<Book> findAllBookActive();


    /**
     * 按种类查询书籍
     * @param sortid
     * @return
     */
    public List<Book> findBookBySort(Integer sortid);

    /**
     * 按条件查询书籍
     * @param map
     * @return
     */

    public HashMap<String, Object> findBookByCon(Map<String,Object> map);

}
