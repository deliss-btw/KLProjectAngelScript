
namespace FVM_BornSelectSpecialty
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature AB_ClickLeftAvatar = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature AB_ClickRightAvatar = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature AB_ConfirmSpecialty = FEUIModelCallbackSignature();

}
struct FVM_BornSelectSpecialty : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> m_AvatarLeft;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> m_AvatarRight;
    UPROPERTY()
    TEUIModelRef<FVM_SpecialtyItem> m_LeftSpecialtyItem;
    UPROPERTY()
    TEUIModelRef<FVM_SpecialtyItem> m_RightSpecialtyItem;
    UPROPERTY()
    uint m_LeftAvatarId;
    UPROPERTY()
    uint m_RightAvatarId;
    UPROPERTY()
    uint m_SelectedAvatarId;
    UPROPERTY()
    bool m_bBornAlready;
    UPROPERTY()
    bool m_bSpecialtyConfirmed;
    UPROPERTY()
    FText m_SelectedSpecialtyDesc;
    UPROPERTY()
    FText m_SelectEdSpecialtyRecommendation;

    FVM_BornSelectSpecialty()
    {
        this.m_LeftAvatarId = 0;
        this.m_RightAvatarId = 0;
        this.m_SelectedAvatarId = 0;
        this.m_bBornAlready = false;
        this.m_bSpecialtyConfirmed = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_BornSelectSpecialty(const FVM_BornSelectSpecialty &inout Other)
    {
        this.m_LeftAvatarId = 0;
        this.m_RightAvatarId = 0;
        this.m_SelectedAvatarId = 0;
        this.m_bBornAlready = false;
        this.m_bSpecialtyConfirmed = false;
        this.m_AvatarLeft = Other.m_AvatarLeft;
        this.m_AvatarRight = Other.m_AvatarRight;
        this.m_LeftSpecialtyItem = Other.m_LeftSpecialtyItem;
        this.m_RightSpecialtyItem = Other.m_RightSpecialtyItem;
        this.m_LeftAvatarId = int(Other.m_LeftAvatarId);
        this.m_RightAvatarId = int(Other.m_RightAvatarId);
        this.m_SelectedAvatarId = int(Other.m_SelectedAvatarId);
        this.m_bBornAlready = Other.m_bBornAlready;
        this.m_bSpecialtyConfirmed = Other.m_bSpecialtyConfirmed;
        this.m_SelectedSpecialtyDesc = Other.m_SelectedSpecialtyDesc;
        this.m_SelectEdSpecialtyRecommendation = Other.m_SelectEdSpecialtyRecommendation;
        return;
    }
    FVM_BornSelectSpecialty& opAssign(const FVM_BornSelectSpecialty &inout Other)
    {
        this.m_AvatarLeft = Other.m_AvatarLeft;
        this.m_AvatarRight = Other.m_AvatarRight;
        this.m_LeftSpecialtyItem = Other.m_LeftSpecialtyItem;
        this.m_RightSpecialtyItem = Other.m_RightSpecialtyItem;
        this.m_LeftAvatarId = int(Other.m_LeftAvatarId);
        this.m_RightAvatarId = int(Other.m_RightAvatarId);
        this.m_SelectedAvatarId = int(Other.m_SelectedAvatarId);
        this.m_bBornAlready = Other.m_bBornAlready;
        this.m_bSpecialtyConfirmed = Other.m_bSpecialtyConfirmed;
        this.m_SelectedSpecialtyDesc = Other.m_SelectedSpecialtyDesc;
        return Other.m_SelectEdSpecialtyRecommendation;
    }
    bool IsAvatarSelected() const
    {
        int local_1 = this.GetSelectedAvatarId();
        return (local_1 != 0);
    }
    bool IsSpecialtyLocked() const
    {
        return this.GetbSpecialtyConfirmed() || this.GetbBornAlready();
    }
    void PostConstruct()
    {
        int local_1 = 0;
        const UAvatarBuildSettings local_4;
        this.SetSelectedAvatarId(0);
        GetGameplaySettings<UAvatarBuildSettings> local_6;
        local_4 = local_6;
        if (local_4 == nullptr)
        {
            return;
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_58 = this.GetMainAvatarConfigFromBuild(local_4.SwordSpecialtyTrainingAvatarConfig);
        if (local_58.IsSet())
        {
            this.SetLeftAvatarId(local_1);
            TEUIModelRef<FM_Avatar> TEUIModelRef<FM_Avatar>() = TEUIModelRef<FM_Avatar>(::FM_Avatar::Create(this.GetManager(), local_58));
            this.SetAvatarLeft(TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetManager(), TEUIModelRef<FM_Avatar>())));
            TEUIModelRef<FVM_SpecialtyItem> local_68 = TEUIModelRef<FVM_SpecialtyItem>(::FVM_SpecialtyItem::Create(this.GetManager(), this.GetAvatarLeft()));
            this.SetLeftSpecialtyItem(local_68);
            int local_9 = 1;
            TEUIModelRef<FVM_SpecialtyItem> local_68_2 = this.GetLeftSpecialtyItem();
            local_9.SetbUseBtnSelect();
            local_9 = 1;
            TEUIModelRef<FVM_SpecialtyItem> local_68_3 = this.GetLeftSpecialtyItem();
            local_9.SetNeverActive();
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_34 = this.GetMainAvatarConfigFromBuild(local_4.WizardSpecialtyTrainingAvatarConfig);
        if (local_34.IsSet())
        {
            this.SetRightAvatarId(local_1);
            TEUIModelRef<FM_Avatar> local_64 = TEUIModelRef<FM_Avatar>(::FM_Avatar::Create(this.GetManager(), local_34));
            this.SetAvatarRight(TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetManager(), local_64)));
            TEUIModelRef<FVM_SpecialtyItem> local_68_4 = TEUIModelRef<FVM_SpecialtyItem>(::FVM_SpecialtyItem::Create(this.GetManager(), this.GetAvatarRight()));
            this.SetRightSpecialtyItem(local_68_4);
            int local_9_2 = 1;
            TEUIModelRef<FVM_SpecialtyItem> local_68_5 = this.GetRightSpecialtyItem();
            local_9_2.SetbUseBtnSelect();
            local_9_2 = 1;
            TEUIModelRef<FVM_SpecialtyItem> local_68_6 = this.GetRightSpecialtyItem();
            local_9_2.SetNeverActive();
        }
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetMainAvatarConfigFromBuild(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout BuildConfig) const
    {
        bool local_140 = false;
        if (!(BuildConfig.IsSet()))
        {
            return TDataObjectPtr<FAvatarPrefabConfig>();
        }
        if (!(GetAvatarMappingConfig().IsSet()))
        {
            return TDataObjectPtr<FAvatarPrefabConfig>();
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_122;
        for (auto& local_136 : GetAvatar())
        {
            if (!(local_136.IsSet()))
            {
                continue;
            }
            local_140 = local_140 && (0 == 1);
            if (local_140)
            {
                return local_136;
            }
            if (!(local_122.IsSet()))
            {
                local_122 = local_136;
            }
        }
        return local_122;
    }
    ESlateVisibility TipsBtnVisibility() const
    {
        bool local_5 = (int(::UICommonUtil::GetCurrentInputType(this.GetContext().UELocalPlayer)) == 0);
        if (local_5)
        {
            return ESlateVisibility(2);
        }
        else
        {
            return ESlateVisibility(0);
        }
    }
    void OnSpecialtyItemSelectedMsg(const FMsg_SpecialtyItemSelected &inout Msg)
    {
        if (this.IsSpecialtyLocked())
        {
            return;
        }
        int local_2 = int(Msg.AvatarId);
        if (local_2 == 0)
        {
            this.SetSelectedAvatarId(0);
            TEUIModelRef<FVM_SpecialtyItem> local_6 = this.GetLeftSpecialtyItem();
            0.SetbSelected();
            int local_1 = 0;
            TEUIModelRef<FVM_SpecialtyItem> local_6_2 = this.GetRightSpecialtyItem();
            local_1.SetbSelected();
        }
        if (local_2 == this.GetLeftAvatarId())
        {
            this.SetSelectedAvatarId(this.GetLeftAvatarId());
            int local_1_2 = 1;
            TEUIModelRef<FVM_SpecialtyItem> local_6_3 = this.GetLeftSpecialtyItem();
            local_1_2.SetbSelected();
            local_1_2 = 0;
            TEUIModelRef<FVM_SpecialtyItem> local_6_4 = this.GetRightSpecialtyItem();
            local_1_2.SetbSelected();
        }
        else
        {
            if (local_2 == this.GetRightAvatarId())
            {
                this.SetSelectedAvatarId(this.GetRightAvatarId());
                int local_1_3 = 0;
                TEUIModelRef<FVM_SpecialtyItem> local_6_5 = this.GetLeftSpecialtyItem();
                local_1_3.SetbSelected();
                local_1_3 = 1;
                TEUIModelRef<FVM_SpecialtyItem> local_6_6 = this.GetRightSpecialtyItem();
                local_1_3.SetbSelected();
            }
        }
        this.RefreshSelectedSpecialtyDesc();
        this.RefreshSelectedSpecialtyRecommendation();
        return;
    }
    void AB_ClickLeftAvatar()
    {
        if (this.IsSpecialtyLocked())
        {
            return;
        }
        int local_2 = this.GetSelectedAvatarId();
        if (local_2 != 0 && (this.GetSelectedAvatarId() == this.GetLeftAvatarId()))
        {
            return;
        }
        if (this.GetLeftSpecialtyItem().IsValid())
        {
            TEUIModelRef<FVM_SpecialtyItem> local_6 = this.GetLeftSpecialtyItem();
            OnClickItem();
        }
        return;
    }
    void AB_ClickRightAvatar()
    {
        if (this.IsSpecialtyLocked())
        {
            return;
        }
        int local_2 = this.GetSelectedAvatarId();
        if (local_2 != 0 && (this.GetSelectedAvatarId() == this.GetRightAvatarId()))
        {
            return;
        }
        if (this.GetRightSpecialtyItem().IsValid())
        {
            TEUIModelRef<FVM_SpecialtyItem> local_6 = this.GetRightSpecialtyItem();
            OnClickItem();
        }
        return;
    }
    void AB_ConfirmSpecialty()
    {
        const UAvatarBuildSettings local_8;
        if (this.IsSpecialtyLocked())
        {
            return;
        }
        int local_2 = this.GetSelectedAvatarId();
        if (local_2 == 0)
        {
            return;
        }
        if (this.GetSelectedAvatarId() == this.GetLeftAvatarId())
        {
            GetGameplaySettings<UAvatarBuildSettings> local_10;
            TEUIModelRef<FVM_AvatarInfo> local_6 = this.GetAvatarLeft();
            OnChangeSpecialty();
            local_8 = local_10;
            if (local_8 != nullptr)
            {
                if (local_8.SwordSpecialtyDivineSkillConfig.IsSet())
                {
                    ::FMS_DivineSkillData::Get(this.GetContext().Manager).GS_RequestChangeDivineSkill(local_8.SwordSpecialtyDivineSkillConfig);
                }
            }
        }
        else
        {
            GetGameplaySettings<UAvatarBuildSettings> local_10;
            TEUIModelRef<FVM_AvatarInfo> local_6_2 = this.GetAvatarRight();
            OnChangeSpecialty();
            local_8 = local_10;
            if (local_8 != nullptr)
            {
                if (local_8.WizardSpecialtyDivineSkillConfig.IsSet())
                {
                    ::FMS_DivineSkillData::Get(this.GetContext().Manager).GS_RequestChangeDivineSkill(local_8.WizardSpecialtyDivineSkillConfig);
                }
            }
        }
        this.SetbSpecialtyConfirmed(true);
        return;
    }
    void OnPlayerBornStateChanged(const FC_PlayerBornState &inout PlayerBornState)
    {
        if (PlayerBornState && PlayerBornState.GetbBorn())
        {
            this.SetbBornAlready(true);
        }
        return;
    }
    void RefreshSelectedSpecialtyDesc()
    {
        const UAvatarBuildSettings local_2;
        GetGameplaySettings<UAvatarBuildSettings> local_4;
        local_2 = local_4;
        if (local_2 != nullptr)
        {
            if (this.GetSelectedAvatarId() == this.GetLeftAvatarId())
            {
                this.SetSelectedSpecialtyDesc(local_2.SwordSpecialtyDescription);
            }
            else
            {
                if (this.GetSelectedAvatarId() == this.GetRightAvatarId())
                {
                    this.SetSelectedSpecialtyDesc(local_2.WizardSpecialtyDescription);
                }
                else
                {
                    this.SetSelectedSpecialtyDesc(FText());
                }
            }
        }
        return;
    }
    void RefreshSelectedSpecialtyRecommendation()
    {
        const UAvatarBuildSettings local_2;
        GetGameplaySettings<UAvatarBuildSettings> local_4;
        local_2 = local_4;
        if (local_2 != nullptr)
        {
            if (this.GetSelectedAvatarId() == this.GetLeftAvatarId())
            {
                this.SetSelectEdSpecialtyRecommendation(local_2.SwordSpecialtyRecommendation);
            }
            else
            {
                if (this.GetSelectedAvatarId() == this.GetRightAvatarId())
                {
                    this.SetSelectEdSpecialtyRecommendation(local_2.WizardSpecialtyRecommendation);
                }
                else
                {
                    this.SetSelectEdSpecialtyRecommendation(FText());
                }
            }
        }
        return;
    }
    TEUIModelRef<FVM_AvatarInfo> GetAvatarLeft() const property
    {
        this.TrackPropertyRead(0);
        return this.m_AvatarLeft;
    }
    void SetAvatarLeft(const TEUIModelRef<FVM_AvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarInfo> local_2;
        local_2 = this.m_AvatarLeft;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarLeft = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarInfo> GetAvatarRight() const property
    {
        this.TrackPropertyRead(1);
        return this.m_AvatarRight;
    }
    void SetAvatarRight(const TEUIModelRef<FVM_AvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarInfo> local_2;
        local_2 = this.m_AvatarRight;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AvatarRight = __Value;
        return;
    }
    TEUIModelRef<FVM_SpecialtyItem> GetLeftSpecialtyItem() const property
    {
        this.TrackPropertyRead(2);
        return this.m_LeftSpecialtyItem;
    }
    void SetLeftSpecialtyItem(const TEUIModelRef<FVM_SpecialtyItem> &inout __Value) property
    {
        TEUIModelRef<FVM_SpecialtyItem> local_2;
        local_2 = this.m_LeftSpecialtyItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LeftSpecialtyItem = __Value;
        return;
    }
    TEUIModelRef<FVM_SpecialtyItem> GetRightSpecialtyItem() const property
    {
        this.TrackPropertyRead(3);
        return this.m_RightSpecialtyItem;
    }
    void SetRightSpecialtyItem(const TEUIModelRef<FVM_SpecialtyItem> &inout __Value) property
    {
        TEUIModelRef<FVM_SpecialtyItem> local_2;
        local_2 = this.m_RightSpecialtyItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RightSpecialtyItem = __Value;
        return;
    }
    uint GetLeftAvatarId() const property
    {
        this.TrackPropertyRead(4);
        return this.m_LeftAvatarId;
    }
    void SetLeftAvatarId(const uint __Value) property
    {
        if (this.m_LeftAvatarId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_LeftAvatarId = __Value;
        return;
    }
    uint GetRightAvatarId() const property
    {
        this.TrackPropertyRead(5);
        return this.m_RightAvatarId;
    }
    void SetRightAvatarId(const uint __Value) property
    {
        if (this.m_RightAvatarId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_RightAvatarId = __Value;
        return;
    }
    uint GetSelectedAvatarId() const property
    {
        this.TrackPropertyRead(6);
        return this.m_SelectedAvatarId;
    }
    void SetSelectedAvatarId(const uint __Value) property
    {
        if (this.m_SelectedAvatarId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SelectedAvatarId = __Value;
        return;
    }
    bool GetbBornAlready() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bBornAlready;
    }
    void SetbBornAlready(const bool __Value) property
    {
        if (!(this.m_bBornAlready) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bBornAlready = __Value;
        return;
    }
    bool GetbSpecialtyConfirmed() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bSpecialtyConfirmed;
    }
    void SetbSpecialtyConfirmed(const bool __Value) property
    {
        if (!(this.m_bSpecialtyConfirmed) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bSpecialtyConfirmed = __Value;
        return;
    }
    const FText GetSelectedSpecialtyDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FText GetModify_SelectedSpecialtyDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetSelectedSpecialtyDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_SelectedSpecialtyDesc = __Value;
        return;
    }
    const FText GetSelectEdSpecialtyRecommendation() const property
    {
        const FText __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FText GetModify_SelectEdSpecialtyRecommendation() property
    {
        FText __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetSelectEdSpecialtyRecommendation(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_SelectEdSpecialtyRecommendation = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BornSelectSpecialty
{
    UPROPERTY()
    bool IsAvatarSelected;
    UPROPERTY()
    bool IsSpecialtyLocked;
    UPROPERTY()
    ESlateVisibility TipsBtnVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_BornSelectSpecialty> Self;


}

namespace FVM_BornSelectSpecialty
{
FVM_BornSelectSpecialty& Create(const UObject ContextObject)
{
    return FVM_BornSelectSpecialty::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_BornSelectSpecialty CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_BornSelectSpecialty __r;
    TEUIModelRef<FVM_BornSelectSpecialty> local_6 = TEUIModelRef<FVM_BornSelectSpecialty>(EUIInternal::MakeModelWithManager(Manager, FVM_BornSelectSpecialty::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarLeft";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarRight";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftSpecialtyItem";
    local_14.TypeName = "TEUIModelRef<FVM_SpecialtyItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightSpecialtyItem";
    local_14.TypeName = "TEUIModelRef<FVM_SpecialtyItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedSpecialtyDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectEdSpecialtyRecommendation";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsAvatarSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSpecialtyLocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipsBtnVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BornSelectSpecialty>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BornSelectSpecialty;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnSpecialtyItemSelectedMsg";
    local_26.MessageTypeName = "Msg_SpecialtyItemSelected";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    FEUIModelMonitorDefine local_40;
    local_40.FunctionName = "__OnPlayerBornStateChanged";
    local_40.ComponentType = FC_PlayerBornState;
    Result.MonitorFunctions.Add(local_40);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BornSelectSpecialty;
}
void __OnSpecialtyItemSelectedMsg(FVM_BornSelectSpecialty &inout Model, const FMsg_SpecialtyItemSelected &inout Message)
{
    Model.OnSpecialtyItemSelectedMsg(Message);
    return;
}
void __OnPlayerBornStateChanged(FVM_BornSelectSpecialty &inout Model, const FECSEntity &inout Entity, const FC_PlayerBornState &inout Component)
{
    Model.OnPlayerBornStateChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TEUIModelRef<FVM_AvatarInfo> __UIGetter_AvatarLeft(const FVM_BornSelectSpecialty &inout Model)
{
    return Model.GetAvatarLeft();
}
TEUIModelRef<FVM_AvatarInfo> __UIGetter_AvatarRight(const FVM_BornSelectSpecialty &inout Model)
{
    return Model.GetAvatarRight();
}
TEUIModelRef<FVM_SpecialtyItem> __UIGetter_LeftSpecialtyItem(const FVM_BornSelectSpecialty &inout Model)
{
    return Model.GetLeftSpecialtyItem();
}
TEUIModelRef<FVM_SpecialtyItem> __UIGetter_RightSpecialtyItem(const FVM_BornSelectSpecialty &inout Model)
{
    return Model.GetRightSpecialtyItem();
}
FText __UIGetter_SelectedSpecialtyDesc(const FVM_BornSelectSpecialty &inout Model)
{
    return Model.GetSelectedSpecialtyDesc();
}
FText __UIGetter_SelectEdSpecialtyRecommendation(const FVM_BornSelectSpecialty &inout Model)
{
    return Model.GetSelectEdSpecialtyRecommendation();
}
bool __UIGetter_IsAvatarSelected(const FVM_BornSelectSpecialty &inout Model)
{
    return Model.IsAvatarSelected();
}
bool __UIGetter_IsSpecialtyLocked(const FVM_BornSelectSpecialty &inout Model)
{
    return Model.IsSpecialtyLocked();
}
ESlateVisibility __UIGetter_TipsBtnVisibility(const FVM_BornSelectSpecialty &inout Model)
{
    return Model.TipsBtnVisibility();
}
TEUIModelRef<FVM_BornSelectSpecialty> __UIGetter_Self(const FVM_BornSelectSpecialty &inout Model)
{
    return TEUIModelRef<FVM_BornSelectSpecialty>(Model);
}
int __IndexOf_AvatarLeft()
{
    return 0;
}
int __IndexOf_AvatarRight()
{
    return 1;
}
int __IndexOf_LeftSpecialtyItem()
{
    return 2;
}
int __IndexOf_RightSpecialtyItem()
{
    return 3;
}
int __IndexOf_LeftAvatarId()
{
    return 4;
}
int __IndexOf_RightAvatarId()
{
    return 5;
}
int __IndexOf_SelectedAvatarId()
{
    return 6;
}
int __IndexOf_bBornAlready()
{
    return 7;
}
int __IndexOf_bSpecialtyConfirmed()
{
    return 8;
}
int __IndexOf_SelectedSpecialtyDesc()
{
    return 9;
}
int __IndexOf_SelectEdSpecialtyRecommendation()
{
    return 10;
}
}
namespace __GeneratedProperties_FVM_BornSelectSpecialty
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
