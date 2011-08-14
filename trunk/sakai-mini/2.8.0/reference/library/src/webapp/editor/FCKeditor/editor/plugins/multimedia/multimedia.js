var oEditor    = window.parent.InnerDialogLoaded(); 
var FCK        = oEditor.FCK; 
var FCKLang    = oEditor.FCKLang ;
var FCKConfig  = oEditor.FCKConfig ;
var oMedia     = null;
var isNew	   = true;
var flashPlayer = "/library/media/mediaplayer.swf";

/** Initial setup */
window.onload = function() { 
	// Translate dialog box
	oEditor.FCKLanguageManager.TranslatePage(document);
	// Load selected movie
	loadMediaSelection();
	// Show Ok button
	window.parent.SetOkButton(true);
}

/** Media object */
var Media = function (o){
	this.id = '';
	this.url = '';
	this.autostart = true;
	this.allowFullscreen = true;
	this.width = '800';
	this.height = '420';
	if(o) this.setObjectElement(o);
};

Media.prototype.getUrl = function(){
	if(!this.url){
		return this.url;
	}
	var urlPrefix = top.location.protocol+'//'+top.location.host;
	if(top.location.port){
		urlPrefix +=':'+top.location.port;
	}
	if(this.url.substr(0,urlPrefix.length)==urlPrefix){
		return this.url.substr(urlPrefix.length);
	}else{
		return this.url;
	}
}
Media.prototype.getInnerHTML = function (objectId){
	var rnd = Math.floor(Math.random()*1000001);
	var s = "";
	s += '<OBJECT id="meida' + rnd + '" ';
	s += '        type="application/x-shockwave-flash" ';
	s += '        data="'+ flashPlayer +'" ';
	s += '        width="'+this.width+'" height="'+this.height+'" >';
	s += '  <param name="allowFullScreen" value="'+(this.allowFullscreen?'true':'false')+'" />';
	s += '  <PARAM name="movie" value="'+ flashPlayer +'" /><param name="bgcolor" value="#FFFFFF" />';
	s += '  <PARAM name="FlashVars" value="fileUrl='+encodeURI(this.getUrl())+'&amp;filePath='+encodeURI(this.getUrl())+'&amp;autostart='+(this.autostart?'true':'false')+'" />';
	s += '</OBJECT>';
	return s;
}
Media.prototype.setAttribute = function(attr, val) {
	if (val=="true") {
		this[attr]=true;
	} else if (val=="false") {
		this[attr]=false;
	} else {
		this[attr]=val;
	}
};
Media.prototype.setObjectElement = function (e){
	if (!e) return ;
	this.width = GetAttribute( e, 'width', this.width );
	this.height = GetAttribute( e, 'height', this.height );
};




function loadMediaSelection() {
	oMovie = new Media();
	var oSel = FCK.Selection.GetSelectedElement();
	if(oSel != null) {
		var oSelConv = FCK.GetRealElement(oSel);
		if(oSelConv != null) {
			oSel = oSelConv;
		}
		if (oSel.id != null && oSel.id.match(/^media[0-9]*$/)) {
			oMovie.setAttribute('id', oSel.id);
		}
		for ( var i = 0; i < oSel.childNodes.length; i++) {
			if (oSel.childNodes[i].tagName == 'PARAM') {
				var name = GetAttribute(oSel.childNodes[i], 'name');
				var value = GetAttribute(oSel.childNodes[i], 'value');
				if (name == 'FlashVars') {
					// Flash video
					var vars = value.split('&');
					for ( var fv = 0; fv < vars.length; fv++) {
						var varsT = vars[fv].split('=');
						name = varsT[0];
						value = varsT[1];
						if (name == 'fileUrl'||name=='filePath') {
							oMovie.setAttribute('url', decodeURI(value));
						} else {
							oMovie.setAttribute(name, value);
						}
					}
				} else if (name == 'movie' && !value.endsWith(flashPlayer)) {
					ShowE('tdBrowse', FCKConfig.LinkBrowser);
					return;
				} else {
					// Other movie types
					oMovie.setAttribute(name, value);
				}
				isNew = false;
			}
		}
	}
	
	// Read current settings (existing movie)
	GetE('txtUrl').value = oMovie.url;
	GetE('txtWidth').value = oMovie.width;
	GetE('txtHeight').value = oMovie.height;
	GetE('chkAutoplay').checked	= oMovie.autostart;
	GetE('chkAllowFullscreen').checked	= oMovie.autostart;
	// Show/Hide according to settings
	ShowE('tdBrowse', FCKConfig.LinkBrowser);
	return oMovie;
}


/** Browse/upload a file on server */
function BrowseServer() {
	if(!FCKConfig.MultimediaBrowserURL) {
		FCKConfig.MultimediaBrowserURL = FCKConfig.ImageBrowserURL.replace(/(&|\?)Type=Image/i, "$1Type=Multimedia");
	}
	if(!FCKConfig.MultimediaBrowserWindowWidth) {
		FCKConfig.MultimediaBrowserWindowWidth = FCKConfig.ScreenWidth * 0.7;
	}
	if(!FCKConfig.MultimediaBrowserWindowWidth) {
		FCKConfig.MultimediaBrowserWindowHeight = FCKConfig.ScreenHeight * 0.7;
	}
	OpenFileBrowser(
			FCKConfig.MultimediaBrowserURL, 
			FCKConfig.MultimediaBrowserWindowWidth, 
			FCKConfig.MultimediaBrowserWindowHeight);
}


/** Start processing */
function Ok() {
	if(GetE('txtUrl').value.length == 0||!GetE('txtUrl').value.toLowerCase().endsWith('.xml')) {
		GetE('txtUrl').focus();
		window.parent.SetSelectedTab('Info');
		alert(FCKLang.MultimediaNoUrl) ;
		return false ;
	}
	
	oEditor.FCKUndo.SaveUndoStep();
	
	var e = (oMovie || new Media()) ;
	updateMediaObject(e) ;
	if(!isNew) {
		if(!navigator.userAgent.contains('Safari')) {
			FCK.Selection.Delete();
		}
		FCK.InsertHtml(e.getInnerHTML());
	}else{
		FCK.InsertHtml(e.getInnerHTML());
	}
	
	return true;
}

function SetUrl(url) {
	GetE('txtUrl').value = url;
}


/** Update Movie object from Form */
function updateMediaObject(e){
	e.url = GetE('txtUrl').value;
	e.width = (isNaN(GetE('txtWidth').value)) ? 0 : parseInt(GetE('txtWidth').value);
	e.height = (isNaN(GetE('txtHeight').value)) ? 0 : parseInt(GetE('txtHeight').value);
	e.autostart = (GetE('chkAutoplay').checked) ? true : false;
	e.allowFullscreen = (GetE('chkAllowFullscreen').checked) ? true : false;
}

String.prototype.endsWith = function(str) 
{return (this.match(str+"$")==str)}

String.prototype.contains = function(str) 
{return (this.match(str)==str)}