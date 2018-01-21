<%@ page import="model.Users" %>
<%@ page import="model.Post" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: kcp
  Date: 5/17/17
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (request.getSession().getAttribute("loggedInUser") == null) {
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Job Seeker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="static/css/bootstrap-theme.min.css"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="static/css/style.css"/>

    <!--JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCd-ipzIa-0P6g9jycRCEfwPIXttyC5024" async
            defer></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/script.js"></script>
    <script src="static/js/interact.js"></script>
</head>
<body class="container-fluid">

<!--nav starts-->
<nav id="navbar" class="navbar navbar-default navbar-static-top navbar-fixed-top">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#navbar-container" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbar-container">
        <ul class="nav navbar-nav">
            <li id="home-menu" class="active"><a href="#"><span class="glyphicon glyphicon-home"></span>Home</a></li>
            <li id="profile-menu"><a href="#"><span class="glyphicon glyphicon-user"></span>Profile</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#" data-toggle="modal" data-target="#weather">Weather</a></li>
            <li><a href="/Logout">Logout</a></li>
        </ul>
    </div><!-- /.navbar-collapse -->
</nav>
<!--nav ends-->

<%--weather modal--%>
<div class="modal fade" id="weather" tabindex="-1" role="dialog"
     aria-labelledby="weather-label">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="input-group">

                    <input id="location-info" type="text" placeholder="eg.52557" class="form-control"/>
                    <span class="input-group-btn"><button id="location-btn1" name="location-btn1"
                                                          class="btn btn-default" type="button"><span
                            class="glyphicon glyphicon-search"></span></button></span>

                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <div id="map" style="width:100%;height:250px;"></div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6 text-right">
                        <h2 class="degree"></h2>
                        <div class="weather-image"></div>
                    </div>
                    <div class="col-sm-6 text-right">
                        <h1 class="city"></h1>
                        <div class="type text-capitalize"></div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <div class="bottom-part row">
                    <div class="col-sm-4">
                        <div class="small-weather text-center text-capitalize">
                            <p>SAT 290.10 &#8457;</p>
                            <span class="glyphicon glyphicon-cloud"></span>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="small-weather text-center text-capitalize">
                            <p>SUN 289.15 &#8457;</p>
                            <span class="glyphicon glyphicon-cloud"></span>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="small-weather text-center text-capitalize">
                            <p>MON 289.25 &#8457;</p>
                            <span class="glyphicon glyphicon-cloud"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%--weather modal end--%>


<!-- update post section starts-->
<section id="posts">
    <div class="container"><%--container starts--%>
        <div class="row">
            <header class="page-header col-sm-12">
                <h1>Get Connected..
                    <small>Find Job Faster</small>
                </h1>
            </header>
        </div>

        <!--row div starts-->
        <div id="update-status" class="row">
            <article class="col-md-12  col-centered article-container">
                <header class="clearfix">
                    <img class="img-responsive" src="http://lorempixel.com/75/75" alt="profile-picture"/>
                    <h1>${loggedInUser.fullName}</h1>
                    <br>
                    <small>Update About Job</small>
                </header>
                <form id="update-status-form" class="clearfix" action="#" method="post">
                    <div class="form-group">
                        <%--<label for="update-status">Update Info</label>--%>
                        <textarea class="form-control" rows="5" id="update-status-textarea"
                                  name="update-status-textarea"></textarea>
                    </div>
                    <button id="comment" type="submit" class="btn btn-primary">Post
                    </button>
                </form>
            </article>
        </div>

        <!--row div starts-->
        <c:forEach items="${posts}" var="post">

            <div class="row">
                <article class="col-md-12  col-centered article-container">
                    <header class="clearfix">
                        <img class="img-responsive" src="http://lorempixel.com/75/75" alt="profile-picture"/>
                        <h1>${post.postedby}
                            <br>
                            <small>Posted on: ${post.datecreated}</small>
                        </h1>
                        <p>${post.postcontent}</p>
                    </header>
                        <%--<img class="img-responsive" src="http://lorempixel.com/500/500" alt="post-picture"/>--%>
                    <footer>
                        <div class="btn-group" role="group">
                            <c:choose>
                                <c:when test="${post.likedByMe.equalsIgnoreCase('true')}">
                                    <button type="button" id="${post.postid}" class="like-button btn btn-link"><span
                                            class="glyphicon glyphicon-heart red"></span><span
                                            class="like red"> Unlike </span><span class="badge"
                                                                                  style="background-color: red">${post.totallikes}</span>
                                    </button>

                                </c:when>
                                <c:otherwise>
                                    <button type="button" id="${post.postid}" class="like-button btn btn-link"><span
                                            class="glyphicon glyphicon-heart-empty blue"></span><span
                                            class="like blue"> Like </span><span class="badge"
                                                                                 style="background-color: #337ab7">${post.totallikes}</span>
                                    </button>

                                </c:otherwise>
                            </c:choose>

                            <button type="button"id="${post.postid}-comment-open-button" name="${post.postid}"class="comment-button btn btn-link"><span
                                    class="glyphicon glyphicon-comment"></span>
                                Comment
                            </button>
                        </div>
                        <div class="comment-content-div" id="${post.postid}-comment-content-div">
                            <div id="${post.postid}-comment-list" class="list-group">

                            </div>

                            <form id="${post.postid}-comment-form" class="clearfix list-group-item">
                                <div class="form-group">
                                    <textarea name="comment-content" id="${post.postid}-comment-content-textarea"
                                              class="form-control" rows="5"
                                              name="update-comment-textarea"></textarea>
                                </div>
                                <button type="button" class="comment-content-button btn btn-primary pull-right">
                                    Comment<span class="postidComment" style="display: none;">${post.postid}</span>
                                </button>
                            </form>
                        </div>
                    </footer>

                </article>
            </div>
        </c:forEach>
        <!--row div ends-->
    </div>
    <%--container ends--%>
</section>
<!--post section ends-->


<%--profile section starts--%>
<section id="profile" class="container">
    <div class="row">
        <header>
            <img class="img-responsive img-circle" src="http://lorempixel.com/150/150" alt="profile-picture"/>
            <h1>${loggedInUser.fullName}</h1>
        </header>
    </div>

    <div id="profile-body" class="row"><%--div row starts--%>
        <%--my profile about starts--%>
        <aside class="col-md-5 col-sm-12" id="my-profile-content">
            <div class="panel panel-default panel panel-info">
                <div class="panel-heading clearfix">
                    <h3 class="panel-title">About</h3>
                    <!-- Button trigger modal -->
                    <button class="btn-link" data-toggle="modal" data-target="#edit-profile">Edit <span
                            class="glyphicon glyphicon-edit"></span></button>

                    <!-- Edit user Modal -->
                    <div class="modal fade" id="edit-profile" tabindex="-1" role="dialog"
                         aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Username</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" action="/EditUserProfile" method="post" id="edit-Profile-form">
                                        <div class="form-group">
                                            <label for="edit-fullname" class="col-sm-2 control-label">Fullname</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="edit-fullname" name="edit-fullname"
                                                       placeholder="Fullname" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="edit-email" class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="email" class="form-control" id="edit-email" name="edit-email"
                                                       placeholder="Email" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="edit-password" class="col-sm-2 control-label">Password</label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="edit-password"
                                                       placeholder="Password" disabled>
                                            </div>
                                        </div>

                                        <div class="form-group form-inline">
                                            <label for="edit-state" class="col-sm-2 control-label">State</label>
                                            <div class="col-sm-10">
                                                <select id="edit-state" name="edit-state" class="form-control" tabindex="6"
                                                        id="register-state"
                                                        name="register-state">
                                                    <option value="AL">Alabama</option>
                                                    <option value="AK">Alaska</option>
                                                    <option value="AZ">Arizona</option>
                                                    <option value="AR">Arkansas</option>
                                                    <option value="CA">California</option>
                                                    <option value="CO">Colorado</option>
                                                    <option value="CT">Connecticut</option>
                                                    <option value="DE">Delaware</option>
                                                    <option value="DC">District Of Columbia</option>
                                                    <option value="FL">Florida</option>
                                                    <option value="GA">Georgia</option>
                                                    <option value="HI">Hawaii</option>
                                                    <option value="ID">Idaho</option>
                                                    <option value="IL">Illinois</option>
                                                    <option value="IN">Indiana</option>
                                                    <option value="IA">Iowa</option>
                                                    <option value="KS">Kansas</option>
                                                    <option value="KY">Kentucky</option>
                                                    <option value="LA">Louisiana</option>
                                                    <option value="ME">Maine</option>
                                                    <option value="MD">Maryland</option>
                                                    <option value="MA">Massachusetts</option>
                                                    <option value="MI">Michigan</option>
                                                    <option value="MN">Minnesota</option>
                                                    <option value="MS">Mississippi</option>
                                                    <option value="MO">Missouri</option>
                                                    <option value="MT">Montana</option>
                                                    <option value="NE">Nebraska</option>
                                                    <option value="NV">Nevada</option>
                                                    <option value="NH">New Hampshire</option>
                                                    <option value="NJ">New Jersey</option>
                                                    <option value="NM">New Mexico</option>
                                                    <option value="NY">New York</option>
                                                    <option value="NC">North Carolina</option>
                                                    <option value="ND">North Dakota</option>
                                                    <option value="OH">Ohio</option>
                                                    <option value="OK">Oklahoma</option>
                                                    <option value="OR">Oregon</option>
                                                    <option value="PA">Pennsylvania</option>
                                                    <option value="RI">Rhode Island</option>
                                                    <option value="SC">South Carolina</option>
                                                    <option value="SD">South Dakota</option>
                                                    <option value="TN">Tennessee</option>
                                                    <option value="TX">Texas</option>
                                                    <option value="UT">Utah</option>
                                                    <option value="VT">Vermont</option>
                                                    <option value="VA">Virginia</option>
                                                    <option value="WA">Washington</option>
                                                    <option value="WV">West Virginia</option>
                                                    <option value="WI">Wisconsin</option>
                                                    <option value="WY">Wyoming</option>
                                                </select>
                                                <input type="text" name="edit-city" id="edit-city" tabindex="7"
                                                       class="form-control" placeholder="City" value="" required>
                                                <input type="text" name="edit-zip" id="edit-zip" tabindex="8"
                                                       class="form-control" placeholder="Zip" value=""
                                                       pattern="[0-9]{5}" title="Zip Code should be 5 digits" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="edit-street" class="col-sm-2 control-label">Street</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="edit-street"
                                                       name="edit-street"
                                                       placeholder="Street" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="edit-dob" class="col-sm-2 control-label">Birth Year</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="edit-dob" name="edit-dob"
                                                       placeholder="1995" pattern="[0-9]{4}"
                                                       title="Enter you 4 digit birth year" required>
                                            </div>
                                        </div>
                                        <p id="error-dob-edit" style="display: none">You are under age!!!</p>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button id="eidt-user-submit" type="submit" class="btn btn-primary" form="edit-Profile-form">Save
                                        changes
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--modal end--%>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <p class="list-group-item" contenteditable="false">Full Name: ${loggedInUser.fullName}</p>
                        <p class="list-group-item" contenteditable="false">Username: ${loggedInUser.username}</p>
                        <p class="list-group-item" contenteditable="false">Email-Address: ${loggedInUser.email}</p>
                        <p class="list-group-item" contenteditable="false">State: ${loggedInUser.state}</p>
                        <p class="list-group-item" contenteditable="false">City: ${loggedInUser.city}</p>
                        <p class="list-group-item" contenteditable="false">Street: ${loggedInUser.street}</p>
                        <p class="list-group-item" contenteditable="false">Zip Code: ${loggedInUser.zipcode}</p>
                        <p class="list-group-item" contenteditable="false">Birth Year: ${loggedInUser.birthyear}</p>
                        <p class="list-group-item" contenteditable="false">Gender: ${loggedInUser.gender}</p>
                    </div>
                </div>
            </div>
        </aside>
        <%--my profile about ends--%>

        <%--my post content article starts--%>
        <article class="col-md-7 col-sm-12" id="my-post-content">
            <c:forEach items="${posts}" var="post">
                <c:if test="${post.userid == loggedInUser.userid}">
                    <!--article container starts-->
                    <article id="${post.postid}-profile-post" class="article-container">
                        <header class="clearfix">
                            <img class="img-responsive" src="http://lorempixel.com/75/75" alt="profile-picture"/>
                            <h1>${post.postedby}
                                <br>
                                <small>Posted on: ${post.datecreated}</small>
                                <p class="profile-post-edit-menu"><span class="glyphicon glyphicon-trash pull-right red"
                                                                        style="font-size: medium"></span>
                                    <span class="postIdValue" style="display: none">${post.postid}</span>
                                </p>
                            </h1>
                            <p>${post.postcontent}</p>
                        </header>
                        <footer>
                            <div class="btn-group" role="group">

                                <c:choose>
                                    <c:when test="${post.likedByMe.equalsIgnoreCase('true')}">
                                        <button type="button" id="${post.postid}"
                                                class="profile-like-button btn btn-link"><span
                                                class="glyphicon glyphicon-heart red"></span><span
                                                class="like red"> Unlike </span><span class="badge"
                                                                                      style="background-color: red">${post.totallikes}</span>
                                        </button>

                                    </c:when>
                                    <c:otherwise>
                                        <button type="button" id="${post.postid}"
                                                class="profile-like-button btn btn-link"><span
                                                class="glyphicon glyphicon-heart-empty blue"></span><span
                                                class="like blue"> Like </span><span class="badge"
                                                                                     style="background-color: #337ab7">${post.totallikes}</span>
                                        </button>

                                    </c:otherwise>
                                </c:choose>

                                <button id="comment-btn3" type="button" class="btn btn-link"><span
                                        class="glyphicon glyphicon-comment"></span> Comment
                                </button>
                            </div>
                        </footer>

                    </article>
                    <!--article container ends-->
                </c:if>
            </c:forEach>
        </article>
        <%--my post content article starts--%>
    </div>
    <%--div row ends--%>

</section>
<%--profile section ends--%>


<footer class="container-fluid">

</footer>

</body>
</html>