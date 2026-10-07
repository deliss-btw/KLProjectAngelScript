

struct FPlayerFullInfo
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    uint m_Uid;
    UPROPERTY()
    FString m_NickName;
    UPROPERTY()
    bool m_bHasNickName;
    UPROPERTY()
    EGenderType m_Gender;
    UPROPERTY()
    bool m_bHasGender;
    UPROPERTY()
    uint m_AvatarConfigId;
    UPROPERTY()
    bool m_bHasAvatar;
    UPROPERTY()
    uint m_CurrentWorldId;
    UPROPERTY()
    bool m_bHasCurrentWorld;
    UPROPERTY()
    uint m_DivineSkillId;
    UPROPERTY()
    bool m_bHasDivineSkill;
    UPROPERTY()
    int m_Level;
    UPROPERTY()
    bool m_bHasLevel;
    UPROPERTY()
    bool m_bIsOnline;
    UPROPERTY()
    bool m_bHasIsOnline;

    FPlayerFullInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPlayerFullInfo(const FPlayerFullInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPlayerFullInfo opAssign(const FPlayerFullInfo &inout Other)
    {
        FPlayerFullInfo __r;
        this.SetUid(Other.GetUid());
        this.SetNickName(Other.GetNickName());
        this.SetbHasNickName(Other.GetbHasNickName());
        this.SetGender(Other.GetGender());
        this.SetbHasGender(Other.GetbHasGender());
        this.SetAvatarConfigId(Other.GetAvatarConfigId());
        this.SetbHasAvatar(Other.GetbHasAvatar());
        this.SetCurrentWorldId(Other.GetCurrentWorldId());
        this.SetbHasCurrentWorld(Other.GetbHasCurrentWorld());
        this.SetDivineSkillId(Other.GetDivineSkillId());
        this.SetbHasDivineSkill(Other.GetbHasDivineSkill());
        this.SetLevel(Other.GetLevel());
        this.SetbHasLevel(Other.GetbHasLevel());
        this.SetbIsOnline(Other.GetbIsOnline());
        this.SetbHasIsOnline(Other.GetbHasIsOnline());
        return __r;
    }
    uint GetUid() const property
    {
        return this.m_Uid;
    }
    void SetUid(const uint __Value) property
    {
        if (this.m_Uid == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Uid = __Value;
        return;
    }
    FString GetNickName() const property
    {
        return this.m_NickName;
    }
    void SetNickName(const FString &inout __Value) property
    {
        if ((this.m_NickName == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_NickName = __Value;
        return;
    }
    bool GetbHasNickName() const property
    {
        return this.m_bHasNickName;
    }
    void SetbHasNickName(const bool __Value) property
    {
        if (!(this.m_bHasNickName) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bHasNickName = __Value;
        return;
    }
    EGenderType GetGender() const property
    {
        return this.m_Gender;
    }
    void SetGender(const EGenderType __Value) property
    {
        if (int(this.m_Gender) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Gender = __Value;
        return;
    }
    bool GetbHasGender() const property
    {
        return this.m_bHasGender;
    }
    void SetbHasGender(const bool __Value) property
    {
        if (!(this.m_bHasGender) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bHasGender = __Value;
        return;
    }
    uint GetAvatarConfigId() const property
    {
        return this.m_AvatarConfigId;
    }
    void SetAvatarConfigId(const uint __Value) property
    {
        if (this.m_AvatarConfigId == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_AvatarConfigId = __Value;
        return;
    }
    bool GetbHasAvatar() const property
    {
        return this.m_bHasAvatar;
    }
    void SetbHasAvatar(const bool __Value) property
    {
        if (!(this.m_bHasAvatar) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bHasAvatar = __Value;
        return;
    }
    uint GetCurrentWorldId() const property
    {
        return this.m_CurrentWorldId;
    }
    void SetCurrentWorldId(const uint __Value) property
    {
        if (this.m_CurrentWorldId == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_CurrentWorldId = __Value;
        return;
    }
    bool GetbHasCurrentWorld() const property
    {
        return this.m_bHasCurrentWorld;
    }
    void SetbHasCurrentWorld(const bool __Value) property
    {
        if (!(this.m_bHasCurrentWorld) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_bHasCurrentWorld = __Value;
        return;
    }
    uint GetDivineSkillId() const property
    {
        return this.m_DivineSkillId;
    }
    void SetDivineSkillId(const uint __Value) property
    {
        if (this.m_DivineSkillId == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_DivineSkillId = __Value;
        return;
    }
    bool GetbHasDivineSkill() const property
    {
        return this.m_bHasDivineSkill;
    }
    void SetbHasDivineSkill(const bool __Value) property
    {
        if (!(this.m_bHasDivineSkill) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_bHasDivineSkill = __Value;
        return;
    }
    int GetLevel() const property
    {
        return this.m_Level;
    }
    void SetLevel(const int __Value) property
    {
        if (this.m_Level == __Value)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_Level = __Value;
        return;
    }
    bool GetbHasLevel() const property
    {
        return this.m_bHasLevel;
    }
    void SetbHasLevel(const bool __Value) property
    {
        if (!(this.m_bHasLevel) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_bHasLevel = __Value;
        return;
    }
    bool GetbIsOnline() const property
    {
        return this.m_bIsOnline;
    }
    void SetbIsOnline(const bool __Value) property
    {
        if (!(this.m_bIsOnline) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_bIsOnline = __Value;
        return;
    }
    bool GetbHasIsOnline() const property
    {
        return this.m_bHasIsOnline;
    }
    void SetbHasIsOnline(const bool __Value) property
    {
        if (!(this.m_bHasIsOnline) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_bHasIsOnline = __Value;
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FPlayerFullInfo &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FPlayerFullInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPlayerFullInfo
{
int __IndexOf_Uid()
{
    return 0;
}
int __IndexOf_NickName()
{
    return 1;
}
int __IndexOf_bHasNickName()
{
    return 2;
}
int __IndexOf_Gender()
{
    return 3;
}
int __IndexOf_bHasGender()
{
    return 4;
}
int __IndexOf_AvatarConfigId()
{
    return 5;
}
int __IndexOf_bHasAvatar()
{
    return 6;
}
int __IndexOf_CurrentWorldId()
{
    return 7;
}
int __IndexOf_bHasCurrentWorld()
{
    return 8;
}
int __IndexOf_DivineSkillId()
{
    return 9;
}
int __IndexOf_bHasDivineSkill()
{
    return 10;
}
int __IndexOf_Level()
{
    return 11;
}
int __IndexOf_bHasLevel()
{
    return 12;
}
int __IndexOf_bIsOnline()
{
    return 13;
}
int __IndexOf_bHasIsOnline()
{
    return 14;
}
}
