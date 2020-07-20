package com.yc.bookstore.service;

import com.yc.bookstore.entity.Book;

import javax.xml.crypto.Data;
import java.util.HashMap;
import java.util.List;

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
     * @param bookname
     * @param price
     * @param sale_amount
     * @param createtime
     * @param updatetime
     * @param is_active
     * @param sortname
     * @return
     */
    public HashMap<String, Object> findBookByCon(String bookname, float price, int sale_amount, Data createtime, Data updatetime, String is_active, String sortname);

}
