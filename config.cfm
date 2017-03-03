<cfscript>
	VARIABLES.package = 'muravisittoast';
	VARIABLES.packageVersion = '1.0.0';
	VARIABLES.settingsDefault = {
		GntpHost: 'localhost',
		GntpPort: 23053,
		GntpPassword: '',
		GntpIcon: 'https://raw.githubusercontent.com/fraxen/muravisittoast/master/defaulticon.png',
	};
	VARIABLES.sites = [];
	for (site in APPLICATION.serviceFactory.getBean('muraScope').init('default').getPlugin('muravisittoast').getAssignedSites()) {
		ArrayAppend(VARIABLES.sites, site.SiteID);
	}
	VARIABLES.hasGNTP = false;
	try {
		createObject('java', 'net.sf.libgrowl.GrowlConnector');
		VARIABLES.hasGNTP = true;
	}
	catch(any e) {
	}

	lock name='mura500' type='exclusive' timeout=200 {
		VARIABLES.SettingsService = new model.services.settings(
			sites: VARIABLES.sites,
			settingsDefault: VARIABLES.settingsDefault,
			hasGNTP: VARIABLES.hasGNTP
		);
	}
</cfscript>
