/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author HP
 */
package classes;

public class Admin {
    
    private static Admin admin = new Admin();
    private Student student = new Student();
    private Faculty faculty = new Faculty();
    private User user = new User();

    private Admin() {
    }
    
    public static Admin get_instance()
    {
        return admin;
    }
    public  Student add_student()
    {
        return student;
    }
    
    public Faculty add_faculty()
    {
        return faculty;
    }
    
    public  User user_instance()
    {
        return user;
    }
    
}

 