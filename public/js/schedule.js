$(document).ready(function(){

    var method = 'getSubGroup';
    fillSelect(method);

    $('#editBttn').click(function(){
        $(':input').removeAttr('hidden');
    });
});

function fillSelect(method)
{
    $.ajax({
        type: "POST",
        url: "/ajax",
        data: "method="+method,
        success:function(response){
            var resp = JSON.parse(response)
            var select = document.getElementById('select');
            for (var i = 0; i < resp.length; i++)
            {
                var option = document.createElement('option');
                option.setAttribute('value', resp.id);
                option.innerHTML=resp[i].year_id+' - '+resp[i].subgroup_id
                select.appendChild(option);
            }
        }
    });
}