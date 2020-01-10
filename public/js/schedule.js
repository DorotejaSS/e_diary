$(document).ready(function(){
    var a = 'getSubGroup';
    fillSelect(a);
});

function fillSelect(func)
{
    $.post("./app/models/Schedule.php",{func: func}, function(response){
        var resp = JSON.parse(response);

    });
}