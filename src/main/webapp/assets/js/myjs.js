$(document).ready(function(){

});

function clear() {
    alert("asdf");
    $(":input").val("");
}

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
    if (!validator.is)
    return flage;
}
