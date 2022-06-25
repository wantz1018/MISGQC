<%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/25
  Time: 10:26
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="{CHARSET}">
    <title></title>
    <style type="text/css">
        .popBox{
            position: relative;
            background: red;
            width: 500px;
            height: 500px;
        }
    </style>
</head>
<body>
<div class="popBox" >
</div>

<script type="text/javascript" src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">	</script>
<script type="text/javascript">
    function drag(){
        var obj=$('.popBox');
        obj.bind('mousedown',start);

        function start(e){
            var ol=obj.position().left;
            var ot=obj.position().top;
            deltaX=e.pageX-ol;
            deltaY=e.pageY-ot;

            $(document).bind({
                'mousemove':move,
                'mouseup':stop
            });
            return false;
        }

        function move(e){
            obj.css({
                "left":(e.pageX-deltaX),
                "top":(e.pageY-deltaY)
            });
            return false;
        }

        function stop(){
            $(document).unbind({
                'mousemove':move,
                'mouseup':stop
            })
        }
    }

    drag();
</script>
</body>
</html>
