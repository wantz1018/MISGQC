let checkCode = ""

function getCaptcha(w, h, n) {
    const CHARTS = "123456789ABCDEFGHJKLMNPQRSTUVWXYZ".split("");
    const randomInt = (s, e) => {
        if (s > e) {
            let t = s;
            s = e;
            e = t;
        }
        s = Math.ceil(s);
        e = Math.floor(e);
        return s + Math.floor(Math.random() * (e - s))
    }
    const randomFloat = (s, e) => {
        return s + Math.random() * (e - s);
    }
    const randomColor = (s, e) => {
        return `rgb(${randomInt(s,e)},${randomInt(s,e)},${randomInt(s,e)})`;
    }

    let canvas = document.createElement('canvas');
    canvas.setAttribute("width", "90")
    canvas.setAttribute("height", "30")
    let ctx = canvas.getContext('2d');

    ctx.rect(0, 0, w, h);
    ctx.clip();

    ctx.fillStyle = randomColor(200, 250);
    ctx.fillRect(0, 0, w, h);

    for (let i = 0.05 * w * h; i > 0; i--) {
        ctx.fillStyle = randomColor(0, 256);
        ctx.fillRect(randomInt(0, w), randomInt(0, h), 1, 1);
    }

    ctx.font = `${h - 4}px Consolas`;
    ctx.fillStyle = randomColor(160, 200);
    let value = "";
    for (let i = 0; i < n; i++) {
        let x = (w - 10) / n * i + 5,
            y = h - 12;
        let r = Math.PI * randomFloat(-0.12, 0.12);
        let ch = CHARTS[randomInt(0, CHARTS.length)];
        value += ch;
        ctx.translate(x, y);
        ctx.rotate(r);
        ctx.fillText(ch, 0, 0);
        ctx.rotate(-r);
        ctx.translate(-x, -y);
    }

    let base64Src = canvas.toDataURL('image/jpg');
    checkCode = value
    return {
        value,
        base64Src
    };

}

function createCheckCode() {
    let res = getCaptcha(80, 30, 4);
    document.querySelector("#checkCodeCanvas").src = res.base64Src;
    document.querySelector("#checkCodeError").innerHTML = ""
}

function checkCheckCode() {
    if (document.querySelector("#checkCodeInputBox").value.toUpperCase() !== checkCode) {
        document.querySelector("#checkCodeError").innerHTML = "验证码错误！"
        document.querySelector("#checkCodeInputBox").value = ""
    }
}