clientId = -1;
clientName = "";
clientSocket = -1;
client_sent_hp = 100;

for (var i = 0; i < 9; i ++) {
	clients[i, 0] = -1; //peer instance id
	clients[i, 1] = ""; //username
	clients[i, 2] = -1; //socket
}

//for now clients[0] is unused - the id of 0 is reserved for the server

//refers to last-sent SERVER state (not client)
sent_xspeed = -1;
sent_yspeed = -1;
sent_shooting = false;
sent_hp = 100;
sent_angle = 999;

username = get_string("Enter a username: ", "Mr Host");

obj_player.username = username;

session = netplay_create_session();

netplay_add_event_handler(session, network_type_connect, example_connect_server_handler);
netplay_add_event_handler(session, network_type_data, example_data_server_handler);
netplay_add_event_handler(session, network_type_disconnect, example_disconnect_server_handler);

init_packets();

netplay_add_packet_handler(session, Packets.Echo, example_echo_server_handler);
netplay_add_packet_handler(session, Packets.Increment, example_increment_server_handler);
netplay_add_packet_handler(session, Packets.Position, example_position_server_handler);
netplay_add_packet_handler(session, Packets.OP_MOVE, server_move_handler);
netplay_add_packet_handler(session, Packets.OP_SHOOT, server_shoot_handler);
netplay_add_packet_handler(session, Packets.JOIN, server_join_handler);

socket  = netplay_open(session, 5000, 32);