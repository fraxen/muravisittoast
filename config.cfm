<cfscript>
	VARIABLES.loader = new mura.javaloader.JavaLoader(
		DirectoryList(ExpandPath('./java'), true, 'path', '*.jar')
	);
	VARIABLES.package = 'muravisittoast';
	VARIABLES.packageVersion = '1.0.0';
	VARIABLES.settingsDefault = {
		GntpHost: 'localhost',
		GntpPort: 23053,
		GntpPassword: '',
		GntpIcon: 'https://raw.githubusercontent.com/fraxen/muravisittoast/master/defaulticon.png',
	};
	VARIABLES.sites = [];
	VARIABLES.m = application.serviceFactory.getBean('muraScope').init('default');
	VARIABLES.pluginConfig = m.getPlugin(VARIABLES.package);
	m = VARIABLES.m;
	for (site in VARIABLES.pluginConfig.getAssignedSites()) {
		ArrayAppend(VARIABLES.sites, site.SiteID);
	}
	VARIABLES.pluginConfig.registerModelDir(dir='/model');
	VARIABLES.SettingsService = VARIABLES.pluginConfig.getServiceFactory().getBean('settings');
	/*
	VARIABLES.loader.create('net.sf.libgrowl.GrowlConnector');
	dbfile = '#ExpandPath('./database/')#GeoLite2-City.mmdb';
	db = CreateObject('java', 'java.io.File').init(dbfile);
	mm = VARIABLES.loader.create('com.maxmind.geoip2.DatabaseReader$Builder')
		.Init(db)
		.build();
	inet = CreateObject('java', 'java.net.InetAddress').getByName(CGI.REMOTE_HOST);

	lock name='muravisittoast' type='exclusive' timeout=200 {
	}
	dump(inet);
	abort;
	*/
</cfscript>
