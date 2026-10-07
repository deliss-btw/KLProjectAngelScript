
namespace FVMS_AbnormalInfo
{
    const int ModelId = 0;

}
struct FVMS_AbnormalInfo : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AbnormalIcon>> m_AbnormalModels;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AbnormalIcon>> m_AllAbnormalInfos;
    UPROPERTY()
    bool m_bAbnormalModelsDirty;

    FVMS_AbnormalInfo()
    {
        this.m_bAbnormalModelsDirty = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_AbnormalInfo(const FVMS_AbnormalInfo &inout Other)
    {
        this.m_bAbnormalModelsDirty = true;
        this.m_AbnormalModels = Other.m_AbnormalModels;
        this.m_AllAbnormalInfos = Other.m_AllAbnormalInfos;
        this.m_bAbnormalModelsDirty = Other.m_bAbnormalModelsDirty;
        return;
    }
    FVMS_AbnormalInfo opAssign(const FVMS_AbnormalInfo &inout Other)
    {
        FVMS_AbnormalInfo __r;
        this.m_AbnormalModels = Other.m_AbnormalModels;
        this.m_AllAbnormalInfos = Other.m_AllAbnormalInfos;
        this.m_bAbnormalModelsDirty = Other.m_bAbnormalModelsDirty;
        return __r;
    }
    void PostConstruct()
    {
        this.InitializeAbnormalInfos();
        this.RequestAbnormalModelsRefresh();
        return;
    }
    void RequestAbnormalModelsRefresh()
    {
        this.SetbAbnormalModelsDirty(true);
        return;
    }
    void InitializeAbnormalInfos()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RefreshAbnormalModels()
    {
        if (!(this.GetbAbnormalModelsDirty()))
        {
            return;
        }
        this.GetModify_AbnormalModels().Reset(0);
        int local_3 = 0;
        for (; local_3 < this.GetAllAbnormalInfos().Num(); ++local_3)
        {
            TEUIModelRef<FVM_AbnormalIcon> local_6 = TEUIModelRef<FVM_AbnormalIcon>(this.GetAllAbnormalInfos()[local_3]);
            if (!(local_6.IsValid()))
            {
                continue;
            }
            if (ShouldDisplayInList())
            {
                this.GetModify_AbnormalModels().Add(local_6);
            }
        }
        this.SetbAbnormalModelsDirty(false);
        return;
    }
    ESlateVisibility DebugNewAbnormalVisibility() const
    {
        return ESlateVisibility(4);
    }
    const TArray<TEUIModelRef<FVM_AbnormalIcon>> GetAbnormalModels() const property
    {
        const TArray<TEUIModelRef<FVM_AbnormalIcon>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AbnormalIcon>> GetModify_AbnormalModels() property
    {
        TArray<TEUIModelRef<FVM_AbnormalIcon>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAbnormalModels(const TArray<TEUIModelRef<FVM_AbnormalIcon>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AbnormalModels = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AbnormalIcon>> GetAllAbnormalInfos() const property
    {
        const TArray<TEUIModelRef<FVM_AbnormalIcon>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AbnormalIcon>> GetModify_AllAbnormalInfos() property
    {
        TArray<TEUIModelRef<FVM_AbnormalIcon>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAllAbnormalInfos(const TArray<TEUIModelRef<FVM_AbnormalIcon>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AllAbnormalInfos = __Value;
        return;
    }
    bool GetbAbnormalModelsDirty() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bAbnormalModelsDirty;
    }
    void SetbAbnormalModelsDirty(const bool __Value) property
    {
        if (!(this.m_bAbnormalModelsDirty) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bAbnormalModelsDirty = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_AbnormalInfo
{
    UPROPERTY()
    ESlateVisibility DebugNewAbnormalVisibility;
    UPROPERTY()
    TEUIModelRef<FVMS_AbnormalInfo> Self;


}

namespace FVMS_AbnormalInfo
{
FVMS_AbnormalInfo& Get(const UObject ContextObject)
{
    return FVMS_AbnormalInfo::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_AbnormalInfo GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_AbnormalInfo __r;
    TEUIModelRef<FVMS_AbnormalInfo> local_6 = TEUIModelRef<FVMS_AbnormalInfo>(EUIInternal::MakeModelWithManager(Manager, FVMS_AbnormalInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AbnormalModels";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AbnormalIcon>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DebugNewAbnormalVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_AbnormalInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_AbnormalInfo;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshAbnormalModels";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_AbnormalInfo;
}
TArray<TEUIModelRef<FVM_AbnormalIcon>> __UIGetter_AbnormalModels(const FVMS_AbnormalInfo &inout Model)
{
    return Model.GetAbnormalModels();
}
ESlateVisibility __UIGetter_DebugNewAbnormalVisibility(const FVMS_AbnormalInfo &inout Model)
{
    return Model.DebugNewAbnormalVisibility();
}
TEUIModelRef<FVMS_AbnormalInfo> __UIGetter_Self(const FVMS_AbnormalInfo &inout Model)
{
    return TEUIModelRef<FVMS_AbnormalInfo>(Model);
}
int __IndexOf_AbnormalModels()
{
    return 0;
}
int __IndexOf_AllAbnormalInfos()
{
    return 1;
}
int __IndexOf_bAbnormalModelsDirty()
{
    return 2;
}
}
namespace __GeneratedProperties_FVMS_AbnormalInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
