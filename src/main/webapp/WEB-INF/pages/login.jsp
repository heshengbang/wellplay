<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>WELLPLAY</title>
    <link rel="stylesheet" type="text/css" href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" >
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js" type="text/javascript"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js" type="text/javascript"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>

    <style type="text/css">

        body {
            background-size: cover;
            background: #8c8c8c url(./login.jpg) no-repeat;
            font-size: 16px;
        }

        .form {
            background: rgba(255, 255, 255, 0.2);
            width: 400px;
            margin: 100px auto;
        }

        #login_form {
            display: block;
        }

        #register_form {
            display: none;
        }

        .fa {
            display: inline-block;
            top: 27px;
            left: 6px;
            position: relative;
            color: #ccc;
        }

        input[type="text"], input[type="password"] {
            padding-left: 26px;
        }

        .checkbox {
            padding-left: 21px;
        }
    </style>
    <script type="text/javascript">
        $().ready(function() {
            $("#login_form").validate({
                rules: {
                    j_username: "required",
                    j_password: {
                        required: true,
                        minlength: 4
                    }
                },
                messages: {
                    j_username: "请输入姓名",
                    j_password: {
                        required: "请输入密码",
                        minlength: "密码不能小于8个字 符"
                    }
                }
            });
            $("#register_form").validate({
                rules: {
                    username: "required",
                    password: {
                        required: true,
                        minlength: 5
                    },
                    rpassword: {
                        equalTo: "#register_password"
                    },
                    email: {
                        required: true,
                        email: true
                    }
                },
                messages: {
                    username: "请输入姓名",
                    password: {
                        required: "请输入密码",
                        minlength: "密码不能小于8个字 符"
                    },
                    rpassword: {
                        equalTo: "两次密码不一样"
                    },
                    email: {
                        required: "请输入邮箱",
                        email: "请输入有效邮箱"
                    }
                }
            });

            document.body.style.backgroundImage="<c:url value="../../resources/login.jpg"/>";
            document.body.style.backgroundRepeat="no-repeat";
            document.body.style.backgroundAttachment="cover";
        });
        $(function() {
            $("#register_btn").click(function() {
                $("#register_form").css("display", "block");
                $("#login_form").css("display", "none");
            });
            $("#back_btn").click(function() {
                $("#register_form").css("display", "none");
                $("#login_form").css("display", "block");
            });
        });
    </script>
</head>

<body>
<div class="container">
    <div class="form row">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form" action="<c:url value="/j_spring_security_check" />" method="post">
            <h3 class="form-title">WELL PLAY</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" id="j_username" type="text" placeholder="Username" name="j_username"
                           autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" id="j_password" type="password" placeholder="Password" name="j_password"
                           maxlength="8"/>
                </div>
                <div class="form-group">
                    <label class="checkbox">
                        <input type="checkbox" id="_spring_security_remember_me"
                               name="_spring_security_remember_me" /> Remember me
                    </label>
                    <hr/>
                    <a href="javascript:" id="register_btn" class="">Create an account</a>
                </div>
                <div class="form-group">
                    <input type="submit" name="submit" class="btn btn-success pull-right"/>
                </div>
            </div>
        </form>
    </div>

    <div class="form row">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form">
            <h3 class="form-title">Login to your account</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="Username" name="username"
                           autofocus="autofocus"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Password" id="register_password"
                           name="password"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-check fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Re-type Your Password"
                           name="rpassword"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-envelope fa-lg"></i>
                    <input class="form-control eamil" type="text" placeholder="Email" name="email"/>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-success pull-right" value="Sign Up "/>
                    <input type="submit" class="btn btn-info pull-left" id="back_btn" value="Back"/>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
