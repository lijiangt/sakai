// Register the related commands.
FCKCommands.RegisterCommand(
	'Multimedia',
	new FCKDialogCommand(
		'Multimedia',
		FCKLang['MultimediaDlgTitle'],
		FCKConfig.PluginsPath + 'multimedia/multimedia.html',
		580, 350
	)
);
 
// Create the toolbar button.
var oMultimediaItem = new FCKToolbarButton(
	'Multimedia', 
	FCKLang['MultimediaBtn'], 
	FCKLang['MultimediaTooltip'],
	null, 
	false, true);
oMultimediaItem.IconPath = FCKConfig.PluginsPath + 'multimedia/media.gif'; 
FCKToolbarItems.RegisterItem('Multimedia', oMultimediaItem);