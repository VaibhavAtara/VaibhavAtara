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
public class Subject {
    
    private double toc;
    private double sepm;
    private double hci;
    private double os;
    private double dbms;

    public double getToc() {
        return toc;
    }

    public void setToc(String cond,String att) {
         if(cond.equals("0"))
           this.toc = 0;
       else
            this.toc = (Double.parseDouble(att)/Double.parseDouble(cond)*100.0);
       
    }

    public double getSepm() {
        return sepm;
    }

    public void setSepm(String cond,String att) {
        if(cond.equals("0"))
           this.sepm = 0;
       else
            this.sepm = (Double.parseDouble(att)/Double.parseDouble(cond)*100.0);
       
    }

    public double getHci() {
        return hci;
    }

    public void setHci(String cond,String att) {
        if(cond.equals("0"))
           this.hci = 0;
       else
            this.hci = (Double.parseDouble(att)/Double.parseDouble(cond)*100.0);
  
    }

    public double getOs() {
        return os;
    }

    public void setOs(String cond,String att) {
        if(cond.equals("0"))
           this.os = 0;
       else
            this.os = (Double.parseDouble(att)/Double.parseDouble(cond)*100.0);
        
    }

    public double getDbms() {
        return dbms;
    }

    public void setDbms(String cond,String att) {
        if(cond.equals("0"))
           this.dbms = 0;
       else
            this.dbms = (Double.parseDouble(att)/Double.parseDouble(cond)*100.0);
        
    }
    
}
