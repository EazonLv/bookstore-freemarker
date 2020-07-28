<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>网上书店</title>
    <link rel="shortcut icon" href="/lib/favicon.ico" type="image/x-icon">
    <link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/lib/css/carousel.css" rel="stylesheet">
    <script src="/lib/jq/jquery-3.3.1.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/layer/layer.js"></script>
    <script src="/lib/js/holder.min.js"></script>
</head>
<body>

<div class="navbar-wrapper">
    <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="javascript:void(0)">网上书店</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="javascript:void(0)">主页</a></li>
                        <li class="dropdown">
                            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">书籍分类<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <#list sort as s>
                                    <li><a href="javascript:void(0)" id="${s.id}">${s.sortname}</a></li>
                                </#list>
                            </ul>
                        </li>
                        <li><a href="#contact">咨询</a></li>
                            <#if Session["user"]?exists>
                             <li class="dropdown">
                                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.username} <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="javascript:void(0)" id="logout">退出</a></li>
                                    <li><a href="javascript:void(0)" id="shoppingcar">我的购物车</a></li>
                                </ul>
                             </li>
                            <#else>
                                <li><a href="javascript:void(0)" id="login">登录</a></li>
                            </#if>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>

<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img class="first-slide" src="/lib/img/cover5.jpg" alt="First slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>海贼王：山治</h1>
                    <p><a class="btn btn-lg btn-primary" href="javascript:void(0)" role="button">查看详情</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="second-slide" src="/lib/img/cover6.jpg" alt="Second slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>火影忍者：鸣人</h1>
                    <p><a class="btn btn-lg btn-primary" href="javascript:void(0)" role="button">查看详情</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="third-slide" src="/lib/img/cover7.jpg" alt="Third slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>死神：黑崎一护</h1>
                    <p><a class="btn btn-lg btn-primary" href="javascript:void(0)" role="button">查看详情</a></p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div><!-- /.carousel -->


<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row" >
        <#list book as b>
        <div class="col-lg-4">
            <img class="img-circle" src="/lib/img/${b.image}" alt="Generic placeholder image" width="140" height="140">
            <h2>${b.bookname}</h2>
            <p>价格：￥${b.price}</p>
            <p><a class="btn btn-default" href="javascript:void(0)" role="button">查看详情 &raquo;</a></p>
            <p><a class="btn btn-default addCart" href="javascript:void(0)" role="button" selfindex="${b_index}">加入购物车 &raquo;</a></p>
            <input type="hidden" value="￥${b.price}"/>
            <input type="hidden" value="${b.image}"/>
            <input type="hidden" value="${b.bookname}"/>
            <input type="hidden" value="${b.sortid}"/>
        </div><!-- /.col-lg-4 -->
        </#list>
    </div><!-- /.row -->


    <!--&lt;!&ndash; START THE FEATURETTES &ndash;&gt;-->

    <!--<hr class="featurette-divider">-->

    <!--<div class="row featurette">-->
        <!--<div class="col-md-7">-->
            <!--<h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your mind.</span></h2>-->
            <!--<p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>-->
        <!--</div>-->
        <!--<div class="col-md-5">-->
            <!--<img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">-->
        <!--</div>-->
    <!--</div>-->

    <!--<hr class="featurette-divider">-->

    <!--<div class="row featurette">-->
        <!--<div class="col-md-7 col-md-push-5">-->
            <!--<h2 class="featurette-heading">Oh yeah, it's that good. <span class="text-muted">See for yourself.</span></h2>-->
            <!--<p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>-->
        <!--</div>-->
        <!--<div class="col-md-5 col-md-pull-7">-->
            <!--<img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">-->
        <!--</div>-->
    <!--</div>-->

    <!--<hr class="featurette-divider">-->

    <!--<div class="row featurette">-->
        <!--<div class="col-md-7">-->
            <!--<h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>-->
            <!--<p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>-->
        <!--</div>-->
        <!--<div class="col-md-5">-->
            <!--<img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">-->
        <!--</div>-->
    <!--</div>-->

    <!--<hr class="featurette-divider">-->

    <!--&lt;!&ndash; /END THE FEATURETTES &ndash;&gt;-->


    <!--&lt;!&ndash; FOOTER &ndash;&gt;-->
    <!--<footer>-->
        <!--<p class="pull-right"><a href="javascript:void(0)">Back to top</a></p>-->
        <!--<p>&copy; 2016 Company, Inc. &middot; <a href="javascript:void(0)">Privacy</a> &middot; <a href="javascript:void(0)">Terms</a></p>-->
    <!--</footer>-->
</div><!-- /.container -->





<script>
    $(function () {
        var books = [];
        <#list book as b>
            var book = {
                'singalPrice' : '￥${b.price}',
                'img' :'/lib/img/${b.image}',
                'name' : '${b.bookname}',
                'sortid' : '${b.sortid}'
            }
            books.push(book);
        </#list>


        var booksbuy = [];




        $("#logout").click(function () {
            $.ajax({
                url:'/user/logout',
                type:'post',
                success:function (data) {
                    layer.msg(data.retMsg,{time:2000},function () {
                        location.reload();
                    })
                }

            })
        })

        $("#shoppingcar").click(function () {
            //iframe层-父子操作
            layer.open({
                type: 2,
                title:'购物车',
                area: ['1300px', '600px'],
                fixed: false, //不固定
                maxmin: false,
                content: 'html/cart.html',
                offset:'auto'
            });
        })

        $("#login").click(function () {
            //iframe层-父子操作
            layer.open({
                type: 2,
                title:'登录',
                area: ['600px', '600px'],
                fixed: false,
                maxmin: false,
                content: 'html/login.html',
                offset:'auto'
            });
        })

        $(".addCart").click(function () {
            var index = $(this).attr("selfindex");

            var data = {
                'name' : books[index].name,
                'img' : books[index].img,
                'goodTip' : '',
                'singalPrice' : books[index].singalPrice,
                'sortid' : books[index].sortid
            }

            if(sessionStorage.getItem("user")==null){
                layer.msg('请先登录！',{time:1500})
            }else{
                booksbuy.push(data);
                sessionStorage.setItem("booksbuy",JSON.stringify(booksbuy));
                layer.msg('加入购物车成功！',{time:1500})
            }
        })
    })
</script>
</body>
</html>