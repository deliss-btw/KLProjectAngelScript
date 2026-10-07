
namespace FVM_TalentEditPageChangeSkill
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSkillItemSelected = FEUIModelCallbackSignature();

}
struct FVM_TalentEditPageChangeSkill : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> m_OnSelectTypeAllSkill;
    UPROPERTY()
    int m_CurrentSkillIndex;
    UPROPERTY()
    TEUIModelRef<FMS_EditingAvatar> m_EditingAvatar;
    UPROPERTY()
    TDataObjectPtr<FSkillInitConfig> m_CurSkillBtnConfig;

    FVM_TalentEditPageChangeSkill()
    {
        this.m_CurrentSkillIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TalentEditPageChangeSkill' by default constructor.");
        return;
    }
    FVM_TalentEditPageChangeSkill(const FVM_TalentEditPageChangeSkill &inout Other)
    {
        this.m_CurrentSkillIndex = 0;
        this.m_OnSelectTypeAllSkill = Other.m_OnSelectTypeAllSkill;
        this.m_CurrentSkillIndex = int(Other.m_CurrentSkillIndex);
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_CurSkillBtnConfig = Other.m_CurSkillBtnConfig;
        return;
    }
    FVM_TalentEditPageChangeSkill(const TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> &inout InOnSelectTypeAllSkill)
    {
        this.m_CurrentSkillIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetOnSelectTypeAllSkill(InOnSelectTypeAllSkill);
        return;
    }
    FVM_TalentEditPageChangeSkill& opAssign(const FVM_TalentEditPageChangeSkill &inout Other)
    {
        this.m_OnSelectTypeAllSkill = Other.m_OnSelectTypeAllSkill;
        this.m_CurrentSkillIndex = int(Other.m_CurrentSkillIndex);
        this.m_EditingAvatar = Other.m_EditingAvatar;
        return Other.m_CurSkillBtnConfig;
    }
    TEUIModelRef<FVM_TalentSkillInfoItem> GetSelectedSkillInfoItem() const
    {
        if (this.GetOnSelectTypeAllSkill().IsValidIndex(this.GetCurrentSkillIndex()))
        {
            return this.GetOnSelectTypeAllSkill()[this.GetCurrentSkillIndex()];
        }
        return TEUIModelRef<FVM_TalentSkillInfoItem>();
    }
    void Setup(const TEUIModelRef<FVM_TalentEditSkillBtn> &inout SetDefaultSelect)
    {
        TEUIModelRef<FM_TalentNode> local_18;
        TEUIModelWeakRef<FM_TalentNode> local_20;
        for (auto& local_16 : this.GetOnSelectTypeAllSkill())
        {
            local_18.GetTalentNode();
            local_20.GetTalentNode();
            if ((local_18 == local_20.opImplConv()))
            {
                this.SetCurrentSkillIndex(this.GetOnSelectTypeAllSkill().IndexOfByKey(local_16));
            }
        }
        return;
    }
    void PostConstruct()
    {
        this.SetEditingAvatar(TEUIModelRef<FMS_EditingAvatar>(::FMS_EditingAvatar::Get(this.GetContext().Manager)));
        TEUIModelRef<FMS_EditingAvatar> local_2 = this.GetEditingAvatar();
        bool local_3 = !(!(GetAvatarConfig()));
        return;
    }
    void BeginDestroy()
    {
        return;
    }
    void OnSkillItemSelected(const FEUIModelContainer &inout SkillItem)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    const TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> GetOnSelectTypeAllSkill() const property
    {
        const TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> GetModify_OnSelectTypeAllSkill() property
    {
        TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetOnSelectTypeAllSkill(const TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OnSelectTypeAllSkill = __Value;
        return;
    }
    int GetCurrentSkillIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurrentSkillIndex;
    }
    void SetCurrentSkillIndex(const int __Value) property
    {
        if (this.m_CurrentSkillIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentSkillIndex = __Value;
        return;
    }
    TEUIModelRef<FMS_EditingAvatar> GetEditingAvatar() const property
    {
        this.TrackPropertyRead(2);
        return this.m_EditingAvatar;
    }
    void SetEditingAvatar(const TEUIModelRef<FMS_EditingAvatar> &inout __Value) property
    {
        TEUIModelRef<FMS_EditingAvatar> local_2;
        local_2 = this.m_EditingAvatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_EditingAvatar = __Value;
        return;
    }
    const TDataObjectPtr<FSkillInitConfig> GetCurSkillBtnConfig() const property
    {
        const TDataObjectPtr<FSkillInitConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FSkillInitConfig> GetModify_CurSkillBtnConfig() property
    {
        TDataObjectPtr<FSkillInitConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCurSkillBtnConfig(const TDataObjectPtr<FSkillInitConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurSkillBtnConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TalentEditPageChangeSkill
{
    UPROPERTY()
    TEUIModelRef<FVM_TalentSkillInfoItem> SelectedSkillInfoItem;
    UPROPERTY()
    TEUIModelRef<FVM_TalentEditPageChangeSkill> Self;

    __GeneratedProperties_FVM_TalentEditPageChangeSkill()
    {
        return;
    }
}

namespace FVM_TalentEditPageChangeSkill
{
FVM_TalentEditPageChangeSkill& Create(const UObject ContextObject, const TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> &inout OnSelectTypeAllSkill)
{
    return FVM_TalentEditPageChangeSkill::CreateByManager(EUIInternal::GetContextManager(ContextObject), OnSelectTypeAllSkill);
}
FVM_TalentEditPageChangeSkill CreateByManager(const UEUIManagerSubsystem Manager, const TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> &inout OnSelectTypeAllSkill)
{
    FVM_TalentEditPageChangeSkill __r;
    TEUIModelRef<FVM_TalentEditPageChangeSkill> local_6 = TEUIModelRef<FVM_TalentEditPageChangeSkill>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentEditPageChangeSkill::ModelId, 0, OnSelectTypeAllSkill));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "OnSelectTypeAllSkill";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TalentSkillInfoItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedSkillInfoItem";
    local_14.TypeName = "TEUIModelRef<FVM_TalentSkillInfoItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TalentEditPageChangeSkill>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TalentEditPageChangeSkill;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentEditPageChangeSkill;
}
TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> __UIGetter_OnSelectTypeAllSkill(const FVM_TalentEditPageChangeSkill &inout Model)
{
    return Model.GetOnSelectTypeAllSkill();
}
TEUIModelRef<FVM_TalentSkillInfoItem> __UIGetter_SelectedSkillInfoItem(const FVM_TalentEditPageChangeSkill &inout Model)
{
    return Model.GetSelectedSkillInfoItem();
}
TEUIModelRef<FVM_TalentEditPageChangeSkill> __UIGetter_Self(const FVM_TalentEditPageChangeSkill &inout Model)
{
    return TEUIModelRef<FVM_TalentEditPageChangeSkill>(Model);
}
int __IndexOf_OnSelectTypeAllSkill()
{
    return 0;
}
int __IndexOf_CurrentSkillIndex()
{
    return 1;
}
int __IndexOf_EditingAvatar()
{
    return 2;
}
int __IndexOf_CurSkillBtnConfig()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_TalentEditPageChangeSkill
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
