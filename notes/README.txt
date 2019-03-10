Multiplayer Top Down Shooter Example

-------

A straightforward and simple foundation for creating a multiplayer shooter in GM.

The underlying networking scripts are from AndrewBGM's excellent netplay library found here:
https://github.com/AndrewBGM/netplay [MIT License]

This project builds upon these scripts to implement a basic shooter game with server/client HP and position syncing.

collision_line_first script taken from GMLscripts.com [GMLscripts.com/license]


-------

Testing/Running:

Open up two instances of GMS or the executable itself, start one as Server and join as Client on the other.
Maintain the default setting of localhost in this instance.

NOTE: For testing between different PCs, you must have port-forwarding set up for the whichever PC is host.

For more info / how to do this, here is an excellent guide:
https://youtu.be/61cL3pKyYAM

For more debugging help, here's a helpful thread:
https://forum.yoyogames.com/index.php?threads/different-computers-wont-connect.21333/


-------

How it works / System Overview:

server instantiation
client instantiation: send JOIN packet
server receives JOIN: store client info, reply with ACCEPT including a client ID
client receives ACCEPT: store client ID

client changes movement/direction:
	-client sends position and current speeds to server (OP_MOVE)
	-client calcs new position locally

client shoots:
	-client sends image angle and shooting state (true/false) (OP_SHOOT)
	-client calcs if shot hit anybody locally and alters peer HPs appropriately

client changes aim/angle:
	-client sends image angle and shooting state (OP_SHOOT)

server receives OP_MOVE packet:
	-server verifies, updates peer instance position from given speeds
	-server replies with a SYNC packet with the sender's official state

server receives OP_SHOOT packet:
	-server verifies, updates peer instance shooting state and angle
	-server replies with a SYNC packet with the sender's official state

client receives a SYNC (about itself):
	-client checks if locally calculated position is within a margin of error of server's given position
		-refreshes position only if necessary
	-client checks if locally calculated HP is different than server, updates if so
	-client DOES NOT update shooting state and image angle from server

client receives a SYNC (about server):
	-client updates peer instance position only if necessary (if guess-timation is off by a significant margin)
	-client uses given speeds + position to locally calculate peer movement
	-client updates peer's shooting status and angle immediately based on given server info
	
