package model;

/**
 * Created by kcp on 5/21/17.
 */
public class Post {
    String postid;
    String userid;
    String postcontent;
    String location;
    String datecreated;
    String dateupdated;
    String totallikes;
    String postedby;
    String likedByMe;

    public Post() {
    }

    public String getPostid() {
        return postid;
    }

    public void setPostid(String postid) {
        this.postid = postid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPostcontent() {
        return postcontent;
    }

    public void setPostcontent(String postcontent) {
        this.postcontent = postcontent;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
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

    public String getTotallikes() {
        return totallikes;
    }

    public void setTotallikes(String totallikes) {
        this.totallikes = totallikes;
    }

    public String getPostedby() {
        return postedby;
    }

    public void setPostedby(String postedby) {
        this.postedby = postedby;
    }

    public String getLikedByMe() {
        return likedByMe;
    }

    public void setLikedByMe(String likedByMe) {
        this.likedByMe = likedByMe;
    }
}