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

    // Active les popover de eZBootstrap
    $('.popover-trigger').popover();

    // Active dotdotdot sur les thumbnails des articles
    $('.thumbnail .inside').dotdotdot();

});
