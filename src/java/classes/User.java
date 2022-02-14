/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author HP
 */
public class User {
    private String user_id;
    private String roll_no;

    public String getRoll_no() {
        return roll_no;
    }

    public void setRoll_no(int no_of_roll,String section) {
        String roll=String.valueOf(no_of_roll);
           String classname = "TE-"+section;
           String div;
           if(section.equals("10"))
              div="30";
           else
               div="39";
           
           
           StringBuilder sb1 = new StringBuilder();
           while(sb1.length()+roll.length()<2) {
             sb1.append('0');
                 }
                 sb1.append(no_of_roll);
                String div_roll = sb1.toString();
              this.roll_no= div+div_roll;
        
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(int no_of_students,String type) {
        
        String count=String.valueOf(no_of_students);
              StringBuilder sb = new StringBuilder();
             while(sb.length()+count.length()<6) {
             sb.append('0');
                 }
                 sb.append(no_of_students);
                 String finalid = sb.toString();
            
            if(type.equals("S"))
                this.user_id ="S2K18" + finalid;
            else
                this.user_id = "T2K18" + finalid;
            
           
    }
    
    
   
    
    
}
