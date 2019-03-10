/// example_increment_server_handler(session, socket, ip, port, packet_id, values);

var _session   = argument[0],
    _socket    = argument[1],
    _ip        = argument[2],
    _port      = argument[3],
    _packet_id = argument[4],
    _values    = argument[5];

var _cid	= _values[0];
var _xspeed = _values[1];
var _yspeed = _values[2];

var peer = obj_server.clients[_cid, 0];

show_debug_message("Server received: [id=" + string(_cid) + ": " + string(_xspeed) + ", " + string(_yspeed) + "]");

peer.xspeed = _xspeed;
peer.yspeed = _yspeed;


// for now this sync packet will simply send the client his current official state as a reply
// right now, we pass in an id=1 to indicate the client and id=0 to indicate the server - this should be changed to be dynamic (multi-client task)
//netplay_send(_session, _socket, Packets.SYNC, _cid, peer.hp, peer.x, peer.y, peer.xspeed, peer.yspeed, peer.shooting, 0, 0);

broadcast_sync(_session, _cid);