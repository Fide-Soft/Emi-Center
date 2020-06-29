$('.footer-icons').hover(
    function(){ $(this).addClass('animate__animated animate__jello') },
    function(){ $(this).removeClass('animate__animated animate__jello') }
 )
 $(function() {
   $( '.navbar-nav li' ).on( 'click', function() {
         $( this ).parent().find( 'li.active' ).removeClass( 'active' );
         $( this ).addClass( 'active' );
   });
});
                        