#include <sourcemod>
#include <sdkhooks>
#include <sdktools>

#define TEAM_CT 3
#define TEAM_T 2

public Plugin: myinfo = {
        name = "hitbox-red-models",
        author = "spy",
        description = "",
        version = "1.1",
        url = ""
};

public OnPluginStart()
{
    HookEvent("player_spawn", Event_PlayerSpawn); 
    
    PrecacheModel("models/player/custom_player/legacy/colored/terrorist_backwards_large.mdl");
    AddFileToDownloadsTable("materials/models/player/colored/multicolor.vmt");
    AddFileToDownloadsTable("materials/models/player/colored/multicolor.vtf");
    AddFileToDownloadsTable("models/player/custom_player/legacy/colored/terrorist_backwards_large.dx90.vtx");
    AddFileToDownloadsTable("models/player/custom_player/legacy/colored/terrorist_backwards_large.mdl");
    AddFileToDownloadsTable("models/player/custom_player/legacy/colored/terrorist_backwards_large.phy");
    AddFileToDownloadsTable("models/player/custom_player/legacy/colored/terrorist_backwards_large.vvd");
}

public Action:Event_PlayerSpawn(Handle:event, const String:name[], bool:dontBroadcast)
{
        
    new client = GetClientOfUserId(GetEventInt(event, "userid"));
    
    if(IsPlayerAlive(client))
    {
      switch (GetClientTeam(client)) 
      {
         case TEAM_CT: SetEntityModel(client, "models/player/custom_player/legacy/colored/counter-terrorist_backwards_large.mdl"), SetEntityRenderColor(client, 255, 0, 0, 255);  
         case TEAM_T:  SetEntityModel(client, "models/player/custom_player/legacy/colored/counter-terrorist_backwards_large.mdl"), SetEntityRenderColor(client, 255, 0, 0, 255);
      }
    }
} 
