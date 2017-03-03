<cfscript>
component persistent="false" accessors="true" output="false" extends="mura.plugin.pluginGenericEventHandler" {

	include 'config.cfm';

	public void function onApplicationLoad(required struct $) {
		// register this file as a Mura eventHandler
		VARIABLES.pluginConfig.addEventHandler(this);
	}
	
}
</cfscript>
