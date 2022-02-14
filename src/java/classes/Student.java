package classes;

public class Student {
    
    private  String name;
    private String email;
    private String section;
    private Subject subject = new Subject();
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }
    
    public Subject view_attendance()
    {
        return subject;
    }
}
