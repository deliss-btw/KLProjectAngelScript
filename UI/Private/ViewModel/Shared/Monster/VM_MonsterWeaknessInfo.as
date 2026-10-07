
namespace FVM_MonsterWeaknessInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature GotoCommissionRewardDetail = FEUIModelCallbackSignature();

}
struct FVM_MonsterWeaknessInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FMonsterWeaknessPartConfig> m_WeaknessPartConfig;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_RewardList;
    UPROPERTY()
    FText m_RewardTitleText;

    FVM_MonsterWeaknessInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MonsterWeaknessInfo(const FVM_MonsterWeaknessInfo &inout Other)
    {
        this.m_WeaknessPartConfig = Other.m_WeaknessPartConfig;
        this.m_RewardList = Other.m_RewardList;
        this.m_RewardTitleText = Other.m_RewardTitleText;
        return;
    }
    FVM_MonsterWeaknessInfo& opAssign(const FVM_MonsterWeaknessInfo &inout Other)
    {
        this.m_WeaknessPartConfig = Other.m_WeaknessPartConfig;
        this.m_RewardList = Other.m_RewardList;
        return Other.m_RewardTitleText;
    }
    void LoadConfig(const FConfigVM_MonsterWeaknessInfo &inout InConfig)
    {
        this.SetRewardTitleText(InConfig.RewardTitleText);
        this.SetWeaknessPartConfig(InConfig.WeaknessPartConfig);
        return;
    }
    void RefreshRewardList()
    {
        if (!(this.GetWeaknessPartConfig()))
        {
            return;
        }
        TEUIModelRef<FVM_CommonRewardList> local_8 = TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, ::FCommonRewardListBuilder::BuildFromDropConfig(this.GetWeaknessPartConfig().opArrow().GetDestroyDropItemConfig())));
        this.SetRewardList(local_8);
        TEUIModelRef<FVM_CommonRewardList> local_8_2 = this.GetRewardList();
        this.GetRewardTitleText().OverrideRewardTitleText();
        TEUIModelRef<FVM_CommonRewardList> local_8_3 = this.GetRewardList();
        this.GetWeaknessPartConfig().opArrow().PartName.OverrideRewardDescriptionText();
        return;
    }
    void GotoCommissionRewardDetail()
    {
        if (this.GetRewardList().IsNull() || this.GetRewardList().opArrow().IsEmpty())
        {
            return;
        }
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_CommissionRewardDetail, this.GetRewardList().opImplConv());
        return;
    }
    const TDataObjectPtr<FMonsterWeaknessPartConfig> GetWeaknessPartConfig() const property
    {
        const TDataObjectPtr<FMonsterWeaknessPartConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FMonsterWeaknessPartConfig> GetModify_WeaknessPartConfig() property
    {
        TDataObjectPtr<FMonsterWeaknessPartConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetWeaknessPartConfig(const TDataObjectPtr<FMonsterWeaknessPartConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_WeaknessPartConfig = __Value;
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
    const FText GetRewardTitleText() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_RewardTitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetRewardTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RewardTitleText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MonsterWeaknessInfo
{
    UPROPERTY()
    TEUIModelRef<FVM_MonsterWeaknessInfo> Self;

    __GeneratedProperties_FVM_MonsterWeaknessInfo()
    {
        return;
    }
}

namespace FVM_MonsterWeaknessInfo
{
FVM_MonsterWeaknessInfo& Create(const UObject ContextObject)
{
    return FVM_MonsterWeaknessInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MonsterWeaknessInfo CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MonsterWeaknessInfo __r;
    TEUIModelRef<FVM_MonsterWeaknessInfo> local_6 = TEUIModelRef<FVM_MonsterWeaknessInfo>(EUIInternal::MakeModelWithManager(Manager, FVM_MonsterWeaknessInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "WeaknessPartConfig";
    local_14.TypeName = "TDataObjectPtr<FMonsterWeaknessPartConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardList";
    local_14.TypeName = "TEUIModelRef<FVM_CommonRewardList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardTitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MonsterWeaknessInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MonsterWeaknessInfo;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__RefreshRewardList";
    local_24.DirtyFlags.Set(FVM_MonsterWeaknessInfo::__IndexOf_WeaknessPartConfig());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MonsterWeaknessInfo;
}
void __RefreshRewardList(FVM_MonsterWeaknessInfo &inout Model)
{
    Model.RefreshRewardList();
    return;
}
TDataObjectPtr<FMonsterWeaknessPartConfig> __UIGetter_WeaknessPartConfig(const FVM_MonsterWeaknessInfo &inout Model)
{
    return Model.GetWeaknessPartConfig();
}
TEUIModelRef<FVM_CommonRewardList> __UIGetter_RewardList(const FVM_MonsterWeaknessInfo &inout Model)
{
    return Model.GetRewardList();
}
FText __UIGetter_RewardTitleText(const FVM_MonsterWeaknessInfo &inout Model)
{
    return Model.GetRewardTitleText();
}
TEUIModelRef<FVM_MonsterWeaknessInfo> __UIGetter_Self(const FVM_MonsterWeaknessInfo &inout Model)
{
    return TEUIModelRef<FVM_MonsterWeaknessInfo>(Model);
}
int __IndexOf_WeaknessPartConfig()
{
    return 0;
}
int __IndexOf_RewardList()
{
    return 1;
}
int __IndexOf_RewardTitleText()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MonsterWeaknessInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
