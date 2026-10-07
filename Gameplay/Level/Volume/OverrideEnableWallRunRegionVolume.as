

class AOverrideEnableWallRunRegionVolume : AECSRegionVolume
{
    default bAffectMovment = true;
    default bOverrideWallRun = true;
    default bEnableWallRun = true;

    AOverrideEnableWallRunRegionVolume()
    {
        super();
        return;
    }
}

