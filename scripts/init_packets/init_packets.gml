netplay_add_packet(session, Packets.Echo, buffer_string);
netplay_add_packet(session, Packets.Increment, buffer_u16);
netplay_add_packet(session, Packets.Position, buffer_u16, buffer_u16);
netplay_add_packet(session, Packets.OP_MOVE, buffer_u8, buffer_s16, buffer_s16);
netplay_add_packet(session, Packets.SYNC, buffer_u16, buffer_u8, buffer_u16, buffer_u16, buffer_s16, buffer_s16, buffer_u16, buffer_bool, buffer_u16, buffer_u16);
netplay_add_packet(session, Packets.JOIN, buffer_string);
netplay_add_packet(session, Packets.ACCEPT, buffer_u16, buffer_bool);
netplay_add_packet(session, Packets.OP_SHOOT, buffer_u8, buffer_u16, buffer_bool, buffer_u16, buffer_u16);
netplay_add_packet(session, Packets.MATCH, buffer_u8, buffer_string, buffer_bool, buffer_u8, buffer_u8, buffer_u8, buffer_bool);