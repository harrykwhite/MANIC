mylight.x = x;
mylight.y = y + 6;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y + 6;
mylight.light[| eLight.LutIntensity] = 1.15;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;