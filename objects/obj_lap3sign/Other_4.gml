ini_open(global.charsave);
var _lap3 = ini_read_string("Lap3", level, 0);

if (_lap3 == 0)
    instance_destroy();

ini_close();
