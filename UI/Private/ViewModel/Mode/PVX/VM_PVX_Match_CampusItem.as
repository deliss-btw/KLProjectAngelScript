
namespace FVM_PVX_Match_CampusItem
{
    const int ModelId = 0;

}
struct FVM_PVX_Match_CampusItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FPvxMatchConfig> m_PvxMatchConfig;
    UPROPERTY()
    bool m_bPlayerOrBoss;
    UPROPERTY()
    FText m_CampusName;
    UPROPERTY()
    FText m_CampusDesc;
    UPROPERTY()
    FText m_CampusAllowMemberNum;
    UPROPERTY()
    bool m_bSelected;
    UPROPERTY()
    bool m_bHovered;
    UPROPERTY()
    int m_MaxMemberNum;
    UPROPERTY()
    bool m_bCanMatch;

    FVM_PVX_Match_CampusItem()
    {
        this.m_bPlayerOrBoss = false;
        this.m_bSelected = false;
        this.m_bHovered = false;
        this.m_MaxMemberNum = 1;
        this.m_bCanMatch = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PVX_Match_CampusItem' by default constructor.");
        return;
    }
    FVM_PVX_Match_CampusItem(const FVM_PVX_Match_CampusItem &inout Other)
    {
        this.m_bPlayerOrBoss = false;
        this.m_bSelected = false;
        this.m_bHovered = false;
        this.m_MaxMemberNum = 1;
        this.m_bCanMatch = true;
        this.m_PvxMatchConfig = Other.m_PvxMatchConfig;
        this.m_bPlayerOrBoss = Other.m_bPlayerOrBoss;
        this.m_CampusName = Other.m_CampusName;
        this.m_CampusDesc = Other.m_CampusDesc;
        this.m_CampusAllowMemberNum = Other.m_CampusAllowMemberNum;
        this.m_bSelected = Other.m_bSelected;
        this.m_bHovered = Other.m_bHovered;
        this.m_MaxMemberNum = int(Other.m_MaxMemberNum);
        this.m_bCanMatch = Other.m_bCanMatch;
        return;
    }
    FVM_PVX_Match_CampusItem(const TDataObjectPtr<FPvxMatchConfig> &inout InPvxMatchConfig, const bool InbPlayerOrBoss)
    {
        this.m_bPlayerOrBoss = false;
        this.m_bSelected = false;
        this.m_bHovered = false;
        this.m_MaxMemberNum = 1;
        this.m_bCanMatch = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPvxMatchConfig(InPvxMatchConfig);
        this.SetbPlayerOrBoss(InbPlayerOrBoss);
        return;
    }
    FVM_PVX_Match_CampusItem opAssign(const FVM_PVX_Match_CampusItem &inout Other)
    {
        FVM_PVX_Match_CampusItem __r;
        this.m_PvxMatchConfig = Other.m_PvxMatchConfig;
        this.m_bPlayerOrBoss = Other.m_bPlayerOrBoss;
        this.m_CampusName = Other.m_CampusName;
        this.m_CampusDesc = Other.m_CampusDesc;
        this.m_CampusAllowMemberNum = Other.m_CampusAllowMemberNum;
        this.m_bSelected = Other.m_bSelected;
        this.m_bHovered = Other.m_bHovered;
        this.m_MaxMemberNum = int(Other.m_MaxMemberNum);
        this.m_bCanMatch = Other.m_bCanMatch;
        return __r;
    }
    void PostConstruct()
    {
        const FPvxMatchConfig& local_4;
        if (this.GetPvxMatchConfig())
        {
            if (this.GetbPlayerOrBoss())
            {
                this.SetCampusName(local_4.PlayerName);
                this.SetCampusDesc(local_4.PlayerDesc);
                this.SetMaxMemberNum(int(local_4.MaxTeamMemberNum));
                this.SetCampusAllowMemberNum(FText::Format(NSLOCTEXT("CampusAllowMemberNum", "{0}-{1}"), local_4.MinTeamMemberNum, this.GetMaxMemberNum()));
                return;
            }
            this.SetCampusName(local_4.BossName);
            this.SetCampusDesc(local_4.BossDesc);
            this.SetMaxMemberNum(int(local_4.BossNum));
            FNumberFormattingOptions local_20;
            this.SetCampusAllowMemberNum(FText::AsNumber(this.GetMaxMemberNum(), local_20));
        }
        return;
    }
    const TDataObjectPtr<FPvxMatchConfig> GetPvxMatchConfig() const property
    {
        const TDataObjectPtr<FPvxMatchConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FPvxMatchConfig> GetModify_PvxMatchConfig() property
    {
        TDataObjectPtr<FPvxMatchConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPvxMatchConfig(const TDataObjectPtr<FPvxMatchConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PvxMatchConfig = __Value;
        return;
    }
    bool GetbPlayerOrBoss() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bPlayerOrBoss;
    }
    void SetbPlayerOrBoss(const bool __Value) property
    {
        if (!(this.m_bPlayerOrBoss) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bPlayerOrBoss = __Value;
        return;
    }
    const FText GetCampusName() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_CampusName() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCampusName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CampusName = __Value;
        return;
    }
    const FText GetCampusDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_CampusDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCampusDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CampusDesc = __Value;
        return;
    }
    const FText GetCampusAllowMemberNum() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_CampusAllowMemberNum() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCampusAllowMemberNum(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CampusAllowMemberNum = __Value;
        return;
    }
    bool GetbSelected() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bSelected;
    }
    void SetbSelected(const bool __Value) property
    {
        if (!(this.m_bSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bSelected = __Value;
        return;
    }
    bool GetbHovered() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bHovered;
    }
    void SetbHovered(const bool __Value) property
    {
        if (!(this.m_bHovered) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bHovered = __Value;
        return;
    }
    int GetMaxMemberNum() const property
    {
        this.TrackPropertyRead(7);
        return this.m_MaxMemberNum;
    }
    void SetMaxMemberNum(const int __Value) property
    {
        if (this.m_MaxMemberNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_MaxMemberNum = __Value;
        return;
    }
    bool GetbCanMatch() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bCanMatch;
    }
    void SetbCanMatch(const bool __Value) property
    {
        if (!(this.m_bCanMatch) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bCanMatch = __Value;
        return;
    }
}

struct FMsg_PVXMatchCampusItemClicked : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FVM_PVX_Match_CampusItem> ClickCampusItem;

    FMsg_PVXMatchCampusItemClicked()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_PVX_Match_CampusItem
{
    UPROPERTY()
    TEUIModelRef<FVM_PVX_Match_CampusItem> Self;

    __GeneratedProperties_FVM_PVX_Match_CampusItem()
    {
        return;
    }
}

namespace FVM_PVX_Match_CampusItem
{
FVM_PVX_Match_CampusItem& Create(const UObject ContextObject, const TDataObjectPtr<FPvxMatchConfig> &inout PvxMatchConfig, const bool bPlayerOrBoss)
{
    return FVM_PVX_Match_CampusItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), PvxMatchConfig, bPlayerOrBoss);
}
FVM_PVX_Match_CampusItem CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FPvxMatchConfig> &inout PvxMatchConfig, const bool bPlayerOrBoss)
{
    FVM_PVX_Match_CampusItem __r;
    TEUIModelRef<FVM_PVX_Match_CampusItem> local_6 = TEUIModelRef<FVM_PVX_Match_CampusItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PVX_Match_CampusItem::ModelId, 0, PvxMatchConfig, bPlayerOrBoss));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CampusName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CampusDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CampusAllowMemberNum";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHovered";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PVX_Match_CampusItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PVX_Match_CampusItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_Match_CampusItem;
}
FText __UIGetter_CampusName(const FVM_PVX_Match_CampusItem &inout Model)
{
    return Model.GetCampusName();
}
FText __UIGetter_CampusDesc(const FVM_PVX_Match_CampusItem &inout Model)
{
    return Model.GetCampusDesc();
}
FText __UIGetter_CampusAllowMemberNum(const FVM_PVX_Match_CampusItem &inout Model)
{
    return Model.GetCampusAllowMemberNum();
}
bool __UIGetter_bSelected(const FVM_PVX_Match_CampusItem &inout Model)
{
    return Model.GetbSelected();
}
bool __UIGetter_bHovered(const FVM_PVX_Match_CampusItem &inout Model)
{
    return Model.GetbHovered();
}
TEUIModelRef<FVM_PVX_Match_CampusItem> __UIGetter_Self(const FVM_PVX_Match_CampusItem &inout Model)
{
    return TEUIModelRef<FVM_PVX_Match_CampusItem>(Model);
}
int __IndexOf_PvxMatchConfig()
{
    return 0;
}
int __IndexOf_bPlayerOrBoss()
{
    return 1;
}
int __IndexOf_CampusName()
{
    return 2;
}
int __IndexOf_CampusDesc()
{
    return 3;
}
int __IndexOf_CampusAllowMemberNum()
{
    return 4;
}
int __IndexOf_bSelected()
{
    return 5;
}
int __IndexOf_bHovered()
{
    return 6;
}
int __IndexOf_MaxMemberNum()
{
    return 7;
}
int __IndexOf_bCanMatch()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_PVX_Match_CampusItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
