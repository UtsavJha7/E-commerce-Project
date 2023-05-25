/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mavenproject1.dao;

import com.mycompany.mavenproject1.entities.User;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author utsav
 */
public class UserDao {
    private SessionFactory factory;
    
    public UserDao(SessionFactory factory){
        this.factory=factory;
    }
    
    //getuser by email and password
    public User getUserByEmailAndPassword(String email,String password){
        
        User user=null;
        try{
            String qS ="from User where userEmail =:e and userPassword =:p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(qS);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user = (User)q.getSingleResult();
        
          session.close();
           
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return user;
    }
}
