
namespace FVM_DivineSkillInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OpenDivineSkill = FEUIModelCallbackSignature();

}
struct FVM_DivineSkillInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_DivineSkill> m_EquipableSkill;
    UPROPERTY()
    TEUIModelRef<FVM_EquipHoverTips> m_HoverTipsVM;

    FVM_DivineSkillInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_DivineSkillInfo' by default constructor.");
        return;
    }
    FVM_DivineSkillInfo(const FVM_DivineSkillInfo &inout Other)
    {
        this.m_EquipableSkill = Other.m_EquipableSkill;
        this.m_HoverTipsVM = Other.m_HoverTipsVM;
        return;
    }
    FVM_DivineSkillInfo(const TEUIModelRef<FM_DivineSkill> &inout InEquipableSkill)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEquipableSkill(InEquipableSkill);
        return;
    }
    FVM_DivineSkillInfo& opAssign(const FVM_DivineSkillInfo &inout Other)
    {
        this.m_EquipableSkill = Other.m_EquipableSkill;
        return Other.m_HoverTipsVM;
    }
    TDataObjectPtr<FDivineSkillConfig> GetEquipableSkillConfig() const
    {
        if (this.GetEquipableSkill())
        {
            return this.GetEquipableSkill().opArrow().GetConfig();
        }
        return TDataObjectPtr<FDivineSkillConfig>(nullptr);
    }
    FSoftBrush GetDisplayIcon() const
    {
        TDataObjectPtr<FDivineSkillConfig> local_24 = this.GetEquipableSkillConfig();
        FSoftBrush local_140;
        if (local_24)
        {
            local_140 = this.GetEquipableSkillConfig().opArrow().DisplayIcon;
        }
        else
        {
            local_140 = FSoftBrush();
        }
        return local_140;
    }
    FSoftBrush GetTypeIcon() const
    {
        TDataObjectPtr<FDivineSkillConfig> local_24 = this.GetEquipableSkillConfig();
        if (local_24)
        {
            TDataObjectPtr<FDivineSkillTypeConfig> local_74 = local_24.opArrow().GetTypeConfig();
            if (local_74)
            {
                return local_74.opArrow().TypeIcon;
            }
        }
        return FSoftBrush();
    }
    FSoftBrush GetLiteraryImage() const
    {
        TDataObjectPtr<FDivineSkillConfig> local_24 = this.GetEquipableSkillConfig();
        if (local_24)
        {
            TDataObjectPtr<FDivineLiteraryTypeConfig> local_74 = local_24.opArrow().GetLiteraryTypeConfig();
            if (local_74)
            {
                return local_74.opArrow().LiteraryImage;
            }
        }
        return FSoftBrush();
    }
    FText GetTypeName() const
    {
        TDataObjectPtr<FDivineSkillConfig> local_24 = this.GetEquipableSkillConfig();
        if (local_24)
        {
            TDataObjectPtr<FDivineSkillTypeConfig> local_74 = local_24.opArrow().GetTypeConfig();
            if (local_74)
            {
                return local_74.opArrow().TypeName;
            }
        }
        return FText();
    }
    bool SuitForCurrentAvatar() const
    {
        FMS_PvpModeState& local_2 = ::FMS_PvpModeState::Get(this.GetContext().Manager);
        if (local_2.GetbIsPvpMode())
        {
            int local_53 = local_2.GetCurrentPvpAvatarId();
            GetDataObjectByGSDataId<FAvatarPrefabConfig> local_52;
            TDataObjectPtr<FAvatarPrefabConfig> local_78 = local_52.opImplConv();
            return ::DivineSkillUtils::SuitForAvatar(this.GetEquipableSkillConfig(), local_78);
        }
        return ::DivineSkillUtils::SuitForPlayerCurrentAvatars(this.GetEquipableSkillConfig(), this.GetContext().GetLocalPlayer());
    }
    bool NotSuitForCurrentAvatar() const
    {
        return !(this.SuitForCurrentAvatar());
    }
    int GetDivineSkillTypeIndex() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    FText GetDivineSkillTypeDesc() const
    {
        TDataObjectPtr<FDivineSkillConfig> local_24 = this.GetEquipableSkillConfig();
        if (local_24)
        {
            TDataObjectPtr<FDivineSkillTypeConfig> local_74 = local_24.opArrow().GetTypeConfig();
            if (local_74)
            {
                return local_74.opArrow().Description;
            }
        }
        return FText();
    }
    FText GetAttributeDescriptionText() const
    {
        TDataObjectPtr<FDivineSkillConfig> local_24 = this.GetEquipableSkillConfig();
        FText local_54;
        if (local_24)
        {
            if (!(this.SuitForCurrentAvatar()))
            {
                local_54 = NSLOCTEXT("DivineSkillAttributeDescriptionNotSuit", "{0}пј€жњЄжїЂжґ»пј‰");
                return FText::Format(local_54, local_24.opArrow().AttributeDescription);
            }
            return local_24.opArrow().AttributeDescription;
        }
        return local_54;
    }
    bool IsCurrentDivineSkill() const
    {
        bool local_5;
        FMS_DivineSkillData& local_2 = ::FMS_DivineSkillData::Get(this.GetContext().Manager);
        FMS_PvpModeState& local_4 = ::FMS_PvpModeState::Get(this.GetContext().Manager);
        if (local_4.GetbIsPvpMode())
        {
            TDataObjectPtr<FDivineSkillConfig> local_30 = local_2.GetPvpAvatarEquipedDivineSkill(local_4.GetCurrentPvpAvatarId());
            if (!(local_30))
            {
                local_5 = false;
            }
            else
            {
                local_5 = this.GetEquipableSkill();
            }
            if (!(local_5))
            {
                local_5 = false;
            }
            else
            {
                TDataObjectPtr<FDivineSkillConfig> local_54;
                local_54 = this.GetEquipableSkill().opArrow().GetConfig();
                local_5 = (local_54 == local_30.opImplConv());
            }
            return local_5;
        }
        return (local_2.GetEditingDivineSkill() == this.GetEquipableSkill().opImplConv());
    }
    bool IsUnactiveDivineSkill() const
    {
        return !(this.SuitForCurrentAvatar());
    }
    FText GetUnactiveDescription() const
    {
        TDataObjectPtr<FDivineSkillTypeConfig> local_24 = this.GetMainAvatarTypeConfig();
        if (!(local_24))
        {
            return FText();
        }
        return FText::Format(NSLOCTEXT("DivineSkillUnactiveDesc", "дё»ж€и§’и‰І[<img id=\"{0}\"/>{1}]дёЋзҐћж је®љдЅЌдёЌеЊ№й…Ќ"), FText::FromString(local_24.opArrow().RichTextImageName), local_24.opArrow().TypeName);
    }
    TDataObjectPtr<FDivineSkillTypeConfig> GetMainAvatarTypeConfig() const
    {
        return ::DivineSkillUtils::FindTypeConfigByIllustrate(this.GetMainAvatarIllustrate());
    }
    EAvatarIllustrate GetMainAvatarIllustrate() const
    {
        int local_104 = 0;
        FMS_PvpModeState& local_2 = ::FMS_PvpModeState::Get(this.GetContext().Manager);
        if (local_2.GetbIsPvpMode())
        {
            int local_53 = local_2.GetCurrentPvpAvatarId();
            GetDataObjectByGSDataId<FAvatarPrefabConfig> local_52;
            if (local_52.opImplConv().IsSet() && GetDefaultFoundation().IsSet())
            {
                return ::FASCommonUtils::TalentDivisionToIllustrate(ETalentDivision(local_104));
            }
            return EAvatarIllustrate(3);
        }
        return ::DivineSkillUtils::GetPlayerMainAvatarIllustrate(this.GetContext().GetLocalPlayer());
    }
    bool OpenDivineSkill(const FEUIModelRef &inout DivineSkillInfo)
    {
        bool local_3 = this.GetHoverTipsVM().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_EquipHoverTips> local_2 = this.GetHoverTipsVM();
            local_3 = GetOverrideClickWidgetConfig().IsSet();
        }
        if (local_3)
        {
            TEUIModelRef<FVM_EquipHoverTips> local_2_2 = this.GetHoverTipsVM();
        }
        else
        {
            FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Player_EquipableSkillSettings);
        }
        return true;
    }
    TEUIModelRef<FVM_EquipHoverTips> GetHoverTips()
    {
        FVM_EquipHoverTips& local_2 = ::FVM_EquipHoverTips::Create(this.GetContext().Manager);
        TDataObjectPtr<FDivineSkillConfig> local_26 = this.GetEquipableSkillConfig();
        FText local_64;
        if (local_26)
        {
            local_64 = local_26.opArrow().DisplayName;
        }
        else
        {
            local_64 = FText();
        }
        local_2.SetDisplayName(local_64);
        local_2.SetEquipLevel(0);
        local_2.SetbIsShowLevel(false);
        local_2.SetClickModelRef(FEUIModelRef(this));
        local_2.SetbIsShowContent(true);
        bool local_55 = this.SuitForCurrentAvatar();
        int local_65 = local_55 ? 0 : 1;
        local_2.SetContentIndex(local_65);
        FText local_54;
        if (local_26)
        {
            local_54 = local_26.opArrow().AttributeDescription;
        }
        else
        {
            local_54 = FText();
        }
        local_2.SetContentText(local_54);
        local_2.GetOnClickGoToCallback().Bind(this, FVM_DivineSkillInfo::OpenDivineSkill);
        this.SetHoverTipsVM(TEUIModelRef<FVM_EquipHoverTips>(local_2));
        return TEUIModelRef<FVM_EquipHoverTips>(local_2);
    }
    TEUIModelRef<FM_DivineSkill> GetEquipableSkill() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EquipableSkill;
    }
    void SetEquipableSkill(const TEUIModelRef<FM_DivineSkill> &inout __Value) property
    {
        TEUIModelRef<FM_DivineSkill> local_2;
        local_2 = this.m_EquipableSkill;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EquipableSkill = __Value;
        return;
    }
    TEUIModelRef<FVM_EquipHoverTips> GetHoverTipsVM() const property
    {
        this.TrackPropertyRead(1);
        return this.m_HoverTipsVM;
    }
    void SetHoverTipsVM(const TEUIModelRef<FVM_EquipHoverTips> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipHoverTips> local_2;
        local_2 = this.m_HoverTipsVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HoverTipsVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_DivineSkillInfo
{
    UPROPERTY()
    TDataObjectPtr<FDivineSkillConfig> EquipableSkillConfig;
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    FSoftBrush TypeIcon;
    UPROPERTY()
    FSoftBrush LiteraryImage;
    UPROPERTY()
    FText TypeName;
    UPROPERTY()
    bool SuitForCurrentAvatar;
    UPROPERTY()
    bool NotSuitForCurrentAvatar;
    UPROPERTY()
    int DivineSkillTypeIndex;
    UPROPERTY()
    FText DivineSkillTypeDesc;
    UPROPERTY()
    FText AttributeDescriptionText;
    UPROPERTY()
    bool IsCurrentDivineSkill;
    UPROPERTY()
    bool IsUnactiveDivineSkill;
    UPROPERTY()
    FText UnactiveDescription;
    UPROPERTY()
    TEUIModelRef<FVM_DivineSkillInfo> Self;


}

namespace FVM_DivineSkillInfo
{
FVM_DivineSkillInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_DivineSkill> &inout EquipableSkill)
{
    return FVM_DivineSkillInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), EquipableSkill);
}
FVM_DivineSkillInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_DivineSkill> &inout EquipableSkill)
{
    FVM_DivineSkillInfo __r;
    TEUIModelRef<FVM_DivineSkillInfo> local_6 = TEUIModelRef<FVM_DivineSkillInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_DivineSkillInfo::ModelId, 0, EquipableSkill));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "HoverTipsVM";
    local_14.TypeName = "TEUIModelRef<FVM_EquipHoverTips>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipableSkillConfig";
    local_14.TypeName = "TDataObjectPtr<FDivineSkillConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TypeIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LiteraryImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TypeName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SuitForCurrentAvatar";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NotSuitForCurrentAvatar";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DivineSkillTypeIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DivineSkillTypeDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AttributeDescriptionText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsCurrentDivineSkill";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnactiveDivineSkill";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UnactiveDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_DivineSkillInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_DivineSkillInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_DivineSkillInfo;
}
TEUIModelRef<FVM_EquipHoverTips> __UIGetter_HoverTipsVM(const FVM_DivineSkillInfo &inout Model)
{
    return Model.GetHoverTipsVM();
}
TDataObjectPtr<FDivineSkillConfig> __UIGetter_EquipableSkillConfig(const FVM_DivineSkillInfo &inout Model)
{
    return Model.GetEquipableSkillConfig();
}
FSoftBrush __UIGetter_DisplayIcon(const FVM_DivineSkillInfo &inout Model)
{
    return Model.GetDisplayIcon();
}
FSoftBrush __UIGetter_TypeIcon(const FVM_DivineSkillInfo &inout Model)
{
    return Model.GetTypeIcon();
}
FSoftBrush __UIGetter_LiteraryImage(const FVM_DivineSkillInfo &inout Model)
{
    return Model.GetLiteraryImage();
}
FText __UIGetter_TypeName(const FVM_DivineSkillInfo &inout Model)
{
    return Model.GetTypeName();
}
bool __UIGetter_SuitForCurrentAvatar(const FVM_DivineSkillInfo &inout Model)
{
    return Model.SuitForCurrentAvatar();
}
bool __UIGetter_NotSuitForCurrentAvatar(const FVM_DivineSkillInfo &inout Model)
{
    return Model.NotSuitForCurrentAvatar();
}
int __UIGetter_DivineSkillTypeIndex(const FVM_DivineSkillInfo &inout Model)
{
    return Model.GetDivineSkillTypeIndex();
}
FText __UIGetter_DivineSkillTypeDesc(const FVM_DivineSkillInfo &inout Model)
{
    return Model.GetDivineSkillTypeDesc();
}
FText __UIGetter_AttributeDescriptionText(const FVM_DivineSkillInfo &inout Model)
{
    return Model.GetAttributeDescriptionText();
}
bool __UIGetter_IsCurrentDivineSkill(const FVM_DivineSkillInfo &inout Model)
{
    return Model.IsCurrentDivineSkill();
}
bool __UIGetter_IsUnactiveDivineSkill(const FVM_DivineSkillInfo &inout Model)
{
    return Model.IsUnactiveDivineSkill();
}
FText __UIGetter_UnactiveDescription(const FVM_DivineSkillInfo &inout Model)
{
    return Model.GetUnactiveDescription();
}
TEUIModelRef<FVM_DivineSkillInfo> __UIGetter_Self(const FVM_DivineSkillInfo &inout Model)
{
    return TEUIModelRef<FVM_DivineSkillInfo>(Model);
}
int __IndexOf_EquipableSkill()
{
    return 0;
}
int __IndexOf_HoverTipsVM()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_DivineSkillInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
