$(document).ready(function(){

    // Pozivanje funkcije koja popunjava select
    fillSelect('fillSelect');

    // Kada se #select promeni callback funkcija
    $('#select').change(function(){

            $('.subjectTd').html('<select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select>');

            fillSubjects('fillSubjects');

        // Provera da li je korisnik izabrao neku studentsku grupu
        checkSelect($('#select').val());

        var sg_id = $('#select').val();

        // Ako jeste salju se podaci (method, id) ScheduleController-u
        if (sg_id != 0)
        {           
            $.ajax({
                type: 'POST',
                url: '/ajax',
                data: {'method':'getSchedule', 'id':sg_id},
                success:function(response){

                    // Parsiranje JSON-a koji ScheduleController vrati JS-u
                    var resp = JSON.parse(response);

                    // Provera da li studentska grupa ima vec uneti raspored casova
                    if (!jQuery.isEmptyObject(resp))
                    { 
                        // Stampanje rasporeda
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

    // Na klik na Edit dugme callback funkcija
    $('#editBttn').click(function(){

        $('.subjectTd').html('<select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select>');

        fillSubjects('fillSubjects');

        $('.subjects').removeAttr('hidden');

        $('#cancelBttn').removeAttr('hidden');

        $('#saveBttn').removeAttr('hidden');

        $('#editBttn').attr('hidden', '');
    });

    // Na klik na Cancel dugme callback funkcija
    $('#cancelBttn').click(function(){

        $('.subjects').attr('hidden', '');

        $('#cancelBttn').attr('hidden', '');

        $('#saveBttn').attr('hidden', '');

        $('#select').val('0');
    });

    // Na klik na Save dugme callback funkcija
    $('#saveBttn').click(function(){

        var subject_data = [];
        var position_data = [];
        var select = document.getElementsByClassName('subjects');

        // Izvlacenje unetih vrednosti
        for (var i = 0; i < select.length; i++)
        {
            subject_data.push(select[i].value);
            position_data.push(select[i].parentElement.id);
        }

        // Izvlacenje id-ja izabranje studentske grupe
        var sg_id = $('#select').val();

        // Slanje poataka (method, subject_data, position_data, id) ScheduleControlleru
        $.ajax({
            type: 'POST',
            url: '/ajax',
            data: {'method':'saveData', 'subject_data':subject_data, 'position_data':position_data, 'id':sg_id},
            success:function(){

                alert('Uspesno dodavanje!');

                $('.subjects').attr('hidden', '');

                $('#cancelBttn').attr('hidden', '');

                $('#saveBttn').attr('hidden', '');

                $('#editBttn').attr('hidden', '');

                $('#select').val('0');
            }
        });
    });
});

// Provera da li je korisnik izabrao neku studentsku grupu
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

// Funkcija koja popunjava select
function fillSelect(method)
{
    // Slanje metode koju ScheduleController poziva
    $.ajax({
        type: 'POST',
        url: '/ajax',
        data: 'method='+method,
        success:function(response){

            // Parsiranje JSON-a koji ScheduleController vrati JS-u
            var resp = JSON.parse(response);
            var select = document.getElementById('select');
            for (var i = 0; i < resp.length; i++)

            // Punjenje select-a
            {
                var option = document.createElement('option');
                option.setAttribute('value', resp[i].id);
                option.innerHTML=resp[i].year_id+' - '+resp[i].subgroup_id
                select.appendChild(option);
            }
        }
    });
}

// Funkcija koja popunjava select-e za unos predmeta
function fillSubjects(method)
{
    // Slanje metode koju ScheduleController poziva
    $.ajax({
        type: 'POST',
        url: '/ajax',
        data: 'method='+method,
        success:function(response){

            // Parsiranje JSON-a koji ScheduleController vrati JS-u
            var resp = JSON.parse(response);
            var select = document.getElementsByClassName('subjects');

            for (var i = 0; i < select.length; i++)
            {
                // Punjenje select-a
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