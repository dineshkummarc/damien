$(document).ready(function(){

    // Ajout des qTip sur les drapeaux de langue
    $('#langues img, #lienssociaux img').qtip({
        content: {
            attr: 'alt'
        },
        style: {
            classes: 'ui-tooltip-youtube ui-tooltip-shadow'
        },
        position: {
            my: 'bottom center',
            at: 'top center'
        }
    });


    $('.thumbnail .inside').dotdotdot();

});
