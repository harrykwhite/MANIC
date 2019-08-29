image_speed = 1;

mylight.x = x;
mylight.y = y - 16;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;