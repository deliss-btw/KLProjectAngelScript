

struct FMS_HUDInputManagerConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    FEUIActionBinding ReleaseFocusBinding;
    UPROPERTY()
    FEUIActionBinding RequireFocusBinding;

    FMS_HUDInputManagerConfigDefault()
    {
        return;
    }
}

