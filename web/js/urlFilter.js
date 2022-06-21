window.onload = function () {
    let nullExpression = /expression=null/;
    if (nullExpression.test(location.href)) {
        location.href = location.href.replace("?expression=null", "?").replace("&expression=null", "");
    }
    }