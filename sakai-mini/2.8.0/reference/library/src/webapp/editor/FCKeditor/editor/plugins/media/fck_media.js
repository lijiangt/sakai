/*
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2005 Frederico Caldeira Knabben
 * 
 * Licensed under the terms of the GNU Lesser General Public License:
 * 		http://www.opensource.org/licenses/lgpl-license.php
 * 
 * For further information visit:
 * 		http://www.fckeditor.net/
 * 
 * "Support Open Source software. What about a donation today?"
 * 
 * File Name: fck_media.js
 * 	Scripts related to the Media dialog window (see fck_media.html).
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
 */

var oEditor		= window.parent.InnerDialogLoaded() ;

var FCK			= oEditor.FCK ;
var FCKLang		= oEditor.FCKLang ;
var FCKConfig	= oEditor.FCKConfig ;



//#### Dialog Tabs

// Set the dialog tabs.
window.parent.AddTab( 'Info', oEditor.FCKLang.DlgInfoTab ) ;

if ( FCKConfig.MediaUpload )
	window.parent.AddTab( 'Upload', FCKLang.DlgLnkUpload ) ;

if ( !FCKConfig.MediaDlgHideAdvanced )
	window.parent.AddTab( 'Advanced', oEditor.FCKLang.DlgAdvancedTag ) ;

// Function called when a dialog tag is selected.
function OnDialogTabChange( tabCode )
{
	ShowE('divInfo'		, ( tabCode == 'Info' ) ) ;
	ShowE('divUpload'	, ( tabCode == 'Upload' ) ) ;
	ShowE('divAdvanced'	, ( tabCode == 'Advanced' ) ) ;
}

// Get the selected media embed (if available).
var oFakeImage = FCK.Selection.GetSelectedElement() ;
var oEmbed ;

if ( oFakeImage )
{
	//alert(oFakeImage.tagName);
//	alert(oFakeImage.getAttribute('_fckmedia'));
//	alert(oFakeImage._fckmedia);
	if ( oFakeImage.tagName == 'IMG' && oFakeImage.getAttribute('_fckmedia') ){
	//	alert(111);
		oEmbed = FCK.GetRealElement( oFakeImage ) ;
	//	alert(oEmbed);
	}else{
		oFakeImage = null ;
	}
}

window.onload = function()
{
	// Translate the dialog box texts.
	oEditor.FCKLanguageManager.TranslatePage(document) ;

	// Load the selected element information (if any).
	LoadSelection() ;

	// Show/Hide the "Browse Server" button.
	GetE('tdBrowse').style.display = FCKConfig.MediaBrowser	? '' : 'none' ;

	// Set the actual uploader URL.
	if ( FCKConfig.MediaUpload )
		GetE('frmUpload').action = FCKConfig.MediaUploadURL ;

	window.parent.SetAutoSize( true ) ;

	// Activate the "OK" button.
	window.parent.SetOkButton( true ) ;
}

function LoadSelection()
{
	if ( ! oEmbed ) return ;
	var fckeditor_type = null;
	if(!oEmbed.fckeditor_type)	{
		fckeditor_type = oEmbed.fckeditor_type;
	}
	if(!fckeditor_type){
		fckeditor_type = oEmbed.getAttribute('fckeditor_type')
	}
	if ( fckeditor_type!='media') return ;

	//var sUrl = GetAttribute( oEmbed, 'src', '' ) ;
	
//	GetE('txtUrl').value    = FCKConfig.MediaPlayer;
	GetE('txtWidth').value  = GetAttribute( oEmbed, 'width', '' ) ;
	GetE('txtHeight').value = GetAttribute( oEmbed, 'height', '' ) ;

	// Get Advances Attributes
	var repeat = null;
	var file = null;
	var autostart = null;
	var allowfullscreen;
	var flashvars = GetAttribute( oEmbed, 'flashvars', '' ) ;	
	flashvars = flashvars.replace(/&amp;/gi,'&');
	var varUnits =  flashvars.split('&');
	var varObj = new Object();
	for(var i = 0;i<varUnits.length;i++){
		var unit = varUnits[i].split('=');
		varObj[unit[0]] = unit[1];
	}

	if(varObj['id']){
		varObj['file']= varObj['file']+'&id='+varObj['id'];
	}
	GetE('txtUrl').value = varObj['file'];
	
	//GetE('txtAttId').value		= oEmbed.id ;
	GetE('chkAutoPlay').checked	=  varObj['autostart']=='true';
	GetE('chkLoop').checked		= varObj['repeat']=='true';
	GetE('chkAllowFullscreen').checked		= GetAttribute( oEmbed, 'allowfullscreen', 'true' ) == 'true' ;
//	GetE('chkMenu').checked		= GetAttribute( oEmbed, 'menu', 'true' ) == 'true' ;
//	GetE('cmbScale').value		= GetAttribute( oEmbed, 'scale', '' ).toLowerCase() ;
	
//	GetE('txtAttTitle').value		= oEmbed.title ;

//	if ( oEditor.FCKBrowserInfo.IsIE )
//	{
//		GetE('txtAttClasses').value = oEmbed.getAttribute('className') || '' ;
//		GetE('txtAttStyle').value = oEmbed.style.cssText ;
//	}
//	else
//	{
//		GetE('txtAttClasses').value = oEmbed.getAttribute('class',2) || '' ;
//		GetE('txtAttStyle').value = oEmbed.getAttribute('style',2) ;
//	}

	UpdatePreview() ;
}



//#### The OK button was hit.
function Ok()
{
	if ( GetE('txtUrl').value.length == 0 )
	{
		window.parent.SetSelectedTab( 'Info' ) ;
		GetE('txtUrl').focus() ;

		alert( oEditor.FCKLang.DlgAlertUrl ) ;

		return false ;
	}
	var fileUrl=GetE('txtUrl').value;
	if("xml"!=fileUrl.substr(fileUrl.length-3)){
		alert("对不起，本系统暂时不支持单一的非xml文件格式！请重新选择上传的媒体文件。");
		return false;
	}
	if ( !oEmbed )
	{
		oEmbed		= FCK.EditorDocument.createElement( 'EMBED' ) ;
		oFakeImage  = null ;
	}
	UpdateEmbed( oEmbed ) ;
	
	if ( !oFakeImage )
	{
		oFakeImage	= oEditor.FCKDocumentProcessor_CreateFakeImage( 'FCK__Media', oEmbed ) ;
		oFakeImage.setAttribute( '_fckmedia', 'true', 0 ) ;
		oFakeImage.setAttribute( 'fckeditor_type', 'media', 0 ) ;
		oFakeImage	= FCK.InsertElementAndGetIt( oFakeImage ) ;
	}
	else
		oEditor.FCKUndo.SaveUndoStep() ;
		
	oEditor.FCKMediaProcessor.RefreshView( oFakeImage, oEmbed ) ;
	//FCKMediaProcessor.RefreshView( oFakeImage, oEmbed ) ;

	return true ;
}

function UpdateEmbed( e )
{
	SetAttribute( e, 'type'			, 'application/x-shockwave-flash' ) ;
	SetAttribute( e, 'pluginspage'	, 'http://www.macromedia.com/go/getflashplayer' ) ;

	e.src = FCKConfig.MediaPlayer ;
	SetAttribute( e, "width" , GetE('txtWidth').value ) ;
	SetAttribute( e, "height", GetE('txtHeight').value ) ;
	
	// Advances Attributes

	//SetAttribute( e, 'id'	, GetE('txtAttId').value ) ;
	//SetAttribute( e, 'scale', GetE('cmbScale').value ) ;
	var flashvars = 'file='+GetE('txtUrl').value+'&repeat='+(GetE('chkLoop').checked ? 'true' : 'false')+'&autostart='+(GetE('chkAutoPlay').checked ? 'true' : 'false');	
//	alert(flashvars);
	SetAttribute( e, 'flashvars', flashvars ) ;
	SetAttribute( e, 'fckeditor_type', 'media' ) ;
	SetAttribute( e, 'bgcolor',  '#FFFFFF') ;
	SetAttribute( e, 'allowfullscreen', GetE('chkAllowFullscreen').checked? 'true' : 'false' ) ;
//	SetAttribute( e, 'play', GetE('chkAutoPlay').checked ? 'true' : 'false' ) ;
//	SetAttribute( e, 'loop', GetE('chkLoop').checked ? 'true' : 'false' ) ;
	//SetAttribute( e, 'menu', GetE('chkMenu').checked ? 'true' : 'false' ) ;

	//SetAttribute( e, 'title'	, GetE('txtAttTitle').value ) ;

//	if ( oEditor.FCKBrowserInfo.IsIE )
//	{
//		SetAttribute( e, 'className', GetE('txtAttClasses').value ) ;
//		e.style.cssText = GetE('txtAttStyle').value ;
//	}
//	else
//	{
//		SetAttribute( e, 'class', GetE('txtAttClasses').value ) ;
//		SetAttribute( e, 'style', GetE('txtAttStyle').value ) ;
//	}
}

var ePreview ;

function SetPreviewElement( previewEl )
{
	ePreview = previewEl ;
	
	if ( GetE('txtUrl').value.length > 0 )
		UpdatePreview() ;
}

function UpdatePreview()
{
	if ( !ePreview )
		return ;
		
	while ( ePreview.firstChild )
		ePreview.removeChild( ePreview.firstChild ) ;

	if ( GetE('txtUrl').value.length == 0 )
		ePreview.innerHTML = '&nbsp;' ;
	else
	{
		var oDoc	= ePreview.ownerDocument || ePreview.document ;
		var e		= oDoc.createElement( 'EMBED' ) ;
		
		e.src = FCKConfig.MediaPlayer;
		e.type		= 'application/x-shockwave-flash' ;
		e.width		= '100%' ;
		e.height	= '100%' ;
		var flashvars = 'file='+GetE('txtUrl').value+'&repeat='+(GetE('chkLoop').checked ? 'true' : 'false')+'&autostart='+(GetE('chkAutoPlay').checked ? 'true' : 'false');	
		SetAttribute( e, 'flashvars', flashvars ) ;
		SetAttribute( e, 'fckeditor_type', 'media' ) ;
	SetAttribute( e, 'bgcolor',  '#FFFFFF') ;
	SetAttribute( e, 'allowfullscreen', GetE('chkAllowFullscreen').checked? 'true' : 'false' ) ;
		ePreview.appendChild( e ) ;
	}
}

// <embed id="ePreview" src="fck_flash/claims.swf" width="100%" height="100%" style="visibility:hidden" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
//This is some <embed width="320" height="260" allowfullscreen="true" fckeditor_type="media" flashvars="file=http://primaryedu.bupticet.com/local/local_edu/media/ff8080811172a561011172c38edf0008.flv&amp;autostart=true" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" bgcolor="#FFFFFF" src="../../mediaplayer.swf"></embed><strong>sample text</strong>. You are&nbsp;<a name="fred"></a> using <a href="http://www.fckeditor.net/">FCKeditor</a>.
function BrowseServer()
{
	OpenFileBrowser( FCKConfig.MediaBrowserURL, FCKConfig.MediaBrowserWindowWidth, FCKConfig.MediaBrowserWindowHeight ) ;
}

function SetUrl( url, width, height )
{
	GetE('txtUrl').value = url ;
//	alert(url);
	if(url.length>4){
		var lengthOfStr = url.length;
		var ext = url.substring(lengthOfStr-4);
//		alert(ext);
		if(ext == '.flv'){
			GetE('txtHeight').value = 260;
		}else if(ext == '.mp3'){
			GetE('txtHeight').value =20;
		}
	} 
	
	if ( width )
		GetE('txtWidth').value = width ;
		
	if ( height ) 
		GetE('txtHeight').value = height ;

	UpdatePreview() ;

	window.parent.SetSelectedTab( 'Info' ) ;
}

function OnUploadCompleted( errorNumber, fileUrl, fileName, customMsg )
{
	switch ( errorNumber )
	{
		case 0 :	// No errors
			alert( 'Your file has been successfully uploaded' ) ;
			break ;
		case 1 :	// Custom error
			alert( customMsg ) ;
			return ;
		case 101 :	// Custom warning
			alert( customMsg ) ;
			break ;
		case 201 :
			alert( 'A file with the same name is already available. The uploaded file has been renamed to "' + fileName + '"' ) ;
			break ;
		case 202 :
			alert( 'Invalid file type' ) ;
			return ;
		case 203 :
			alert( "Security error. You probably don't have enough permissions to upload. Please check your server." ) ;
			return ;
		default :
			alert( 'Error on file upload. Error number: ' + errorNumber ) ;
			return ;
	}

	SetUrl( fileUrl ) ;
	GetE('frmUpload').reset() ;
}

var oUploadAllowedExtRegex	= new RegExp( FCKConfig.MediaUploadAllowedExtensions, 'i' ) ;
var oUploadDeniedExtRegex	= new RegExp( FCKConfig.MediaUploadDeniedExtensions, 'i' ) ;

function CheckUpload()
{
	var sFile = GetE('txtUploadFile').value ;
	
	if ( sFile.length == 0 )
	{
		alert( 'Please select a file to upload' ) ;
		return false ;
	}
	
	if ( ( FCKConfig.MediaUploadAllowedExtensions.length > 0 && !oUploadAllowedExtRegex.test( sFile ) ) ||
		( FCKConfig.MediaUploadDeniedExtensions.length > 0 && oUploadDeniedExtRegex.test( sFile ) ) )
	{
		OnUploadCompleted( 202 ) ;
		return false ;
	}
	
	return true ;
}