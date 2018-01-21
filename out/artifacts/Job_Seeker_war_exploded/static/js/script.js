/**
 * Created by kcp on 5/15/17.
 */
$(document).ready(function () {
    $("#profile-menu").click(function (e) {
        //self.location.reload();
        $('#profile').css('display', 'block');
        $("#profile").delay(100).fadeIn(100);
        $("#posts").fadeOut(100);
        $('#navbar-container li').removeClass("active");
        $(this).addClass("active");

        e.preventDefault();
    });

    $("#home-menu").click(function (e) {
        $("#posts").delay(100).fadeIn(100);
        $("#profile").fadeOut(100);
        $('#navbar-container li').removeClass("active");
        $(this).addClass("active");
        e.preventDefault();
    });

    $("#my-post").click(function (e) {
        $("#my-post-content").delay(100).fadeIn(100);
        $("#my-profile-content").fadeOut(100);
        $('#my-profile').removeClass("active");
        $(this).addClass("active");
        e.preventDefault();
    });

    $("#my-profile").click(function (e) {
        $('#my-post-content').css('display', 'block');
        $("#my-profile-content").delay(100).fadeIn(100);
        $("#my-post-content").fadeOut(100);
        $('#my-post').removeClass("active");
        $(this).addClass("active");
        e.preventDefault();
    });

    $("#postMenuDropDown").click(function () {
        $("#postMenu").toggle();
    });

    //update post
    $("#comment").click(function (e) {
        e.preventDefault();

        $.post("/SubmitPost", {"post": $("#update-status-textarea").val()}).done(function (response) {
            if (response.status === "success") {
                let post = JSON.parse(response.post);

                $("#update-status-textarea").val("");

                const content = `<div class="row">
                    <article class="col-md-12  col-centered article-container">
                        <header class="clearfix">
                            <img class="img-responsive" src="http://lorempixel.com/75/75" alt="profile-picture"/>
                            <h1>${post.postedby}
                                <br>
                                <small>Posted on: ${post.datecreated}</small>
                            </h1>
                            <p>${post.postcontent}</p>
                        </header>
                        
                        <footer>
                            <div class="btn-group" role="group">
                                <button type="button" id="${post.postid}" class="like-button btn btn-link"><span
                                        class="glyphicon glyphicon-heart-empty"></span><span class="like"> Like </span><span class="badge">${post.totallikes}</span></button>
                                <button id="comment-btn1" type="button" class="comment-button btn btn-link"><span class="glyphicon glyphicon-comment"></span> Comment</button>
                            </div>
                        </footer>
                    </article>
                    </div>`;
                $(content).insertAfter($("#update-status")).delay(100).fadeIn(200);
                $("#" + post.postid).click(like);
            } else {
                alert(" :[")
            }
        });
    });

    $("button.like-button").click(like);

    $("button.profile-like-button").click(like);


    function like() {
        let e = $(this);
        $.post("/likes", {postid: this.id}).done(function (response) {
            if (response.status === "Button liked") {
                e.find("span.glyphicon").removeClass("glyphicon-heart-empty").addClass("glyphicon-heart").css("color", "red");
                e.find("span.like").css("color", "red").text(" Unlike ");
                e.find("span.badge").css("background-color", "red");
                e.find("span.badge").text(parseInt(e.find("span.badge").text()) + 1);

            }
            else if (response.status === "Button Unliked") {
                e.find("span.glyphicon").removeClass("glyphicon-heart").addClass("glyphicon-heart-empty").css("color", "#337ab7");
                e.find("span.like").css("color", "#337ab7").text(" Like ");
                e.find("span.badge").css("background-color", "#337ab7");
                e.find("span.badge").text(parseInt(e.find("span.badge").text()) - 1);
            }
        });
    };

    $(".comment-content-button").click(comment);

    function comment() {
        let e = $(this);

        let postid = e.find("span.postidComment").text();
        let commentContent = $("#" + postid + "-comment-content-textarea").val();

        if ($(commentContent) != '') {
            $.post("/comments", {
                post_id: postid,
                comment: commentContent
            }).done(function (response) {
                if (response.status === "success") {
                    $("#" + postid + "-comment-content-textarea").val("");
                    let content = "<p class=\"list-group-item\">" + commentContent + "</p>";
                    $("#" + postid + "-comment-list").append(content);
                } else {
                    console.log("ERROR!!");
                }

            });
        }

    };

    $(".comment-button").click(function () {
        postid = this.name;

        $("#" + postid + "-comment-content-div").toggle();


        $.post("/loadcomments", {
            post_id: postid
        }).done(function (response) {
            $("#" + postid + "-comment-list").empty();
            $.each(response, function (index, value) {
                let content = "<p class=\"list-group-item\">" + value.comment + "</p>";
                $("#" + postid + "-comment-list").append(content);
            });

        });

    });

    $("p.profile-post-edit-menu").click(function () {
        let e = $(this);
        let postid = e.find("span.postIdValue").text();
        $.post("/deletepost", {postid: postid}).done(function (response) {
            if (response.status === "success") {
                $("#" + postid + "-profile-post").remove();
            }
        })
    });

    //edit user
    $('#edit-user-submit').click(function (e) {
        let invalid = false;
        let age = (new Date).getFullYear() - $('#edit-dob').val();
        if (age <= 18) {
            $('#error-dob-edit').show();
            invalid = true;
        }
        if (invalid == true) {
            e.preventDefault();
        }
    })


});
