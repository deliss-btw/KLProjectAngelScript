
namespace FVM_MinimapIconTooltip
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature GuideToTarget = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature TeleportToTarget = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature MarkTarget = FEUIModelCallbackSignature();

}
struct FVM_MinimapIconTooltip : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FVM_MinimapIconHoverProvider> m_HoverProvider;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_DropPreview;

    FVM_MinimapIconTooltip()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MinimapIconTooltip' by default constructor.");
        return;
    }
    FVM_MinimapIconTooltip(const FVM_MinimapIconTooltip &inout Other)
    {
        this.m_HoverProvider = Other.m_HoverProvider;
        this.m_Spot = Other.m_Spot;
        this.m_DropPreview = Other.m_DropPreview;
        return;
    }
    FVM_MinimapIconTooltip(const TEUIModelWeakRef<FVM_MinimapIconHoverProvider> &inout InHoverProvider)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetHoverProvider(InHoverProvider);
        return;
    }
    FVM_MinimapIconTooltip& opAssign(const FVM_MinimapIconTooltip &inout Other)
    {
        this.m_HoverProvider = Other.m_HoverProvider;
        this.m_Spot = Other.m_Spot;
        return Other.m_DropPreview;
    }
    void PostConstruct()
    {
        TEUIModelRef<FVM_MinimapIcon> local_2 = this.GetMinimapIcon();
        if (local_2)
        {
            this.SetSpot(local_2.opArrow().GetSpot());
            FSpotViewAdapter local_16;
            TDataObjectPtr<FPresentationConfig> local_40 = ::GetPresentationConfig(this.GetSpot().opArrow(), local_16);
            if (local_40)
            {
                TDataObjectPtr<FDropItemConfigBase> local_88 = local_40.opArrow().GetDropReward();
                if (local_88)
                {
                    this.SetDropPreview(TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, ::FCommonRewardListBuilder::BuildFromDropConfig(local_88))));
                }
            }
        }
        return;
    }
    FText GetSpotName() const
    {
        FSpotViewAdapter local_10;
        return ::GetSpotName(this.GetSpot().opArrow(), local_10);
    }
    FText GetSpotDescription() const
    {
        FSpotViewAdapter local_10;
        return ::GetSpotDescription(this.GetSpot().opArrow(), local_10);
    }
    bool HasMarkDecoractor() const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    FText GetMarkDecoractorText() const
    {
        FText local_28;
        if (this.GetSpot())
        {
            FSpotViewAdapter local_12;
            TEUIModelRef<FM_PresentationData_Mark> local_14 = ::GetMarkData(this.GetSpot().opArrow(), local_12);
            if (local_14)
            {
                TEUIModelRef<FM_Player> local_18 = local_14.opArrow().GetDisplayMarkPlayer();
                if (local_18)
                {
                    local_28 = FText::FromString(local_18.opArrow().GetNickName());
                    return FText::Format(NSLOCTEXT("Minimap", "MarkTooltipText", "{0}зљ„ж ‡и®°"), local_28);
                }
            }
        }
        return local_28;
    }
    bool CanGuideToTarget() const
    {
        FVM_MinimapIconHoverProvider& local_4;
        TEUIModelWeakRef<FVM_MinimapIconHoverProvider> local_2 = this.GetHoverProvider();
        if (local_4)
        {
            return local_4.GetbAllowGuide();
        }
        return false;
    }
    bool CanTeleportToTarget() const
    {
        FVM_MinimapIconHoverProvider& local_4;
        TEUIModelWeakRef<FVM_MinimapIconHoverProvider> local_2 = this.GetHoverProvider();
        if (local_4)
        {
            return local_4.GetbAllowTeleport();
        }
        return false;
    }
    bool CanMarkTarget() const
    {
        FVM_MinimapIconHoverProvider& local_4;
        int local_5;
        TEUIModelWeakRef<FVM_MinimapIconHoverProvider> local_2 = this.GetHoverProvider();
        if (local_4)
        {
            if (!(local_4.GetbAllowMark()))
            {
                local_5 = 0;
            }
            else
            {
                bool local_9 = ::MarkUtil::GetMarkConfigSetting().bMinimapAllowMarkEntity;
                local_5 = local_9;
            }
            return (local_5 != 0);
        }
        return false;
    }
    bool HasRewardPreview() const
    {
        return this.GetDropPreview().IsValid() || !(this.GetTextReward().IsEmpty());
    }
    FText GetTextReward() const
    {
        TDataObjectPtr<FPresentationConfig> local_24 = this.GetPresentationConfig();
        if (local_24)
        {
            return local_24.opArrow().TextReward;
        }
        return FText();
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetRewardPreviewItems() const
    {
        if (this.GetDropPreview().IsValid())
        {
            return this.GetDropPreview().opArrow().GetRewards();
        }
        return TArray<TEUIModelRef<FVM_CommonRewardItem>>();
    }
    void GuideToTarget()
    {
        FVM_MinimapIconHoverProvider& local_4;
        TEUIModelWeakRef<FVM_MinimapIconHoverProvider> local_2 = this.GetHoverProvider();
        if (local_4)
        {
            local_4.SetGuideTarget();
        }
        return;
    }
    void TeleportToTarget()
    {
        FVM_MinimapIconHoverProvider& local_4;
        TEUIModelWeakRef<FVM_MinimapIconHoverProvider> local_2 = this.GetHoverProvider();
        if (local_4)
        {
            local_4.TeleportToEntity();
        }
        return;
    }
    void MarkTarget()
    {
        FVM_MinimapIconHoverProvider& local_4;
        TEUIModelWeakRef<FVM_MinimapIconHoverProvider> local_2 = this.GetHoverProvider();
        if (local_4)
        {
            local_4.MarkEntity();
        }
        return;
    }
    void HandleSpotPresentationDataModified(const FMsg_SpotPresentationDataModified &inout Message)
    {
        if (int(Message.DataType) == 8)
        {
            this.UpdateTooltipActions();
        }
        return;
    }
    void UpdateTooltipActions()
    {
        int local_4 = 0;
        bool local_13;
        TEUIModelWeakRef<FVM_MinimapIconHoverProvider> local_2 = this.GetHoverProvider();
        if (!(local_4))
        {
            return;
        }
        UMinimapGlobalConfig local_10 = ::MinimapUtils::GetMinimapGlobalConfig();
        if (local_10 == nullptr)
        {
            return;
        }
        local_10.GuideAction.UnRegisterForModel(FEUIModelRef(this));
        local_10.CancelGuideAction.UnRegisterForModel(FEUIModelRef(this));
        local_10.TeleportAction.UnRegisterForModel(FEUIModelRef(this));
        local_10.MarkAction.UnRegisterForModel(FEUIModelRef(this));
        local_10.CancelMarkAction.UnRegisterForModel(FEUIModelRef(this));
        local_10.MarkAndGuideAction.UnRegisterForModel(FEUIModelRef(this));
        local_10.CancelMarkAndGuideAction.UnRegisterForModel(FEUIModelRef(this));
        local_13 = local_4.GetbAllowGuide();
        FSpotViewAdapter local_24;
        bool local_26 = local_13 && ::HasDecoractor(this.GetSpot().opArrow(), EPresentationSpotDecoractor(0), local_24);
        bool local_5 = local_4.GetbAllowMark();
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            local_5 = ::MarkUtil::GetMarkConfigSetting().bMinimapAllowMarkEntity;
        }
        bool local_27 = local_5 && ::HasDecoractor(this.GetSpot().opArrow(), EPresentationSpotDecoractor(1), local_24);
        bool local_32 = false;
        if (local_27)
        {
            TEUIModelRef<FM_Spot> local_16 = this.GetSpot();
            TEUIModelRef<FM_PresentationData_Mark> local_34 = ::GetMarkData(local_16.opArrow(), local_24);
            if (local_34)
            {
                local_32 = local_34.opArrow().IsMarkedByLocalPlayer();
            }
        }
        if ((local_13 && local_5))
        {
            if (local_26 || local_32)
            {
                local_10.CancelMarkAndGuideAction.DeferRegisterAction(FEUIModelRef(this), this.GetContext().UELocalPlayer, local_4, FVM_MinimapIconHoverProvider::CancelMarkAndGuideEntity);
            }
            else
            {
                local_10.MarkAndGuideAction.DeferRegisterAction(FEUIModelRef(this), this.GetContext().UELocalPlayer, local_4, FVM_MinimapIconHoverProvider::MarkAndGuideEntity);
            }
        }
        else
        {
            if (local_26)
            {
                local_10.CancelGuideAction.DeferRegisterAction(FEUIModelRef(this), this.GetContext().UELocalPlayer, local_4, FVM_MinimapIconHoverProvider::SetGuideTarget);
            }
            else
            {
                if (local_13)
                {
                    local_10.GuideAction.DeferRegisterAction(FEUIModelRef(this), this.GetContext().UELocalPlayer, local_4, FVM_MinimapIconHoverProvider::SetGuideTarget);
                }
            }
            if (local_32)
            {
                local_10.CancelMarkAction.DeferRegisterAction(FEUIModelRef(this), this.GetContext().UELocalPlayer, local_4, FVM_MinimapIconHoverProvider::MarkEntity);
            }
            else
            {
                if ((local_5 && !(local_27)))
                {
                    local_10.MarkAction.DeferRegisterAction(FEUIModelRef(this), this.GetContext().UELocalPlayer, local_4, FVM_MinimapIconHoverProvider::MarkEntity);
                }
            }
        }
        if (local_4.GetbAllowTeleport())
        {
            local_10.TeleportAction.DeferRegisterAction(FEUIModelRef(this), this.GetContext().UELocalPlayer, local_4, FVM_MinimapIconHoverProvider::TeleportToEntity);
        }
        return;
    }
    TEUIModelRef<FVM_MinimapIcon> GetMinimapIcon() const
    {
        FVM_MinimapIconHoverProvider& local_4;
        TEUIModelWeakRef<FVM_MinimapIconHoverProvider> local_2 = this.GetHoverProvider();
        if (local_4)
        {
            return local_4.GetMinimapIcon();
        }
        return TEUIModelRef<FVM_MinimapIcon>(nullptr);
    }
    TDataObjectPtr<FPresentationConfig> GetPresentationConfig() const
    {
        if (this.GetSpot())
        {
            FSpotViewAdapter local_12;
            return ::GetPresentationConfig(this.GetSpot().opArrow(), local_12);
        }
        return TDataObjectPtr<FPresentationConfig>(nullptr);
    }
    TEUIModelWeakRef<FVM_MinimapIconHoverProvider> GetHoverProvider() const property
    {
        this.TrackPropertyRead(0);
        return this.m_HoverProvider;
    }
    void SetHoverProvider(const TEUIModelWeakRef<FVM_MinimapIconHoverProvider> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_MinimapIconHoverProvider> local_2;
        local_2 = this.m_HoverProvider;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_HoverProvider = __Value;
        return;
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(1);
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
        this.MarkPropertyDirty(1);
        this.m_Spot = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonRewardList> GetDropPreview() const property
    {
        this.TrackPropertyRead(2);
        return this.m_DropPreview;
    }
    void SetDropPreview(const TEUIModelRef<FVM_CommonRewardList> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonRewardList> local_2;
        local_2 = this.m_DropPreview;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DropPreview = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MinimapIconTooltip
{
    UPROPERTY()
    FText SpotName;
    UPROPERTY()
    FText SpotDescription;
    UPROPERTY()
    bool HasMarkDecoractor;
    UPROPERTY()
    FText MarkDecoractorText;
    UPROPERTY()
    bool CanGuideToTarget;
    UPROPERTY()
    bool CanTeleportToTarget;
    UPROPERTY()
    bool CanMarkTarget;
    UPROPERTY()
    bool HasRewardPreview;
    UPROPERTY()
    FText TextReward;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> RewardPreviewItems;
    UPROPERTY()
    TEUIModelRef<FVM_MinimapIconTooltip> Self;


}

namespace FVM_MinimapIconTooltip
{
FVM_MinimapIconTooltip& Create(const UObject ContextObject, const TEUIModelWeakRef<FVM_MinimapIconHoverProvider> &inout HoverProvider)
{
    return FVM_MinimapIconTooltip::CreateByManager(EUIInternal::GetContextManager(ContextObject), HoverProvider);
}
FVM_MinimapIconTooltip CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FVM_MinimapIconHoverProvider> &inout HoverProvider)
{
    FVM_MinimapIconTooltip __r;
    TEUIModelRef<FVM_MinimapIconTooltip> local_6 = TEUIModelRef<FVM_MinimapIconTooltip>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MinimapIconTooltip::ModelId, 0, HoverProvider));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_MinimapIconTooltip;
}
void __HandleSpotPresentationDataModified(FVM_MinimapIconTooltip &inout Model, const FMsg_SpotPresentationDataModified &inout Message)
{
    Model.HandleSpotPresentationDataModified(Message);
    return;
}
TEUIModelRef<FVM_CommonRewardList> __UIGetter_DropPreview(const FVM_MinimapIconTooltip &inout Model)
{
    return Model.GetDropPreview();
}
FText __UIGetter_SpotName(const FVM_MinimapIconTooltip &inout Model)
{
    return Model.GetSpotName();
}
FText __UIGetter_SpotDescription(const FVM_MinimapIconTooltip &inout Model)
{
    return Model.GetSpotDescription();
}
bool __UIGetter_HasMarkDecoractor(const FVM_MinimapIconTooltip &inout Model)
{
    return Model.HasMarkDecoractor();
}
FText __UIGetter_MarkDecoractorText(const FVM_MinimapIconTooltip &inout Model)
{
    return Model.GetMarkDecoractorText();
}
bool __UIGetter_CanGuideToTarget(const FVM_MinimapIconTooltip &inout Model)
{
    return Model.CanGuideToTarget();
}
bool __UIGetter_CanTeleportToTarget(const FVM_MinimapIconTooltip &inout Model)
{
    return Model.CanTeleportToTarget();
}
bool __UIGetter_CanMarkTarget(const FVM_MinimapIconTooltip &inout Model)
{
    return Model.CanMarkTarget();
}
bool __UIGetter_HasRewardPreview(const FVM_MinimapIconTooltip &inout Model)
{
    return Model.HasRewardPreview();
}
FText __UIGetter_TextReward(const FVM_MinimapIconTooltip &inout Model)
{
    return Model.GetTextReward();
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_RewardPreviewItems(const FVM_MinimapIconTooltip &inout Model)
{
    return Model.GetRewardPreviewItems();
}
TEUIModelRef<FVM_MinimapIconTooltip> __UIGetter_Self(const FVM_MinimapIconTooltip &inout Model)
{
    return TEUIModelRef<FVM_MinimapIconTooltip>(Model);
}
int __IndexOf_HoverProvider()
{
    return 0;
}
int __IndexOf_Spot()
{
    return 1;
}
int __IndexOf_DropPreview()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MinimapIconTooltip
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
