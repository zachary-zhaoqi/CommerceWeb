$(document).ready(function(){

});
function registeValidator() {
    var flage = true;
    if(!validator.isEmail($("#email").val())){
        $('#emaillable').text("Email:格式不正确")
        $('#emaillable').css("color","red");
        flage=false;
    }
    return flage;
}