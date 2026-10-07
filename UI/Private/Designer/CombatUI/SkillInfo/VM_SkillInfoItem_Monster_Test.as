
namespace FVM_SkillInfoItem_Monster_Test
{
    const int ModelId = 0;

}
struct FVM_SkillInfoItem_Monster_Test : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    const USkillConfig m_SkillConfig;
    UPROPERTY()
    int m_SkillIndex;
    UPROPERTY()
    FSimpleInputSkillConfig m_SimpleSkillConfig;
    UPROPERTY()
    FString m_SkillName;
    UPROPERTY()
    FString m_InputName;
    UPROPERTY()
    FString m_SkillCDRemainTime;
    UPROPERTY()
    float32 m_SkillCDRemainTimeOneDecimal;
    UPROPERTY()
    float32 m_NormalizedCDRemainTime;
    UPROPERTY()
    ESlateVisibility m_CDCanvasVisibility;
    UPROPERTY()
    ESlateVisibility m_ItemRowVisibility;

    FVM_SkillInfoItem_Monster_Test()
    {
        this.m_SkillConfig = nullptr;
        this.m_SkillIndex = 0;
        this.m_SkillCDRemainTimeOneDecimal = 0.0f;
        this.m_NormalizedCDRemainTime = 0.0f;
        this.m_CDCanvasVisibility = ESlateVisibility(0);
        this.m_ItemRowVisibility = ESlateVisibility(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SkillInfoItem_Monster_Test' by default constructor.");
        return;
    }
    FVM_SkillInfoItem_Monster_Test(const FVM_SkillInfoItem_Monster_Test &inout Other)
    {
        this.m_SkillConfig = nullptr;
        this.m_SkillIndex = 0;
        this.m_SkillCDRemainTimeOneDecimal = 0.0f;
        this.m_NormalizedCDRemainTime = 0.0f;
        this.m_CDCanvasVisibility = ESlateVisibility(0);
        this.m_ItemRowVisibility = ESlateVisibility(0);
        this.m_SkillConfig = Other.m_SkillConfig;
        this.m_SkillIndex = int(Other.m_SkillIndex);
        this.m_SimpleSkillConfig = Other.m_SimpleSkillConfig;
        this.m_SkillName = Other.m_SkillName;
        this.m_InputName = Other.m_InputName;
        this.m_SkillCDRemainTime = Other.m_SkillCDRemainTime;
        this.m_SkillCDRemainTimeOneDecimal = Other.m_SkillCDRemainTimeOneDecimal;
        this.m_NormalizedCDRemainTime = Other.m_NormalizedCDRemainTime;
        this.m_CDCanvasVisibility = Other.m_CDCanvasVisibility;
        this.m_ItemRowVisibility = Other.m_ItemRowVisibility;
        return;
    }
    FVM_SkillInfoItem_Monster_Test(const USkillConfig InSkillConfig, const int InSkillIndex)
    {
        this.m_SkillConfig = nullptr;
        this.m_SkillIndex = 0;
        this.m_SkillCDRemainTimeOneDecimal = 0.0f;
        this.m_NormalizedCDRemainTime = 0.0f;
        this.m_CDCanvasVisibility = ESlateVisibility(0);
        this.m_ItemRowVisibility = ESlateVisibility(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSkillConfig(InSkillConfig);
        this.SetSkillIndex(InSkillIndex);
        return;
    }
    FVM_SkillInfoItem_Monster_Test opAssign(const FVM_SkillInfoItem_Monster_Test &inout Other)
    {
        FVM_SkillInfoItem_Monster_Test __r;
        this.m_SkillConfig = Other.m_SkillConfig;
        this.m_SkillIndex = int(Other.m_SkillIndex);
        this.m_SimpleSkillConfig = Other.m_SimpleSkillConfig;
        this.m_SkillName = Other.m_SkillName;
        this.m_InputName = Other.m_InputName;
        this.m_SkillCDRemainTime = Other.m_SkillCDRemainTime;
        this.m_SkillCDRemainTimeOneDecimal = Other.m_SkillCDRemainTimeOneDecimal;
        this.m_NormalizedCDRemainTime = Other.m_NormalizedCDRemainTime;
        this.m_CDCanvasVisibility = Other.m_CDCanvasVisibility;
        this.m_ItemRowVisibility = Other.m_ItemRowVisibility;
        return __r;
    }
    int GetCDRemainTimer() const
    {
        return FMath::Max(0, FMath::RoundToInt(this.GetSkillCDRemainTimeOneDecimal()));
    }
    ESlateVisibility GetCDVisibility() const
    {
        int local_8;
        if ((this.GetSkillCDRemainTimeOneDecimal()) > 0.0f && (int(this.GetCDCanvasVisibility()) == 0))
        {
            local_8 = ESlateVisibility(0);
        }
        else
        {
            local_8 = ESlateVisibility(1);
        }
        return ESlateVisibility(local_8);
    }
    void PostConstruct()
    {
        if (this.GetSkillConfig() == nullptr)
        {
            return;
        }
        this.SetSkillName(this.GetSkillConfig().GetSkillName().ToString());
        for (auto& local_24 : this.GetSkillConfig().InputConfig)
        {
            if (local_24.bUseForSkillTransit)
            {
                this.SetInputName(FName(local_24.Name).ToString());
            }
        }
        return;
    }
    USkillConfig GetSkillConfig() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SkillConfig;
    }
    void SetSkillConfig(const USkillConfig __Value) property
    {
        if (this.m_SkillConfig == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    int GetSkillIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SkillIndex;
    }
    void SetSkillIndex(const int __Value) property
    {
        if (this.m_SkillIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SkillIndex = __Value;
        return;
    }
    const FSimpleInputSkillConfig GetSimpleSkillConfig() const property
    {
        const FSimpleInputSkillConfig __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSimpleInputSkillConfig GetModify_SimpleSkillConfig() property
    {
        FSimpleInputSkillConfig __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetSimpleSkillConfig(const FSimpleInputSkillConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SimpleSkillConfig = __Value;
        return;
    }
    FString GetSkillName() const property
    {
        FString __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FString GetModify_SkillName() property
    {
        FString __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSkillName(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SkillName = __Value;
        return;
    }
    const FString GetInputName() const property
    {
        const FString __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FString GetModify_InputName() property
    {
        FString __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetInputName(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_InputName = __Value;
        return;
    }
    const FString GetSkillCDRemainTime() const property
    {
        const FString __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FString GetModify_SkillCDRemainTime() property
    {
        FString __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetSkillCDRemainTime(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SkillCDRemainTime = __Value;
        return;
    }
    const float32 GetSkillCDRemainTimeOneDecimal() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_SkillCDRemainTimeOneDecimal() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetSkillCDRemainTimeOneDecimal(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SkillCDRemainTimeOneDecimal = __Value;
        return;
    }
    const float32 GetNormalizedCDRemainTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_NormalizedCDRemainTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetNormalizedCDRemainTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_NormalizedCDRemainTime = __Value;
        return;
    }
    ESlateVisibility GetCDCanvasVisibility() const property
    {
        this.TrackPropertyRead(8);
        return this.m_CDCanvasVisibility;
    }
    void SetCDCanvasVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_CDCanvasVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CDCanvasVisibility = __Value;
        return;
    }
    ESlateVisibility GetItemRowVisibility() const property
    {
        this.TrackPropertyRead(9);
        return this.m_ItemRowVisibility;
    }
    void SetItemRowVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_ItemRowVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ItemRowVisibility = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SkillInfoItem_Monster_Test
{
    UPROPERTY()
    int CDRemainTimer;
    UPROPERTY()
    ESlateVisibility CDVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_SkillInfoItem_Monster_Test> Self;


}

namespace FVM_SkillInfoItem_Monster_Test
{
FVM_SkillInfoItem_Monster_Test& Create(const UObject ContextObject, const USkillConfig SkillConfig, const int SkillIndex)
{
    return FVM_SkillInfoItem_Monster_Test::CreateByManager(EUIInternal::GetContextManager(ContextObject), SkillConfig, SkillIndex);
}
FVM_SkillInfoItem_Monster_Test CreateByManager(const UEUIManagerSubsystem Manager, const USkillConfig SkillConfig, const int SkillIndex)
{
    FVM_SkillInfoItem_Monster_Test __r;
    TEUIModelRef<FVM_SkillInfoItem_Monster_Test> local_6 = TEUIModelRef<FVM_SkillInfoItem_Monster_Test>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SkillInfoItem_Monster_Test::ModelId, 0, SkillConfig, SkillIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SkillName";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "InputName";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillCDRemainTime";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillCDRemainTimeOneDecimal";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NormalizedCDRemainTime";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CDCanvasVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemRowVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CDRemainTimer";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CDVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SkillInfoItem_Monster_Test>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SkillInfoItem_Monster_Test;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SkillInfoItem_Monster_Test;
}
FString __UIGetter_SkillName(const FVM_SkillInfoItem_Monster_Test &inout Model)
{
    return Model.GetSkillName();
}
FString __UIGetter_InputName(const FVM_SkillInfoItem_Monster_Test &inout Model)
{
    return Model.GetInputName();
}
FString __UIGetter_SkillCDRemainTime(const FVM_SkillInfoItem_Monster_Test &inout Model)
{
    return Model.GetSkillCDRemainTime();
}
float32 __UIGetter_SkillCDRemainTimeOneDecimal(const FVM_SkillInfoItem_Monster_Test &inout Model)
{
    return Model.GetSkillCDRemainTimeOneDecimal();
}
float32 __UIGetter_NormalizedCDRemainTime(const FVM_SkillInfoItem_Monster_Test &inout Model)
{
    return Model.GetNormalizedCDRemainTime();
}
ESlateVisibility __UIGetter_CDCanvasVisibility(const FVM_SkillInfoItem_Monster_Test &inout Model)
{
    return Model.GetCDCanvasVisibility();
}
ESlateVisibility __UIGetter_ItemRowVisibility(const FVM_SkillInfoItem_Monster_Test &inout Model)
{
    return Model.GetItemRowVisibility();
}
int __UIGetter_CDRemainTimer(const FVM_SkillInfoItem_Monster_Test &inout Model)
{
    return Model.GetCDRemainTimer();
}
ESlateVisibility __UIGetter_CDVisibility(const FVM_SkillInfoItem_Monster_Test &inout Model)
{
    return Model.GetCDVisibility();
}
TEUIModelRef<FVM_SkillInfoItem_Monster_Test> __UIGetter_Self(const FVM_SkillInfoItem_Monster_Test &inout Model)
{
    return TEUIModelRef<FVM_SkillInfoItem_Monster_Test>(Model);
}
int __IndexOf_SkillConfig()
{
    return 0;
}
int __IndexOf_SkillIndex()
{
    return 1;
}
int __IndexOf_SimpleSkillConfig()
{
    return 2;
}
int __IndexOf_SkillName()
{
    return 3;
}
int __IndexOf_InputName()
{
    return 4;
}
int __IndexOf_SkillCDRemainTime()
{
    return 5;
}
int __IndexOf_SkillCDRemainTimeOneDecimal()
{
    return 6;
}
int __IndexOf_NormalizedCDRemainTime()
{
    return 7;
}
int __IndexOf_CDCanvasVisibility()
{
    return 8;
}
int __IndexOf_ItemRowVisibility()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_SkillInfoItem_Monster_Test
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
