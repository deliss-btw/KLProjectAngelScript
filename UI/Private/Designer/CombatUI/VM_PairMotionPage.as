
namespace FVMS_PairMotionPage
{
    const int ModelId = 0;

}
struct FVMS_PairMotionPage : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    int m_CurrentTab;
    UPROPERTY()
    TArray<FEUIModelRef> m_MultiMotionRefs;
    UPROPERTY()
    TArray<FEUIModelRef> m_DisplayMotionRefs;
    UPROPERTY()
    TArray<FEUIModelRef> m_MotionTabs;
    UPROPERTY()
    TArray<FName> m_AllRowNames;

    FVMS_PairMotionPage()
    {
        this.m_CurrentTab = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_PairMotionPage(const FVMS_PairMotionPage &inout Other)
    {
        this.m_CurrentTab = 0;
        this.m_CurrentTab = int(Other.m_CurrentTab);
        this.m_MultiMotionRefs = Other.m_MultiMotionRefs;
        this.m_DisplayMotionRefs = Other.m_DisplayMotionRefs;
        this.m_MotionTabs = Other.m_MotionTabs;
        this.m_AllRowNames = Other.m_AllRowNames;
        return;
    }
    FVMS_PairMotionPage& opAssign(const FVMS_PairMotionPage &inout Other)
    {
        this.m_CurrentTab = int(Other.m_CurrentTab);
        this.m_MultiMotionRefs = Other.m_MultiMotionRefs;
        this.m_DisplayMotionRefs = Other.m_DisplayMotionRefs;
        this.m_MotionTabs = Other.m_MotionTabs;
        return Other.m_AllRowNames;
    }
    void PostConstruct()
    {
        this.RefreshMotionList();
        return;
    }
    void Tick()
    {
        UInteractionBehaviorBase local_28;
        if (!(FECSEntity(this.GetContext().GetLocalPlayerPawn()).IsValid()) || !(FECSEntity(this.GetContext().GetLocalPlayer()).IsValid()))
        {
            return;
        }
        Get local_18;
        const FC_BestInteractionTargetInfo& local_20 = local_18.opCall();
        if (local_20)
        {
            ModifyOrAdd local_36;
            FECSEntity local_24 = FECSEntity(local_20.TargetEntity);
            if (!(local_24.IsValid()))
            {
                return;
            }
            local_28 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_24, local_20.InteractTargetPointAndBehaviorIndex);
            if (int(local_28.InteractType) == 3 || (int(local_28.InteractType) == 16))
            {
                local_36.opCall().InteractTarget = local_24;
            }
        }
        else
        {
            ModifyOrAdd local_36;
            Get local_40;
            const FC_BestInteractionTargetInfoModeZ& local_42 = local_40.opCall();
            if (local_42)
            {
                FECSEntity local_24_2 = FECSEntity(local_42.TargetEntity);
                if (!(local_24_2.IsValid()))
                {
                    return;
                }
                local_28 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_24_2, local_42.InteractTargetPointAndBehaviorIndex);
                if (int(local_28.InteractType) == 3 || (int(local_28.InteractType) == 16))
                {
                    local_36.opCall().InteractTarget = local_24_2;
                }
            }
        }
        return;
    }
    void OnMotionUnlocked(const FMsg_MotionUnlockChanged &inout MotionUnlocked)
    {
        this.RefreshMotionList();
        return;
    }
    void OnMotionIndexChanged(const FCE_UISetMotionIndex &inout MotionIndexChanged)
    {
        this.SetCurrentTab(int(MotionIndexChanged.PageIndex));
        return;
    }
    void OnSelectTargetChanged(const FCE_SelectTargetChanged &inout SelectTargetChanged)
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        ModifyOrAdd local_8;
        local_8.opCall().InteractTarget = SelectTargetChanged.InteractTarget;
        return;
    }
    void OnCurrentTabChanged()
    {
        this.UpdateDisplayMotionRefs();
        return;
    }
    void BeginDestroy()
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayer());
        Modify local_12;
        FC_SelectSocialInteractionInfo& local_14 = local_12.opCall();
        if (local_14)
        {
            local_14.InteractTarget = ENTITY_NULL;
        }
        return;
    }
    void RefreshMotionList()
    {
        FEUIModelRef local_106;
        this.GetModify_MultiMotionRefs().Empty(0);
        this.GetModify_MotionTabs().Empty(0);
        TDataObjectIterator<FMotionData> local_18;
        for (; local_18; )
        {
            const FMotionData& local_22 = local_18.GetData();
            if (int(local_22.ShowType) == 2)
            {
            }
            else
            {
                bool local_19 = ::FMS_MotionUnlock::Get(this.GetContext().Manager).IsMotionLocked(local_22);
                if (int(local_22.ShowType) == 0 || (int(local_22.ShowType) == 1 && !(local_19)))
                {
                    TDataObjectPtr<FMotionData> local_76;
                    TDataObjectPtr<FMotionData> local_52 = local_76;
                    if (int(local_22.MotionType) == 1)
                    {
                        local_106 = FEUIModelRef(::FVM_SocialMotionItem::Create(this.GetContext().Manager, EMotionType(1), local_52, local_19));
                        this.GetModify_MultiMotionRefs().Add(local_106);
                    }
                }
            }
            local_18.Next();
        }
        this.GetModify_MotionTabs().Add(local_106);
        this.UpdateDisplayMotionRefs();
        return;
    }
    void UpdateDisplayMotionRefs()
    {
        this.SetDisplayMotionRefs(this.GetModify_MultiMotionRefs());
        return;
    }
    int GetCurrentTab() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CurrentTab;
    }
    void SetCurrentTab(const int __Value) property
    {
        if (this.m_CurrentTab == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentTab = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetMultiMotionRefs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_MultiMotionRefs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetMultiMotionRefs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MultiMotionRefs = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetDisplayMotionRefs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_DisplayMotionRefs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDisplayMotionRefs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplayMotionRefs = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetMotionTabs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_MotionTabs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetMotionTabs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MotionTabs = __Value;
        return;
    }
    const TArray<FName> GetAllRowNames() const property
    {
        const TArray<FName> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<FName> GetModify_AllRowNames() property
    {
        TArray<FName> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetAllRowNames(const TArray<FName> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_AllRowNames = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_PairMotionPage
{
    UPROPERTY()
    TEUIModelRef<FVMS_PairMotionPage> Self;

    __GeneratedProperties_FVMS_PairMotionPage()
    {
        return;
    }
}

namespace FVMS_PairMotionPage
{
FVMS_PairMotionPage& Get(const UObject ContextObject)
{
    return FVMS_PairMotionPage::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_PairMotionPage GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_PairMotionPage __r;
    TEUIModelRef<FVMS_PairMotionPage> local_6 = TEUIModelRef<FVMS_PairMotionPage>(EUIInternal::MakeModelWithManager(Manager, FVMS_PairMotionPage::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayMotionRefs";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MotionTabs";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_PairMotionPage>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_PairMotionPage;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnMotionUnlocked";
    local_26.MessageTypeName = "Msg_MotionUnlockChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    FEUIModelEventDefine local_36;
    local_36.FunctionName = "__OnMotionIndexChanged";
    local_36.EventType = FCE_UISetMotionIndex;
    Result.EventFunctions.Add(local_36);
    local_36.FunctionName = "__OnSelectTargetChanged";
    local_36.EventType = FCE_SelectTargetChanged;
    Result.EventFunctions.Add(local_36);
    FEUIModelDirtyDefine local_44;
    local_44.FunctionName = "__OnCurrentTabChanged";
    local_44.DirtyFlags.Set(FVMS_PairMotionPage::__IndexOf_CurrentTab());
    Result.DirtyFunctions.Add(local_44);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_PairMotionPage;
}
void __Tick(FVMS_PairMotionPage &inout Model)
{
    Model.Tick();
    return;
}
void __OnMotionUnlocked(FVMS_PairMotionPage &inout Model, const FMsg_MotionUnlockChanged &inout Message)
{
    Model.OnMotionUnlocked(Message);
    return;
}
void __OnMotionIndexChanged(FVMS_PairMotionPage &inout Model, const FCE_UISetMotionIndex &inout Event)
{
    Model.OnMotionIndexChanged(Event);
    return;
}
void __OnSelectTargetChanged(FVMS_PairMotionPage &inout Model, const FCE_SelectTargetChanged &inout Event)
{
    Model.OnSelectTargetChanged(Event);
    return;
}
void __OnCurrentTabChanged(FVMS_PairMotionPage &inout Model)
{
    Model.OnCurrentTabChanged();
    return;
}
TArray<FEUIModelRef> __UIGetter_DisplayMotionRefs(const FVMS_PairMotionPage &inout Model)
{
    return Model.GetDisplayMotionRefs();
}
TArray<FEUIModelRef> __UIGetter_MotionTabs(const FVMS_PairMotionPage &inout Model)
{
    return Model.GetMotionTabs();
}
TEUIModelRef<FVMS_PairMotionPage> __UIGetter_Self(const FVMS_PairMotionPage &inout Model)
{
    return TEUIModelRef<FVMS_PairMotionPage>(Model);
}
int __IndexOf_CurrentTab()
{
    return 0;
}
int __IndexOf_MultiMotionRefs()
{
    return 1;
}
int __IndexOf_DisplayMotionRefs()
{
    return 2;
}
int __IndexOf_MotionTabs()
{
    return 3;
}
int __IndexOf_AllRowNames()
{
    return 4;
}
}
namespace __GeneratedProperties_FVMS_PairMotionPage
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
