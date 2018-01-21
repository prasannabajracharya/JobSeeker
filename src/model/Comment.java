package model;

/**
 * Created by kcp on 5/23/17.
 */
public class Comment {
    String commentid;
    String postid;
    String comment;
    String datecreated;
    String userid;

    public Comment() {
    }

    public String getCommentid() {
        return commentid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setCommentid(String commentid) {
        this.commentid = commentid;
    }

    public String getPostid() {
        return postid;
    }

    public void setPostid(String postid) {
        this.postid = postid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getDatecreated() {
        return datecreated;
    }

    public void setDatecreated(String datecreated) {
        this.datecreated = datecreated;
    }
}
