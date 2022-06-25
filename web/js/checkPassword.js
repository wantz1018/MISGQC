function checkPassword() {
    if(document.getElementById("password").value !== document.getElementById("passwordConfirm").value) {
        document.getElementById("passwordNotEqual").style.display = "inline"
        document.getElementById("passwordConfirm").value = ""
    }
}