
namespace FVM_SocialDungeonMinimapIcon
{
    const int ModelId = 0;

}
struct FVM_SocialDungeonMinimapIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_RewardList;
    UPROPERTY()
    FText m_ToolTipTitle;
    UPROPERTY()
    FText m_ToolTipDesc;
    UPROPERTY()
    FSoftBrush m_DungeonIcon;
    UPROPERTY()
    bool m_bHasInit;

    FVM_SocialDungeonMinimapIcon()
    {
        this.m_bHasInit = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SocialDungeonMinimapIcon' by default constructor.");
        return;
    }
    FVM_SocialDungeonMinimapIcon(const FVM_SocialDungeonMinimapIcon &inout Other)
    {
        this.m_bHasInit = false;
        this.m_Spot = Other.m_Spot;
        this.m_RewardList = Other.m_RewardList;
        this.m_ToolTipTitle = Other.m_ToolTipTitle;
        this.m_ToolTipDesc = Other.m_ToolTipDesc;
        this.m_DungeonIcon = Other.m_DungeonIcon;
        this.m_bHasInit = Other.m_bHasInit;
        return;
    }
    FVM_SocialDungeonMinimapIcon(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        this.m_bHasInit = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_SocialDungeonMinimapIcon opAssign(const FVM_SocialDungeonMinimapIcon &inout Other)
    {
        FVM_SocialDungeonMinimapIcon __r;
        this.m_Spot = Other.m_Spot;
        this.m_RewardList = Other.m_RewardList;
        this.m_ToolTipTitle = Other.m_ToolTipTitle;
        this.m_ToolTipDesc = Other.m_ToolTipDesc;
        this.m_DungeonIcon = Other.m_DungeonIcon;
        this.m_bHasInit = Other.m_bHasInit;
        return __r;
    }
    void PostConstruct()
    {
        int local_12 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            if (local_12.GetLeveScriptActorInfo().Contains(this.GetEntityID()))
            {
                FECSEntityId local_13 = this.GetEntityID();
                TDataObjectPtr<FDungeonConfig> local_38 = local_12.GetLeveScriptActorInfo()[local_13];
                if (local_38)
                {
                    this.SetRewardList(TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, ::FCommonRewardListBuilder::BuildFromDropConfig(GetTempRewardView()))));
                    this.SetbHasInit(true);
                }
            }
        }
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetTooltipWidgetClass() const
    {
        UMarkSettings local_2 = ::MarkUtil::GetMarkConfigSetting();
        return local_2.SocialDungeonMinimapMarkTips;
    }
    int GetRewardTypeSwitchIndex() const
    {
        if (this.IsEventFinish())
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
    bool IsEventFinish() const
    {
        return false;
    }
    bool HasReward() const
    {
        return !(this.IsEventFinish());
    }
    FECSEntityId GetEntityID() const property
    {
        return ::GetOwnerEntityId(this.GetSpot().opArrow());
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Spot = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonRewardList> GetRewardList() const property
    {
        this.TrackPropertyRead(1);
        return this.m_RewardList;
    }
    void SetRewardList(const TEUIModelRef<FVM_CommonRewardList> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonRewardList> local_2;
        local_2 = this.m_RewardList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RewardList = __Value;
        return;
    }
    const FText GetToolTipTitle() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_ToolTipTitle() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetToolTipTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ToolTipTitle = __Value;
        return;
    }
    const FText GetToolTipDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_ToolTipDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetToolTipDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ToolTipDesc = __Value;
        return;
    }
    FSoftBrush GetDungeonIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FSoftBrush GetModify_DungeonIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDungeonIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DungeonIcon = __Value;
        return;
    }
    bool GetbHasInit() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bHasInit;
    }
    void SetbHasInit(const bool __Value) property
    {
        if (!(this.m_bHasInit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bHasInit = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SocialDungeonMinimapIcon
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> TooltipWidgetClass;
    UPROPERTY()
    int RewardTypeSwitchIndex;
    UPROPERTY()
    bool IsEventFinish;
    UPROPERTY()
    bool HasReward;
    UPROPERTY()
    TEUIModelRef<FVM_SocialDungeonMinimapIcon> Self;


}

namespace FVM_SocialDungeonMinimapIcon
{
FVM_SocialDungeonMinimapIcon& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_SocialDungeonMinimapIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_SocialDungeonMinimapIcon CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_SocialDungeonMinimapIcon __r;
    TEUIModelRef<FVM_SocialDungeonMinimapIcon> local_6 = TEUIModelRef<FVM_SocialDungeonMinimapIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SocialDungeonMinimapIcon::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RewardList";
    local_14.TypeName = "TEUIModelRef<FVM_CommonRewardList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToolTipTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToolTipDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DungeonIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TooltipWidgetClass";
    local_14.TypeName = "TSoftClassPtr<UEUIUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardTypeSwitchIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEventFinish";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasReward";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SocialDungeonMinimapIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SocialDungeonMinimapIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SocialDungeonMinimapIcon;
}
TEUIModelRef<FVM_CommonRewardList> __UIGetter_RewardList(const FVM_SocialDungeonMinimapIcon &inout Model)
{
    return Model.GetRewardList();
}
FText __UIGetter_ToolTipTitle(const FVM_SocialDungeonMinimapIcon &inout Model)
{
    return Model.GetToolTipTitle();
}
FText __UIGetter_ToolTipDesc(const FVM_SocialDungeonMinimapIcon &inout Model)
{
    return Model.GetToolTipDesc();
}
FSoftBrush __UIGetter_DungeonIcon(const FVM_SocialDungeonMinimapIcon &inout Model)
{
    return Model.GetDungeonIcon();
}
TSoftClassPtr<UEUIUserWidget> __UIGetter_TooltipWidgetClass(const FVM_SocialDungeonMinimapIcon &inout Model)
{
    return Model.GetTooltipWidgetClass();
}
int __UIGetter_RewardTypeSwitchIndex(const FVM_SocialDungeonMinimapIcon &inout Model)
{
    return Model.GetRewardTypeSwitchIndex();
}
bool __UIGetter_IsEventFinish(const FVM_SocialDungeonMinimapIcon &inout Model)
{
    return Model.IsEventFinish();
}
bool __UIGetter_HasReward(const FVM_SocialDungeonMinimapIcon &inout Model)
{
    return Model.HasReward();
}
TEUIModelRef<FVM_SocialDungeonMinimapIcon> __UIGetter_Self(const FVM_SocialDungeonMinimapIcon &inout Model)
{
    return TEUIModelRef<FVM_SocialDungeonMinimapIcon>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_RewardList()
{
    return 1;
}
int __IndexOf_ToolTipTitle()
{
    return 2;
}
int __IndexOf_ToolTipDesc()
{
    return 3;
}
int __IndexOf_DungeonIcon()
{
    return 4;
}
int __IndexOf_bHasInit()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_SocialDungeonMinimapIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
