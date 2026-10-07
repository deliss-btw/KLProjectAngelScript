
namespace FVM_CurrentDivineSkill
{
    const int ModelId = 0;

}
struct FVM_CurrentDivineSkill : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;

    FVM_CurrentDivineSkill()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CurrentDivineSkill(const FVM_CurrentDivineSkill &inout Other)
    {
        return;
    }
    FVM_CurrentDivineSkill opAssign(const FVM_CurrentDivineSkill &inout Other)
    {
        FVM_CurrentDivineSkill __r;
        return __r;
    }
    TEUIModelRef<FVM_DivineSkillInfo> GetEquipableSkillInfo() const
    {
        return TEUIModelRef<FVM_DivineSkillInfo>(::FVM_DivineSkillInfo::Create(this.GetContext().Manager, ::FMS_DivineSkillData::Get(this.GetContext().Manager).GetLocalPlayerDivineSkill()));
    }
    bool GetEquipableSkillNotSuit() const
    {
        FVM_DivineSkillInfo& local_6;
        TEUIModelRef<FVM_DivineSkillInfo> local_2 = this.GetEquipableSkillInfo();
        if (local_6)
        {
            return local_6.GetEquipableSkillConfig() && !(local_6.SuitForCurrentAvatar());
        }
        return false;
    }
    FText GetEquipableSkillNotSuitHint() const
    {
        FVM_DivineSkillInfo& local_6;
        TEUIModelRef<FVM_DivineSkillInfo> local_2 = this.GetEquipableSkillInfo();
        FText local_12;
        if (local_6)
        {
            local_12 = local_6.GetDivineSkillTypeDesc();
            return FText::Format(NSLOCTEXT("DivineSkillNotSuitHint", "зҐћж јжЉЂдёЋеЅ“е‰ЌйџдјЌи§’и‰Іеќ‡дёЌеЊ№й…ЌпјЊе»єи®®дёЉйµ{0}и§’и‰ІжїЂжґ»зҐћж јжЉЂ"), local_12);
        }
        return local_12;
    }
}

struct __GeneratedProperties_FVM_CurrentDivineSkill
{
    UPROPERTY()
    TEUIModelRef<FVM_DivineSkillInfo> EquipableSkillInfo;
    UPROPERTY()
    bool EquipableSkillNotSuit;
    UPROPERTY()
    FText EquipableSkillNotSuitHint;
    UPROPERTY()
    TEUIModelRef<FVM_CurrentDivineSkill> Self;


}

namespace FVM_CurrentDivineSkill
{
FVM_CurrentDivineSkill& Create(const UObject ContextObject)
{
    return FVM_CurrentDivineSkill::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CurrentDivineSkill CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CurrentDivineSkill __r;
    TEUIModelRef<FVM_CurrentDivineSkill> local_6 = TEUIModelRef<FVM_CurrentDivineSkill>(EUIInternal::MakeModelWithManager(Manager, FVM_CurrentDivineSkill::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EquipableSkillInfo";
    local_14.TypeName = "TEUIModelRef<FVM_DivineSkillInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipableSkillNotSuit";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipableSkillNotSuitHint";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CurrentDivineSkill>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CurrentDivineSkill;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CurrentDivineSkill;
}
TEUIModelRef<FVM_DivineSkillInfo> __UIGetter_EquipableSkillInfo(const FVM_CurrentDivineSkill &inout Model)
{
    return Model.GetEquipableSkillInfo();
}
bool __UIGetter_EquipableSkillNotSuit(const FVM_CurrentDivineSkill &inout Model)
{
    return Model.GetEquipableSkillNotSuit();
}
FText __UIGetter_EquipableSkillNotSuitHint(const FVM_CurrentDivineSkill &inout Model)
{
    return Model.GetEquipableSkillNotSuitHint();
}
TEUIModelRef<FVM_CurrentDivineSkill> __UIGetter_Self(const FVM_CurrentDivineSkill &inout Model)
{
    return TEUIModelRef<FVM_CurrentDivineSkill>(Model);
}
}
namespace __GeneratedProperties_FVM_CurrentDivineSkill
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
