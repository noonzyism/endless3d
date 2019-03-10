/// example_increment_server_handler(session, socket, ip, port, packet_id, values);

var _session   = argument[0],
    _socket    = argument[1],
    _ip        = argument[2],
    _port      = argument[3],
    _packet_id = argument[4],
    _values    = argument[5];

var _x = _values[0];
var _y = _values[1];

show_debug_message("Server received: [" + string(_x) + ", " + string(_y) + "]");

obj_peer.x = _x;
obj_peer.y = _y;