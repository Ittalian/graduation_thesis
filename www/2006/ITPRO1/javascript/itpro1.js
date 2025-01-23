document.write( '<div id="popup"></div>' );
cgi = 'http://www.sw.it.aoyama.ac.jp/cgi-bin/test.cgi';		// cgi URI
var id;
var lecture;	// lecture name
var x, y;

window.onload = function initialize() {
	var temp = document.getElementsByClassName( 'collapse' );
	lecture = document.URL.substring( document.URL.lastIndexOf( '/' ) + 1, document.URL.lastIndexOf( '.' ))

	Event.observe( document, 'mousemove', getMousePosition, false )
	Event.observe( $( 'open' ), 'click', allCollapse, false );
	Event.observe( $( 'close' ), 'click', allCollapse, false );
	Event.observe( $( 'translateOn' ), 'click', selectTranslation, false );
	Event.observe( $( 'translateOff' ), 'click', selectTranslation, false );
	
	for ( var i = 0; i < temp.length; i++ ) {
		Event.observe( temp[i], 'click', collapse, false );
	}

	allCollapse();
	selectTranslation();

	// alert( 'Opera と　firefox であれば全て動作します。IE は無理です。' + '\n' + 'hatena ボタンにチェックを入れるとマウスオーバーしても翻訳されません。' + '\n' );
}

function hatenaKeyword() {
	var url = cgi + '?http://search.hatena.ne.jp/keyword?word=' + encodeURI( this.firstChild.nodeValue ) + '&mode=rss2&ie=utf8&page=1';

	new Ajax.Request( './annotation/' + lecture + '/' + lecture + 'en.xml', { onComplete: translation } );
}

function popup( ajax ) {
	/*var xml = ajax.responseXML.getElementsByTagName( 'title' )[0];
	var keyword = '<a href="' + node_after( xml ).firstChild.nodeValue + '">' + xml + '</a>';*/
	
	$( 'popup' ).innerHTML = ajax.responseXML;
	new Rico.Effect.Position( 'popup', x + 10, y - 15, 0, 1 );
	$( 'popup' ).style.visibility = 'visible';
	fade( 1 );
}

function fade( n ) {
	new Rico.Effect.FadeTo( 'popup', n, 500, 1 );
}

function fadeout() {
	fade( 0 );
}

// collapse div element
function collapse() {
	Element.toggle( node_after( this ) );	// Element.toggle swithces display state.
}

// get mouse position
function getMousePosition( event ) {
	x = Event.pointerX( event );
	y = Event.pointerY( event );
}

// translate japanese into english
function translateJapanese() {
	id = this.id;
	new Ajax.Request( './annotation/' + lecture + '/' + lecture + 'en.xml', { onComplete: translation } );
}

// translate english into japanese
function translateEnglish() {
	id = this.id;
			setTimeout( 'wait()', 500000 );
	new Ajax.Request( './annotation/' + lecture + '/' + lecture + '.xml', { onComplete: translation } );
}

function translation( ajax ) {
	var resource = ajax.responseXML.getElementsByTagName( 'Description' );
	var temp;
			
	// id が一致したものを翻訳。だいぶ効率は悪い。
	for ( var i = 0; i < resource.length; i++ ) {
		temp = resource[i].attributes.item( 0 ).value.split( '#' )[1];
//		temp = resource[i].getAttribute( 'about' ).split( '#' )[1]; firefox で無理
		
		if ( temp.indexOf( id ) != -1 ) {
			$( id ).innerHTML = resource[i].childNodes[1].firstChild.nodeValue;
			break;
		}
	}
}

// translate all elements 
function translateAll() {
	if ( $( 'english' ).checked ) {
		new Ajax.Request( './annotation/' + lecture + '/' + lecture + 'en.xml', { onComplete: allTranslation } );
	}
	else {
		new Ajax.Request( './annotation/' + lecture + '/' + lecture + '.xml', { onComplete: allTranslation } );
	}
}

function allTranslation( ajax ) {
	var translation = document.getElementsByClassName( 'translation' );
	var i;
	var resource = ajax.responseXML.getElementsByTagName( 'Description' );
	var temp;
	
	// id が一致したものを翻訳。だいぶ効率は悪い。
	for ( i = 0; i < resource.length; i++ ) {
		temp = resource[i].attributes.item( 0 ).value.split( '#' )[1];
		
		if ( temp.indexOf( translation[i].id ) != -1 ) {
			$( translation[i].id ).innerHTML = resource[i].childNodes[1].firstChild.nodeValue;
		}
	}
}

// all heading element collapse		
function allCollapse() {
	var temp = document.getElementsByClassName( 'collapse' );
	var i;

	if ( $( 'open' ).checked ) {
		for ( i = 0; i < temp.length; i++ ) {
			Element.show( node_after( temp[i] ) );	// Element.show sets style.display = ''.
		}
	}
	else {
		for ( i = 0; i < temp.length; i++ ) {
			Element.hide( node_after( temp[i] ) );	// Element.hide sets style.display = 'none'.
		}
	}			
}

// select translation mode on or off
function selectTranslation() {
	var temp = document.getElementsByClassName( 'translation' );
	var i;

	if( $( 'translateOn' ).checked ) {
		Element.show( $( 'language' ) );
		
		for ( i = 0; i < temp.length; i++ ) {
			Event.observe( temp[i], 'mouseover', translateJapanese, false );
			Event.observe( temp[i], 'mouseout', translateEnglish, false );
		}
		
		Event.observe( $( 'english' ), 'click', translateAll, false );
		Event.observe( $( 'japanese' ), 'click', translateAll, false );

	}
	else {
		Element.hide( $( 'language' ) );

		for ( i = 0; i < temp.length; i++ ) {
			Event.stopObserving( temp[i], 'mouseover', translateJapanese, false );
			Event.stopObserving( temp[i], 'mouseout', translateEnglish, false );
		}
		
		$( 'english' ).checked = false;
		$( 'japanse' ).checked = false;
	}
}

// translate english into japanese
function translateEnglishpop() {
	id = this.id;
	new Ajax.Request( './annotation/' + lecture + '/' + lecture + '.xml', { onComplete: translation } );
}

function translationpop( ajax ) {
	var resource = ajax.responseXML.getElementsByTagName( 'Description' );
	var temp;
			
	// id が一致したものを翻訳。だいぶ効率は悪い。
	for ( var i = 0; i < resource.length; i++ ) {
		temp = resource[i].attributes.item( 0 ).value.split( '#' )[1];
//		temp = resource[i].getAttribute( 'about' ).split( '#' )[1]; firefox で無理
		
		if ( temp.indexOf( id ) != -1 ) {
			$( 'popup' ).innerHTML = resource[i].childNodes[1].firstChild.nodeValue;
			new Rico.Effect.Position( 'popup', x + 10, y - 15, 0, 1 );
			$( 'popup' ).style.visibility = 'visible';
			fade( 1 );
			break;
		}
	}

}
// method for test		
function test() {
	id = 'lec2-1';
	new Ajax.Request( './annotation/lecture2/test.txt', { onComplete: ajaxTest } );
}

// method for ajax test
function ajaxTest( ajax ) {	
	$( id ).innerHTML = ajax.responseText;
}