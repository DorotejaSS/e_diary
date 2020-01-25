$(document).ready(function(){

    fillStudentGroup('fillStudentGroup');

    fillSubjects('fillSubjects');

    $('#sgBttn').click(function(){

        $('#subject').attr('hidden','')

        $('#student_group').removeAttr('hidden')

    });

    $('#sBttn').click(function(){

        $('#student_group').attr('hidden','')

        $('#subject').removeAttr('hidden')

    });

    $('#student_group').change(function(){

        am4core.disposeAllCharts();

        $('#chartdiv').removeAttr('hidden')

        if ($('#student_group').val() != 0)
        {
            var sg_id = $('#student_group').val()
            $.ajax({
                type: 'POST',
                url: '/charts',
                data: {'method':'getSgData', 'id':sg_id},
                success:function(response){
                    var resp = JSON.parse(response);

                    console.log(resp);

                    am4core.useTheme(am4themes_animated);
                    am4core.useTheme(am4themes_kelly);

                    var chart = am4core.create("chartdiv", am4charts.XYChart);

                    chart.marginRight = 400;

                    chart.data = resp;

                    var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
                    categoryAxis.dataFields.category = "subject";
                    categoryAxis.title.text = "Subjects";
                    categoryAxis.renderer.grid.template.location = 0;
                    categoryAxis.renderer.minGridDistance = 20;

                    var  valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
                    valueAxis.title.text = "# of grades";

                    var series1 = chart.series.push(new am4charts.ColumnSeries());
                    series1.dataFields.valueY = "1";
                    series1.dataFields.categoryX = "subject";
                    series1.name = "1";
                    series1.tooltipText = "{name}: [bold]{valueY}[/]";
                    series1.stacked = true;

                    var series2 = chart.series.push(new am4charts.ColumnSeries());
                    series2.dataFields.valueY = "2";
                    series2.dataFields.categoryX = "subject";
                    series2.name = "2";
                    series2.tooltipText = "{name}: [bold]{valueY}[/]";
                    series2.stacked = true;
                    
                    var series3 = chart.series.push(new am4charts.ColumnSeries());
                    series3.dataFields.valueY = "3";
                    series3.dataFields.categoryX = "subject";
                    series3.name = "3";
                    series3.tooltipText = "{name}: [bold]{valueY}[/]";
                    series3.stacked = true;
                    
                    var series4 = chart.series.push(new am4charts.ColumnSeries());
                    series4.dataFields.valueY = "4";
                    series4.dataFields.categoryX = "subject";
                    series4.name = "4";
                    series4.tooltipText = "{name}: [bold]{valueY}[/]";
                    series4.stacked = true;
                    
                    var series5 = chart.series.push(new am4charts.ColumnSeries());
                    series5.dataFields.valueY = "5";
                    series5.dataFields.categoryX = "subject";
                    series5.name = "5";
                    series5.tooltipText = "{name}: [bold]{valueY}[/]";
                    series5.stacked = true;

                    // Add cursor
                    chart.cursor = new am4charts.XYCursor();
                }
            }); 
        }

    });

    $('#subject').change(function(){
        
    });

});

function fillStudentGroup(method)
{
    $.ajax({
        type: 'POST',
        url: '/charts',
        data: 'method='+method,
        success:function(response){

            var resp = JSON.parse(response);
            var select = document.getElementById('student_group');
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

function fillSubjects(method)
{
    $.ajax({
        type: 'POST',
        url: '/charts',
        data: 'method='+method,
        success:function(response){

            var resp = JSON.parse(response);
            var select = document.getElementById('subject');
            for (var i = 0; i < resp.length; i++)

            // Punjenje select-a
            {
                var option = document.createElement('option');
                option.setAttribute('value', resp[i].id);
                option.innerHTML=resp[i].title+' - '+resp[i].first_name+' '+resp[i].last_name
                select.appendChild(option);
            }
        }
    });
}
	