
namespace FVM_TutorialHandbook
{
    const int ModelId = 0;

}
struct FVM_TutorialHandbook : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TutorialHandbookEntry>> m_Entries;
    UPROPERTY()
    TEUIModelWeakRef<FVM_TutorialHandbookEntry> m_HoveredEntry;
    UPROPERTY()
    bool m_bHasHoveredEntry;

    FVM_TutorialHandbook()
    {
        this.m_bHasHoveredEntry = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_TutorialHandbook(const FVM_TutorialHandbook &inout Other)
    {
        this.m_bHasHoveredEntry = false;
        this.m_Entries = Other.m_Entries;
        this.m_HoveredEntry = Other.m_HoveredEntry;
        this.m_bHasHoveredEntry = Other.m_bHasHoveredEntry;
        return;
    }
    FVM_TutorialHandbook opAssign(const FVM_TutorialHandbook &inout Other)
    {
        FVM_TutorialHandbook __r;
        this.m_Entries = Other.m_Entries;
        this.m_HoveredEntry = Other.m_HoveredEntry;
        this.m_bHasHoveredEntry = Other.m_bHasHoveredEntry;
        return __r;
    }
    void PostConstruct()
    {
        UGuideManualSettings local_4 = ::GuideManualSettings::Get();
        FMS_GuideManual& local_8 = ::FMS_GuideManual::Get(this.GetManager());
        int local_9 = 0;
        for (; local_9 < local_4.TabSettings.Num(); )
        {
            FGuideManualTabSetting& local_14 = local_4.TabSettings[local_9];
            FVM_TutorialHandbookEntry& local_18 = ::FVM_TutorialHandbookEntry::Create(this.GetManager(), int(local_14.Tab));
            local_18.SetTabName(local_14.TabName);
            local_18.SetTabIcon(local_14.Icon);
            local_18.SetTab(EGuideManualTab(local_14.Tab));
            local_18.SetbHasUnfinished(this.CheckTabHasUnfinished(local_8, EGuideManualTab(local_14.Tab)));
            this.GetModify_Entries().Add(TEUIModelRef<FVM_TutorialHandbookEntry>(local_18));
            ++local_9;
        }
        return;
    }
    void OnEntryHoverChanged(const FMsg_TutorialHandbookEntryHovered &inout Msg)
    {
        if (Msg.bHovered)
        {
            this.SetHoveredEntry(Msg.HoveredEntry);
            this.SetbHasHoveredEntry(true);
            return;
        }
        this.SetHoveredEntry(TEUIModelWeakRef<FVM_TutorialHandbookEntry>());
        this.SetbHasHoveredEntry(false);
        return;
    }
    void EnterHoveredOrSelected()
    {
        if (this.GetHoveredEntry().IsValid())
        {
            TEUIModelWeakRef<FVM_TutorialHandbookEntry> local_2 = this.GetHoveredEntry();
            OnClicked();
        }
        return;
    }
    bool CheckTabHasUnfinished(FMS_GuideManual &inout GuideModel, const EGuideManualTab Tab)
    {
        TDataObjectIterator<FGuideGroupConfig> local_16;
        int local_86 = 0;
        for (; local_16; )
        {
            TDataObjectPtr<FGuideGroupConfig> local_58 = local_16.GetDataPtr();
            if (0 != int(Tab))
            {
            }
            else
            {
                if (!(GuideModel.IsVisibleInManual(local_58)))
                {
                }
                else
                {
                    if (!(GuideModel.IsGuideFinished(local_86)))
                    {
                        return true;
                    }
                }
            }
            local_16.Next();
        }
        return false;
    }
    const TArray<TEUIModelRef<FVM_TutorialHandbookEntry>> GetEntries() const property
    {
        const TArray<TEUIModelRef<FVM_TutorialHandbookEntry>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TutorialHandbookEntry>> GetModify_Entries() property
    {
        TArray<TEUIModelRef<FVM_TutorialHandbookEntry>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEntries(const TArray<TEUIModelRef<FVM_TutorialHandbookEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Entries = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_TutorialHandbookEntry> GetHoveredEntry() const property
    {
        this.TrackPropertyRead(1);
        return this.m_HoveredEntry;
    }
    void SetHoveredEntry(const TEUIModelWeakRef<FVM_TutorialHandbookEntry> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_TutorialHandbookEntry> local_2;
        local_2 = this.m_HoveredEntry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HoveredEntry = __Value;
        return;
    }
    bool GetbHasHoveredEntry() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bHasHoveredEntry;
    }
    void SetbHasHoveredEntry(const bool __Value) property
    {
        if (!(this.m_bHasHoveredEntry) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bHasHoveredEntry = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TutorialHandbook
{
    UPROPERTY()
    TEUIModelRef<FVM_TutorialHandbook> Self;

    __GeneratedProperties_FVM_TutorialHandbook()
    {
        return;
    }
}

namespace FVM_TutorialHandbook
{
FVM_TutorialHandbook& Create(const UObject ContextObject)
{
    return FVM_TutorialHandbook::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TutorialHandbook CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_TutorialHandbook __r;
    TEUIModelRef<FVM_TutorialHandbook> local_6 = TEUIModelRef<FVM_TutorialHandbook>(EUIInternal::MakeModelWithManager(Manager, FVM_TutorialHandbook::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Entries";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TutorialHandbookEntry>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasHoveredEntry";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TutorialHandbook>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TutorialHandbook;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnEntryHoverChanged";
    local_26.MessageTypeName = "Msg_TutorialHandbookEntryHovered";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TutorialHandbook;
}
void __OnEntryHoverChanged(FVM_TutorialHandbook &inout Model, const FMsg_TutorialHandbookEntryHovered &inout Message)
{
    Model.OnEntryHoverChanged(Message);
    return;
}
TArray<TEUIModelRef<FVM_TutorialHandbookEntry>> __UIGetter_Entries(const FVM_TutorialHandbook &inout Model)
{
    return Model.GetEntries();
}
bool __UIGetter_bHasHoveredEntry(const FVM_TutorialHandbook &inout Model)
{
    return Model.GetbHasHoveredEntry();
}
TEUIModelRef<FVM_TutorialHandbook> __UIGetter_Self(const FVM_TutorialHandbook &inout Model)
{
    return TEUIModelRef<FVM_TutorialHandbook>(Model);
}
int __IndexOf_Entries()
{
    return 0;
}
int __IndexOf_HoveredEntry()
{
    return 1;
}
int __IndexOf_bHasHoveredEntry()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_TutorialHandbook
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
