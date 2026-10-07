
namespace FVM_TalentEditSkillBtn
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnAvatarSkillDetialSelect = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnUpdateSkillSellectType = FEUIModelCallbackSignature();

}
struct FVM_TalentEditSkillBtn : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;
    UPROPERTY()
    TEUIModelWeakRef<FM_TalentNode> m_TalentNode;
    UPROPERTY()
    ESkillSlot m_SkillButtonSlot;
    UPROPERTY()
    TDataObjectPtr<FSkillInitConfig> m_ForceSetSkillInitConfig;
    UPROPERTY()
    TEUIModelRef<FVM_TalentSkillTypeBG> m_SkillTypeBGVM;
    UPROPERTY()
    TEUIModelRef<FVM_TalentDivisionTypeIcon> m_SkillDivisionTypeVM;
    UPROPERTY()
    bool m_bCurEquipped;
    UPROPERTY()
    bool m_bCanChange;
    UPROPERTY()
    bool m_bIsBigButton;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;

    FVM_TalentEditSkillBtn()
    {
        this.m_bCurEquipped = false;
        this.m_bCanChange = false;
        this.m_SkillButtonSlot = ESkillSlot(1);
        this.m_bIsBigButton = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TalentEditSkillBtn' by default constructor.");
        return;
    }
    FVM_TalentEditSkillBtn(const FVM_TalentEditSkillBtn &inout Other)
    {
        this.m_bCurEquipped = false;
        this.m_bCanChange = false;
        this.m_SkillButtonSlot = ESkillSlot(1);
        this.m_bIsBigButton = false;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_TalentNode = Other.m_TalentNode;
        this.m_SkillButtonSlot = Other.m_SkillButtonSlot;
        this.m_ForceSetSkillInitConfig = Other.m_ForceSetSkillInitConfig;
        this.m_SkillTypeBGVM = Other.m_SkillTypeBGVM;
        this.m_SkillDivisionTypeVM = Other.m_SkillDivisionTypeVM;
        this.m_bCurEquipped = Other.m_bCurEquipped;
        this.m_bCanChange = Other.m_bCanChange;
        this.m_bIsBigButton = Other.m_bIsBigButton;
        this.m_RedDotVM = Other.m_RedDotVM;
        return;
    }
    FVM_TalentEditSkillBtn(const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig, const TEUIModelWeakRef<FM_TalentNode> &inout InTalentNode, const ESkillSlot InSkillButtonSlot)
    {
        this.m_bCurEquipped = false;
        this.m_bCanChange = false;
        this.m_SkillButtonSlot = ESkillSlot(1);
        this.m_bIsBigButton = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatarConfig(InAvatarConfig);
        this.SetTalentNode(InTalentNode);
        this.SetSkillButtonSlot(ESkillSlot(InSkillButtonSlot));
        return;
    }
    FVM_TalentEditSkillBtn& opAssign(const FVM_TalentEditSkillBtn &inout Other)
    {
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_TalentNode = Other.m_TalentNode;
        this.m_SkillButtonSlot = Other.m_SkillButtonSlot;
        this.m_ForceSetSkillInitConfig = Other.m_ForceSetSkillInitConfig;
        this.m_SkillTypeBGVM = Other.m_SkillTypeBGVM;
        this.m_SkillDivisionTypeVM = Other.m_SkillDivisionTypeVM;
        this.m_bCurEquipped = Other.m_bCurEquipped;
        this.m_bCanChange = Other.m_bCanChange;
        this.m_bIsBigButton = Other.m_bIsBigButton;
        return Other.m_RedDotVM;
    }
    void PostConstruct()
    {
        this.RebuildSkillDerivedVMs();
        return;
    }
    void RebuildSkillDerivedVMs()
    {
        int local_13 = 0;
        int local_1 = int(this.GetSkillType());
        this.SetSkillTypeBGVM(TEUIModelRef<FVM_TalentSkillTypeBG>(::FVM_TalentSkillTypeBG::Create(this.GetContext().Manager)));
        int local_5 = int(this.GetSkillDivisionType());
        this.SetSkillDivisionTypeVM(TEUIModelRef<FVM_TalentDivisionTypeIcon>(::FVM_TalentDivisionTypeIcon::Create(this.GetContext().Manager)));
        if (this.GetAvatarConfig())
        {
            int local_1_2 = int(this.GetSkillType());
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Avatar_ReplaceSkillSlot, ::FMS_Talent::Get(this.GetContext().Manager).MakeSlotRedDotKey(local_13)))));
        }
        return;
    }
    void SetForceSkillInitConfig(const TDataObjectPtr<FSkillInitConfig> &inout InConfig)
    {
        this.SetForceSetSkillInitConfig(InConfig);
        this.RebuildSkillDerivedVMs();
        return;
    }
    TDataObjectPtr<FSkillInitConfig> GetSkillInitConfig() const
    {
        int local_54 = 0;
        int local_58;
        if (this.GetForceSetSkillInitConfig().IsSet())
        {
            return this.GetForceSetSkillInitConfig();
        }
        if (!(this.GetTalentNode().IsValid()))
        {
            return TDataObjectPtr<FSkillInitConfig>();
        }
        TEUIModelWeakRef<FM_TalentNode> local_28 = this.GetTalentNode();
        if (local_54.GetActiveLevel() > 0)
        {
            local_58 = local_54.GetActiveLevel();
        }
        else
        {
            local_58 = 1;
        }
        TDataObjectPtr<FTalentConfig> local_108 = local_54.FindTalentByChoiceAndLevel(local_54.GetActiveChoiceIndex(), local_58);
        if (!(local_108))
        {
            local_108 = local_54.GetConfig().NodeConfig;
        }
        if (!(!(local_108)) && GetSkillConfig())
        {
            return GetSkillConfig();
        }
        return local_26;
    }
    TDataObjectPtr<FTalentConfig> GetTalentConfig() const
    {
        int local_54 = 0;
        int local_58;
        TDataObjectPtr<FTalentConfig> local_28;
        if (!(this.GetTalentNode().IsValid()))
        {
            return local_28;
        }
        TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetTalentNode();
        if (local_54.GetActiveLevel() > 0)
        {
            local_58 = local_54.GetActiveLevel();
        }
        else
        {
            local_58 = 1;
        }
        local_28 = local_54.FindTalentByChoiceAndLevel(local_54.GetActiveChoiceIndex(), local_58);
        TDataObjectPtr<FTalentConfig> local_52;
        if (local_28)
        {
            local_52 = local_28;
        }
        else
        {
            local_52 = local_54.GetConfig().NodeConfig;
        }
        return local_52;
    }
    ESkillType GetSkillType() const
    {
        int local_2 = 0;
        int local_6 = 0;
        if (this.GetForceSetSkillInitConfig().IsSet())
        {
            return ESkillType(local_2);
        }
        if (this.GetTalentNode().IsValid())
        {
            TEUIModelWeakRef<FM_TalentNode> local_4 = this.GetTalentNode();
            if (int(local_6.GetTalentType()) == 1)
            {
                local_2 = 2;
                return ESkillType(local_2);
            }
        }
        if (this.GetTalentConfig() && (local_2 != 0))
        {
            return ESkillType(local_2);
        }
        if (this.GetSkillInitConfig())
        {
            return ESkillType(local_2);
        }
        switch (int(this.GetSkillButtonSlot()))
        {
        case 10:
        {
            return ESkillType(1);
        }
        case 1:
        {
            return ESkillType(3);
        }
        case 2:
        {
            return ESkillType(4);
        }
        case 3:
        case 5:
        case 6:
        {
            return ESkillType(5);
        }
        case 4:
        {
            return ESkillType(6);
        }
        case 7:
        {
            return ESkillType(6);
        }
        case 8:
        case 9:
        default:
        {
            local_2 = 0;
        }
        }
        return ESkillType(local_2);
    }
    ETalentDivision GetSkillDivisionType() const
    {
        int local_2 = 0;
        if (this.GetForceSetSkillInitConfig().IsSet())
        {
            local_2 = 0;
            return ETalentDivision(local_2);
        }
        if (this.GetTalentConfig())
        {
            return ETalentDivision(local_2);
        }
        return ETalentDivision(0);
    }
    bool IsShowActionAsText() const
    {
        return (int(this.GetSkillButtonSlot())) == 0 || (int(this.GetSkillButtonSlot()) == 10);
    }
    FEUIInputAction GetEquipmentAction() const
    {
        if (this.GetContext().GetLocalPlayerPawn().IsValid())
        {
            int local_6 = int(this.GetSkillButtonSlot());
            return FEUIInputAction(FSkillUtils::GetSkillInputAction(this.GetContext().GetLocalPlayerPawn()));
        }
        return FEUIInputAction();
    }
    bool NeedShowActionSlot() const
    {
        switch (int(this.GetSkillType()))
        {
        case 3:
        case 4:
        case 5:
        case 6:
        {
            return true;
        }
        default:
        {
        }
        }
        return false;
    }
    FText GetIconTypeName() const
    {
        switch (int(this.GetSkillType()))
        {
        case 2:
        {
            return NSLOCTEXT("TalentSkill", "SkillType_Foundation", "еџєзџі");
        }
        case 1:
        {
            return NSLOCTEXT("TalentSkill", "SkillType_Passive", "иў«еЉЁжЉЂиѓЅ");
        }
        case 3:
        {
            return NSLOCTEXT("TalentSkill", "SkillType_NormalAttack", "ж™®йЂљж”»е‡»");
        }
        case 4:
        {
            return NSLOCTEXT("TalentSkill", "SkillType_SpecialAttack", "з‰№ж®Љж”»е‡»");
        }
        case 5:
        {
            return NSLOCTEXT("TalentSkill", "SkillType_SimpleSkill", "ж€жЉЂ");
        }
        case 6:
        {
            return NSLOCTEXT("TalentSkill", "SkillType_UltraSkill", "з»ќжЉЂ");
        }
        }
        return NSLOCTEXT("TalentSkill", "SkillType_None", "з©є");
    }
    int GetIconTypeIndex() const
    {
        switch (int(this.GetSkillType()))
        {
        case 1:
        {
            return 0;
        }
        case 3:
        {
            return 1;
        }
        case 4:
        {
            return 2;
        }
        case 5:
        {
            return 3;
        }
        case 6:
        {
            return 4;
        }
        case 2:
        default:
        {
        }
        }
        return 0;
    }
    FSoftBrush GetIconImage() const
    {
        USkillConfig local_102;
        bool local_1 = !(this.GetForceSetSkillInitConfig().IsSet());
        if (local_1)
        {
            if (this.GetTalentConfig() && local_1)
            {
            }
            else
            {
            }
        }
        if (this.GetSkillInitConfig())
        {
            if (unresolved.Icon.IsSet())
            {
            }
            else
            {
                if (local_102 != nullptr)
                {
                    FECSEntity local_106 = this.GetContext().GetLocalPlayerPawn();
                    FSkillConfigPresentationData local_220;
                    return local_220.DefaultIcon;
                }
            }
        }
        return FSoftBrush();
    }
    FText GetSkillDesc() const
    {
        bool local_51;
        FText __return;
        bool local_1 = !(this.GetForceSetSkillInitConfig().IsSet());
        if (local_1)
        {
            if (!(this.GetTalentConfig()))
            {
                local_51 = false;
            }
            else
            {
                local_1 = !local_1;
                local_51 = local_1;
            }
            if (local_51)
            {
            }
            else
            {
            }
        }
        if (!(this.GetSkillInitConfig()))
        {
            local_51 = false;
        }
        else
        {
            local_1 = !local_1;
            local_51 = local_1;
        }
        if (local_51)
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    FText GetSkillName() const
    {
        bool local_51;
        FText __return;
        bool local_1 = !(this.GetForceSetSkillInitConfig().IsSet());
        if (local_1)
        {
            if (!(this.GetTalentConfig()))
            {
                local_51 = false;
            }
            else
            {
                local_1 = !local_1;
                local_51 = local_1;
            }
            if (local_51)
            {
            }
            else
            {
            }
        }
        if (!(this.GetSkillInitConfig()))
        {
            local_51 = false;
        }
        else
        {
            local_1 = !local_1;
            local_51 = local_1;
        }
        if (local_51)
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    FText GetSkillTypeShotDesc() const
    {
        bool local_51;
        FText __return;
        bool local_1 = !(this.GetForceSetSkillInitConfig().IsSet());
        if (local_1)
        {
            if (!(this.GetTalentConfig()))
            {
                local_51 = false;
            }
            else
            {
                local_1 = !local_1;
                local_51 = local_1;
            }
            if (local_51)
            {
            }
            else
            {
            }
        }
        if (this.GetSkillInitConfig())
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    void OnTalentNodeChange()
    {
        int local_1 = int(this.GetSkillType());
        this.SetSkillTypeBGVM(TEUIModelRef<FVM_TalentSkillTypeBG>(::FVM_TalentSkillTypeBG::Create(this.GetContext().Manager)));
        return;
    }
    void RefreshIsBigButton()
    {
        int local_5;
        ESkillType local_2 = this.GetSkillType();
        if (int(local_2) == 2)
        {
            local_5 = 1;
        }
        else
        {
            local_5 = (int(local_2) == 6);
        }
        this.SetbIsBigButton((local_5 != 0));
        return;
    }
    void OnAvatarSkillDetialSelect()
    {
        if (!(::FVM_TalentEditPage::CanViewAvatarTalent(this.GetContext().Manager, this.GetAvatarConfig())))
        {
            return;
        }
        ::FVM_TalentEditPage::GotoPage(this.GetContext().UELocalPlayer, this.GetAvatarConfig());
        int local_2 = int(this.GetSkillType());
        int local_3 = int(this.GetSkillButtonSlot());
        ::FVM_TalentEditPage::UpdateSkillSellectType(this.GetContext().UELocalPlayer);
        return;
    }
    void OnUpdateSkillSellectType()
    {
        int local_1 = int(this.GetSkillType());
        int local_2 = int(this.GetSkillButtonSlot());
        ::FVM_TalentEditPage::UpdateSkillSellectType(this.GetContext().UELocalPlayer);
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarConfig = __Value;
        return;
    }
    TEUIModelWeakRef<FM_TalentNode> GetTalentNode() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TalentNode;
    }
    void SetTalentNode(const TEUIModelWeakRef<FM_TalentNode> &inout __Value) property
    {
        TEUIModelWeakRef<FM_TalentNode> local_2;
        local_2 = this.m_TalentNode;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TalentNode = __Value;
        return;
    }
    ESkillSlot GetSkillButtonSlot() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SkillButtonSlot;
    }
    void SetSkillButtonSlot(const ESkillSlot __Value) property
    {
        if (int(this.m_SkillButtonSlot) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SkillButtonSlot = __Value;
        return;
    }
    const TDataObjectPtr<FSkillInitConfig> GetForceSetSkillInitConfig() const property
    {
        const TDataObjectPtr<FSkillInitConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FSkillInitConfig> GetModify_ForceSetSkillInitConfig() property
    {
        TDataObjectPtr<FSkillInitConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetForceSetSkillInitConfig(const TDataObjectPtr<FSkillInitConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ForceSetSkillInitConfig = __Value;
        return;
    }
    TEUIModelRef<FVM_TalentSkillTypeBG> GetSkillTypeBGVM() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SkillTypeBGVM;
    }
    void SetSkillTypeBGVM(const TEUIModelRef<FVM_TalentSkillTypeBG> &inout __Value) property
    {
        TEUIModelRef<FVM_TalentSkillTypeBG> local_2;
        local_2 = this.m_SkillTypeBGVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SkillTypeBGVM = __Value;
        return;
    }
    TEUIModelRef<FVM_TalentDivisionTypeIcon> GetSkillDivisionTypeVM() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SkillDivisionTypeVM;
    }
    void SetSkillDivisionTypeVM(const TEUIModelRef<FVM_TalentDivisionTypeIcon> &inout __Value) property
    {
        TEUIModelRef<FVM_TalentDivisionTypeIcon> local_2;
        local_2 = this.m_SkillDivisionTypeVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SkillDivisionTypeVM = __Value;
        return;
    }
    bool GetbCurEquipped() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bCurEquipped;
    }
    void SetbCurEquipped(const bool __Value) property
    {
        if (!(this.m_bCurEquipped) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bCurEquipped = __Value;
        return;
    }
    bool GetbCanChange() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bCanChange;
    }
    void SetbCanChange(const bool __Value) property
    {
        if (!(this.m_bCanChange) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bCanChange = __Value;
        return;
    }
    bool GetbIsBigButton() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bIsBigButton;
    }
    void SetbIsBigButton(const bool __Value) property
    {
        if (!(this.m_bIsBigButton) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bIsBigButton = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(9);
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
        this.MarkPropertyDirty(9);
        this.m_RedDotVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TalentEditSkillBtn
{
    UPROPERTY()
    bool IsShowActionAsText;
    UPROPERTY()
    FEUIInputAction EquipmentAction;
    UPROPERTY()
    bool NeedShowActionSlot;
    UPROPERTY()
    FText IconTypeName;
    UPROPERTY()
    int IconTypeIndex;
    UPROPERTY()
    FSoftBrush IconImage;
    UPROPERTY()
    FText SkillDesc;
    UPROPERTY()
    FText SkillName;
    UPROPERTY()
    FText SkillTypeShotDesc;
    UPROPERTY()
    TEUIModelRef<FVM_TalentEditSkillBtn> Self;


}

namespace FVM_TalentEditSkillBtn
{
FVM_TalentEditSkillBtn& Create(const UObject ContextObject, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig, const TEUIModelWeakRef<FM_TalentNode> &inout TalentNode, const ESkillSlot SkillButtonSlot)
{
    return FVM_TalentEditSkillBtn::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarConfig, TalentNode);
}
FVM_TalentEditSkillBtn CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig, const TEUIModelWeakRef<FM_TalentNode> &inout TalentNode, const ESkillSlot SkillButtonSlot)
{
    FVM_TalentEditSkillBtn __r;
    TEUIModelRef<FVM_TalentEditSkillBtn> local_6 = TEUIModelRef<FVM_TalentEditSkillBtn>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentEditSkillBtn::ModelId, 0, AvatarConfig, TalentNode, SkillButtonSlot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SkillTypeBGVM";
    local_14.TypeName = "TEUIModelRef<FVM_TalentSkillTypeBG>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillDivisionTypeVM";
    local_14.TypeName = "TEUIModelRef<FVM_TalentDivisionTypeIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCurEquipped";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCanChange";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsBigButton";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsShowActionAsText";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentAction";
    local_14.TypeName = "FEUIInputAction";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NeedShowActionSlot";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconTypeName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconTypeIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillTypeShotDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TalentEditSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TalentEditSkillBtn;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnTalentNodeChange";
    local_24.DirtyFlags.Set(FVM_TalentEditSkillBtn::__IndexOf_TalentNode());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelEffectDefine local_28;
    local_28.FunctionName = "RefreshIsBigButton";
    Result.EffectFunctions.Add(local_28);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentEditSkillBtn;
}
void __OnTalentNodeChange(FVM_TalentEditSkillBtn &inout Model)
{
    Model.OnTalentNodeChange();
    return;
}
TEUIModelRef<FVM_TalentSkillTypeBG> __UIGetter_SkillTypeBGVM(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetSkillTypeBGVM();
}
TEUIModelRef<FVM_TalentDivisionTypeIcon> __UIGetter_SkillDivisionTypeVM(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetSkillDivisionTypeVM();
}
bool __UIGetter_bCurEquipped(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetbCurEquipped();
}
bool __UIGetter_bCanChange(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetbCanChange();
}
bool __UIGetter_bIsBigButton(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetbIsBigButton();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetRedDotVM();
}
bool __UIGetter_IsShowActionAsText(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.IsShowActionAsText();
}
FEUIInputAction __UIGetter_EquipmentAction(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetEquipmentAction();
}
bool __UIGetter_NeedShowActionSlot(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.NeedShowActionSlot();
}
FText __UIGetter_IconTypeName(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetIconTypeName();
}
int __UIGetter_IconTypeIndex(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetIconTypeIndex();
}
FSoftBrush __UIGetter_IconImage(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetIconImage();
}
FText __UIGetter_SkillDesc(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetSkillDesc();
}
FText __UIGetter_SkillName(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetSkillName();
}
FText __UIGetter_SkillTypeShotDesc(const FVM_TalentEditSkillBtn &inout Model)
{
    return Model.GetSkillTypeShotDesc();
}
TEUIModelRef<FVM_TalentEditSkillBtn> __UIGetter_Self(const FVM_TalentEditSkillBtn &inout Model)
{
    return TEUIModelRef<FVM_TalentEditSkillBtn>(Model);
}
int __IndexOf_AvatarConfig()
{
    return 0;
}
int __IndexOf_TalentNode()
{
    return 1;
}
int __IndexOf_SkillButtonSlot()
{
    return 2;
}
int __IndexOf_ForceSetSkillInitConfig()
{
    return 3;
}
int __IndexOf_SkillTypeBGVM()
{
    return 4;
}
int __IndexOf_SkillDivisionTypeVM()
{
    return 5;
}
int __IndexOf_bCurEquipped()
{
    return 6;
}
int __IndexOf_bCanChange()
{
    return 7;
}
int __IndexOf_bIsBigButton()
{
    return 8;
}
int __IndexOf_RedDotVM()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_TalentEditSkillBtn
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
