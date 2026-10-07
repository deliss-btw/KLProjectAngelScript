
const FConsoleVariable CVar_Buff_DebugBuffDataList = FConsoleVariable();
namespace FVM_BuffInfo
{
    const int ModelId = 0;

}
struct FVM_BuffInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    TArray<FEUIDynamicWidgetData> m_BuffModels;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_NormalBuffWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_RoundBuffWidgetClass;

    FVM_BuffInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BuffInfo' by default constructor.");
        return;
    }
    FVM_BuffInfo(const FVM_BuffInfo &inout Other)
    {
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_BuffModels = Other.m_BuffModels;
        this.m_NormalBuffWidgetClass = Other.m_NormalBuffWidgetClass;
        this.m_RoundBuffWidgetClass = Other.m_RoundBuffWidgetClass;
        return;
    }
    FVM_BuffInfo(const FECSEntity &inout InTargetEntity)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTargetEntity(InTargetEntity);
        return;
    }
    FVM_BuffInfo& opAssign(const FVM_BuffInfo &inout Other)
    {
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_BuffModels = Other.m_BuffModels;
        this.m_NormalBuffWidgetClass = Other.m_NormalBuffWidgetClass;
        return Other.m_RoundBuffWidgetClass;
    }
    void LoadConfigDefault(const FVM_BuffInfoConfigDefault &inout InConfig)
    {
        this.SetRoundBuffWidgetClass(InConfig.RoundBuffWidgetClass);
        this.SetNormalBuffWidgetClass(InConfig.NormalBuffWidgetClass);
        return;
    }
    void PostConstruct()
    {
        if (this.GetTargetEntity().IsValid())
        {
            Get local_6;
            this.OnBuffChanged(local_6.opCall());
        }
        return;
    }
    void OnTargetEntityChanged()
    {
        int local_4 = 0;
        if (this.GetTargetEntity().IsValid())
        {
            this.OnBuffChanged(local_4);
        }
        return;
    }
    void OnBuffChanged(const FC_Buff &inout Buff)
    {
        bool local_149;
        FEUIModelContainer::MakeCached local_240;
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(local_4.IsValid()))
        {
            return;
        }
        bool local_9 = (FECSEntity(this.GetTargetEntity()) == local_4);
        bool local_11 = local_9;
        bool local_10 = !(local_9);
        if (local_10)
        {
            FECSEntity local_8 = ::FTeamUtils::GetPlayerOrAvatarTeamEntity(local_4);
            FECSEntity local_16 = ::FTeamUtils::GetPlayerOrAvatarTeamEntity(this.GetTargetEntity());
            local_10 = local_8.IsValid() && local_16.IsValid() && (local_8 == local_16);
            local_11 = local_10;
        }
        TArray<FBuffEntityData> local_26;
        TArray<FBuffEntityData> local_30;
        if (Buff)
        {
            if (CVar_Buff_DebugBuffDataList.GetBool())
            {
                XWarning(ELog(16), FString().Append("Buff.BuffData Debug Entity ").Append(this.GetTargetEntity().GetIdValue()));
            }
            for (auto local_50 : Buff.GetBuffData())
            {
                TDataObjectPtr<FBuffConfig> local_74 = TDataObjectPtr<FBuffConfig>(local_50.ConfigRef);
                if (!(local_50.ConfigRef.IsValid()))
                {
                    local_10 = false;
                }
                else
                {
                    local_10 = local_74.opArrow().bHasPresentationConfig;
                }
                if (local_10)
                {
                    if (CVar_Buff_DebugBuffDataList.GetBool())
                    {
                        XWarning(ELog(16), FString().Append("Buff.BuffData Debug : ").Append(local_50.ConfigRef.GetBuffName()));
                    }
                    TDataObjectPtr<FBuffPresentationConfig> local_124 = TDataObjectPtr<FBuffPresentationConfig>(local_74.opArrow().PresentationConfig);
                    if (local_124)
                    {
                        local_149 = false;
                        if (local_9)
                        {
                            local_149 = local_74.opArrow().bSelfShow;
                        }
                        if ((!(local_9)) && local_11)
                        {
                            local_149 = local_74.opArrow().bTeamShow;
                        }
                        if (!(local_9) && !(local_11))
                        {
                            local_149 = local_74.opArrow().bEnemyShow;
                        }
                        if (local_149)
                        {
                            if (local_124.opArrow().bNeedIcon)
                            {
                                if (int(local_74.opArrow().ClientPresentationType) == 2)
                                {
                                    local_26.Add(local_50);
                                    continue;
                                }
                                local_30.Add(local_50);
                            }
                        }
                    }
                }
            }
        }
        if (local_26.Num() > 0)
        {
            local_30.Add(local_26[0]);
        }
        this.GetModify_BuffModels().Empty(0);
        for (auto local_50 : local_30)
        {
            FBuffModelData local_202;
            local_202.BuffEntityData = local_50;
            local_202.TargetEntity = this.GetTargetEntity();
            if (int(TDataObjectPtr<FBuffConfig>(local_50.ConfigRef).opArrow().ClientPresentationType) == 2)
            {
                local_202.SubBuffEntityData = local_26;
            }
            FEUIDynamicWidgetData local_226;
            local_226.ModelContainer = local_240.opImplConv();
            if (int(TDataObjectPtr<FBuffConfig>(local_50.ConfigRef).opArrow().ClientPresentationType) == 2 || (int(TDataObjectPtr<FBuffConfig>(local_50.ConfigRef).opArrow().ClientPresentationType) == 1))
            {
                local_226.WidgetClass = this.GetRoundBuffWidgetClass();
            }
            else
            {
                local_226.WidgetClass = this.GetNormalBuffWidgetClass();
            }
            this.GetModify_BuffModels().Add(local_226);
        }
        local_149 = false;
        if (local_11)
        {
            bool local_265;
            local_265 = false;
            for (auto local_50 : local_30)
            {
                if (local_50.ConfigRef.IsValid() && (int(TDataObjectPtr<FBuffConfig>(local_50.ConfigRef).opArrow().ClientPresentationType) == 1))
                {
                    local_265 = true;
                    break;
                }
            }
            local_149 = !(local_265);
        }
        if (local_149)
        {
            FBuffModelData local_202;
            FEUIDynamicWidgetData local_226;
            local_226.ModelContainer = local_240.opImplConv();
            local_226.WidgetClass = this.GetRoundBuffWidgetClass();
            this.GetModify_BuffModels().Insert(local_226, 0);
        }
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TargetEntity = __Value;
        return;
    }
    const TArray<FEUIDynamicWidgetData> GetBuffModels() const property
    {
        const TArray<FEUIDynamicWidgetData> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIDynamicWidgetData> GetModify_BuffModels() property
    {
        TArray<FEUIDynamicWidgetData> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetBuffModels(const TArray<FEUIDynamicWidgetData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_BuffModels = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetNormalBuffWidgetClass() const property
    {
        this.TrackPropertyRead(2);
        return this.m_NormalBuffWidgetClass;
    }
    void SetNormalBuffWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_NormalBuffWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_NormalBuffWidgetClass = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetRoundBuffWidgetClass() const property
    {
        this.TrackPropertyRead(3);
        return this.m_RoundBuffWidgetClass;
    }
    void SetRoundBuffWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_RoundBuffWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RoundBuffWidgetClass = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_InGame_Buff_VM_BuffInfo_113
{
    __Lambda_UI_Private_ViewModel_InGame_Buff_VM_BuffInfo_113()
    {
        return;
    }
    bool opCall(FBuffEntityData &inout A, FBuffEntityData &inout B)
    {
        int local_94 = 0;
        int local_100 = 0;
        TDataObjectPtr<FBuffConfig> local_24 = TDataObjectPtr<FBuffConfig>(A.ConfigRef);
        TDataObjectPtr<FBuffConfig> local_48 = TDataObjectPtr<FBuffConfig>(B.ConfigRef);
        int local_78 = int(local_24.opArrow().ClientPresentationType) == 0 ? 1000 : int(local_24.opArrow().ClientPresentationType);
        int local_76 = int(local_24.opArrow().ClientPresentationType) == 0 ? 1000 : int(local_48.opArrow().ClientPresentationType);
        if (local_78 == local_76)
        {
            FECSEntity local_88 = FECSEntity(A.BuffEntityId);
            FECSEntity local_84 = FECSEntity(B.BuffEntityId);
            if (!(!(local_94)) && local_100)
            {
                return (FFPTime(local_94.GetStartTime()).opCmp(local_100.GetStartTime()) < 0);
            }
        }
        return (local_78 < local_76);
    }
}

struct __GeneratedProperties_FVM_BuffInfo
{
    UPROPERTY()
    TEUIModelRef<FVM_BuffInfo> Self;

    __GeneratedProperties_FVM_BuffInfo()
    {
        return;
    }
}

namespace FVM_BuffInfo
{
FVM_BuffInfo& Create(const UObject ContextObject, const FECSEntity &inout TargetEntity)
{
    return FVM_BuffInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), TargetEntity);
}
FVM_BuffInfo CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout TargetEntity)
{
    FVM_BuffInfo __r;
    TEUIModelRef<FVM_BuffInfo> local_6 = TEUIModelRef<FVM_BuffInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BuffInfo::ModelId, 0, TargetEntity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(true);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BuffModels";
    local_14.TypeName = "TArray<FEUIDynamicWidgetData>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BuffInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BuffInfo;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnTargetEntityChanged";
    local_24.DirtyFlags.Set(FVM_BuffInfo::__IndexOf_TargetEntity());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelMonitorDefine local_34;
    local_34.FunctionName = "__OnBuffChanged";
    local_34.ComponentType = FC_Buff;
    local_34.MonitorPropertyName = FName("TargetEntity");
    int local_2_2 = FVM_BuffInfo::__IndexOf_TargetEntity();
    Result.MonitorFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BuffInfo;
}
void __OnTargetEntityChanged(FVM_BuffInfo &inout Model)
{
    Model.OnTargetEntityChanged();
    return;
}
void __OnBuffChanged(FVM_BuffInfo &inout Model, const FECSEntity &inout Entity, const FC_Buff &inout Component)
{
    Model.OnBuffChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<FEUIDynamicWidgetData> __UIGetter_BuffModels(const FVM_BuffInfo &inout Model)
{
    return Model.GetBuffModels();
}
TEUIModelRef<FVM_BuffInfo> __UIGetter_Self(const FVM_BuffInfo &inout Model)
{
    return TEUIModelRef<FVM_BuffInfo>(Model);
}
int __IndexOf_TargetEntity()
{
    return 0;
}
int __IndexOf_BuffModels()
{
    return 1;
}
int __IndexOf_NormalBuffWidgetClass()
{
    return 2;
}
int __IndexOf_RoundBuffWidgetClass()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_BuffInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
