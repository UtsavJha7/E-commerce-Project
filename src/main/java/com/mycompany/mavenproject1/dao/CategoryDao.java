/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mavenproject1.dao;

import com.mycompany.mavenproject1.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author utsav
 */
public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    //save category to db
    public int saveCategory(Category cat){
        Session openSession = this.factory.openSession();
        Transaction beginTransaction = openSession.beginTransaction();
        int catId =(int)openSession.save(cat);
        beginTransaction.commit();
        openSession.close();
        return catId;
}
    public List<Category> getCategories(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }
    public Category getCategoryById(int cid){
        Category cat =null;
        try{
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cid);
            session.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
          return cat;  
    }
        
    
}
