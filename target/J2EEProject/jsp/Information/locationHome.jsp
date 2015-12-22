<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.camplus.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp&key=d84d6d83e0e51e481e50454ccbe8986b"></script>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Map 地图 | Home :: CPCoders</title>

    <link href="/camplus/CSS/index/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/camplus/CSS/index/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!-- web-font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
    <!-- web-font -->
    <!-- js -->
    <script src="/camplus/JavaScript/index/jquery.min.js"></script>
    <script src="/camplus/JavaScript/index/modernizr.custom.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- js -->
    <script src="/camplus/JavaScript/index/modernizr.custom.js"></script>
    <!-- start-smoth-scrolling -->
    <script type="text/javascript" src="/camplus/JavaScript/index/move-top.js"></script>
    <script type="text/javascript" src="/camplus/JavaScript/index/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <script type="text/javascript">
        function showsubmenu(li){
            var submenu=li.getElementsByTagName("ul")[0];
            submenu.style.display="block";
        }
        function hidesubmenu(li){
            var submenu=li.getElementsByTagName("ul")[0];
            submenu.style.display="none";
        }
    </script>
    <!-- start-smoth-scrolling -->
</head>
<style type="text/css">
    #container
    {
        margin: 0px auto;
    }
    #pano_holder{
        margin: 20px auto;
    }
    #search{
        width: 1200px;
        position: absolute;
        top: auto;
        float: inherit;
    }
</style>

<script>

    var geocoder,map,marker = null;

    var init = function() {

        //创建地图
        var map = new qq.maps.Map(document.getElementById("container"),{
            //地图中心坐标
            center: new qq.maps.LatLng(31.2855741398, 121.2147781261),
//        zoomLevel: 16
            zoom:14
        });

        geocoder = new qq.maps.Geocoder({
            complete : function(result){
                map.setCenter(result.detail.location);
                var marker = new qq.maps.Marker({
                    map:map,
                    position: result.detail.location
                });
            }
        });

        // 创建街景
        var pano = new qq.maps.Panorama(document.getElementById('pano_holder'), {
            pano: '10011001120129111239600',
            disableMove: false,
            pov:{
                heading:20,
                pitch:15
            },
            disableFullScreen:false,
            zoom:1
        });
        pano_service = new qq.maps.PanoramaService();

//      地图点击事件
        qq.maps.event.addListener(map, 'click', function (evt){
            var point = evt.latLng;
            var radius;
            pano_service.getPano(point, radius, function (result){
                pano.setPano(result.svid);
            });
        });
    }
    function codeAddress() {
        var address = document.getElementById("address").value;
        geocoder.getLocation(address);
    }

</script>
</head>

<%
    User currentUser = (User)session.getAttribute("userSession");
    String userName = currentUser.getUserName();
%>
<body>
<div class="headerChild">
    <div class="log">
        <div class="quit"><a href="<c:url value="/logout"></c:url>">Logout</a> </div>
        <p><a href="<c:url value="/user/editInfo"></c:url>">Hello,<%=userName%></a> </p>  </div>
    <div class="head-bg">
        <!-- container -->
        <div class="container">
            <div class="head-logo">
                <a href="/camplus/jsp/index.jsp"><img src="/camplus/Images/index/logo1.png" alt="" /></a>
            </div>
            <div class="top-nav">
                <span class="menu"><img src="/camplus/Images/index/menu.png" alt=""></span>
                <ul class="cl-effect-1">
                    <li><a href="/camplus/jsp/index.jsp">Home</a></li>

                    <li><a href="<c:url value="/carpool/select"></c:url> ">Carpool</a></li>
                    <li><a href="/camplus/jsp/CourseDiscussion/courseSearch.jsp">Course</a> </li>
                    <li onmouseover="showsubmenu(this)" onmouseout="hidesubmenu(this)"><a>Gallery</a>
                        <ul class="submenu">
                            <dd><a href="<c:url value="/gallery"></c:url> ">Album</a></dd>
                            <dd><a href="<c:url value="/gallery/hotComment"></c:url> ">Hot</a></dd>
                            <dd><a href="<c:url value="/gallery/mySpace"></c:url> ">MySpace</a></dd>
                        </ul>
                    </li>
                    <li onmouseover="showsubmenu(this)" onmouseout="hidesubmenu(this)"><a>Information</a>
                        <ul class="subMenu">
                            <dd><a href="<c:url value="/information/locationHome"></c:url> ">Map</a></dd>
                            <dd><a href="<c:url value="/restaurant"></c:url> ">Takeout</a></dd>
                            <dd><a href="<c:url value="/information/busTimeHome"></c:url> ">Shuttle</a></dd>
                        </ul>
                    </li>
                </ul>
                <!-- script-for-menu -->
                <script>
                    $( "span.menu" ).click(function() {
                        $( "ul.cl-effect-1" ).slideToggle( 300, function() {
                            // Animation complete.
                        });
                    });
                </script>
                <!-- /script-for-menu -->
            </div>
            <div class="clearfix"> </div>
        </div>
        <!-- //container -->
    </div>
</div>
</body>
</body>
<body onLoad="init()">
<div class="booking-info">
    <h3>平面地图</h3>
</div>
<div style="width:1250px;height:400px" id="container"></div>
<div class="booking-info">
    <h3><br>街景地图</h3>
</div>
<div style="width:1250px;height:400px" id="pano_holder"></div>
<script src="http://map.qq.com/api/js?v=2.exp&key=d84d6d83e0e51e481e50454ccbe8986b"></script>
</body>
</html>