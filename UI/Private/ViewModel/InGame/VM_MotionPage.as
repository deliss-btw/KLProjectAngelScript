
namespace FVMS_MotionPage
{
    const int ModelId = 0;

}
struct FVMS_MotionPage : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    int m_CurrentTab;
    UPROPERTY()
    TArray<FEUIModelRef> m_SingleMotionRefs;
    UPROPERTY()
    TArray<FEUIModelRef> m_MultiMotionRefs;
    UPROPERTY()
    TArray<FEUIModelRef> m_FunctionPropMotionRefs;
    UPROPERTY()
    TArray<FEUIModelRef> m_DisplayMotionRefs;
    UPROPERTY()
    TArray<FEUIModelRef> m_MotionTabs;
    UPROPERTY()
    UDataTable m_MotionDataTable;
    UPROPERTY()
    TArray<FName> m_AllRowNames;

    FVMS_MotionPage()
    {
        this.m_MotionDataTable = nullptr;
        this.m_CurrentTab = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_MotionPage(const FVMS_MotionPage &inout Other)
    {
        this.m_MotionDataTable = nullptr;
        this.m_CurrentTab = 0;
        this.m_CurrentTab = int(Other.m_CurrentTab);
        this.m_SingleMotionRefs = Other.m_SingleMotionRefs;
        this.m_MultiMotionRefs = Other.m_MultiMotionRefs;
        this.m_FunctionPropMotionRefs = Other.m_FunctionPropMotionRefs;
        this.m_DisplayMotionRefs = Other.m_DisplayMotionRefs;
        this.m_MotionTabs = Other.m_MotionTabs;
        this.m_MotionDataTable = Other.m_MotionDataTable;
        this.m_AllRowNames = Other.m_AllRowNames;
        return;
    }
    FVMS_MotionPage& opAssign(const FVMS_MotionPage &inout Other)
    {
        this.m_CurrentTab = int(Other.m_CurrentTab);
        this.m_SingleMotionRefs = Other.m_SingleMotionRefs;
        this.m_MultiMotionRefs = Other.m_MultiMotionRefs;
        this.m_FunctionPropMotionRefs = Other.m_FunctionPropMotionRefs;
        this.m_DisplayMotionRefs = Other.m_DisplayMotionRefs;
        this.m_MotionTabs = Other.m_MotionTabs;
        this.m_MotionDataTable = Other.m_MotionDataTable;
        return Other.m_AllRowNames;
    }
    void LoadConfigDefault(const FVMS_MotionPageConfigDefault &inout InConfig)
    {
        this.SetMotionDataTable(InConfig.MotionDataTable);
        return;
    }
    void PostConstruct()
    {
        this.RefreshMotionList();
        return;
    }
    void Tick()
    {
        UInteractionBehaviorBase local_30;
        ModifyOrAdd local_36;
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(local_4.IsValid()) || !(FECSEntity(this.GetContext().GetLocalPlayer()).IsValid()))
        {
            return;
        }
        if (this.GetCurrentTab() == 1)
        {
            Get local_20;
            const FC_BestInteractionTargetInfo& local_22 = local_20.opCall();
            if (local_22)
            {
                FECSEntity local_26 = FECSEntity(local_22.TargetEntity);
                if (!(local_26.IsValid()))
                {
                    return;
                }
                local_30 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_26, local_22.InteractTargetPointAndBehaviorIndex);
                if (::FTeamUtils::IsInSameTeam(local_4, local_26) && (int(local_30.InteractType) == 3 || (int(local_30.InteractType) == 16)))
                {
                    local_36.opCall().InteractTarget = local_26;
                }
            }
            else
            {
                Get local_40;
                const FC_BestInteractionTargetInfoModeZ& local_42 = local_40.opCall();
                if (local_42)
                {
                    FECSEntity local_26_2 = FECSEntity(local_42.TargetEntity);
                    if (!(local_26_2.IsValid()))
                    {
                        return;
                    }
                    local_30 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_26_2, local_42.InteractTargetPointAndBehaviorIndex);
                    if (::FTeamUtils::IsInSameTeam(local_4, local_26_2) && (int(local_30.InteractType) == 3 || (int(local_30.InteractType) == 16)))
                    {
                        local_36.opCall().InteractTarget = local_26_2;
                    }
                }
            }
        }
        else
        {
            Modify local_46;
            FC_SelectSocialInteractionInfo& local_48 = local_46.opCall();
            if (local_48)
            {
                local_48.InteractTarget = ENTITY_NULL;
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
        FMotionData local_136;
        FEUIModelRef local_220;
        this.GetModify_SingleMotionRefs().Empty(0);
        this.GetModify_MultiMotionRefs().Empty(0);
        this.GetModify_FunctionPropMotionRefs().Empty(0);
        this.GetModify_DisplayMotionRefs().Empty(0);
        this.GetModify_MotionTabs().Empty(0);
        this.GetMotionDataTable().GetRowNames(this.GetModify_AllRowNames());
        for (auto& local_20 : this.GetAllRowNames())
        {
            if (!(this.GetMotionDataTable().FindRow(local_20, local_136)))
            {
                continue;
            }
            if (int(local_136.ShowType) == 2)
            {
                continue;
            }
            bool local_17 = ::FMS_MotionUnlock::Get(this.GetContext().Manager).IsMotionLocked(local_136);
            if (int(local_136.ShowType) == 0 || (int(local_136.ShowType) == 1 && !(local_17)))
            {
                TDataObjectPtr<FMotionData> local_190;
                TDataObjectPtr<FMotionData> local_166 = local_190;
                if (int(local_136.MotionType) == 0)
                {
                    local_220 = FEUIModelRef(::FVM_SocialMotionItem::Create(this.GetContext().Manager, EMotionType(0), local_166, local_17));
                    this.GetModify_SingleMotionRefs().Add(local_220);
                }
                else
                {
                    if (int(local_136.MotionType) == 1)
                    {
                        local_220 = FEUIModelRef(::FVM_SocialMotionItem::Create(this.GetContext().Manager, EMotionType(1), local_166, local_17));
                        this.GetModify_MultiMotionRefs().Add(local_220);
                    }
                    else
                    {
                        if (int(local_136.MotionType) == 2)
                        {
                            local_220 = FEUIModelRef(::FVM_SocialMotionItem::Create(this.GetContext().Manager, EMotionType(2), local_166, local_17));
                            this.GetModify_FunctionPropMotionRefs().Add(local_220);
                        }
                    }
                }
            }
        }
        int local_221 = 0;
        for (; local_221 < 3; )
        {
            this.GetModify_MotionTabs().Add(local_220);
            ++local_221;
        }
        this.UpdateDisplayMotionRefs();
        return;
    }
    void UpdateDisplayMotionRefs()
    {
        if (this.GetCurrentTab() == 0)
        {
            this.SetDisplayMotionRefs(this.GetModify_SingleMotionRefs());
            return;
        }
        if (this.GetCurrentTab() == 1)
        {
            this.SetDisplayMotionRefs(this.GetModify_MultiMotionRefs());
            return;
        }
        if (this.GetCurrentTab() == 2)
        {
            this.SetDisplayMotionRefs(this.GetModify_FunctionPropMotionRefs());
            return;
        }
        this.GetModify_DisplayMotionRefs().Empty(0);
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
    const TArray<FEUIModelRef> GetSingleMotionRefs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_SingleMotionRefs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSingleMotionRefs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SingleMotionRefs = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetMultiMotionRefs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_MultiMotionRefs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetMultiMotionRefs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MultiMotionRefs = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetFunctionPropMotionRefs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_FunctionPropMotionRefs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetFunctionPropMotionRefs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_FunctionPropMotionRefs = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetDisplayMotionRefs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_DisplayMotionRefs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDisplayMotionRefs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DisplayMotionRefs = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetMotionTabs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_MotionTabs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetMotionTabs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_MotionTabs = __Value;
        return;
    }
    UDataTable GetMotionDataTable() const property
    {
        this.TrackPropertyRead(6);
        return this.m_MotionDataTable;
    }
    void SetMotionDataTable(const UDataTable __Value) property
    {
        if (this.m_MotionDataTable == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        return;
    }
    const TArray<FName> GetAllRowNames() const property
    {
        const TArray<FName> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<FName> GetModify_AllRowNames() property
    {
        TArray<FName> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetAllRowNames(const TArray<FName> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_AllRowNames = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_MotionPage
{
    UPROPERTY()
    TEUIModelRef<FVMS_MotionPage> Self;

    __GeneratedProperties_FVMS_MotionPage()
    {
        return;
    }
}

namespace FVMS_MotionPage
{
FVMS_MotionPage& Get(const UObject ContextObject)
{
    return FVMS_MotionPage::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_MotionPage GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_MotionPage __r;
    TEUIModelRef<FVMS_MotionPage> local_6 = TEUIModelRef<FVMS_MotionPage>(EUIInternal::MakeModelWithManager(Manager, FVMS_MotionPage::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(true);
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
    local_14.TypeName = "TEUIModelRef<FVMS_MotionPage>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_MotionPage;
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
    local_44.DirtyFlags.Set(FVMS_MotionPage::__IndexOf_CurrentTab());
    Result.DirtyFunctions.Add(local_44);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_MotionPage;
}
void __Tick(FVMS_MotionPage &inout Model)
{
    Model.Tick();
    return;
}
void __OnMotionUnlocked(FVMS_MotionPage &inout Model, const FMsg_MotionUnlockChanged &inout Message)
{
    Model.OnMotionUnlocked(Message);
    return;
}
void __OnMotionIndexChanged(FVMS_MotionPage &inout Model, const FCE_UISetMotionIndex &inout Event)
{
    Model.OnMotionIndexChanged(Event);
    return;
}
void __OnSelectTargetChanged(FVMS_MotionPage &inout Model, const FCE_SelectTargetChanged &inout Event)
{
    Model.OnSelectTargetChanged(Event);
    return;
}
void __OnCurrentTabChanged(FVMS_MotionPage &inout Model)
{
    Model.OnCurrentTabChanged();
    return;
}
TArray<FEUIModelRef> __UIGetter_DisplayMotionRefs(const FVMS_MotionPage &inout Model)
{
    return Model.GetDisplayMotionRefs();
}
TArray<FEUIModelRef> __UIGetter_MotionTabs(const FVMS_MotionPage &inout Model)
{
    return Model.GetMotionTabs();
}
TEUIModelRef<FVMS_MotionPage> __UIGetter_Self(const FVMS_MotionPage &inout Model)
{
    return TEUIModelRef<FVMS_MotionPage>(Model);
}
int __IndexOf_CurrentTab()
{
    return 0;
}
int __IndexOf_SingleMotionRefs()
{
    return 1;
}
int __IndexOf_MultiMotionRefs()
{
    return 2;
}
int __IndexOf_FunctionPropMotionRefs()
{
    return 3;
}
int __IndexOf_DisplayMotionRefs()
{
    return 4;
}
int __IndexOf_MotionTabs()
{
    return 5;
}
int __IndexOf_MotionDataTable()
{
    return 6;
}
int __IndexOf_AllRowNames()
{
    return 7;
}
}
namespace __GeneratedProperties_FVMS_MotionPage
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
