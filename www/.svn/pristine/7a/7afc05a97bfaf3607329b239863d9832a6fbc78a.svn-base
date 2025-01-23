var abstracts;

window.onload = function startup() {
	var temp = $$( 'span.abstract' );

	new Ajax.Request( './papers.xml',
		{
			onComplete: function( response ) {
				abstracts = response.responseXML.getElementsByTagName( 'abstract' );

				temp.each( function( t ) {
					t.observe( 'mouseover', displayAbstract );
				} );
			}
		}
	);

}

function displayAbstract( event ) {
	var temp = Event.element( event );
	
	for ( var i = 0; i < abstracts.length; i++ ) {
		if ( abstracts[i].parentNode.getAttribute( 'id' ).indexOf( temp.id ) >= 0 ) {
			$( 'abstract' ).innerHTML = '<p>' + abstracts[i].getElementsByTagName( 'japanese' )[0].firstChild.nodeValue + '</p>';
		}
	}
}