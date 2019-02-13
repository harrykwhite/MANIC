mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y - 10;
mylight.light[| eLight.LutIntensity] = 1.55;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;