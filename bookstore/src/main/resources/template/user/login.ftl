<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>网上书店</title>
    <link rel="shortcut icon" href="/lib/favicon.ico" type="image/x-icon">
    <link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="/lib/jq/jquery-3.3.1.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/layer/layer.js"></script>
    <style>
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin .checkbox {
            font-weight: normal;
        }
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>
<body>


<div class="container">

    <form class="form-signin">
        <h2 class="form-signin-heading">用户登录</h2>
        <label for="userid" class="sr-only">用户名</label>
        <input type="text" id="userid" class="form-control" placeholder="用户名" required="" autofocus="">
        <label for="pwd" class="sr-only">密码</label>
        <input type="password" id="pwd" class="form-control" placeholder="密码" required="">
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住我
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="button" id="sub">登录</button>
    </form>

</div>
<script>
    $("#sub").click(function () {
        if($("#userid").val()==''||$("#pwd").val()==''){
            layer.msg("用户名或者密码不能为空",{time:2000});
            return false;
        }else{
            $.ajax({
                url:'/user/login',
                contentType:"application/x-www-form-urlencoded",
                type:'POST',
                data:{JSONString:JSON.stringify({userid:$("#userid").val(),password:$("#pwd").val()})},
                success:function (data) {
                    if(data.retCode == 1){
                        layer.msg(data.retMsg,{time:2000},function () {
                            location.replace("/index")
                        });
                    }else{
                        layer.msg(data.retMsg,{time:2000});
                    }
                }
            })
        }
    })
</script>



</body>
</html>