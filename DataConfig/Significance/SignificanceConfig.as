
enum EECSSignificanceType
{
    Default,
    NATIVE_MAX = 0,
    Avatar,
    NamedNPC,
    CommonNPC,
    Boss,
    EliteMonster,
    NormalMonster,
    Mount,
    Projectile,
    StaticObject,
    DynamicObject,
    CommonInteractive,
    SpecialInteractive,
    Pickup,
}


struct FSignificanceControlledOffset
{
    UPROPERTY()
    int Avatar = 0;
    UPROPERTY()
    int NamedNPC = 0;
    UPROPERTY()
    int CommonNPC = 0;
    UPROPERTY()
    int Boss = 0;
    UPROPERTY()
    int EliteMonster = 0;
    UPROPERTY()
    int NormalMonster = 0;
    UPROPERTY()
    int Mount = 0;
    UPROPERTY()
    int Projectile = 0;


}

class USignificanceSettings : UDeveloperSettings
{
    UPROPERTY()
    FSignificanceControlledOffset Default;
    UPROPERTY()
    FSignificanceControlledOffset LocalPlayerControlled;
    UPROPERTY()
    FSignificanceControlledOffset TeammateControlled;
    UPROPERTY()
    FSignificanceControlledOffset EnemyControlled;
    UPROPERTY()
    FSignificanceControlledOffset NonControlled;

    USignificanceSettings()
    {
        return;
    }
}

struct FSignificanceConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    EECSSignificanceValue Default = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue Avatar = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue NamedNPC = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue CommonNPC = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue Boss = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue EliteMonster = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue NormalMonster = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue Mount = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue Projectile = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue StaticObject = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue DynamicObject = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue CommonInteractive = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue SpecialInteractive = EECSSignificanceValue(3);
    UPROPERTY()
    EECSSignificanceValue Pickup = EECSSignificanceValue(3);


}

