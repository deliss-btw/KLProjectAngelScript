
enum EAvatarAnimVariantType
{
    None,
    Default,
    Sword,
    Claymore,
    Bow,
    Catalyst,
}

enum EShadowAnimVariantType
{
    None,
    Claymore,
    Default,
    Hammer,
    Shield,
}

enum EGolemAnimVariantType
{
    None,
    GolemStriker,
    GolemSmasher,
    GolemSlinger,
}

enum ECanidaeAnimVariantType
{
    None,
    Default,
    Small,
}


class UAvatarAnimVariantTypeMapper : UAnimVariantTypeMapper
{
    default ScriptEnumType = UEnum::GetEnumType(n"EAvatarAnimVariantType");

    UAvatarAnimVariantTypeMapper()
    {
        return;
    }
    UFUNCTION()
    int GetAnimVariantParent_Implementation(const int Child) const
    {
        return 1;
    }
}

class UShadowAnimVariantTypeMapper : UAnimVariantTypeMapper
{
    default ScriptEnumType = UEnum::GetEnumType(n"EShadowAnimVariantType");

    UShadowAnimVariantTypeMapper()
    {
        return;
    }
    UFUNCTION()
    int GetAnimVariantParent_Implementation(const int Child) const
    {
        return 1;
    }
}

class UGolemAnimVariantTypeMapper : UAnimVariantTypeMapper
{
    default ScriptEnumType = UEnum::GetEnumType(n"EGolemAnimVariantType");

    UGolemAnimVariantTypeMapper()
    {
        return;
    }
    UFUNCTION()
    int GetAnimVariantParent_Implementation(const int Child) const
    {
        return 2;
    }
}

class UCanidaeAnimVariantTypeMapper : UAnimVariantTypeMapper
{
    default ScriptEnumType = UEnum::GetEnumType(n"ECanidaeAnimVariantType");

    UCanidaeAnimVariantTypeMapper()
    {
        return;
    }
    UFUNCTION()
    int GetAnimVariantParent_Implementation(const int Child) const
    {
        return 1;
    }
}

namespace AvatarAnimVariant
{
UFUNCTION()
EAvatarAnimVariantType GetVariantType(const EWeaponType WeaponType)
{
    int local_3 = 0;
    switch (int(WeaponType))
    {
    case 0:
    {
        return EAvatarAnimVariantType(1);
    }
    case 1:
    {
        return EAvatarAnimVariantType(2);
    }
    case 2:
    {
        return EAvatarAnimVariantType(3);
    }
    case 3:
    {
        return EAvatarAnimVariantType(4);
    }
    case 4:
    {
        return EAvatarAnimVariantType(5);
    }
    default:
    {
        FString local_16 = UEnum::GetEnumType(n"EWeaponType").GetNameStringByValue(int(WeaponType));
        XError(ELog(0), FString().Append("Invalid Character Anim Variant Type ").Append(local_16));
        DebugBreak();
        local_3 = 1;
    }
    }
    return EAvatarAnimVariantType(local_3);
}
}
