#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <clientprefs>
#include <smlib>

#define PLUGIN_NAME    "NMRIH Hitbox Fixer"
#define PLUGIN_VERSION "1.0.1"

//There list maps what you want skip.
static const char hSkipMaps[][] = {
    //"nmo_chinatown",
	"nmo_ravenholm"
};

public Plugin:myinfo =
{
	name        = PLUGIN_NAME,
	author      = "MAGISTER",
	description = "New fix hitbox for NMRIH, game version 1.1.0.0",
	version     = PLUGIN_VERSION,
	url         = ""
}

public OnPluginStart()
{
	CreateConVar("nmrih_hitbox_fixer_version", PLUGIN_VERSION, PLUGIN_NAME, FCVAR_NOTIFY|FCVAR_DONTRECORD);
}

public OnMapStart()
{
    File_AddToDownloadsTable("models/fix_zombie");
}

public OnConfigsExecuted()
{
	// precache model (custom)
	PrecacheModel("models/fix_zombie/badass_infected.mdl", true);
	PrecacheModel("models/fix_zombie/bateman_infected.mdl", true);
	PrecacheModel("models/fix_zombie/berny.mdl", true);
	PrecacheModel("models/fix_zombie/butcher_infected.mdl", true);
	PrecacheModel("models/fix_zombie/casual_02.mdl", true);
	PrecacheModel("models/fix_zombie/herby.mdl", true);
	PrecacheModel("models/fix_zombie/hunter_infected.mdl", true);
	PrecacheModel("models/fix_zombie/jive_infected.mdl", true);
	PrecacheModel("models/fix_zombie/jogger.mdl", true);
    PrecacheModel("models/fix_zombie/julie.mdl", true);
	PrecacheModel("models/fix_zombie/lisa.mdl", true);
	PrecacheModel("models/fix_zombie/maxx.mdl", true);
	PrecacheModel("models/fix_zombie/molotov_infected.mdl", true);
	PrecacheModel("models/fix_zombie/national_guard.mdl", true);
	PrecacheModel("models/fix_zombie/officezom.mdl", true);
	PrecacheModel("models/fix_zombie/roje_infected.mdl", true);
	PrecacheModel("models/fix_zombie/runner.mdl", true);
	PrecacheModel("models/fix_zombie/tammy.mdl", true);
	PrecacheModel("models/fix_zombie/toby.mdl", true);
	PrecacheModel("models/fix_zombie/wally_infected.mdl", true);
	PrecacheModel("models/fix_zombie/zombiekid_boy.mdl", true);
	PrecacheModel("models/fix_zombie/zombiekid_girl.mdl", true);

	// precache model (original)
	PrecacheModel("models/nmr_zombie/badass_infected.mdl", true);
	PrecacheModel("models/nmr_zombie/bateman_infected.mdl", true);
	PrecacheModel("models/nmr_zombie/berny.mdl", true);
	PrecacheModel("models/nmr_zombie/butcher_infected.mdl", true);
	PrecacheModel("models/nmr_zombie/casual_02.mdl", true);
	PrecacheModel("models/nmr_zombie/herby.mdl", true);
	PrecacheModel("models/nmr_zombie/hunter_infected.mdl", true);
	PrecacheModel("models/nmr_zombie/jive_infected.mdl", true);
	PrecacheModel("models/nmr_zombie/jogger.mdl", true);
	PrecacheModel("models/nmr_zombie/julie.mdl", true);
	PrecacheModel("models/nmr_zombie/lisa.mdl", true);
	PrecacheModel("models/nmr_zombie/maxx.mdl", true);
	PrecacheModel("models/nmr_zombie/molotov_infected.mdl", true);
	PrecacheModel("models/nmr_zombie/national_guard.mdl", true);
	PrecacheModel("models/nmr_zombie/officezom.mdl", true);
	PrecacheModel("models/nmr_zombie/roje_infected.mdl", true);
	PrecacheModel("models/nmr_zombie/runner.mdl", true);
	PrecacheModel("models/nmr_zombie/tammy.mdl", true);
	PrecacheModel("models/nmr_zombie/toby.mdl", true);
	PrecacheModel("models/nmr_zombie/wally_infected.mdl", true);
	PrecacheModel("models/nmr_zombie/zombiekid_boy.mdl", true);
	PrecacheModel("models/nmr_zombie/zombiekid_girl.mdl", true);
}

public OnEntityCreated(entity, const String:classname[])
{
	decl String:hFixer[64];
	GetCurrentMap(hFixer, 64);
	int num = sizeof(hSkipMaps);
    for ( int i; i < num; i++ )
	{
	    if (StrContains(hFixer, hSkipMaps[i], false))
	    {
	        if(IsValidEdict(entity))
	        {
		        decl String:sName[128];
		        GetEntPropString(entity, Prop_Data, "m_ModelName", sName, 128);
		        if(StrEqual(sName, "models/nmr_zombie/badass_infected.mdl")) {SetEntityModel(entity, "models/fix_zombie/badass_infected.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/bateman_infected.mdl")) {SetEntityModel(entity, "models/fix_zombie/bateman_infected.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/berny.mdl")) {SetEntityModel(entity, "models/fix_zombie/berny.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/butcher_infected.mdl")) {SetEntityModel(entity, "models/fix_zombie/butcher_infected.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/casual_02.mdl")) {SetEntityModel(entity, "models/fix_zombie/casual_02.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/herby.mdl")) {SetEntityModel(entity, "models/fix_zombie/herby.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/hunter_infected.mdl")) {SetEntityModel(entity, "models/fix_zombie/hunter_infected.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/jive_infected.mdl")) {SetEntityModel(entity, "models/fix_zombie/jive_infected.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/jogger.mdl")) {SetEntityModel(entity, "models/fix_zombie/jogger.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/julie.mdl")) {SetEntityModel(entity, "models/fix_zombie/julie.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/lisa.mdl")) {SetEntityModel(entity, "models/fix_zombie/lisa.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/maxx.mdl")) {SetEntityModel(entity, "models/fix_zombie/maxx.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/molotov_infected.mdl")) {SetEntityModel(entity, "models/fix_zombie/molotov_infected.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/national_guard.mdl")) {SetEntityModel(entity, "models/fix_zombie/national_guard.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/officezom.mdl")) {SetEntityModel(entity, "models/fix_zombie/officezom.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/roje_infected.mdl")) {SetEntityModel(entity, "models/fix_zombie/roje_infected.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/runner.mdl")) {SetEntityModel(entity, "models/fix_zombie/runner.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/tammy.mdl")) {SetEntityModel(entity, "models/fix_zombie/tammy.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/toby.mdl")) {SetEntityModel(entity, "models/fix_zombie/toby.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/wally_infected.mdl")) {SetEntityModel(entity, "models/fix_zombie/wally_infected.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/zombiekid_boy.mdl")) {SetEntityModel(entity, "models/fix_zombie/zombiekid_boy.mdl");}
		        if(StrEqual(sName, "models/nmr_zombie/zombiekid_girl.mdl")) {SetEntityModel(entity, "models/fix_zombie/zombiekid_girl.mdl");}
	        }
	    }else{}
	}
}