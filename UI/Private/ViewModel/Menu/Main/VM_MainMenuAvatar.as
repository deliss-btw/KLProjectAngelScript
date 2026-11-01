enum EMainMenuAvatarBuildType
{
    None,
    Weapon,
    Talent,
    Talisman,
}

namespace FVM_MainMenuAvatarBuildTypeEntry
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnHoverChanged = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnEntryClick = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OpenEntry = FEUIModelCallbackSignature();
}
namespace FVM_MainMenuAvatarReturnBtnState
{
    const int ModelId = 0;
}
namespace FVM_MainMenuAvatar
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectAvatarByIndex = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoAvatarBuildPage = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoAvatarWeaponPage = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoAvatarWeaponPageWithModelRef = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoAvatarTalismanPage = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoAvatarTalismanPageWithModelRef = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoAvatarTalentPage = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoAvatarTalentPageWithModelRef = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnHoverEquipSlotChangedCallback = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSpecialtyHoverChangedCallback = FEUIModelCallbackSignature();

}
struct FVM_MainMenuAvatarBuildTypeEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipment> m_AvatarEquipment;
    UPROPERTY()
    TEUIModelRef<FVM_ComposableItem> m_ComposableItemVM;
    UPROPERTY()
    bool m_bIsLocked;
    UPROPERTY()
    bool m_bIsEmpty;
    UPROPERTY()
    bool m_bIsAvatarUnLocked;
    UPROPERTY()
    EEquipSlotType m_EquipSlotType;
    UPROPERTY()
    bool m_bIsHoverd;
    UPROPERTY()
    FOnHoverEquipSlotChanged m_OnHoverEquipSlotChanged;
    UPROPERTY()
    EMainMenuAvatarBuildType m_BuildType;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    FText m_SubTitle;
    UPROPERTY()
    FSlateBrush m_Icon;
    UPROPERTY()
    bool m_bIsNotAvailable;
    UPROPERTY()
    FLinearColor m_RarityColor;
    UPROPERTY()
    FSoftBrush m_RarityImage;
    UPROPERTY()
    FEUIModelRef m_HoverTipsModel;
    UPROPERTY()
    FSimpleEntryClick m_OnEnterClickCallback;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;

    FVM_MainMenuAvatarBuildTypeEntry()
    {
        this.m_BuildType = EMainMenuAvatarBuildType(0);
        this.m_bIsLocked = false;
        this.m_bIsEmpty = false;
        this.m_bIsAvatarUnLocked = false;
        this.m_EquipSlotType = EEquipSlotType(0);
        this.m_bIsHoverd = false;
        this.m_bIsNotAvailable = true;
        this.m_RarityColor = FLinearColor::White;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MainMenuAvatarBuildTypeEntry(const FVM_MainMenuAvatarBuildTypeEntry &inout Other)
    {
        this.m_BuildType = EMainMenuAvatarBuildType(0);
        this.m_bIsLocked = false;
        this.m_bIsEmpty = false;
        this.m_bIsAvatarUnLocked = false;
        this.m_EquipSlotType = EEquipSlotType(0);
        this.m_bIsHoverd = false;
        this.m_bIsNotAvailable = true;
        this.m_RarityColor = FLinearColor::White;
        this.m_AvatarEquipment = Other.m_AvatarEquipment;
        this.m_ComposableItemVM = Other.m_ComposableItemVM;
        this.m_bIsLocked = Other.m_bIsLocked;
        this.m_bIsEmpty = Other.m_bIsEmpty;
        this.m_bIsAvatarUnLocked = Other.m_bIsAvatarUnLocked;
        this.m_EquipSlotType = Other.m_EquipSlotType;
        this.m_bIsHoverd = Other.m_bIsHoverd;
        this.m_BuildType = Other.m_BuildType;
        this.m_Title = Other.m_Title;
        this.m_SubTitle = Other.m_SubTitle;
        this.m_Icon = Other.m_Icon;
        this.m_bIsNotAvailable = Other.m_bIsNotAvailable;
        this.m_RarityColor = Other.m_RarityColor;
        this.m_RarityImage = Other.m_RarityImage;
        this.m_HoverTipsModel = Other.m_HoverTipsModel;
        this.m_RedDotVM = Other.m_RedDotVM;
        return;
    }
    FVM_MainMenuAvatarBuildTypeEntry& opAssign(const FVM_MainMenuAvatarBuildTypeEntry &inout Other)
    {
        this.m_AvatarEquipment = Other.m_AvatarEquipment;
        this.m_ComposableItemVM = Other.m_ComposableItemVM;
        this.m_bIsLocked = Other.m_bIsLocked;
        this.m_bIsEmpty = Other.m_bIsEmpty;
        this.m_bIsAvatarUnLocked = Other.m_bIsAvatarUnLocked;
        this.m_EquipSlotType = Other.m_EquipSlotType;
        this.m_bIsHoverd = Other.m_bIsHoverd;
        this.m_BuildType = Other.m_BuildType;
        this.m_Title = Other.m_Title;
        this.m_SubTitle = Other.m_SubTitle;
        this.m_Icon = Other.m_Icon;
        this.m_bIsNotAvailable = Other.m_bIsNotAvailable;
        this.m_RarityColor = Other.m_RarityColor;
        this.m_RarityImage = Other.m_RarityImage;
        this.m_HoverTipsModel = Other.m_HoverTipsModel;
        return Other.m_RedDotVM;
    }
    void OnHoverChanged(const bool bIsHover)
    {
        EEquipSlotType local_4;
        if (!(this.GetbIsHoverd()) != (!(bIsHover)))
        {
            this.SetbIsHoverd(bIsHover);
            if (this.GetOnHoverEquipSlotChanged().IsBound())
            {
                if (this.GetbIsHoverd())
                {
                    local_4 = this.GetEquipSlotType();
                }
                else
                {
                    local_4 = EEquipSlotType(0);
                }
                this.GetOnHoverEquipSlotChanged().Execute(int(local_4));
            }
        }
        return;
    }
    int GetStateIndex() const
    {
        bool local_3 = ::FEquipmentUtils::IsTalismanSlot(this.GetEquipSlotType());
        if (local_3)
        {
            if (this.GetAvatarEquipment().Get().GetEquipmentSlotInfo().Get().GetbIsLocked())
            {
                return 2;
            }
            if (this.GetAvatarEquipment().Get().GetEquipmentSlotInfo().Get().GetbIsEmpty())
            {
                return 1;
            }
        }
        return 0;
    }
    void OnEntryClick()
    {
        if (this.GetOnEnterClickCallback().IsBound())
        {
            this.GetOnEnterClickCallback().Execute(FEUIModelRef(this));
        }
        return;
    }
    void OnAvatarEquipmentChanged()
    {
        bool local_8;
        TEUIModelRef<FVM_AvatarEquipment> local_2 = this.GetAvatarEquipment();
        if (!(local_2.IsValid()))
        {
            return;
        }
        this.ResetToEmpty();
        TEUIModelRef<FVM_AvatarEquipment> local_2_2 = this.GetAvatarEquipment();
        this.SetbIsAvatarUnLocked(local_2_2.Get().GetEquipmentSlotInfo().Get().GetbIsAvatarUnLocked());
        local_8 = !(this.GetbIsAvatarUnLocked()) || this.GetAvatarEquipment().Get().GetEquipmentSlotInfo().Get().GetbIsLocked();
        this.SetbIsLocked(local_8);
        TEUIModelRef<FVM_AvatarEquipment> local_2_4 = this.GetAvatarEquipment();
        this.SetbIsEmpty(local_2_4.Get().GetEquipmentSlotInfo().Get().GetbIsEmpty());
        TEUIModelRef<FVM_AvatarEquipment> local_2_5 = this.GetAvatarEquipment();
        this.SetEquipSlotType(local_2_5.Get().GetEquipSlot());
        TEUIModelRef<FVM_AvatarEquipment> local_2_6 = this.GetAvatarEquipment();
        TEUIModelRef<FVM_EquipmentInfo> local_14 = local_2_6.Get().GetEquipment();
        TEUIModelRef<FVM_EquipmentInfo> local_12;
        if (local_12.IsValid())
        {
            TEUIModelRef<FVM_AvatarEquipment> local_2_7 = this.GetAvatarEquipment();
            int64 local_22 = ::FEquipmentUtils::GetAvatarEquipmentUid(this.GetContext().GetLocalPlayer(), this.GetEquipSlotType(), local_2_7.Get().GetAvatarConfig());
            if (local_22 != 0)
            {
                TEUIModelRef<FM_ItemData> local_26 = ::FMS_ItemDataCache::Get(this.GetContext().Manager).RequireItemData(local_22);
                this.SetComposableItemVM(TEUIModelRef<FVM_ComposableItem>(::FVM_ComposableItem::Create(this.GetManager(), local_26, EItemDisplayScenario(5))));
            }
            if (int(this.GetEquipSlotType()) == 1 && !(this.GetbIsAvatarUnLocked()))
            {
                this.SetTitle(local_12.Get().GetWeaponCategoryFullName());
            }
            else
            {
                this.SetTitle(local_12.Get().GetEquipmentName());
            }
            this.SetIcon(local_12.Get().GetEquipmentIcon().LoadBrush());
            this.SetRarityColor(local_12.Get().GetEquipmentRarityColor());
            this.SetRarityImage(local_12.Get().GetEquipmentRarityImage());
        }
        if (!(this.GetbIsLocked()))
        {
            if (int(this.GetEquipSlotType()) == 1)
            {
                FRedDotNodeData local_138;
                TEUIModelRef<FVM_AvatarEquipment> local_2_8 = this.GetAvatarEquipment();
                int64 local_16 = local_2_8.Get().GetAvatarConfig().Get().DataId;
                local_138 = FRedDotNodeData(GameplayTags::RedDotSystem_Weapon_NewWeaponCanChange, local_16);
                this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, local_138)));
            }
            else
            {
                FRedDotNodeData local_138;
                if (int(this.GetEquipSlotType()) >= 2 && (int(this.GetEquipSlotType()) <= 5))
                {
                    int64 local_16_2 = int(this.GetEquipSlotType()) << 32;
                    TEUIModelRef<FVM_AvatarEquipment> local_2_9 = this.GetAvatarEquipment();
                    local_16_2 = local_16_2 | local_2_9.Get().GetAvatarConfig().Get().DataId;
                    local_138 = FRedDotNodeData(GameplayTags::RedDotSystem_Talisman_NewTalismanSlot, local_16_2);
                    this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, local_138)));
                }
            }
        }
        else
        {
            FRedDotNodeData local_138;
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, local_138)));
        }
        if (this.GetComposableItemVM().IsValid())
        {
            if (local_12.IsValid())
            {
                ::ComposableItemUtility::SetIsShowLevel(this.GetComposableItemVM().Get(), this.GetbIsAvatarUnLocked() && (local_12.Get().GetEquipmentLevel() > 0));
            }
            ::ComposableItemUtility::SetItemMaskEnable(this.GetComposableItemVM().Get(), this.GetbIsLocked());
            ::ComposableItemUtility::SetItemMaskType(this.GetComposableItemVM().Get(), 1);
        }
        return;
    }
    FVM_MainMenuAvatarBuildTypeEntry InitialzeAsWeapon(const TEUIModelRef<FVM_EquipmentInfo> &inout Equipment)
    {
        int local_202 = 0;
        FVM_MainMenuAvatarBuildTypeEntry __r;
        this.SetBuildType(EMainMenuAvatarBuildType(1));
        this.SetbIsNotAvailable(false);
        this.SetbIsLocked(false);
        if (Equipment)
        {
            this.SetTitle(Equipment.opArrow().GetEquipmentName());
            this.SetIcon(Equipment.opArrow().GetEquipmentIcon().LoadBrush());
            this.SetRarityColor(Equipment.opArrow().GetEquipmentRarityColor());
            this.SetRarityImage(Equipment.opArrow().GetEquipmentRarityImage());
            int64 local_112 = ::FEquipmentUtils::GetAvatarEquipmentUid(this.GetContext().GetLocalPlayer(), this.GetEquipSlotType(), this.GetAvatarEquipment().Get().GetAvatarConfig());
            if (local_112 != 0)
            {
                TEUIModelRef<FM_ItemData> local_116 = ::FMS_ItemDataCache::Get(this.GetContext().Manager).RequireItemData(local_112);
                this.SetComposableItemVM(TEUIModelRef<FVM_ComposableItem>(::FVM_ComposableItem::Create(this.GetManager(), local_116, EItemDisplayScenario(5))));
            }
            else
            {
                if (Equipment.opArrow().GetEquipmentConfig())
                {
                    CastTo local_174;
                    TDataObjectPtr<FItemConfig> local_198 = local_174.opCall();
                    this.SetComposableItemVM(TEUIModelRef<FVM_ComposableItem>(::FVM_ComposableItem::Create(this.GetContext().Manager, local_202.GetItemDataModel(), EItemDisplayScenario(5))));
                }
            }
            this.SetSubTitle(Equipment.opArrow().GetEquipmentLevelText());
        }
        else
        {
            FText local_6 = NSLOCTEXT("EntryWeapon", "武器");
            this.SetTitle(local_6);
            this.SetSubTitle(local_6);
            this.GetModify_Icon().TintColor = FSlateColor(FColor::Transparent);
        }
        this.SetHoverTipsModel(Equipment.opImplConv());
        return __r;
    }
    FVM_MainMenuAvatarBuildTypeEntry& InitialzeAsTalent(const TEUIModelRef<FVM_AvatarInfo> &inout AvatarInfo, const bool bAvatarUnLocked)
    {
        this.ResetToEmpty();
        this.SetbIsAvatarUnLocked(bAvatarUnLocked);
        bool local_1 = !(bAvatarUnLocked);
        if (local_1)
        {
            this.SetbIsLocked(true);
            this.SetSubTitle(NSLOCTEXT("TalentUnlockedText", "角色未解锁，无法查看此信息"));
            FVM_TitleAndDesc& local_10 = ::FVM_TitleAndDesc::Create(this.GetManager(), this.GetTitle(), this.GetSubTitle());
            this.BindTalentHoverTips(local_10, 1, false);
            FRedDotNodeData local_16;
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, local_16)));
        }
        else
        {
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Talent_Entrance, AvatarInfo.Get().GetAvatarConfig().Get().DataId))));
            TEUIModelRef<FM_TalentNode> local_26 = AvatarInfo.Get().GetFoundationNode();
            TEUIModelRef<FM_TalentNode> local_24;
            local_1 = !(local_24.IsValid());
            if (local_1)
            {
            }
            else
            {
                this.SetbIsLocked(false);
                this.SetTitle(local_24.Get().GetNodeName(0));
                this.SetSubTitle(local_24.Get().GetNodeDesc(0));
                TArray<TEUIModelWeakRef<FM_TalentTree>> local_34 = TEUIModelRef<FMS_Talent>(::FMS_Talent::Get(this.GetContext().Manager)).Get().GetTalentTreeListByAvatar(AvatarInfo.Get().GetAvatarConfig());
                for (auto& local_52 : local_34)
                {
                    FTalentLayoutTreeConfig local_168;
                    if (local_168.GetTalentBaseData().IsSet())
                    {
                        int local_285;
                        local_285 = local_168.GetTalentBaseData().Get().DataId;
                        if (local_285 == local_24.Get().GetConfig(0).Get().DataId)
                        {
                            this.SetIcon(local_52.Get().GetLayoutConfig().Get().TitleImage.LoadBrush());
                            break;
                        }
                    }
                }
                FVM_TitleAndDesc& local_10_2 = ::FVM_TitleAndDesc::Create(this.GetManager(), this.GetTitle(), this.GetSubTitle());
                local_1 = true;
                this.BindTalentHoverTips(local_10_2, 0, local_1);
            }
        }
        return local_1;
    }
    void BindTalentHoverTips(FVM_TitleAndDesc &inout TitleAndDesc, const int SwitcherIndex, const bool bShowClick)
    {
        TitleAndDesc.SetSwitcherIndex(SwitcherIndex);
        if (bShowClick)
        {
            TitleAndDesc.SetClickModelRef(FEUIModelRef(this));
            TitleAndDesc.SetbShowClick(true);
            TitleAndDesc.GetOnClickGoToCallback().Bind(this, FVM_MainMenuAvatarBuildTypeEntry::OpenEntry);
        }
        this.SetHoverTipsModel(FEUIModelRef(TitleAndDesc));
        return;
    }
    FVM_MainMenuAvatarBuildTypeEntry InitialzeAsRelic()
    {
        FVM_MainMenuAvatarBuildTypeEntry __r;
        this.SetBuildType(EMainMenuAvatarBuildType(3));
        this.SetTitle(NSLOCTEXT("EntryRelic", "灵饰"));
        this.GetModify_Icon().TintColor = FSlateColor(FColor::Transparent);
        return __r;
    }
    void ResetToEmpty()
    {
        this.SetHoverTipsModel(FEUIModelRef());
        this.SetBuildType(EMainMenuAvatarBuildType(2));
        this.SetbIsNotAvailable(true);
        this.SetTitle(FText());
        this.SetSubTitle(FText());
        this.GetModify_Icon().TintColor = FSlateColor(FColor::Transparent);
        this.SetRarityColor(FLinearColor::White);
        this.SetbIsEmpty(false);
        this.SetbIsLocked(true);
        this.SetbIsAvatarUnLocked(true);
        return;
    }
    FEUIModelRef GetHoverTips()
    {
        FVM_EquipHoverTips& local_2 = ::FVM_EquipHoverTips::Create(this.GetContext().Manager);
        local_2.SetDisplayName(this.GetTitle());
        local_2.SetEquipLevel(0);
        local_2.SetbIsShowLevel(false);
        local_2.SetClickModelRef(FEUIModelRef(this));
        local_2.GetOnClickGoToCallback().Bind(this, FVM_MainMenuAvatarBuildTypeEntry::OpenEntry);
        return FEUIModelRef(local_2);
    }
    bool OpenEntry(const FEUIModelRef &inout ModelRef)
    {
        int local_4 = 0;
        if (!(ModelRef.IsValid()))
        {
            return true;
        }
        if (!(this.GetbIsAvatarUnLocked()))
        {
            return true;
        }
        if (local_4.GetOnEnterClickCallback().IsBound())
        {
            local_4.GetOnEnterClickCallback().Execute(FEUIModelRef(this));
        }
        return true;
    }
    TEUIModelRef<FVM_AvatarEquipment> GetAvatarEquipment() const property
    {
        this.TrackPropertyRead(0);
        return this.m_AvatarEquipment;
    }
    void SetAvatarEquipment(const TEUIModelRef<FVM_AvatarEquipment> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipment> local_2;
        local_2 = this.m_AvatarEquipment;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarEquipment = __Value;
        return;
    }
    TEUIModelRef<FVM_ComposableItem> GetComposableItemVM() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ComposableItemVM;
    }
    void SetComposableItemVM(const TEUIModelRef<FVM_ComposableItem> &inout __Value) property
    {
        TEUIModelRef<FVM_ComposableItem> local_2;
        local_2 = this.m_ComposableItemVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ComposableItemVM = __Value;
        return;
    }
    bool GetbIsLocked() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsLocked;
    }
    void SetbIsLocked(const bool __Value) property
    {
        if (!(this.m_bIsLocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsLocked = __Value;
        return;
    }
    bool GetbIsEmpty() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bIsEmpty;
    }
    void SetbIsEmpty(const bool __Value) property
    {
        if (!(this.m_bIsEmpty) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bIsEmpty = __Value;
        return;
    }
    bool GetbIsAvatarUnLocked() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bIsAvatarUnLocked;
    }
    void SetbIsAvatarUnLocked(const bool __Value) property
    {
        if (!(this.m_bIsAvatarUnLocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bIsAvatarUnLocked = __Value;
        return;
    }
    EEquipSlotType GetEquipSlotType() const property
    {
        this.TrackPropertyRead(5);
        return this.m_EquipSlotType;
    }
    void SetEquipSlotType(const EEquipSlotType __Value) property
    {
        if (int(this.m_EquipSlotType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_EquipSlotType = __Value;
        return;
    }
    bool GetbIsHoverd() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bIsHoverd;
    }
    void SetbIsHoverd(const bool __Value) property
    {
        if (!(this.m_bIsHoverd) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bIsHoverd = __Value;
        return;
    }
    const FOnHoverEquipSlotChanged GetOnHoverEquipSlotChanged() const property
    {
        const FOnHoverEquipSlotChanged __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FOnHoverEquipSlotChanged GetModify_OnHoverEquipSlotChanged() property
    {
        FOnHoverEquipSlotChanged __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetOnHoverEquipSlotChanged(const FOnHoverEquipSlotChanged &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        return;
    }
    EMainMenuAvatarBuildType GetBuildType() const property
    {
        this.TrackPropertyRead(8);
        return this.m_BuildType;
    }
    void SetBuildType(const EMainMenuAvatarBuildType __Value) property
    {
        if (int(this.m_BuildType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_BuildType = __Value;
        return;
    }
    FText GetTitle() const property
    {
        FText __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FText GetModify_Title() property
    {
        FText __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_Title = __Value;
        return;
    }
    const FText GetSubTitle() const property
    {
        const FText __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FText GetModify_SubTitle() property
    {
        FText __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetSubTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_SubTitle = __Value;
        return;
    }
    FSlateBrush GetIcon() const property
    {
        FSlateBrush __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FSlateBrush GetModify_Icon() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetIcon(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_Icon = __Value;
        return;
    }
    bool GetbIsNotAvailable() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bIsNotAvailable;
    }
    void SetbIsNotAvailable(const bool __Value) property
    {
        if (!(this.m_bIsNotAvailable) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bIsNotAvailable = __Value;
        return;
    }
    FLinearColor GetRarityColor() const property
    {
        FLinearColor __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FLinearColor GetModify_RarityColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetRarityColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_RarityColor = __Value;
        return;
    }
    const FSoftBrush GetRarityImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FSoftBrush GetModify_RarityImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetRarityImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_RarityImage = __Value;
        return;
    }
    const FEUIModelRef GetHoverTipsModel() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    FEUIModelRef GetModify_HoverTipsModel() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetHoverTipsModel(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_HoverTipsModel = __Value;
        return;
    }
    const FSimpleEntryClick GetOnEnterClickCallback() const property
    {
        const FSimpleEntryClick __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    FSimpleEntryClick GetModify_OnEnterClickCallback() property
    {
        FSimpleEntryClick __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetOnEnterClickCallback(const FSimpleEntryClick &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(17);
        return this.m_RedDotVM;
    }
    void SetRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_RedDotVM = __Value;
        return;
    }
}

struct FVM_MainMenuAvatarReturnBtnState : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bIsHideReturnBtn;

    FVM_MainMenuAvatarReturnBtnState()
    {
        this.m_bIsHideReturnBtn = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MainMenuAvatarReturnBtnState(const FVM_MainMenuAvatarReturnBtnState &inout Other)
    {
        this.m_bIsHideReturnBtn = false;
        this.m_bIsHideReturnBtn = Other.m_bIsHideReturnBtn;
        return;
    }
    FVM_MainMenuAvatarReturnBtnState opAssign(const FVM_MainMenuAvatarReturnBtnState &inout Other)
    {
        FVM_MainMenuAvatarReturnBtnState __r;
        this.m_bIsHideReturnBtn = Other.m_bIsHideReturnBtn;
        return __r;
    }
    bool GetIsShowReturnBtn() const
    {
        return !(this.GetbIsHideReturnBtn());
    }
    void HandleMsgAvatarDetailPopInfo(const FMsg_AvatarDetailPopInfo &inout Msg)
    {
        this.SetbIsHideReturnBtn(Msg.bIsOpen);
        return;
    }
    bool GetbIsHideReturnBtn() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bIsHideReturnBtn;
    }
    void SetbIsHideReturnBtn(const bool __Value) property
    {
        if (!(this.m_bIsHideReturnBtn) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bIsHideReturnBtn = __Value;
        return;
    }
}

struct FVM_MainMenuAvatar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_SelectedAvatarIndex;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> m_SelectedAvatar;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipment> m_SelectedAvatarEquipment;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfo> m_HoveredEquipmentInfo;
    UPROPERTY()
    TEUIModelRef<FM_TalentNode> m_FoundationNode;
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> m_PlayerOwnedAvatarInfo;
    UPROPERTY()
    TArray<FEUIModelContainer> m_AvatarList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarInfo>> m_MainAvatarSpecialtyList;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarSpecialtyInfo> m_SelectedAvatarSpecialtyInfo;
    UPROPERTY()
    bool m_bIsShowSpecialtyHoverTips;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> m_WeaponEntry;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>> m_TalismanEquipments;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> m_Talisman1Entry;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> m_Talisman2Entry;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> m_Talisman3Entry;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> m_Talisman4Entry;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> m_TalentEntry;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> m_RelicEntry;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarShowcase> m_Showcase;
    UPROPERTY()
    EEquipSlotType m_HoveredEquipmentSlot;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipment> m_HoveredTalismanEquipment;
    UPROPERTY()
    TEUIModelRef<FVM_Text> m_HoverTalismanLockedTips;
    UPROPERTY()
    TEUIModelRef<FVM_EquipHoverTips> m_HoverTalismanEmptyTips;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarDetailInfo> m_AvatarDetailInfo;
    UPROPERTY()
    FGameplayTag m_RedDotNewAvatarTag;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_TrainingRedDotVM;
    UPROPERTY()
    bool m_bAvatarHasUnlockedTraining;
    UPROPERTY()
    bool m_bDisplayAttributeOrSkill;

    FVM_MainMenuAvatar()
    {
        this.m_SelectedAvatarIndex = INDEX_NONE;
        this.m_bIsShowSpecialtyHoverTips = false;
        this.m_HoveredEquipmentSlot = EEquipSlotType(0);
        this.m_bAvatarHasUnlockedTraining = false;
        this.m_bDisplayAttributeOrSkill = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MainMenuAvatar(const FVM_MainMenuAvatar &inout Other)
    {
        this.m_SelectedAvatarIndex = INDEX_NONE;
        this.m_bIsShowSpecialtyHoverTips = false;
        this.m_HoveredEquipmentSlot = EEquipSlotType(0);
        this.m_bAvatarHasUnlockedTraining = false;
        this.m_bDisplayAttributeOrSkill = false;
        this.m_SelectedAvatarIndex = int(Other.m_SelectedAvatarIndex);
        this.m_SelectedAvatar = Other.m_SelectedAvatar;
        this.m_SelectedAvatarEquipment = Other.m_SelectedAvatarEquipment;
        this.m_HoveredEquipmentInfo = Other.m_HoveredEquipmentInfo;
        this.m_FoundationNode = Other.m_FoundationNode;
        this.m_PlayerOwnedAvatarInfo = Other.m_PlayerOwnedAvatarInfo;
        this.m_AvatarList = Other.m_AvatarList;
        this.m_MainAvatarSpecialtyList = Other.m_MainAvatarSpecialtyList;
        this.m_SelectedAvatarSpecialtyInfo = Other.m_SelectedAvatarSpecialtyInfo;
        this.m_bIsShowSpecialtyHoverTips = Other.m_bIsShowSpecialtyHoverTips;
        this.m_WeaponEntry = Other.m_WeaponEntry;
        this.m_TalismanEquipments = Other.m_TalismanEquipments;
        this.m_Talisman1Entry = Other.m_Talisman1Entry;
        this.m_Talisman2Entry = Other.m_Talisman2Entry;
        this.m_Talisman3Entry = Other.m_Talisman3Entry;
        this.m_Talisman4Entry = Other.m_Talisman4Entry;
        this.m_TalentEntry = Other.m_TalentEntry;
        this.m_RelicEntry = Other.m_RelicEntry;
        this.m_Showcase = Other.m_Showcase;
        this.m_HoveredEquipmentSlot = Other.m_HoveredEquipmentSlot;
        this.m_HoveredTalismanEquipment = Other.m_HoveredTalismanEquipment;
        this.m_HoverTalismanLockedTips = Other.m_HoverTalismanLockedTips;
        this.m_HoverTalismanEmptyTips = Other.m_HoverTalismanEmptyTips;
        this.m_AvatarDetailInfo = Other.m_AvatarDetailInfo;
        this.m_RedDotNewAvatarTag = Other.m_RedDotNewAvatarTag;
        this.m_TrainingRedDotVM = Other.m_TrainingRedDotVM;
        this.m_bAvatarHasUnlockedTraining = Other.m_bAvatarHasUnlockedTraining;
        this.m_bDisplayAttributeOrSkill = Other.m_bDisplayAttributeOrSkill;
        return;
    }
    FVM_MainMenuAvatar opAssign(const FVM_MainMenuAvatar &inout Other)
    {
        FVM_MainMenuAvatar __r;
        this.m_SelectedAvatarIndex = int(Other.m_SelectedAvatarIndex);
        this.m_SelectedAvatar = Other.m_SelectedAvatar;
        this.m_SelectedAvatarEquipment = Other.m_SelectedAvatarEquipment;
        this.m_HoveredEquipmentInfo = Other.m_HoveredEquipmentInfo;
        this.m_FoundationNode = Other.m_FoundationNode;
        this.m_PlayerOwnedAvatarInfo = Other.m_PlayerOwnedAvatarInfo;
        this.m_AvatarList = Other.m_AvatarList;
        this.m_MainAvatarSpecialtyList = Other.m_MainAvatarSpecialtyList;
        this.m_SelectedAvatarSpecialtyInfo = Other.m_SelectedAvatarSpecialtyInfo;
        this.m_bIsShowSpecialtyHoverTips = Other.m_bIsShowSpecialtyHoverTips;
        this.m_WeaponEntry = Other.m_WeaponEntry;
        this.m_TalismanEquipments = Other.m_TalismanEquipments;
        this.m_Talisman1Entry = Other.m_Talisman1Entry;
        this.m_Talisman2Entry = Other.m_Talisman2Entry;
        this.m_Talisman3Entry = Other.m_Talisman3Entry;
        this.m_Talisman4Entry = Other.m_Talisman4Entry;
        this.m_TalentEntry = Other.m_TalentEntry;
        this.m_RelicEntry = Other.m_RelicEntry;
        this.m_Showcase = Other.m_Showcase;
        this.m_HoveredEquipmentSlot = Other.m_HoveredEquipmentSlot;
        this.m_HoveredTalismanEquipment = Other.m_HoveredTalismanEquipment;
        this.m_HoverTalismanLockedTips = Other.m_HoverTalismanLockedTips;
        this.m_HoverTalismanEmptyTips = Other.m_HoverTalismanEmptyTips;
        this.m_AvatarDetailInfo = Other.m_AvatarDetailInfo;
        this.m_RedDotNewAvatarTag = Other.m_RedDotNewAvatarTag;
        this.m_TrainingRedDotVM = Other.m_TrainingRedDotVM;
        this.m_bAvatarHasUnlockedTraining = Other.m_bAvatarHasUnlockedTraining;
        this.m_bDisplayAttributeOrSkill = Other.m_bDisplayAttributeOrSkill;
        return __r;
    }
    void LoadConfig(const FConfigVM_MainMenuAvatar &inout InConfig)
    {
        this.SetRedDotNewAvatarTag(InConfig.RedDotNewAvatarTag);
        return;
    }
    bool GetIsTalismanEntranceUnlock() const
    {
        if (this.GetSelectedAvatar().IsValid() && this.GetSelectedAvatar().Get().GetAvatar().IsValid() && this.GetSelectedAvatar().Get().GetAvatar().Get().GetbIsUnlocked())
        {
            return ::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(9), false);
        }
        return false;
    }
    bool GetIsWardrobeEntranceUnlock() const
    {
        return ::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(18), false);
    }
    bool GetIsTalentEntranceUnlock() const
    {
        return ::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(4), false);
    }
    bool IsShowTrainingAction() const
    {
        if (this.GetbDisplayAttributeOrSkill())
        {
            return false;
        }
        if (!(this.GetSelectedAvatar().IsValid()) || !(this.GetSelectedAvatar().Get().GetAvatar().IsValid()) || !(this.GetSelectedAvatar().Get().GetAvatar().Get().GetbIsUnlocked()))
        {
            return false;
        }
        if (!(this.GetbAvatarHasUnlockedTraining()))
        {
            return false;
        }
        return ::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(103), false);
    }
    bool IsShowHoverTipsForEquipment() const
    {
        return this.GetHoveredEquipmentInfo().IsValid();
    }
    bool IsShowHoverTalismanLocked() const
    {
        return this.GetHoveredTalismanEquipment().IsValid() && this.GetHoveredTalismanEquipment().Get().GetEquipmentSlotInfo().Get().GetbIsLocked();
    }
    bool IsShowHoverTalismanNotEquipped() const
    {
        return this.GetHoveredTalismanEquipment().IsValid() && this.GetHoveredTalismanEquipment().Get().GetEquipmentSlotInfo().Get().GetbIsEmpty();
    }
    bool IsSelectAvatarMainPlayer() const
    {
        if (this.GetSelectedAvatar().IsValid())
        {
            return this.GetSelectedAvatar().Get().GetAvatarConfig().Get().bIsMainPlayer;
        }
        return false;
    }
    bool IsShowSpecialtyEntry() const
    {
        bool local_2 = this.IsSelectAvatarMainPlayer();
        if (local_2)
        {
            return ::FMS_SystemControl::Get(::FASCommonUtils::GetLocalPlayerController()).IsSystemUnlock(ESystemModule(102), false);
        }
        return false;
    }
    void OnHoveredEquipmentSlotChanged()
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfo> local_4 = TEUIModelRef<FVM_AvatarEquipmentItemInfo>(FEUIModelRef());
        this.SetHoveredEquipmentInfo(local_4);
        this.SetHoveredTalismanEquipment(TEUIModelRef<FVM_AvatarEquipment>());
        if (this.GetSelectedAvatar().Get().GetAvatar().opArrow().GetbIsUnlocked())
        {
            switch (int(this.GetHoveredEquipmentSlot()))
            {
            case 1:
            {
                TEUIModelRef<FVM_AvatarEquipmentItemInfo> local_4_2 = TEUIModelRef<FVM_AvatarEquipmentItemInfo>(::FVM_AvatarEquipmentItemInfo::Create(this.GetManager(), this.GetWeaponEntry().Get().GetAvatarEquipment().opArrow().GetEquipment()));
                this.SetHoveredEquipmentInfo(local_4_2);
                break;
            }
            case 2:
            case 3:
            case 4:
            case 5:
            {
                int local_13 = int(this.GetHoveredEquipmentSlot()) - 2;
                this.SetHoveredTalismanEquipment(this.GetTalismanEquipments()[local_13].Get().GetAvatarEquipment());
                if (this.GetHoveredTalismanEquipment().IsValid() && this.GetHoveredTalismanEquipment().Get().GetEquipment().IsValid())
                {
                    TEUIModelRef<FVM_AvatarEquipmentItemInfo> local_4_3 = TEUIModelRef<FVM_AvatarEquipmentItemInfo>(::FVM_AvatarEquipmentItemInfo::Create(this.GetManager(), this.GetTalismanEquipments()[local_13].Get().GetAvatarEquipment().opArrow().GetEquipment()));
                    this.SetHoveredEquipmentInfo(local_4_3);
                }
                break;
            }
            }
            TEUIModelRef<FVM_AvatarEquipmentItemInfo> local_4_4 = this.GetHoveredEquipmentInfo();
            if (local_4_4.IsValid())
            {
                bool local_22 = false;
                TEUIModelRef<FVM_AvatarEquipmentItemInfo> local_4_5 = this.GetHoveredEquipmentInfo();
                local_4_5.Get().SetIsEquipmentDescriptionShow(local_22);
                TEUIModelRef<FVM_AvatarEquipmentItemInfo> local_4_6 = this.GetHoveredEquipmentInfo();
                local_4_6.Get().SetEquipSlot(this.GetHoveredEquipmentSlot());
                bool local_22_2 = true;
                TEUIModelRef<FVM_AvatarEquipmentItemInfo> local_4_7 = this.GetHoveredEquipmentInfo();
                local_4_7.Get().SetbShowGoToBtn(local_22_2);
            }
        }
        return;
    }
    void HandleTalismanSlotUnlockCountChange(const FMsg_TalismanSlotUnlockCountChange &inout Msg)
    {
        this.BuildTalismanEntries();
        return;
    }
    void HandleMsgAvatarDetailInfoChanged(const FMsg_AvatarDetailInfoChanged &inout Msg)
    {
        this.SetbDisplayAttributeOrSkill(Msg.bDisplayAttributeOrSkill);
        return;
    }
    void SetCurrentShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout InShowcase)
    {
        this.SetShowcase(InShowcase);
        this.RefreshShowcaseAvatars();
        return;
    }
    void SetCurrentSelectedAvatar(const TEUIModelRef<FVM_AvatarInfo> &inout NewAvatar)
    {
        int local_2 = INDEX_NONE;
        int local_1 = local_2;
        if (NewAvatar.IsValid())
        {
            int local_4 = 0;
            for (; local_4 < this.GetAvatarList().Num(); ++local_4)
            {
                FVM_AvatarInfo& local_10 = FEUIModelContainer::GetModel(this.GetAvatarList()[local_4]).opCall();
                if (local_10)
                {
                    if (local_10.GetAvatarConfig().Get().DataId == NewAvatar.Get().GetAvatarConfig().Get().DataId)
                    {
                        local_1 = local_4;
                        break;
                    }
                }
            }
        }
        if (local_1 != INDEX_NONE)
        {
            this.SetSelectedAvatarIndex(local_1);
        }
        return;
    }
    void OnAvatarTrainingClick()
    {
        int local_12 = 0;
        if (this.GetSelectedAvatar().IsNull())
        {
            return;
        }
        if (!(this.GetSelectedAvatar().Get().GetAvatar().opArrow().GetbIsUnlocked()))
        {
            return;
        }
        if (!(this.GetSelectedAvatar().Get().GetAvatarConfig().IsSet()))
        {
            return;
        }
        if (FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_TrainingEntry).IsValid())
        {
            return;
        }
        TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetSelectedAvatar();
        UEUIManagerSubsystem local_10 = this.GetManager();
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_TrainingEntry, FEUIModelRef(local_12));
        return;
    }
    void RefreshTrainingRedDotVM()
    {
        TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetSelectedAvatar();
        if (!(local_2.IsValid()) || !(this.GetSelectedAvatar().Get().GetAvatarConfig().IsSet()))
        {
            return;
        }
        bool local_4 = false;
        bool local_3 = ::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(103), local_4);
        if (!(local_3))
        {
            return;
        }
        TEUIModelRef<FVM_AvatarInfo> local_2_2 = this.GetSelectedAvatar();
        this.SetTrainingRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_AvatarTraining, local_2_2.Get().GetAvatarConfig().Get().DataId))));
        return;
    }
    void RefreshAvatarHasUnlockedTraining()
    {
        bool local_1 = false;
        if (this.GetSelectedAvatar().IsValid() && this.GetSelectedAvatar().Get().GetAvatarConfig().IsSet())
        {
            local_1 = ::FMS_TrainingModel::Get(this.GetManager()).HasUnlockedTraining(this.GetSelectedAvatar().Get().GetAvatarConfig());
        }
        if (!(this.GetbAvatarHasUnlockedTraining()) != !(local_1))
        {
            this.SetbAvatarHasUnlockedTraining(local_1);
        }
        return;
    }
    void OnTrainingStateChanged(const FMsg_TrainingStateChanged &inout Msg)
    {
        this.RefreshAvatarHasUnlockedTraining();
        this.RefreshTrainingRedDotVM();
        return;
    }
    void PostConstruct()
    {
        this.SetPlayerOwnedAvatarInfo(TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>(::FVMS_PlayerOwnedAvatarInfo::Get(this.GetManager())));
        this.SetHoverTalismanLockedTips(TEUIModelRef<FVM_Text>(::FVM_Text::Create(this.GetManager(), NSLOCTEXT("HoverTalismanUnlockedText", "该灵饰槽位未解锁"))));
        this.SetHoverTalismanEmptyTips(TEUIModelRef<FVM_EquipHoverTips>(::FVM_EquipHoverTips::Create(this.GetManager())));
        this.GetHoverTalismanEmptyTips().Get().SetDisplayName(NSLOCTEXT("HoverTalismanEmptyText", "未装备灵饰"));
        this.GetHoverTalismanEmptyTips().Get().SetbIsShowLevel(false);
        this.GetHoverTalismanEmptyTips().Get().GetOnClickGoToCallback().Bind(this, FVM_MainMenuAvatar::GotoAvatarTalismanPageWithModelRef);
        this.SetWeaponEntry(TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>(::FVM_MainMenuAvatarBuildTypeEntry::Create(this.GetManager())));
        this.GetWeaponEntry().Get().SetEquipSlotType(EEquipSlotType(1));
        this.GetWeaponEntry().Get().GetOnEnterClickCallback().Bind(this, FVM_MainMenuAvatar::GotoAvatarWeaponPageWithModelRef);
        this.GetWeaponEntry().Get().GetOnHoverEquipSlotChanged().Bind(this, FVM_MainMenuAvatar::OnHoverEquipSlotChangedCallback);
        this.BuildTalismanEntries();
        this.SetTalentEntry(TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>(::FVM_MainMenuAvatarBuildTypeEntry::Create(this.GetManager())));
        this.GetTalentEntry().Get().SetEquipSlotType(EEquipSlotType(0));
        this.GetTalentEntry().Get().GetOnEnterClickCallback().Bind(this, FVM_MainMenuAvatar::GotoAvatarTalentPageWithModelRef);
        this.SetAvatarDetailInfo(TEUIModelRef<FVM_AvatarDetailInfo>(::FVM_AvatarDetailInfo::Create(this.GetManager())));
        this.UpdateAvatarList();
        this.SetSelectedAvatarIndex(0);
        int local_22 = 0;
        for (; local_22 < this.GetAvatarList().Num(); ++local_22)
        {
            FVM_AvatarInfo& local_28 = FEUIModelContainer::GetModel(this.GetAvatarList()[local_22]).opCall();
            if (local_28)
            {
                if (local_28.GetSlotIndex() == 0)
                {
                    this.SetSelectedAvatarIndex(local_22);
                    break;
                }
            }
        }
        this.RefreshAvatarHasUnlockedTraining();
        this.RefreshTrainingRedDotVM();
        return;
    }
    void UpdateAvatarList()
    {
        int local_8 = ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData().Get().GetPlayerSpecialtyID();
        this.GetModify_MainAvatarSpecialtyList().Empty(0);
        ::FMS_PlayerAvatarData::Get(this.GetContext().Manager).RefreshAvatarListEntryRedDot();
        TArray<FEUIModelContainer> local_14;
        TArray<TEUIModelRef<FVM_AvatarInfo>> local_20 = this.GetPlayerOwnedAvatarInfo().Get().GetAllConfigAvatars();
        int local_21 = 0;
        for (; local_21 < local_20.Num(); ++local_21)
        {
            int local_23 = local_20[local_21].Get().GetAvatarConfig().Get().bIsMainPlayer;
            if (local_23 != 0)
            {
                this.GetModify_MainAvatarSpecialtyList().Add(local_20[local_21]);
                if (local_20[local_21].Get().GetAvatarConfig().Get().DataId != local_8)
                {
                    continue;
                }
            }
            FEUIModelContainer local_38;
            local_23 = 0;
            FEUIModelRef local_40;
            local_40;
            local_38.AddModel(local_40, local_20[local_21]);
            int64 local_46 = local_20[local_21].Get().GetAvatarConfig().Get().DataId;
            FVM_RedDot& local_48 = ::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Avatar_ListEntry, local_46));
            local_38.AddModel(FEUIModelRef(local_48), false);
            local_14.Add(local_38);
        }
        this.SetAvatarList(local_14);
        return;
    }
    void OnSelectedAvatarIndexChanged()
    {
        if (this.GetAvatarList().IsValidIndex(this.GetSelectedAvatarIndex()))
        {
            this.SetSelectedAvatar(TEUIModelRef<FVM_AvatarInfo>(FEUIModelContainer::GetModel(this.GetAvatarList()[this.GetSelectedAvatarIndex()]).opCall()));
            this.SetSelectedAvatarEquipment(this.GetSelectedAvatar().opArrow().GetAvatarEquipment());
            this.SetFoundationNode(this.GetSelectedAvatar().opArrow().GetFoundationNode());
            this.GetTalentEntry().Get().InitialzeAsTalent(this.GetSelectedAvatar(), this.GetSelectedAvatar().Get().GetAvatar().opArrow().GetbIsUnlocked());
            this.RefreshEntries();
            this.RefreshShowcaseAvatars();
            this.GetAvatarDetailInfo().Get().SetCurrentAvatar(this.GetSelectedAvatar().Get().GetAvatar());
            this.GetAvatarDetailInfo().Get().TrySetShowAttributeOrSkill(this.GetbDisplayAttributeOrSkill());
            if (this.GetSelectedAvatar().Get().GetAvatarConfig().IsSet())
            {
                int64 local_22 = this.GetSelectedAvatar().Get().GetAvatarConfig().Get().DataId;
                ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(this.GetRedDotNewAvatarTag(), local_22);
                ::FMS_PlayerAvatarData::Get(this.GetContext().Manager).RefreshAvatarListEntryRedDot();
            }
            this.RefreshTrainingRedDotVM();
            this.RefreshAvatarHasUnlockedTraining();
        }
        return;
    }
    void UpdateWeaponEntry()
    {
        this.GetWeaponEntry().Get().InitialzeAsWeapon(this.GetSelectedAvatarEquipment().opArrow().GetEquipment());
        return;
    }
    void OnFoundationNodeChanged()
    {
        if (this.GetTalentEntry().IsValid() && this.GetSelectedAvatar().IsValid())
        {
            this.GetTalentEntry().Get().InitialzeAsTalent(this.GetSelectedAvatar(), this.GetSelectedAvatar().Get().GetAvatar().opArrow().GetbIsUnlocked());
        }
        return;
    }
    void SelectAvatarByIndex(const int Index)
    {
        if (Index == INDEX_NONE)
        {
            return;
        }
        this.SetSelectedAvatarIndex(Index);
        return;
    }
    void GotoAvatarBuildPage()
    {
        ::FVM_AvatarBuildPage::GotoPage(this.GetContext().UELocalPlayer, this.GetSelectedAvatar().opArrow().GetAvatarConfig());
        return;
    }
    bool GotoAvatarWeaponPage()
    {
        if (!(this.GetSelectedAvatar().Get().GetAvatar().opArrow().GetbIsUnlocked()))
        {
            return false;
        }
        ::AvatarEquipmentMainUtil::GotoPage(this.GetContext().UELocalPlayer, EEquipSlotType(1), this.GetSelectedAvatar().opArrow().GetAvatarConfig());
        return true;
    }
    bool GotoAvatarWeaponPageWithModelRef(const FEUIModelRef &inout ModelRef)
    {
        if (this.GotoAvatarWeaponPage())
        {
            Get local_8;
            FVM_MainMenuAvatarBuildTypeEntry& local_4 = local_8.opCall();
            if (local_4)
            {
                if (local_4.GetRedDotVM().IsValid() && local_4.GetRedDotVM().Get().HasRedDot())
                {
                    ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(local_4.GetRedDotVM().Get().GetNodeData());
                    ::FMS_PlayerAvatarData::Get(this.GetContext().Manager).RefreshAvatarListEntryRedDot();
                }
            }
        }
        return true;
    }
    bool GotoAvatarTalismanPage()
    {
        if (!(this.GetSelectedAvatar().Get().GetAvatar().opArrow().GetbIsUnlocked()))
        {
            return false;
        }
        bool local_5 = ::FEquipmentUtils::IsTalismanSlot(this.GetHoveredEquipmentSlot());
        if (!(local_5))
        {
            return false;
        }
        if (this.IsShowHoverTalismanLocked())
        {
            return false;
        }
        ::AvatarEquipmentMainUtil::GotoPage(this.GetContext().UELocalPlayer, this.GetHoveredEquipmentSlot(), this.GetSelectedAvatar().opArrow().GetAvatarConfig());
        return true;
    }
    bool GotoAvatarTalismanPageWithModelRef(const FEUIModelRef &inout ModelRef)
    {
        if (this.GotoAvatarTalismanPage())
        {
            Get local_8;
            FVM_MainMenuAvatarBuildTypeEntry& local_4 = local_8.opCall();
            if (local_4)
            {
                if (local_4.GetRedDotVM().IsValid() && local_4.GetRedDotVM().Get().HasRedDot())
                {
                    if (this.GetTalisman1Entry().Get().GetRedDotVM().IsValid())
                    {
                        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(this.GetTalisman1Entry().Get().GetRedDotVM().Get().GetNodeData());
                    }
                    if (this.GetTalisman2Entry().Get().GetRedDotVM().IsValid())
                    {
                        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(this.GetTalisman2Entry().Get().GetRedDotVM().Get().GetNodeData());
                    }
                    if (this.GetTalisman3Entry().Get().GetRedDotVM().IsValid())
                    {
                        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(this.GetTalisman3Entry().Get().GetRedDotVM().Get().GetNodeData());
                    }
                    if (this.GetTalisman4Entry().Get().GetRedDotVM().IsValid())
                    {
                        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(this.GetTalisman4Entry().Get().GetRedDotVM().Get().GetNodeData());
                    }
                    ::FMS_PlayerAvatarData::Get(this.GetContext().Manager).RefreshAvatarListEntryRedDot();
                }
            }
        }
        return true;
    }
    bool GotoAvatarTalentPage()
    {
        if (!(::FVM_TalentEditPage::CanViewAvatarTalent(this.GetContext().Manager, this.GetSelectedAvatar().opArrow().GetAvatarConfig())))
        {
            return true;
        }
        ::FVM_TalentEditPage::GotoPage(this.GetContext().UELocalPlayer, this.GetSelectedAvatar().opArrow().GetAvatarConfig());
        return true;
    }
    bool GotoAvatarTalentPageWithModelRef(const FEUIModelRef &inout ModelRef)
    {
        this.GotoAvatarTalentPage();
        return true;
    }
    bool OnHoverEquipSlotChangedCallback(const int EquipSlotTypeIndex)
    {
        this.SetHoveredEquipmentSlot(EEquipSlotType(EquipSlotTypeIndex));
        return true;
    }
    void RefreshEntries()
    {
        if (!(this.GetSelectedAvatar().IsValid()))
        {
            return;
        }
        TEUIModelRef<FVM_AvatarEquipment> local_8 = this.GetSelectedAvatarEquipment();
        this.GetWeaponEntry().Get().SetAvatarEquipment(local_8);
        int local_9 = 0;
        for (; local_9 < this.GetTalismanEquipments().Num(); ++local_9)
        {
            if (this.GetSelectedAvatar().opArrow().GetTalismanEquipments().IsValidIndex(local_9))
            {
                this.GetTalismanEquipments()[local_9].Get().SetAvatarEquipment(this.GetSelectedAvatar().opArrow().GetTalismanEquipments()[local_9]);
                continue;
            }
            this.GetTalismanEquipments()[local_9].Get().SetAvatarEquipment(local_8);
        }
        TEUIModelRef<FVM_AvatarSpecialtyInfo> local_18 = TEUIModelRef<FVM_AvatarSpecialtyInfo>(::FVM_AvatarSpecialtyInfo::Create(this.GetManager(), this.GetSelectedAvatar().opArrow().GetAvatarConfig()));
        this.SetSelectedAvatarSpecialtyInfo(local_18);
        TEUIModelRef<FVM_AvatarSpecialtyInfo> local_18_2 = this.GetSelectedAvatarSpecialtyInfo();
        local_18_2.Get().GetOnHoverChanged().Bind(this, FVM_MainMenuAvatar::OnSpecialtyHoverChangedCallback);
        if ((int(this.GetHoveredEquipmentSlot())) != 0)
        {
            this.OnHoveredEquipmentSlotChanged();
        }
        return;
    }
    bool OnSpecialtyHoverChangedCallback(const bool bHovered)
    {
        this.SetbIsShowSpecialtyHoverTips(false);
        if (this.GetSelectedAvatarSpecialtyInfo().IsValid())
        {
            if (bHovered && this.GetSelectedAvatarSpecialtyInfo().Get().GetbIsHover())
            {
                this.SetbIsShowSpecialtyHoverTips(this.GetSelectedAvatarSpecialtyInfo().Get().GetbIsMainPlayer());
            }
        }
        return true;
    }
    void OnSpecialtyMainPlayerChanged()
    {
        bool local_1 = false;
        if (this.GetSelectedAvatarSpecialtyInfo().IsValid())
        {
            local_1 = this.GetSelectedAvatarSpecialtyInfo().Get().GetbIsMainPlayer();
        }
        this.SetbIsShowSpecialtyHoverTips(this.GetbIsShowSpecialtyHoverTips() && local_1);
        return;
    }
    void BuildTalismanEntries()
    {
        if (this.GetTalismanEquipments().IsEmpty())
        {
            this.SetTalisman1Entry(TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>(::FVM_MainMenuAvatarBuildTypeEntry::Create(this.GetManager())));
            this.GetTalisman1Entry().Get().SetEquipSlotType(EEquipSlotType(2));
            this.GetTalisman1Entry().Get().GetOnEnterClickCallback().Bind(this, FVM_MainMenuAvatar::GotoAvatarTalismanPageWithModelRef);
            this.GetTalisman1Entry().Get().GetOnHoverEquipSlotChanged().Bind(this, FVM_MainMenuAvatar::OnHoverEquipSlotChangedCallback);
            this.GetModify_TalismanEquipments().Add(this.GetTalisman1Entry());
            this.SetTalisman2Entry(TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>(::FVM_MainMenuAvatarBuildTypeEntry::Create(this.GetManager())));
            this.GetTalisman2Entry().Get().SetEquipSlotType(EEquipSlotType(3));
            this.GetTalisman2Entry().Get().GetOnEnterClickCallback().Bind(this, FVM_MainMenuAvatar::GotoAvatarTalismanPageWithModelRef);
            this.GetTalisman2Entry().Get().GetOnHoverEquipSlotChanged().Bind(this, FVM_MainMenuAvatar::OnHoverEquipSlotChangedCallback);
            this.GetModify_TalismanEquipments().Add(this.GetTalisman2Entry());
            this.SetTalisman3Entry(TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>(::FVM_MainMenuAvatarBuildTypeEntry::Create(this.GetManager())));
            this.GetTalisman3Entry().Get().SetEquipSlotType(EEquipSlotType(4));
            this.GetTalisman3Entry().Get().GetOnEnterClickCallback().Bind(this, FVM_MainMenuAvatar::GotoAvatarTalismanPageWithModelRef);
            this.GetTalisman3Entry().Get().GetOnHoverEquipSlotChanged().Bind(this, FVM_MainMenuAvatar::OnHoverEquipSlotChangedCallback);
            this.GetModify_TalismanEquipments().Add(this.GetTalisman3Entry());
            this.SetTalisman4Entry(TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>(::FVM_MainMenuAvatarBuildTypeEntry::Create(this.GetManager())));
            this.GetTalisman4Entry().Get().SetEquipSlotType(EEquipSlotType(5));
            this.GetTalisman4Entry().Get().GetOnEnterClickCallback().Bind(this, FVM_MainMenuAvatar::GotoAvatarTalismanPageWithModelRef);
            this.GetTalisman4Entry().Get().GetOnHoverEquipSlotChanged().Bind(this, FVM_MainMenuAvatar::OnHoverEquipSlotChangedCallback);
            this.GetModify_TalismanEquipments().Add(this.GetTalisman4Entry());
        }
        return;
    }
    void RefreshShowcaseAvatars()
    {
        if (!(this.GetShowcase()))
        {
            return;
        }
        if (!(this.GetSelectedAvatar()))
        {
            this.GetShowcase().Get().SetNextAvatarEntries(TArray<FAvatarShowcaseEntry>());
            return;
        }
        TArray<FAvatarShowcaseEntry> local_14;
        FAvatarShowcaseEntry local_62;
        TDataObjectPtr<FAvatarPrefabConfig> local_86 = this.GetSelectedAvatar().Get().GetAvatarConfig();
        local_62.AvatarConfig = local_86;
        if (this.GetSelectedAvatarEquipment())
        {
            TEUIModelRef<FVM_EquipmentInfo> local_116 = this.GetSelectedAvatarEquipment().Get().GetEquipment();
            TEUIModelRef<FVM_EquipmentInfo> local_114;
            if (local_114)
            {
                if (local_114.Get().GetEquipmentConfig())
                {
                    CastTo local_168;
                    TDataObjectPtr<FWeaponConfig> local_192 = local_168.opCall();
                    if (local_192)
                    {
                        local_62.WeaponConfig = local_192;
                    }
                }
            }
            else
            {
                local_62.WeaponConfig = local_86.Get().GetDefaultWeapon();
            }
        }
        local_14.Add(local_62);
        this.GetShowcase().Get().SetNextAvatarEntries(local_14);
        return;
    }
    int GetSelectedAvatarIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SelectedAvatarIndex;
    }
    void SetSelectedAvatarIndex(const int __Value) property
    {
        if (this.m_SelectedAvatarIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SelectedAvatarIndex = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarInfo> GetSelectedAvatar() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SelectedAvatar;
    }
    void SetSelectedAvatar(const TEUIModelRef<FVM_AvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarInfo> local_2;
        local_2 = this.m_SelectedAvatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectedAvatar = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipment> GetSelectedAvatarEquipment() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SelectedAvatarEquipment;
    }
    void SetSelectedAvatarEquipment(const TEUIModelRef<FVM_AvatarEquipment> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipment> local_2;
        local_2 = this.m_SelectedAvatarEquipment;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SelectedAvatarEquipment = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfo> GetHoveredEquipmentInfo() const property
    {
        this.TrackPropertyRead(3);
        return this.m_HoveredEquipmentInfo;
    }
    void SetHoveredEquipmentInfo(const TEUIModelRef<FVM_AvatarEquipmentItemInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfo> local_2;
        local_2 = this.m_HoveredEquipmentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_HoveredEquipmentInfo = __Value;
        return;
    }
    TEUIModelRef<FM_TalentNode> GetFoundationNode() const property
    {
        this.TrackPropertyRead(4);
        return this.m_FoundationNode;
    }
    void SetFoundationNode(const TEUIModelRef<FM_TalentNode> &inout __Value) property
    {
        TEUIModelRef<FM_TalentNode> local_2;
        local_2 = this.m_FoundationNode;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_FoundationNode = __Value;
        return;
    }
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> GetPlayerOwnedAvatarInfo() const property
    {
        this.TrackPropertyRead(5);
        return this.m_PlayerOwnedAvatarInfo;
    }
    void SetPlayerOwnedAvatarInfo(const TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> local_2;
        local_2 = this.m_PlayerOwnedAvatarInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_PlayerOwnedAvatarInfo = __Value;
        return;
    }
    TArray<FEUIModelContainer> GetAvatarList() const property
    {
        TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_AvatarList() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetAvatarList(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_AvatarList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarInfo>> GetMainAvatarSpecialtyList() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarInfo>> GetModify_MainAvatarSpecialtyList() property
    {
        TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetMainAvatarSpecialtyList(const TArray<TEUIModelRef<FVM_AvatarInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_MainAvatarSpecialtyList = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarSpecialtyInfo> GetSelectedAvatarSpecialtyInfo() const property
    {
        this.TrackPropertyRead(8);
        return this.m_SelectedAvatarSpecialtyInfo;
    }
    void SetSelectedAvatarSpecialtyInfo(const TEUIModelRef<FVM_AvatarSpecialtyInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarSpecialtyInfo> local_2;
        local_2 = this.m_SelectedAvatarSpecialtyInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_SelectedAvatarSpecialtyInfo = __Value;
        return;
    }
    bool GetbIsShowSpecialtyHoverTips() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bIsShowSpecialtyHoverTips;
    }
    void SetbIsShowSpecialtyHoverTips(const bool __Value) property
    {
        if (!(this.m_bIsShowSpecialtyHoverTips) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bIsShowSpecialtyHoverTips = __Value;
        return;
    }
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> GetWeaponEntry() const property
    {
        this.TrackPropertyRead(10);
        return this.m_WeaponEntry;
    }
    void SetWeaponEntry(const TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> local_2;
        local_2 = this.m_WeaponEntry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_WeaponEntry = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>> GetTalismanEquipments() const property
    {
        const TArray<TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>> __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    TArray<TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>> GetModify_TalismanEquipments() property
    {
        TArray<TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>> __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetTalismanEquipments(const TArray<TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_TalismanEquipments = __Value;
        return;
    }
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> GetTalisman1Entry() const property
    {
        this.TrackPropertyRead(12);
        return this.m_Talisman1Entry;
    }
    void SetTalisman1Entry(const TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> local_2;
        local_2 = this.m_Talisman1Entry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_Talisman1Entry = __Value;
        return;
    }
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> GetTalisman2Entry() const property
    {
        this.TrackPropertyRead(13);
        return this.m_Talisman2Entry;
    }
    void SetTalisman2Entry(const TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> local_2;
        local_2 = this.m_Talisman2Entry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_Talisman2Entry = __Value;
        return;
    }
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> GetTalisman3Entry() const property
    {
        this.TrackPropertyRead(14);
        return this.m_Talisman3Entry;
    }
    void SetTalisman3Entry(const TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> local_2;
        local_2 = this.m_Talisman3Entry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_Talisman3Entry = __Value;
        return;
    }
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> GetTalisman4Entry() const property
    {
        this.TrackPropertyRead(15);
        return this.m_Talisman4Entry;
    }
    void SetTalisman4Entry(const TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> local_2;
        local_2 = this.m_Talisman4Entry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_Talisman4Entry = __Value;
        return;
    }
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> GetTalentEntry() const property
    {
        this.TrackPropertyRead(16);
        return this.m_TalentEntry;
    }
    void SetTalentEntry(const TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> local_2;
        local_2 = this.m_TalentEntry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_TalentEntry = __Value;
        return;
    }
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> GetRelicEntry() const property
    {
        this.TrackPropertyRead(17);
        return this.m_RelicEntry;
    }
    void SetRelicEntry(const TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> local_2;
        local_2 = this.m_RelicEntry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_RelicEntry = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarShowcase> GetShowcase() const property
    {
        this.TrackPropertyRead(18);
        return this.m_Showcase;
    }
    void SetShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarShowcase> local_2;
        local_2 = this.m_Showcase;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_Showcase = __Value;
        return;
    }
    EEquipSlotType GetHoveredEquipmentSlot() const property
    {
        this.TrackPropertyRead(19);
        return this.m_HoveredEquipmentSlot;
    }
    void SetHoveredEquipmentSlot(const EEquipSlotType __Value) property
    {
        if (int(this.m_HoveredEquipmentSlot) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_HoveredEquipmentSlot = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipment> GetHoveredTalismanEquipment() const property
    {
        this.TrackPropertyRead(20);
        return this.m_HoveredTalismanEquipment;
    }
    void SetHoveredTalismanEquipment(const TEUIModelRef<FVM_AvatarEquipment> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipment> local_2;
        local_2 = this.m_HoveredTalismanEquipment;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_HoveredTalismanEquipment = __Value;
        return;
    }
    TEUIModelRef<FVM_Text> GetHoverTalismanLockedTips() const property
    {
        this.TrackPropertyRead(21);
        return this.m_HoverTalismanLockedTips;
    }
    void SetHoverTalismanLockedTips(const TEUIModelRef<FVM_Text> &inout __Value) property
    {
        TEUIModelRef<FVM_Text> local_2;
        local_2 = this.m_HoverTalismanLockedTips;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_HoverTalismanLockedTips = __Value;
        return;
    }
    TEUIModelRef<FVM_EquipHoverTips> GetHoverTalismanEmptyTips() const property
    {
        this.TrackPropertyRead(22);
        return this.m_HoverTalismanEmptyTips;
    }
    void SetHoverTalismanEmptyTips(const TEUIModelRef<FVM_EquipHoverTips> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipHoverTips> local_2;
        local_2 = this.m_HoverTalismanEmptyTips;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_HoverTalismanEmptyTips = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarDetailInfo> GetAvatarDetailInfo() const property
    {
        this.TrackPropertyRead(23);
        return this.m_AvatarDetailInfo;
    }
    void SetAvatarDetailInfo(const TEUIModelRef<FVM_AvatarDetailInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarDetailInfo> local_2;
        local_2 = this.m_AvatarDetailInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_AvatarDetailInfo = __Value;
        return;
    }
    const FGameplayTag GetRedDotNewAvatarTag() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(24);
        return __r;
    }
    FGameplayTag GetModify_RedDotNewAvatarTag() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(24);
        return __r;
    }
    void SetRedDotNewAvatarTag(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_RedDotNewAvatarTag = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetTrainingRedDotVM() const property
    {
        this.TrackPropertyRead(25);
        return this.m_TrainingRedDotVM;
    }
    void SetTrainingRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_TrainingRedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_TrainingRedDotVM = __Value;
        return;
    }
    bool GetbAvatarHasUnlockedTraining() const property
    {
        this.TrackPropertyRead(26);
        return this.m_bAvatarHasUnlockedTraining;
    }
    void SetbAvatarHasUnlockedTraining(const bool __Value) property
    {
        if (!(this.m_bAvatarHasUnlockedTraining) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_bAvatarHasUnlockedTraining = __Value;
        return;
    }
    bool GetbDisplayAttributeOrSkill() const property
    {
        this.TrackPropertyRead(27);
        return this.m_bDisplayAttributeOrSkill;
    }
    void SetbDisplayAttributeOrSkill(const bool __Value) property
    {
        if (!(this.m_bDisplayAttributeOrSkill) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_bDisplayAttributeOrSkill = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MainMenuAvatarBuildTypeEntry
{
    UPROPERTY()
    int StateIndex;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> Self;

}

struct __GeneratedProperties_FVM_MainMenuAvatarReturnBtnState
{
    UPROPERTY()
    bool IsShowReturnBtn;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatarReturnBtnState> Self;

}

struct __GeneratedProperties_FVM_MainMenuAvatar
{
    UPROPERTY()
    bool IsTalismanEntranceUnlock;
    UPROPERTY()
    bool IsWardrobeEntranceUnlock;
    UPROPERTY()
    bool IsTalentEntranceUnlock;
    UPROPERTY()
    bool IsShowTrainingAction;
    UPROPERTY()
    bool IsShowHoverTipsForEquipment;
    UPROPERTY()
    bool IsShowHoverTalismanLocked;
    UPROPERTY()
    bool IsShowHoverTalismanNotEquipped;
    UPROPERTY()
    bool IsSelectAvatarMainPlayer;
    UPROPERTY()
    bool IsShowSpecialtyEntry;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatar> Self;

}

namespace FVM_MainMenuAvatarBuildTypeEntry
{
FVM_MainMenuAvatarBuildTypeEntry& Create(const UObject ContextObject)
{
    return FVM_MainMenuAvatarBuildTypeEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MainMenuAvatarBuildTypeEntry& CreateByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>(EUIInternal::MakeModelWithManager(Manager, FVM_MainMenuAvatarBuildTypeEntry::ModelId)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarEquipment";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipment>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ComposableItemVM";
    local_14.TypeName = "TEUIModelRef<FVM_ComposableItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsLocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsEmpty";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsAvatarUnLocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsNotAvailable";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RarityColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RarityImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverTipsModel";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "StateIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MainMenuAvatarBuildTypeEntry;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnAvatarEquipmentChanged";
    local_24.DirtyFlags.Set(FVM_MainMenuAvatarBuildTypeEntry::__IndexOf_AvatarEquipment());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MainMenuAvatarBuildTypeEntry;
}
void __OnAvatarEquipmentChanged(FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    Model.OnAvatarEquipmentChanged();
    return;
}
TEUIModelRef<FVM_AvatarEquipment> __UIGetter_AvatarEquipment(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetAvatarEquipment();
}
TEUIModelRef<FVM_ComposableItem> __UIGetter_ComposableItemVM(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetComposableItemVM();
}
bool __UIGetter_bIsLocked(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetbIsLocked();
}
bool __UIGetter_bIsEmpty(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetbIsEmpty();
}
bool __UIGetter_bIsAvatarUnLocked(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetbIsAvatarUnLocked();
}
FText __UIGetter_Title(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_SubTitle(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetSubTitle();
}
FSlateBrush __UIGetter_Icon(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetIcon();
}
bool __UIGetter_bIsNotAvailable(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetbIsNotAvailable();
}
FLinearColor __UIGetter_RarityColor(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetRarityColor();
}
FSoftBrush __UIGetter_RarityImage(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetRarityImage();
}
FEUIModelRef __UIGetter_HoverTipsModel(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetHoverTipsModel();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetRedDotVM();
}
int __UIGetter_StateIndex(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return Model.GetStateIndex();
}
TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> __UIGetter_Self(const FVM_MainMenuAvatarBuildTypeEntry &inout Model)
{
    return TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>(Model);
}
int __IndexOf_AvatarEquipment()
{
    return 0;
}
int __IndexOf_ComposableItemVM()
{
    return 1;
}
int __IndexOf_bIsLocked()
{
    return 2;
}
int __IndexOf_bIsEmpty()
{
    return 3;
}
int __IndexOf_bIsAvatarUnLocked()
{
    return 4;
}
int __IndexOf_EquipSlotType()
{
    return 5;
}
int __IndexOf_bIsHoverd()
{
    return 6;
}
int __IndexOf_OnHoverEquipSlotChanged()
{
    return 7;
}
int __IndexOf_BuildType()
{
    return 8;
}
int __IndexOf_Title()
{
    return 9;
}
int __IndexOf_SubTitle()
{
    return 10;
}
int __IndexOf_Icon()
{
    return 11;
}
int __IndexOf_bIsNotAvailable()
{
    return 12;
}
int __IndexOf_RarityColor()
{
    return 13;
}
int __IndexOf_RarityImage()
{
    return 14;
}
int __IndexOf_HoverTipsModel()
{
    return 15;
}
int __IndexOf_OnEnterClickCallback()
{
    return 16;
}
int __IndexOf_RedDotVM()
{
    return 17;
}
}
namespace __GeneratedProperties_FVM_MainMenuAvatarBuildTypeEntry
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_MainMenuAvatarBuildTypeEntry.Get();
}
}
namespace FVM_MainMenuAvatarReturnBtnState
{
FVM_MainMenuAvatarReturnBtnState& Create(const UObject ContextObject)
{
    return FVM_MainMenuAvatarReturnBtnState::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MainMenuAvatarReturnBtnState& CreateByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVM_MainMenuAvatarReturnBtnState>(EUIInternal::MakeModelWithManager(Manager, FVM_MainMenuAvatarReturnBtnState::ModelId)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "IsShowReturnBtn";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenuAvatarReturnBtnState>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MainMenuAvatarReturnBtnState;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__HandleMsgAvatarDetailPopInfo";
    local_26.MessageTypeName = "Msg_AvatarDetailPopInfo";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MainMenuAvatarReturnBtnState;
}
void __HandleMsgAvatarDetailPopInfo(FVM_MainMenuAvatarReturnBtnState &inout Model, const FMsg_AvatarDetailPopInfo &inout Message)
{
    Model.HandleMsgAvatarDetailPopInfo(Message);
    return;
}
bool __UIGetter_IsShowReturnBtn(const FVM_MainMenuAvatarReturnBtnState &inout Model)
{
    return Model.GetIsShowReturnBtn();
}
TEUIModelRef<FVM_MainMenuAvatarReturnBtnState> __UIGetter_Self(const FVM_MainMenuAvatarReturnBtnState &inout Model)
{
    return TEUIModelRef<FVM_MainMenuAvatarReturnBtnState>(Model);
}
int __IndexOf_bIsHideReturnBtn()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_MainMenuAvatarReturnBtnState
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_MainMenuAvatarReturnBtnState.Get();
}
}
namespace FVM_MainMenuAvatar
{
FVM_MainMenuAvatar& Create(const UObject ContextObject)
{
    return FVM_MainMenuAvatar::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MainMenuAvatar& CreateByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVM_MainMenuAvatar>(EUIInternal::MakeModelWithManager(Manager, FVM_MainMenuAvatar::ModelId)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SelectedAvatar";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedAvatarEquipment";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipment>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoveredEquipmentInfo";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FoundationNode";
    local_14.TypeName = "TEUIModelRef<FM_TalentNode>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarList";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainAvatarSpecialtyList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AvatarInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedAvatarSpecialtyInfo";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarSpecialtyInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsShowSpecialtyHoverTips";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WeaponEntry";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalismanEquipments";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentEntry";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RelicEntry";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoveredTalismanEquipment";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipment>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverTalismanLockedTips";
    local_14.TypeName = "TEUIModelRef<FVM_Text>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverTalismanEmptyTips";
    local_14.TypeName = "TEUIModelRef<FVM_EquipHoverTips>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarDetailInfo";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarDetailInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TrainingRedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsTalismanEntranceUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsWardrobeEntranceUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsTalentEntranceUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsShowTrainingAction";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsShowHoverTipsForEquipment";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsShowHoverTalismanLocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsShowHoverTalismanNotEquipped";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelectAvatarMainPlayer";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsShowSpecialtyEntry";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenuAvatar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MainMenuAvatar;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(28);
    local_22.AddRefPropertyDirty(0, 6, FVM_AvatarSpecialtyInfo::__IndexOf_bIsMainPlayer());
    local_22.AddRefPropertyDirty(1, 1, FVM_AvatarEquipment::__IndexOf_Equipment());
    local_22.AddRefPropertyDirty(2, 0, FVM_AvatarInfo::__IndexOf_FoundationNode());
    local_22.AddRefPropertyDirty(3, 0, FVM_AvatarInfo::__IndexOf_TalismanEquipments());
    local_22.AddRefPropertyDirty(4, 4, FVMS_PlayerOwnedAvatarInfo::__IndexOf_AllConfigAvatars());
    local_22.AddRefPropertyDirty(5, 4, FVMS_PlayerOwnedAvatarInfo::__IndexOf_UnLockAvatarList());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("SelectedAvatarSpecialtyInfo");
    local_30.PropertyModelId = FVM_AvatarSpecialtyInfo::ModelId;
    local_30.MappingDirtyOffset = local_22.GetMappingDirtyOffset(6);
    local_30.RelatedDirtyMask.SetBit(FVM_AvatarSpecialtyInfo::__IndexOf_bIsMainPlayer(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    local_30.PropertyName = FName("SelectedAvatarEquipment");
    local_30.PropertyModelId = FVM_AvatarEquipment::ModelId;
    local_30.MappingDirtyOffset = local_22.GetMappingDirtyOffset(1);
    local_30.RelatedDirtyMask.SetBit(FVM_AvatarEquipment::__IndexOf_Equipment(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    local_30.PropertyName = FName("SelectedAvatar");
    local_30.PropertyModelId = FVM_AvatarInfo::ModelId;
    local_30.MappingDirtyOffset = local_22.GetMappingDirtyOffset(0);
    local_30.RelatedDirtyMask.SetBit(FVM_AvatarInfo::__IndexOf_FoundationNode(), true);
    local_30.RelatedDirtyMask.SetBit(FVM_AvatarInfo::__IndexOf_TalismanEquipments(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    local_30.PropertyName = FName("PlayerOwnedAvatarInfo");
    local_30.PropertyModelId = FVMS_PlayerOwnedAvatarInfo::ModelId;
    local_30.MappingDirtyOffset = local_22.GetMappingDirtyOffset(4);
    local_30.RelatedDirtyMask.SetBit(FVMS_PlayerOwnedAvatarInfo::__IndexOf_AllConfigAvatars(), true);
    local_30.RelatedDirtyMask.SetBit(FVMS_PlayerOwnedAvatarInfo::__IndexOf_UnLockAvatarList(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelDirtyDefine local_40;
    local_40.FunctionName = "__OnHoveredEquipmentSlotChanged";
    local_40.DirtyFlags.Set(FVM_MainMenuAvatar::__IndexOf_SelectedAvatar());
    local_40.DirtyFlags.Set(FVM_MainMenuAvatar::__IndexOf_HoveredEquipmentSlot());
    Result.DirtyFunctions.Add(local_40);
    FEUIModelMsgHandleDefine local_50;
    local_50.FunctionName = "__HandleTalismanSlotUnlockCountChange";
    local_50.MessageTypeName = "Msg_TalismanSlotUnlockCountChange";
    local_50.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_50);
    local_50.FunctionName = "__HandleMsgAvatarDetailInfoChanged";
    local_50.MessageTypeName = "Msg_AvatarDetailInfoChanged";
    local_50.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_50);
    local_50.FunctionName = "__OnTrainingStateChanged";
    local_50.MessageTypeName = "Msg_TrainingStateChanged";
    local_50.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_50);
    local_40.FunctionName = "__UpdateAvatarList";
    local_40.DirtyFlags.Set(FVM_MainMenuAvatar::__IndexOf_PlayerOwnedAvatarInfo());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(5));
    local_40.DirtyFlags.Set(FVM_MainMenuAvatar::__IndexOf_PlayerOwnedAvatarInfo());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(4));
    Result.DirtyFunctions.Add(local_40);
    local_40.FunctionName = "__OnSelectedAvatarIndexChanged";
    local_40.DirtyFlags.Set(FVM_MainMenuAvatar::__IndexOf_SelectedAvatarIndex());
    local_40.DirtyFlags.Set(FVM_MainMenuAvatar::__IndexOf_AvatarList());
    Result.DirtyFunctions.Add(local_40);
    local_40.FunctionName = "__UpdateWeaponEntry";
    local_40.DirtyFlags.Set(FVM_MainMenuAvatar::__IndexOf_SelectedAvatarEquipment());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(1));
    local_40.DirtyFlags.Set(FVM_MainMenuAvatar::__IndexOf_SelectedAvatarEquipment());
    Result.DirtyFunctions.Add(local_40);
    local_40.FunctionName = "__OnFoundationNodeChanged";
    local_40.DirtyFlags.Set(FVM_MainMenuAvatar::__IndexOf_SelectedAvatar());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(2));
    Result.DirtyFunctions.Add(local_40);
    local_40.FunctionName = "__RefreshEntries";
    local_40.DirtyFlags.Set(FVM_MainMenuAvatar::__IndexOf_SelectedAvatar());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(3));
    Result.DirtyFunctions.Add(local_40);
    local_40.FunctionName = "__OnSpecialtyMainPlayerChanged";
    local_40.DirtyFlags.Set(FVM_MainMenuAvatar::__IndexOf_SelectedAvatarSpecialtyInfo());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    Result.DirtyFunctions.Add(local_40);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MainMenuAvatar;
}
void __OnHoveredEquipmentSlotChanged(FVM_MainMenuAvatar &inout Model)
{
    Model.OnHoveredEquipmentSlotChanged();
    return;
}
void __HandleTalismanSlotUnlockCountChange(FVM_MainMenuAvatar &inout Model, const FMsg_TalismanSlotUnlockCountChange &inout Message)
{
    Model.HandleTalismanSlotUnlockCountChange(Message);
    return;
}
void __HandleMsgAvatarDetailInfoChanged(FVM_MainMenuAvatar &inout Model, const FMsg_AvatarDetailInfoChanged &inout Message)
{
    Model.HandleMsgAvatarDetailInfoChanged(Message);
    return;
}
void __OnTrainingStateChanged(FVM_MainMenuAvatar &inout Model, const FMsg_TrainingStateChanged &inout Message)
{
    Model.OnTrainingStateChanged(Message);
    return;
}
void __UpdateAvatarList(FVM_MainMenuAvatar &inout Model)
{
    Model.UpdateAvatarList();
    return;
}
void __OnSelectedAvatarIndexChanged(FVM_MainMenuAvatar &inout Model)
{
    Model.OnSelectedAvatarIndexChanged();
    return;
}
void __UpdateWeaponEntry(FVM_MainMenuAvatar &inout Model)
{
    Model.UpdateWeaponEntry();
    return;
}
void __OnFoundationNodeChanged(FVM_MainMenuAvatar &inout Model)
{
    Model.OnFoundationNodeChanged();
    return;
}
void __RefreshEntries(FVM_MainMenuAvatar &inout Model)
{
    Model.RefreshEntries();
    return;
}
void __OnSpecialtyMainPlayerChanged(FVM_MainMenuAvatar &inout Model)
{
    Model.OnSpecialtyMainPlayerChanged();
    return;
}
TEUIModelRef<FVM_AvatarInfo> __UIGetter_SelectedAvatar(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetSelectedAvatar();
}
TEUIModelRef<FVM_AvatarEquipment> __UIGetter_SelectedAvatarEquipment(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetSelectedAvatarEquipment();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfo> __UIGetter_HoveredEquipmentInfo(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetHoveredEquipmentInfo();
}
TEUIModelRef<FM_TalentNode> __UIGetter_FoundationNode(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetFoundationNode();
}
TArray<FEUIModelContainer> __UIGetter_AvatarList(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetAvatarList();
}
TArray<TEUIModelRef<FVM_AvatarInfo>> __UIGetter_MainAvatarSpecialtyList(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetMainAvatarSpecialtyList();
}
TEUIModelRef<FVM_AvatarSpecialtyInfo> __UIGetter_SelectedAvatarSpecialtyInfo(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetSelectedAvatarSpecialtyInfo();
}
bool __UIGetter_bIsShowSpecialtyHoverTips(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetbIsShowSpecialtyHoverTips();
}
TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> __UIGetter_WeaponEntry(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetWeaponEntry();
}
TArray<TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>> __UIGetter_TalismanEquipments(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetTalismanEquipments();
}
TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> __UIGetter_TalentEntry(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetTalentEntry();
}
TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> __UIGetter_RelicEntry(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetRelicEntry();
}
TEUIModelRef<FVM_AvatarEquipment> __UIGetter_HoveredTalismanEquipment(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetHoveredTalismanEquipment();
}
TEUIModelRef<FVM_Text> __UIGetter_HoverTalismanLockedTips(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetHoverTalismanLockedTips();
}
TEUIModelRef<FVM_EquipHoverTips> __UIGetter_HoverTalismanEmptyTips(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetHoverTalismanEmptyTips();
}
TEUIModelRef<FVM_AvatarDetailInfo> __UIGetter_AvatarDetailInfo(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetAvatarDetailInfo();
}
TEUIModelRef<FVM_RedDot> __UIGetter_TrainingRedDotVM(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetTrainingRedDotVM();
}
bool __UIGetter_IsTalismanEntranceUnlock(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetIsTalismanEntranceUnlock();
}
bool __UIGetter_IsWardrobeEntranceUnlock(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetIsWardrobeEntranceUnlock();
}
bool __UIGetter_IsTalentEntranceUnlock(const FVM_MainMenuAvatar &inout Model)
{
    return Model.GetIsTalentEntranceUnlock();
}
bool __UIGetter_IsShowTrainingAction(const FVM_MainMenuAvatar &inout Model)
{
    return Model.IsShowTrainingAction();
}
bool __UIGetter_IsShowHoverTipsForEquipment(const FVM_MainMenuAvatar &inout Model)
{
    return Model.IsShowHoverTipsForEquipment();
}
bool __UIGetter_IsShowHoverTalismanLocked(const FVM_MainMenuAvatar &inout Model)
{
    return Model.IsShowHoverTalismanLocked();
}
bool __UIGetter_IsShowHoverTalismanNotEquipped(const FVM_MainMenuAvatar &inout Model)
{
    return Model.IsShowHoverTalismanNotEquipped();
}
bool __UIGetter_IsSelectAvatarMainPlayer(const FVM_MainMenuAvatar &inout Model)
{
    return Model.IsSelectAvatarMainPlayer();
}
bool __UIGetter_IsShowSpecialtyEntry(const FVM_MainMenuAvatar &inout Model)
{
    return Model.IsShowSpecialtyEntry();
}
TEUIModelRef<FVM_MainMenuAvatar> __UIGetter_Self(const FVM_MainMenuAvatar &inout Model)
{
    return TEUIModelRef<FVM_MainMenuAvatar>(Model);
}
int __IndexOf_SelectedAvatarIndex()
{
    return 0;
}
int __IndexOf_SelectedAvatar()
{
    return 1;
}
int __IndexOf_SelectedAvatarEquipment()
{
    return 2;
}
int __IndexOf_HoveredEquipmentInfo()
{
    return 3;
}
int __IndexOf_FoundationNode()
{
    return 4;
}
int __IndexOf_PlayerOwnedAvatarInfo()
{
    return 5;
}
int __IndexOf_AvatarList()
{
    return 6;
}
int __IndexOf_MainAvatarSpecialtyList()
{
    return 7;
}
int __IndexOf_SelectedAvatarSpecialtyInfo()
{
    return 8;
}
int __IndexOf_bIsShowSpecialtyHoverTips()
{
    return 9;
}
int __IndexOf_WeaponEntry()
{
    return 10;
}
int __IndexOf_TalismanEquipments()
{
    return 11;
}
int __IndexOf_Talisman1Entry()
{
    return 12;
}
int __IndexOf_Talisman2Entry()
{
    return 13;
}
int __IndexOf_Talisman3Entry()
{
    return 14;
}
int __IndexOf_Talisman4Entry()
{
    return 15;
}
int __IndexOf_TalentEntry()
{
    return 16;
}
int __IndexOf_RelicEntry()
{
    return 17;
}
int __IndexOf_Showcase()
{
    return 18;
}
int __IndexOf_HoveredEquipmentSlot()
{
    return 19;
}
int __IndexOf_HoveredTalismanEquipment()
{
    return 20;
}
int __IndexOf_HoverTalismanLockedTips()
{
    return 21;
}
int __IndexOf_HoverTalismanEmptyTips()
{
    return 22;
}
int __IndexOf_AvatarDetailInfo()
{
    return 23;
}
int __IndexOf_RedDotNewAvatarTag()
{
    return 24;
}
int __IndexOf_TrainingRedDotVM()
{
    return 25;
}
int __IndexOf_bAvatarHasUnlockedTraining()
{
    return 26;
}
int __IndexOf_bDisplayAttributeOrSkill()
{
    return 27;
}
}
namespace __GeneratedProperties_FVM_MainMenuAvatar
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_MainMenuAvatar.Get();
}
}
