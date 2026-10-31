namespace Significance
{
enum ESignificancePlayerType
{
    Self,
    Teammate,
    OtherPlayer,
}

FECSEntity GetOwnerPawnEntity(const FECSEntity &inout Entity)
{
    FECSEntity local_4 = Entity;
    for (; local_4; )
    {
        Has local_18;
        bool local_5 = local_18.opCall();
        if (local_5)
        {
            return local_4;
        }
        Has local_22;
        local_5 = local_22.opCall();
        if (local_5)
        {
            return local_4;
        }
        GetDefaulted local_10;
        local_4 = local_10.opCall().GetOwnerEntity();
    }
    return ENTITY_NULL;
}
Significance::ESignificancePlayerType GetPlayerType(const FECSEntity &inout Player)
{
    Significance::ESignificancePlayerType __return;
    FECSEntity local_4 = FASCommonUtils::GetLocalPlayerProxy();
    if ((__return == local_4))
    {
        return Significance::ESignificancePlayerType(0);
    }
    FECSEntity local_8 = FTeamUtils::GetTeamEntityForController(local_4);
    GetDefaulted local_18;
    if (local_8 && (FECSEntity(local_18.opCall().GetTeamEntity()) == local_8))
    {
        return Significance::ESignificancePlayerType(1);
    }
    return Significance::ESignificancePlayerType(2);
}
int GetSignificanceOffset(const FSignificanceControlledOffset &inout Offset, const EECSSignificanceType SignificanceType)
{
    switch (int(SignificanceType))
    {
    case 1:
    {
        return int(Offset.Avatar);
    }
    case 2:
    {
        return int(Offset.NamedNPC);
    }
    case 3:
    {
        return int(Offset.CommonNPC);
    }
    case 4:
    {
        return int(Offset.Boss);
    }
    case 5:
    {
        return int(Offset.EliteMonster);
    }
    case 6:
    {
        return int(Offset.NormalMonster);
    }
    case 7:
    {
        return int(Offset.Mount);
    }
    case 8:
    {
        return int(Offset.Projectile);
    }
    }
    return 0;
}
int GetSignificanceOffset(const FECSEntity &inout Entity, const EECSSignificanceType SignificanceType)
{
    USignificanceSettings local_2 = USignificanceSettings.GetDefaultObject();
    FECSEntity local_8 = Significance::GetOwnerPawnEntity(Entity);
    if (local_8)
    {
        Get local_18;
        const FC_ControlledByPlayer& local_20 = local_18.opCall();
        if (local_20)
        {
            int local_23 = int(Significance::GetPlayerType(local_20.GetPlayerEntity()));
            if (local_23 <= 1)
            {
                if (local_23 != 0)
                {
                    if (local_23 != 1)
                    {
                    }
                }
                else
                {
                    return Significance::GetSignificanceOffset(local_2.LocalPlayerControlled, EECSSignificanceType(SignificanceType));
                }
            }
        }
        if ((int(FASCommonUtils::GetEntityFactionRelation(FASCommonUtils::GetLocalPlayerPawnEntity(), local_8))) == 2)
        {
            return Significance::GetSignificanceOffset(local_2.EnemyControlled, EECSSignificanceType(SignificanceType));
        }
        return Significance::GetSignificanceOffset(local_2.Default, EECSSignificanceType(SignificanceType));
    }
    return (Significance::GetSignificanceOffset(local_2.NonControlled, EECSSignificanceType(SignificanceType)));
}
EECSSignificanceType GetSignificanceType(const FECSEntity &inout Entity)
{
    Has local_4;
    if (local_4.opCall())
    {
        return EECSSignificanceType(7);
    }
    Has local_10;
    if (local_10.opCall())
    {
        return EECSSignificanceType(8);
    }
    if (FASCommonUtils::IsNPC(Entity))
    {
        return EECSSignificanceType(3);
    }
    if (FASCommonUtils::IsMonsterPrefab(Entity))
    {
        int local_13 = int(FASCommonUtils::GetMonsterRank(Entity));
        if (local_13 <= 2)
        {
            if (local_13 != 1)
            {
                if (local_13 != 2)
                {
                }
                else
                {
                    return EECSSignificanceType(4);
                }
            }
            else
            {
                return EECSSignificanceType(5);
            }
        }
        return EECSSignificanceType(6);
    }
    if (FASCommonUtils::IsAvatarPrefab(Entity))
    {
        return EECSSignificanceType(1);
    }
    Has local_18;
    if (local_18.opCall())
    {
        return EECSSignificanceType(13);
    }
    Get local_22;
    if (local_22.opCall())
    {
        return EECSSignificanceType(11);
    }
    Has local_28;
    if (local_28.opCall())
    {
        return EECSSignificanceType(10);
    }
    if (FASCommonUtils::IsPropPrefab(Entity))
    {
        return EECSSignificanceType(10);
    }
    return EECSSignificanceType(0);
}
EECSSignificanceValue GetSignificanceDefaultValue(const FSignificanceConfig &inout Config, const EECSSignificanceType Type)
{
    int local_3 = 0;
    switch (int(Type))
    {
    case 0:
    {
        return Config.Default;
    }
    case 2:
    {
        return Config.NamedNPC;
    }
    case 3:
    {
        return Config.CommonNPC;
    }
    case 1:
    {
        return Config.Avatar;
    }
    case 4:
    {
        return Config.Boss;
    }
    case 5:
    {
        return Config.EliteMonster;
    }
    case 6:
    {
        return Config.NormalMonster;
    }
    case 7:
    {
        return Config.Mount;
    }
    case 8:
    {
        return Config.Projectile;
    }
    case 9:
    {
        return Config.StaticObject;
    }
    case 10:
    {
        return Config.DynamicObject;
    }
    case 11:
    {
        return Config.CommonInteractive;
    }
    case 12:
    {
        return Config.SpecialInteractive;
    }
    case 13:
    {
        local_3 = int(Config.Pickup);
        return EECSSignificanceValue(local_3);
    }
    }
    return EECSSignificanceValue(local_3);
}
EECSSignificanceValue GetSignificanceValue(const FSignificanceConfig &inout Config, const EECSSignificanceType Type, const int Offset)
{
    return FMath::Clamp((int((Significance::GetSignificanceDefaultValue(Config, EECSSignificanceType(Type)))) + Offset), 1, 5);
}
}
