/**
 * Created by kcp on 5/17/17.
 */
$(function() {
    $('#login-form-link').click(function(e) {
        $("#login-form").delay(100).fadeIn(100);
        $("#register-form").fadeOut(100);
        $('#register-form-link').removeClass('active');
        $(this).addClass('active');
        e.preventDefault();
    });
    $('#register-form-link').click(function(e) {
        $("#register-form").delay(100).fadeIn(100);
        $("#login-form").fadeOut(100);
        $('#login-form-link').removeClass('active');
        $(this).addClass('active');
        e.preventDefault();
    });


    //login validation
    $("#login-submit").click(function(e){
        e.preventDefault();

        $.post("/Login",{"username":$("#login-username").val(),"password":$("#login-password").val()}).done(function(response){
            if(response.status==="success"){
                window.location.replace("/InitialLoad");
            }else {
                $("#loginErrorMessage").text(response.message);
                $("#loginError").delay(50).fadeIn(50);
            }
        });
    });
    //register validation

    $('#register-submit').click(function (e) {
        let invalid = false;
        if($('#register-password').val()!=$('#register-confirm-password').val()){
            $("#invalid-register-msg").text("Password did not match");
            $("#registerError").delay(50).fadeIn(50);
            invalid = true;
        }

        // var date = (new Date).getFullYear();
        //var age = (new Date).getFullYear()-$('#register-dob').val().slice(-4);

        let age = 2017 - $('#register-dob').val();
        if(age<=18){
            $('#underage-msg').show();
            invalid = true;
        }
        if(invalid==true){
            e.preventDefault();
        }
    })

});
