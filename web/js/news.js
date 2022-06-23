//页面需引入jquery库  https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js
$(document).ready(function(){
    $('#button').click(function(){  //点击页面上id为button的按钮发送请求
        $.post('http://api.tianapi.com/nongye/index',
            {
                key:'70193efbffe57ad51c001e23abbbe4c4',num:'1'
            },
            function(data,status){
                console.log(data);
                $('#result').append(JSON.stringify(data)); //返回内容绑定到id为result的标签
                alert('状态码：' + data.code + '\n消息：' + data.msg);
            });
    });
});