// Register the related commands.
var dialogPath = FCKConfig.PluginsPath + 'media/fckmedia.html';
var flvPlayerDialogCmd = new FCKDialogCommand( 'media', FCKLang["DlgMediaTitle"], dialogPath, 580, 350 );
FCKCommands.RegisterCommand( 'media', flvPlayerDialogCmd ) ;

// Create the Flash toolbar button.
// FCKToolbarButton( commandName, label, tooltip, style, sourceView, contextSensitive )
var oFlvPlayerItem		= new FCKToolbarButton( 'media', FCKLang["InsertMedia"]) ;
oFlvPlayerItem.IconPath	= FCKPlugins.Items['media'].Path + 'fck_flvmedia.gif' ;

FCKToolbarItems.RegisterItem( 'media', oFlvPlayerItem ) ;			
// 'Flash' is the name used in the Toolbar config.




