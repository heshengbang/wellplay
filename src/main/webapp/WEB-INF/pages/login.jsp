<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>WELLPLAY</title>
    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" >
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js" type="text/javascript"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js" type="text/javascript"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>

    <style type="text/css">

        body {
            background-size: cover;
            background: #8c8c8c url(../../resources/login.jpg) no-repeat;
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
            top: 27px;
            left: 6px;
            right: 6px;
            position: relative;
            color: #ccc;
        }
        .fa-envelope {

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
                        minlength: 6
                    }
                },
                messages: {
                    j_username: "请输入姓名",
                    j_password: {
                        required: "请输入密码",
                        minlength: "密码不能小于6个字符"
                    }
                }
            });
            $("#register_form").validate({
                rules: {
                    username: "required",
                    password: {
                        required: true,
                        minlength: 6
                    },
                    rpassword: {
                        required: true,
                        equalTo: "#r_password"
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
                        minlength: "密码不能小于6个字 符"
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

            $("#register_user").click(function () {
                var username = $("#r_username").val();
                var password = $("#r_password").val();
                var email = $("#r_email").val();

                console.log(username);

                <%--$.post("<c:url value="/wellpaly/registerUser"/>", {--%>
                    <%--username: username,--%>
                    <%--password: password,--%>
                    <%--email: email--%>
                <%--}, callbackSuccess, callbackComplete, callbackError);--%>

                var data = {
                    username: username,
                    password: password,
                    email: email
                };

                var params ="username="+username+"&password="+password+"&email="+email;

                $.ajax({
                    url: "<c:url value="/wellplay/registerUser" />",
                    type: "POST",
                    cache: false,
                    dataType :"text",
                    data: data,
                    complete: function (response, status) {
                        //完成回调
                        if (response.responseText !== "register success") {
                            $(".modal-body").html("注册失败，请确认注册信息是否正确");
                            //弹出模态框
                            $('#tipBox').modal();
                        } else {
                            $(".modal-body").html("注册成功，请重新登录");
                            //弹出模态框
                            $('#tipBox').modal();
                            //模态框关闭回调函数
                            $('#tipBox').on('hidden.bs.modal', function() {
                                location.reload();
                            })
                        }
                    },
                    success: function (status, response) {
                        //成功回调
                    },
                    error: function (status, response) {
                        //错误回调
                    }
                });
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
                    <span class="fa fa-user fa-lg" style="font-style: italic;"></span>
                    <input class="form-control required" id="j_username" type="text" placeholder="用户名" name="j_username"
                           autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <span class="fa fa-lock fa-lg" style="font-style: italic;"></span>
                    <input class="form-control required" id="j_password" type="password" placeholder="密码" name="j_password"
                           maxlength="8"/>
                </div>
                <div class="form-group">
                    <label class="checkbox">
                        <input type="checkbox" id="_spring_security_remember_me"
                               name="_spring_security_remember_me" /> 记住密码
                    </label>
                    <hr/>
                    <a href="javascript:" id="register_btn" class="">创建账号</a>
                </div>
                <div class="form-group">
                    <input type="submit" name="submit" class="btn btn-success pull-right"/>
                </div>
            </div>
        </form>
    </div>

    <div class="form row">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form" action="<c:url value="/wellpaly/registerUser" />" method="post">
            <h3 class="form-title">注册账号</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <span class="fa fa-user fa-lg" style="font-style: italic;"></span>
                    <input id="r_username" class="form-control required" type="text" placeholder="用户名" name="username"
                           autofocus="autofocus" />
                </div>
                <div class="form-group">
                    <span class="fa fa-lock fa-lg" style="font-style: italic;"></span>
                    <input  id="r_password" class="form-control required" type="password" placeholder="密码"
                           name="password"/>
                </div>
                <div class="form-group">
                    <span class="fa fa-check fa-lg" style="font-style: italic;"></span>
                    <input class="form-control required" type="password" placeholder="再次输入密码"
                           name="rpassword"/>
                </div>
                <div class="form-group">
                    <span class="fa fa-envelope fa-lg" style="font-style: italic;"></span>
                    <input id="r_email" class="form-control eamil trim" type="text" placeholder="邮箱" name="email"/>
                </div>
                <div class="form-group">
                    <input type="button" class="btn btn-success pull-right" id="register_user" value="注册 "/>
                    <input type="button" class="btn btn-info pull-left" id="back_btn" value="返回"/>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Small modal -->
<%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myID">Small modal</button>--%>
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="tipBox">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="close_modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
