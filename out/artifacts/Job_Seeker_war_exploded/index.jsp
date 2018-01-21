<%--
  Created by IntelliJ IDEA.
  User: kcp
  Date: 5/17/17
  Time: 7:53 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getSession().getAttribute("loggedInUser")!=null){
        response.sendRedirect("/InitialLoad");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Signup</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="static/css/bootstrap-theme.min.css"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="static/css/login-register.css"/>

    <!--JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/login-register.js"></script>
</head>
<body>
<section id="signup-form" class="container">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-login">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <a href="#" class="active" id="login-form-link">Login</a>
                            </div>
                            <div class="col-xs-6">
                                <a href="#" id="register-form-link">Register</a>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form id="login-form" action="#" method="post" role="form"
                                      style="display: block;">
                                    <div id="loginError" class="form-group text-center">
                                        <div class="alert alert-danger" role="alert">
                                            <span class="glyphicon glyphicon-exclamation-sign"
                                                  aria-hidden="true"></span>
                                            <span class="sr-only">Error:</span>
                                            <span id="loginErrorMessage"></span>
                                        </div>
                                    </div>
                                    <div class="user-image thumbnail">
                                        <img class="img-responsive img-circle" src="http://lorempixel.com/150/150"
                                             alt="user-picture">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="login-username" id="login-username" tabindex="1"
                                               class="form-control" placeholder="Username" value="">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="login-password" id="login-password" tabindex="2"
                                               class="form-control" placeholder="Password">
                                    </div>
                                    <div class="form-group text-center">
                                        <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                        <label for="remember"> Remember Me</label>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <input type="submit" name="login-submit" id="login-submit" tabindex="4"
                                                       class="form-control btn btn-login" value="Log In">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="text-center">
                                                    <a href="#" tabindex="5" class="forgot-password">Forgot
                                                        Password?</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <form id="register-form" action="/RegisterUser" method="post" role="form"
                                      style="display: none;">
                                    <div id="registerError" class="form-group text-center">
                                        <div class="alert alert-danger" role="alert">
                                            <span class="glyphicon glyphicon-exclamation-sign"
                                                  aria-hidden="true"></span>
                                            <span class="sr-only">Error:</span>
                                            <span id="invalid-register-msg"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input type="text" name="register-full-name" id="register-full-name"
                                               tabindex="1"
                                               class="form-control" placeholder="Fullname" required/>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="register-username" id="register-username" tabindex="2"
                                               class="form-control" placeholder="Username" value="" required/>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" name="register-email" id="register-email" tabindex="3"
                                               class="form-control" placeholder="Email Address" value="" required title="Please enter a valid email id"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="register-password" id="register-password"
                                               tabindex="4"
                                               class="form-control" placeholder="Password" required pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$" title="Password should be at least 6 characters and contain at least one number"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="register-confirm-password"
                                               id="register-confirm-password" tabindex="5" class="form-control"
                                               placeholder="Confirm Password" required/>
                                    </div>
                                    <div class="form-group form-inline">
                                        <select class="form-control" tabindex="6" id="register-state"
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
                                        <input type="text" name="register-city" id="register-city" tabindex="7"
                                               class="form-control" placeholder="City" value="" required/>
                                        <input type="text" name="register-zip" id="register-zip" tabindex="8"
                                               class="form-control" placeholder="Zip" value="" pattern="[0-9]{5}" title="Zip Code should be 5 digits" required/>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="register-street"
                                               id="register-street" tabindex="8" class="form-control"
                                               placeholder="Street" required/>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="register-dob" placeholder="Birth Year"
                                               id="register-dob" tabindex="9" class="form-control" pattern="[0-9]{4}" title="Enter you 4 digit birth year" required/>
                                    </div>

                                    <div class="form-group">
                                        <div class="radio-inline">
                                            <label><input type="radio" tabindex="10" name="register-gender"
                                                          value="male">Male</label>
                                        </div>
                                        <div class="radio-inline">
                                            <label><input type="radio" tabindex="11" name="register-gender"
                                                          value="female" checked/>Female</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <input type="submit" name="register-submit" id="register-submit"
                                                       tabindex="12" class="form-control btn btn-register"
                                                       value="Register Now">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>