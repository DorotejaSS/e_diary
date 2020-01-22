$(document).ready(function(){

    //if user scroll down then show the scroll image with fade effect
    $(window).scroll(function(){
        if ($(this).scrollTop() > 500) {
            $('.scroll').fadeIn();
        } 
        else 
        {
            $('.scroll').fadeOut();
        }
    });

    //if user click on scroll link then scroll window to top
    $('.scroll').click(function(){
    $('html, body').animate({scrollTop : 0},1600);

          return false;
    });

});