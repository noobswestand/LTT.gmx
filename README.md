# LMG Adventures
Please view the RAW for proper format



I will add to this, if requested. Right now, I think this should be enough to get people started
Here is a quick map on where to find things while editing the game:
The map goes like this:
///Catagory///
  Sub-Catagory
    Object    : (event) Description
    Script    : (object,event) Description

///Interfaces///
  HighScores
    obj_highscoresign : (step) The sign that you double click on to bring up the high scores
    obj_tuthelp       : (drawGUI) The object that draws the interface for the high scores
    scr_drawDead      : (obj_control,draw) Submits the high scores to the database
    obj_control       : (Async:HTTP) Gets the Success/Fail message for submit highscores
    
  Options
    obj_tuthelp       : (create) setup the vars for the options
    scr_drawOptions   : (obj_tuthelp,drawGUI) Draws the options
  
  In-Game-UI
    obj_control       : (create) A bunch of scripts that setup everything
    obj_control       : (draw) Where the game draws the guns,shovels,health bars, charge bars, and death screen (sorry for the chaos in this section)
    
  Menu
    obj_select        : (draw) Draws the character picking mechanism
      
      
      
///Game///
  Player
    obj_player        : (all) The game logic for the player movement is pretty much all in this object
    obj_control       : (Begin/End/Norm Step) These scripts do a lot of different things like; controller, gun rotation, going down a level, etc..
    .
  Monsters
    NOTE: most of the logic for the monsters is stored in the corresponding monster object: obj_monster0, obj_monster1...
    scr_spawn         : (obj_spawn,step) This spawns the monsters in on the floor
    par_monster       : (all)
  
  InGameObjects
    obj_gem           : (all) In game gems that you pick up
    obj_player        : (Collision w/ obj_gem) This is where the money is added up
    obj_key           : (all) does what keys do
    obj_health        : (all) gives player 10hp
    obj_chest         : (all) Does the stuff for chest buying
    obj_crate         : (all) Does the stuff for crates+breaking them
    obj_dynamite      : (all) Explodes, etc...
    
  Terrain Generation
    obj_room_generate : (create) Determines how the terrain is generated
    scr_generateRoom2 : (obj_room_generate,create) Generates the random normal rooms
    scr_generateRoomBoss:(obj_room_generate,create) Generates rooms for the bosses
  
  
///Online///
  TCP
    obj_server        : (create) Sets up the in game server(tcp and udp)
    obj_server        : (Aysnc:Networking) Handles the connecting/disconnecting/messages
    obj_client2       : (UserEvent0) Handles the networking cases for the server
    obj_client2       : (alarm3) Sends over the terrain to the client
    obj_client        : (create) Connects to the server
    ReceivedPacket    : (obj_client,Aynsc:Networking) Handles the networking cases for the client
  
  UDP
    obj_server        : (create) Sets up the in game server(tcp and udp)
    obj_server        : (alarm3) Broadcasts the server on the LAN network
    obj_findmatch     : (all) Tries to find a match that is being broadcast by the server
    obj_UDP           : (all) Does a lot of the misc. networking functionality
  

///Sounds///
  obj_soundLoad       :(create) Loads the sounds and puts the in the correct catagories for settings
  obj_sound           :(all) Handles general sound tasks

///Mobile///
  obj_touchscreen     :(all) Does the basic touch screen buttons
  obj_joystick        :(all) Is the on-screen joystick
