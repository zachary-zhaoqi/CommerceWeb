$(document).ready(function(){

});

function registeValidator() {
    var flage = true;
    if(!validator.isEmail($("#email").val())){
        $('#emaillable').text("Email:格式不正确")
        $('#emaillable').css("color","red");
        flage=false;
    }else {
        $('#emaillable').text("Email:")
        $('#emaillable').css("color","#646a7c");
    }
    if ($("[name='password']:input").val()==""){
        $('#passwordlable').text("密码:不能为空")
        $('#passwordlable').css("color","red");
        flage=false;
    }else {
        $('#passwordlable').text("密码:")
        $('#passwordlable').css("color","#646a7c");
    }
    //两次密码是否相同
    if (!validator.equals($("[name='password']:input").val(),$("[name='password2']:input").val())){
        $('#passwordlable').text("密码:两次密码不同")
        $('#passwordlable').css("color","red");
        flage=false;
    }else {
        $('#passwordlable').text("密码:")
        $('#passwordlable').css("color","#646a7c");
    }
    return flage;
}
