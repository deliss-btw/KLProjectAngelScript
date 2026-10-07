

struct FVirtualJoystickConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    float32 Radius = 100.0f;
    UPROPERTY()
    float32 DeadZone = 0.1f;
    UPROPERTY()
    bool bSnapToFinger = true;
    UPROPERTY()
    FKey XAxis;
    UPROPERTY()
    FKey YAxis;


}

