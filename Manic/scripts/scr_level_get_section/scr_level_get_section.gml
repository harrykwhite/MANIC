var roomname = room_get_name(room);
var roomnamel = string_length(roomname);
var section = string_copy(roomname, roomnamel - 1, roomnamel);

return real(section) + 1;