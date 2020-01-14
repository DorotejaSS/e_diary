$(document).ready(function(){
    fillSelect('fillSelect');
    fillSubjects('fillSubjects');
    checkSelect($('#select').val());

    $('#select').change(function(){
        checkSelect($('#select').val());
        var sg_id = $('#select').val();
        if (sg_id != 0)
        {
            $.ajax({
                type: 'POST',
                url: '/ajax',
                data: {'method':'getSchedule', 'id':sg_id},
                success:function(response){
                    var resp = JSON.parse(response);
                    if (jQuery.isEmptyObject(resp) === false)
                    {
                        
                    }
                }
            }); 
        }
    });

    $('#editBttn').click(function(){
        $('.subjects').removeAttr('hidden');
        $('#cancelBttn').removeAttr('hidden');
        $('#saveBttn').removeAttr('hidden');
        $('#editBttn').attr('hidden', '');
    });

    $('#cancelBttn').click(function(){
        $('.subjects').attr('hidden', '');
        $('#cancelBttn').attr('hidden', '');
        $('#saveBttn').attr('hidden', '');
        $('#editBttn').removeAttr('hidden');
    });

    $('#saveBttn').click(function(){
        var subject_data = [];
        var position_data = [];
        var select = document.getElementsByClassName('subjects');
        for (var i = 0; i < select.length; i++)
        {
            subject_data.push(select[i].value);
            position_data.push(select[i].parentElement.id);
        }
        alert(subject_data);
        alert(position_data);
        $.ajax({
            type: 'POST',
            url: '/ajax',
            data: {'method':'getData', 'subject_data':subject_data, 'position_data':position_data},
            success:function(response){
                var resp = JSON.parse(response);
            }
        });
    });
});

function checkSelect(value)
{
    if (value == 0)
    {
        $('#editBttn').attr('hidden', '');
    }
    else
    {
        $('#editBttn').removeAttr('hidden');
    }
}

function fillSelect(method)
{
    $.ajax({
        type: 'POST',
        url: '/ajax',
        data: 'method='+method,
        success:function(response){
            var resp = JSON.parse(response);
            var select = document.getElementById('select');
            for (var i = 0; i < resp.length; i++)
            {
                var option = document.createElement('option');
                option.setAttribute('value', resp[i].id);
                option.innerHTML=resp[i].year_id+' - '+resp[i].subgroup_id
                select.appendChild(option);
            }
        }
    });
}

function fillSubjects(method)
{
    $.ajax({
        type: 'POST',
        url: '/ajax',
        data: 'method='+method,
        success:function(response){
            var resp = JSON.parse(response);
            var select = document.getElementsByClassName('subjects');
            for (var i = 0; i < select.length; i++)
            {
                fill(select[i]);
            }

            function fill(sel)
            {
                for (var i = 0; i < resp.length; i++)
                {
                    var sel = sel;
                    var option = document.createElement('option');
                    option.setAttribute('value', resp[i].id);
                    option.innerHTML=resp[i].title+' - '+resp[i].first_name+' '+resp[i].last_name
                    sel.appendChild(option);
                }
            }
        }
    });
}