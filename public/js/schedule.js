$(document).ready(function(){
    fillSelect('fillSelect');
    fillSubjects('fillSubjects');
    checkSelect($('#select').val());

    $('#select').change(function(){
        $('.subjectTd').html('<select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select>');
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
                    if (!jQuery.isEmptyObject(resp))
                    {
                        for (var i = 0; i < resp.length; i++)
                        {
                            var td = document.getElementById(resp[i].position);
                            td.innerHTML = resp[i].title;
                            td.setAttribute('data-s_id', resp[i].subject_id);
                        }
                        
                    }
                }
            }); 
        }
    });

    $('#editBttn').click(function(){
        $('.subjectTd').html('<select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select>');
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
        checkSelect($('#select').val());
        var sg_id = $('#select').val();
        $.ajax({
            type: 'POST',
            url: '/ajax',
            data: {'method':'saveData', 'subject_data':subject_data, 'position_data':position_data, 'id':sg_id},
            success:function(){
                alert('Uspesno dodavanje!');
                $('.subjects').attr('hidden', '');
                $('#cancelBttn').attr('hidden', '');
                $('#saveBttn').attr('hidden', '');
                $('#editBttn').removeAttr('hidden');
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