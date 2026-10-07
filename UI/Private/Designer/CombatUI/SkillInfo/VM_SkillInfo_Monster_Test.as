
namespace FVMS_SkillInfo_Monster_Test
{
    const int ModelId = 0;

}
struct FVMS_SkillInfo_Monster_Test : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_SkillInfoItem_Monster_Test>> m_SkillList;
    UPROPERTY()
    FECSEntity m_LocalPlayerPawnEntity;
    UPROPERTY()
    FEUITimerHandle m_SkillInfoCDRefreshTimer;

    FVMS_SkillInfo_Monster_Test()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SkillInfo_Monster_Test(const FVMS_SkillInfo_Monster_Test &inout Other)
    {
        this.m_SkillList = Other.m_SkillList;
        this.m_LocalPlayerPawnEntity = Other.m_LocalPlayerPawnEntity;
        this.m_SkillInfoCDRefreshTimer = Other.m_SkillInfoCDRefreshTimer;
        return;
    }
    FVMS_SkillInfo_Monster_Test& opAssign(const FVMS_SkillInfo_Monster_Test &inout Other)
    {
        this.m_SkillList = Other.m_SkillList;
        this.m_LocalPlayerPawnEntity = Other.m_LocalPlayerPawnEntity;
        return Other.m_SkillInfoCDRefreshTimer;
    }
    void PostConstruct()
    {
        this.ScheduleTick(this.GetModify_SkillInfoCDRefreshTimer(), n"RefreshSkillInfoCD", 0.1f, 0.0f);
        return;
    }
    void RefreshSkillListForPawn()
    {
        const USkillConfig local_40;
        int local_57;
        int local_58;
        bool local_61;
        FECSEntity local_12 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn());
        if (!((local_12 == this.GetLocalPlayerPawnEntity())))
        {
            this.SetLocalPlayerPawnEntity(local_12);
            if (!(this.GetLocalPlayerPawnEntity().IsValid()))
            {
                return;
            }
            this.GetModify_SkillList().Empty(0);
            int local_21 = 0;
            for (; local_21 < 0.GetSkillInstanceNum(); ++local_21)
            {
                bool local_13 = false;
                const FC_SkillInstance& local_26 = FSkillUtils::GetSkillInstance(this.GetLocalPlayerPawnEntity(), local_21, local_13);
                const FSimpleInputSkillConfig& local_28 = local_26.GetSimpleInputSkillConfig();
                if (local_28.IsValid())
                {
                    TSoftObjectPtr<USkillConfig> local_38 = local_26.GetSkillConfig();
                    FVM_SkillInfoItem_Monster_Test& local_42 = ::FVM_SkillInfoItem_Monster_Test::Create(this.GetContext().Manager, local_40, local_21);
                    local_42.SetSkillName(local_28.SkillName.ToString());
                    local_42.SetInputName(local_28.GetSimpleInputTrigger().FriendlyTriggerName);
                    FFPTime local_50 = local_26.GetCDDuration();
                    if (!((local_50 == 0.0)))
                    {
                        float32 local_54 = float32((FSkillUtils::GetSkillCDRemainTime(this.GetLocalPlayerPawnEntity(), local_21).ToSeconds()));
                        local_42.SetSkillCDRemainTimeOneDecimal((FMath::RoundToFloat(local_54 * 10.0f)) / 10.0f);
                        local_42.SetSkillCDRemainTime(::FloatUtils::FormatFloatOneDecimal(local_42.GetSkillCDRemainTimeOneDecimal()));
                        local_42.SetNormalizedCDRemainTime(local_54 / local_26.GetCDDuration());
                    }
                    else
                    {
                        local_42.SetSkillCDRemainTime(FString("0.0"));
                        local_42.SetSkillCDRemainTimeOneDecimal(0.0f);
                        local_42.SetNormalizedCDRemainTime(0.0f);
                    }
                    if (local_42.GetSkillCDRemainTimeOneDecimal() > 0.0f)
                    {
                        local_58 = 0;
                        local_57 = local_58;
                    }
                    else
                    {
                        local_58 = 1;
                        local_57 = local_58;
                    }
                    local_42.SetCDCanvasVisibility(ESlateVisibility(local_57));
                    if (this.ShouldShowSkillRowByName(local_42.GetSkillName()))
                    {
                        local_58 = 0;
                        local_57 = local_58;
                    }
                    else
                    {
                        local_58 = 1;
                        local_57 = local_58;
                    }
                    local_42.SetItemRowVisibility(ESlateVisibility(local_57));
                    this.GetModify_SkillList().Add(TEUIModelRef<FVM_SkillInfoItem_Monster_Test>(local_42));
                    continue;
                }
                local_61 = false;
                TSoftObjectPtr<USkillConfig> local_38_2 = local_26.GetSkillConfig();
                for (auto& local_76 : local_40.InputConfig)
                {
                    if (local_76.bUseForSkillTransit)
                    {
                        local_61 = true;
                    }
                }
                if (local_61)
                {
                    local_13 = local_26.GetUseConditionConfig().Condition.Evaluate(this.GetLocalPlayerPawnEntity());
                    TSoftObjectPtr<USkillConfig> local_38_3 = local_26.GetSkillConfig();
                    FVM_SkillInfoItem_Monster_Test& local_42_2 = ::FVM_SkillInfoItem_Monster_Test::Create(this.GetContext().Manager, local_40, local_21);
                    FFPTime local_50_2 = local_26.GetCDDuration();
                    if (!((local_50_2 == 0.0)))
                    {
                        float32 local_53 = float32((FSkillUtils::GetSkillCDRemainTime(this.GetLocalPlayerPawnEntity(), local_21).ToSeconds()));
                        local_42_2.SetSkillCDRemainTimeOneDecimal((FMath::RoundToFloat(local_53 * 10.0f)) / 10.0f);
                        local_42_2.SetSkillCDRemainTime(::FloatUtils::FormatFloatOneDecimal(local_42_2.GetSkillCDRemainTimeOneDecimal()));
                        local_42_2.SetNormalizedCDRemainTime(local_53 / local_26.GetCDDuration());
                    }
                    else
                    {
                        local_42_2.SetSkillCDRemainTime(FString("0.0"));
                        local_42_2.SetSkillCDRemainTimeOneDecimal(0.0f);
                        local_42_2.SetNormalizedCDRemainTime(0.0f);
                    }
                    if (local_42_2.GetSkillCDRemainTimeOneDecimal() > 0.0f)
                    {
                        local_58 = 0;
                        local_57 = local_58;
                    }
                    else
                    {
                        local_58 = 1;
                        local_57 = local_58;
                    }
                    local_42_2.SetCDCanvasVisibility(ESlateVisibility(local_57));
                    if (local_13 && this.ShouldShowSkillRowByName(local_42_2.GetSkillName()))
                    {
                        local_58 = 0;
                        local_57 = local_58;
                    }
                    else
                    {
                        local_58 = 1;
                        local_57 = local_58;
                    }
                    local_42_2.SetItemRowVisibility(ESlateVisibility(local_57));
                    this.GetModify_SkillList().Add(TEUIModelRef<FVM_SkillInfoItem_Monster_Test>(local_42_2));
                }
            }
        }
        return;
    }
    bool ShouldShowSkillRowByName(const FString &inout Name) const
    {
        if (Name.IsEmpty())
        {
            return false;
        }
        return (!((Name == FString("None"))));
    }
    void RefreshSkillInfoCD()
    {
        FVM_SkillInfoItem_Monster_Test& local_6;
        bool local_7;
        int local_25;
        bool local_27;
        bool local_1 = !(this.GetLocalPlayerPawnEntity().IsValid());
        if (local_1)
        {
            return;
        }
        if (this.GetSkillList().Num() <= 0)
        {
            return;
        }
        int local_4 = 0;
        for (; local_4 < this.GetSkillList().Num(); ++local_4)
        {
            if ((local_6 == nullptr))
            {
                continue;
            }
            local_7 = false;
            const FC_SkillInstance& local_10 = FSkillUtils::GetSkillInstance(this.GetLocalPlayerPawnEntity(), local_6.GetSkillIndex(), local_7);
            bool local_1_2 = !(local_7);
            if (local_1_2)
            {
                continue;
            }
            const FSimpleInputSkillConfig& local_12 = local_10.GetSimpleInputSkillConfig();
            if (local_12.IsValid())
            {
                FFPTime local_14 = local_10.GetCDDuration();
                local_1_2 = !((local_14 == 0.0));
                if (local_1_2)
                {
                    float32 local_18 = float32((FSkillUtils::GetSkillCDRemainTime(this.GetLocalPlayerPawnEntity(), local_6.GetSkillIndex()).ToSeconds()));
                    local_6.SetSkillCDRemainTimeOneDecimal((FMath::RoundToFloat(local_18 * 10.0f)) / 10.0f);
                    local_6.SetSkillCDRemainTime(::FloatUtils::FormatFloatOneDecimal(local_6.GetSkillCDRemainTimeOneDecimal()));
                    local_6.SetNormalizedCDRemainTime(local_18 / local_10.GetCDDuration());
                }
                else
                {
                    local_6.SetSkillCDRemainTime(FString("0.0"));
                    local_6.SetSkillCDRemainTimeOneDecimal(0.0f);
                    local_6.SetNormalizedCDRemainTime(0.0f);
                }
                if (local_6.GetSkillCDRemainTimeOneDecimal() > 0.0f)
                {
                    int local_26 = 0;
                    local_25 = local_26;
                }
                else
                {
                    int local_26_2 = 1;
                    local_25 = local_26_2;
                }
                local_6.SetCDCanvasVisibility(ESlateVisibility(local_25));
                local_6.SetSkillName(local_12.SkillName.ToString());
                if (this.ShouldShowSkillRowByName(local_6.GetSkillName()))
                {
                    int local_26_3 = 0;
                    local_25 = local_26_3;
                }
                else
                {
                    int local_26_4 = 1;
                    local_25 = local_26_4;
                }
                local_6.SetItemRowVisibility(ESlateVisibility(local_25));
                continue;
            }
            local_27 = false;
            for (auto& local_44 : local_6.GetSkillConfig().InputConfig)
            {
                local_1_2 = local_44.bUseForSkillTransit;
                if (local_1_2)
                {
                    local_27 = true;
                }
            }
            local_1_2 = !(local_27);
            if (local_1_2)
            {
                continue;
            }
            local_1_2 = local_10.GetUseConditionConfig().Condition.Evaluate(this.GetLocalPlayerPawnEntity());
            if (local_1_2)
            {
                FFPTime local_14_2 = local_10.GetCDDuration();
                if ((!((local_14_2 == 0.0))))
                {
                    float32 local_19 = float32((FSkillUtils::GetSkillCDRemainTime(this.GetLocalPlayerPawnEntity(), local_6.GetSkillIndex()).ToSeconds()));
                    local_6.SetSkillCDRemainTimeOneDecimal((FMath::RoundToFloat(local_19 * 10.0f)) / 10.0f);
                    local_6.SetSkillCDRemainTime(::FloatUtils::FormatFloatOneDecimal(local_6.GetSkillCDRemainTimeOneDecimal()));
                    local_6.SetNormalizedCDRemainTime(local_19 / local_10.GetCDDuration());
                }
                else
                {
                    local_6.SetSkillCDRemainTime(FString("0.0"));
                    local_6.SetSkillCDRemainTimeOneDecimal(0.0f);
                    local_6.SetNormalizedCDRemainTime(0.0f);
                }
                if (local_6.GetSkillCDRemainTimeOneDecimal() > 0.0f)
                {
                    int local_26_5 = 0;
                    local_25 = local_26_5;
                }
                else
                {
                    int local_26_6 = 1;
                    local_25 = local_26_6;
                }
                local_6.SetCDCanvasVisibility(ESlateVisibility(local_25));
                if (this.ShouldShowSkillRowByName(local_6.GetSkillName()))
                {
                    int local_26_7 = 0;
                    local_25 = local_26_7;
                }
                else
                {
                    int local_26_8 = 1;
                    local_25 = local_26_8;
                }
                local_6.SetItemRowVisibility(ESlateVisibility(local_25));
                continue;
            }
            local_6.SetItemRowVisibility(ESlateVisibility(1));
        }
        return;
    }
    const TArray<TEUIModelRef<FVM_SkillInfoItem_Monster_Test>> GetSkillList() const property
    {
        const TArray<TEUIModelRef<FVM_SkillInfoItem_Monster_Test>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_SkillInfoItem_Monster_Test>> GetModify_SkillList() property
    {
        TArray<TEUIModelRef<FVM_SkillInfoItem_Monster_Test>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSkillList(const TArray<TEUIModelRef<FVM_SkillInfoItem_Monster_Test>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SkillList = __Value;
        return;
    }
    const FECSEntity GetLocalPlayerPawnEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FECSEntity GetModify_LocalPlayerPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetLocalPlayerPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_LocalPlayerPawnEntity = __Value;
        return;
    }
    const FEUITimerHandle GetSkillInfoCDRefreshTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUITimerHandle GetModify_SkillInfoCDRefreshTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetSkillInfoCDRefreshTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SkillInfoCDRefreshTimer = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_SkillInfo_Monster_Test
{
    UPROPERTY()
    TEUIModelRef<FVMS_SkillInfo_Monster_Test> Self;

    __GeneratedProperties_FVMS_SkillInfo_Monster_Test()
    {
        return;
    }
}

namespace FVMS_SkillInfo_Monster_Test
{
FVMS_SkillInfo_Monster_Test& Get(const UObject ContextObject)
{
    return FVMS_SkillInfo_Monster_Test::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SkillInfo_Monster_Test GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SkillInfo_Monster_Test __r;
    TEUIModelRef<FVMS_SkillInfo_Monster_Test> local_6 = TEUIModelRef<FVMS_SkillInfo_Monster_Test>(EUIInternal::MakeModelWithManager(Manager, FVMS_SkillInfo_Monster_Test::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SkillList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_SkillInfoItem_Monster_Test>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_SkillInfo_Monster_Test>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SkillInfo_Monster_Test;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshSkillListForPawn";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SkillInfo_Monster_Test;
}
TArray<TEUIModelRef<FVM_SkillInfoItem_Monster_Test>> __UIGetter_SkillList(const FVMS_SkillInfo_Monster_Test &inout Model)
{
    return Model.GetSkillList();
}
TEUIModelRef<FVMS_SkillInfo_Monster_Test> __UIGetter_Self(const FVMS_SkillInfo_Monster_Test &inout Model)
{
    return TEUIModelRef<FVMS_SkillInfo_Monster_Test>(Model);
}
int __IndexOf_SkillList()
{
    return 0;
}
int __IndexOf_LocalPlayerPawnEntity()
{
    return 1;
}
int __IndexOf_SkillInfoCDRefreshTimer()
{
    return 2;
}
}
namespace __GeneratedProperties_FVMS_SkillInfo_Monster_Test
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
