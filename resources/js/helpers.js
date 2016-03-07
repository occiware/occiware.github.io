/**
 * Moves the footer at the bottom of the window (no matter the window's height).
 */
function moveFooter() {
  var footer = $( "#footer" );

  // See style.css.
  // We cannot get it dynamically because this function is also used on resize events.
  var marginTop = 18;
  var newMarginTop = $( window ).height() - footer.position().top - footer.height() - marginTop;
  if( newMarginTop > 10 ) {
    footer.css( 'margin-top', newMarginTop + 'px' );
  }
}


$( window ).ready( moveFooter );
$( window ).resize( moveFooter );
