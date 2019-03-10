clientId = -1;

sent_xspeed = -1;
sent_yspeed = -1;

sent_shooting = false;
sent_weapon = -1;
sent_angle = 999;

//maps client IDs to instance IDs - peers[0] is used for the host
for (var i = 0; i < 9; i ++) {
	peers[i] = -1; //peer instance id
}

session = netplay_create_session();

netplay_add_event_handler(session, network_type_connect, example_connect_client_handler);
netplay_add_event_handler(session, network_type_data, example_data_client_handler);
netplay_add_event_handler(session, network_type_disconnect, example_disconnect_client_handler);

init_packets();

netplay_add_packet_handler(session, Packets.Echo, example_echo_client_handler);
netplay_add_packet_handler(session, Packets.Increment, example_increment_client_handler);
netplay_add_packet_handler(session, Packets.SYNC, client_sync_handler);
netplay_add_packet_handler(session, Packets.ACCEPT, client_accept_handler);
netplay_add_packet_handler(session, Packets.MATCH, client_match_handler);


username = get_string("Enter a username: ", "Mr Client");

obj_player.username = username;

var host = get_string("Enter a host address to connect to: ", "localhost");

socket = netplay_connect(session, host, 5000);

//netplay_send(session, socket, ExamplePackets.Echo, "Hello World!");
//netplay_send(session, socket, ExamplePackets.Increment, 10);

netplay_send(session, socket, Packets.JOIN, username);