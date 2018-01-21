package model;

/**
 * Created by kcp on 5/21/17.
 */

public class Users {

    String userid;
    String fullName;
    String username;
    String gender;
    String state;
    String city;
    String street;
    String zipcode;
    String birthyear;
    String email;
    String password;
    String datecreated;
    String dateupdated;
    String imageurl;

    public Users() {
    }

    public Users(String userid, String fullName, String username, String gender, String state, String city, String street, String zipcode, String birthyear, String email, String password, String datecreated, String dateupdated, String imageurl) {
        this.userid = userid;
        this.fullName = fullName;
        this.username = username;
        this.gender = gender;
        this.state = state;
        this.city = city;
        this.street = street;
        this.zipcode = zipcode;
        this.birthyear = birthyear;
        this.email = email;
        this.password = password;
        this.datecreated = datecreated;
        this.dateupdated = dateupdated;
        this.imageurl = imageurl;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getBirthyear() {
        return birthyear;
    }

    public void setBirthyear(String birthyear) {
        this.birthyear = birthyear;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDatecreated() {
        return datecreated;
    }

    public void setDatecreated(String datecreated) {
        this.datecreated = datecreated;
    }

    public String getDateupdated() {
        return dateupdated;
    }

    public void setDateupdated(String dateupdated) {
        this.dateupdated = dateupdated;
    }

    public String getImageurl() {
        return imageurl;
    }

    public void setImageurl(String imageurl) {
        this.imageurl = imageurl;
    }

    @Override
    public String toString() {
        return "Users{" +
                "userid='" + userid + '\'' +
                ", fullName='" + fullName + '\'' +
                ", username='" + username + '\'' +
                ", gender='" + gender + '\'' +
                ", state='" + state + '\'' +
                ", city='" + city + '\'' +
                ", street='" + street + '\'' +
                ", zipcode='" + zipcode + '\'' +
                ", birthyear='" + birthyear + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", datecreated='" + datecreated + '\'' +
                ", dateupdated='" + dateupdated + '\'' +
                ", imageurl='" + imageurl + '\'' +
                '}';
    }
}