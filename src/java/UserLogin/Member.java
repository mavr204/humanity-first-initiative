package UserLogin;

import java.util.Date;

public class Member {
    private String username;
    private String firstname;
    private String lastname;
    private String phone;
    private String email;
    private String admin;

    // Constructors

    public Member(String username, String firstname, String lastname, String phone, String email, String admin) {
        this.username = username;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.email = email;
        this.admin = admin;
    }

    // Getters and setters

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
 
    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }
}
