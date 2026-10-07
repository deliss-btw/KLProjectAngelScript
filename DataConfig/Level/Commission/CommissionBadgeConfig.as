
enum ECommissionBadgeConfigType
{
    Fight,
    Team,
    Social,
}

enum ECommissionPlayerStateCountType
{
    BiggerThanTarget,
    SmallerThanTarget,
    RankFirst,
    RankSecond,
}


struct FCommissionBadgeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    ECommissionBadgeConfigType BadgeType;
    UPROPERTY()
    FSoftBrush IconBrush;
    UPROPERTY()
    FText BadgeName;
    UPROPERTY()
    FText BadgeDesc;
    UPROPERTY()
    FText BadgeValueDesc;
    UPROPERTY()
    ECommissionPlayerStatsType CountState;
    UPROPERTY()
    ECommissionPlayerStateCountType CountType;
    UPROPERTY()
    int Target;
    UPROPERTY()
    int Score;


}

struct FCommissionBadgeRewardResurlt
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FCommissionBadgeConfig> m_Config;
    UPROPERTY()
    bool m_bPercent;
    UPROPERTY()
    int m_Value;
    UPROPERTY()
    float32 m_Percent;

    FCommissionBadgeRewardResurlt()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCommissionBadgeRewardResurlt(const FCommissionBadgeRewardResurlt &inout Other)
    {
        this.m_bPercent = false;
        this.m_Value = 0;
        this.m_Percent = 0.0f;
        this.m_Config = Other.m_Config;
        this.m_bPercent = Other.m_bPercent;
        this.m_Value = int(Other.m_Value);
        this.m_Percent = Other.m_Percent;
        return;
    }
    FCommissionBadgeRewardResurlt opAssign(const FCommissionBadgeRewardResurlt &inout Other)
    {
        int local_2 = 0;
        FCommissionBadgeRewardResurlt __r;
        this.SetConfig(Other.GetConfig());
        this.SetbPercent(Other.GetbPercent());
        this.SetValue(local_2);
        this.SetPercent(Other.GetPercent());
        return __r;
    }
    TDataObjectPtr<FCommissionBadgeConfig> GetConfig() const property
    {
        TDataObjectPtr<FCommissionBadgeConfig> __r;
        return __r;
    }
    TDataObjectPtr<FCommissionBadgeConfig> GetModify_Config() property
    {
        TDataObjectPtr<FCommissionBadgeConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FCommissionBadgeConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Config = __Value;
        return;
    }
    bool GetbPercent() const property
    {
        return this.m_bPercent;
    }
    void SetbPercent(const bool __Value) property
    {
        if (!(this.m_bPercent) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bPercent = __Value;
        return;
    }
    int GetValue() const property
    {
        return this.m_Value;
    }
    void SetValue(const int __Value) property
    {
        if (this.m_Value == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Value = __Value;
        return;
    }
    float32 GetPercent() const property
    {
        return this.m_Percent;
    }
    void SetPercent(const float32 __Value) property
    {
        if (this.m_Percent == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Percent = __Value;
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FCommissionBadgeRewardResurlt &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FCommissionBadgeRewardResurlt &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCommissionBadgeRewardResurlt
{
int __IndexOf_Config()
{
    return 0;
}
int __IndexOf_bPercent()
{
    return 1;
}
int __IndexOf_Value()
{
    return 2;
}
int __IndexOf_Percent()
{
    return 3;
}
}
