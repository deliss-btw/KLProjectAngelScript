
namespace FVM_EquipmentCompare
{
    const int ModelId = 0;

}
struct FVM_EquipmentCompare : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Equipment> m_Equipment;
    UPROPERTY()
    TEUIModelRef<FM_Equipment> m_CompareTarget;
    UPROPERTY()
    TArray<FEUIModelRef> m_CompareAttributes;

    FVM_EquipmentCompare()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_EquipmentCompare' by default constructor.");
        return;
    }
    FVM_EquipmentCompare(const FVM_EquipmentCompare &inout Other)
    {
        this.m_Equipment = Other.m_Equipment;
        this.m_CompareTarget = Other.m_CompareTarget;
        this.m_CompareAttributes = Other.m_CompareAttributes;
        return;
    }
    FVM_EquipmentCompare(const TEUIModelRef<FM_Equipment> &inout InEquipment, const TEUIModelRef<FM_Equipment> &inout InCompareTarget)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEquipment(InEquipment);
        this.SetCompareTarget(InCompareTarget);
        return;
    }
    FVM_EquipmentCompare& opAssign(const FVM_EquipmentCompare &inout Other)
    {
        this.m_Equipment = Other.m_Equipment;
        this.m_CompareTarget = Other.m_CompareTarget;
        return Other.m_CompareAttributes;
    }
    void PostConstruct()
    {
        const UAvatarBuildSettings local_2;
        GetGameplaySettings<UAvatarBuildSettings> local_4;
        int local_101 = 0;
        local_2 = local_4;
        TEUIModelRef<FM_Equipment> local_8 = this.GetEquipment();
        TDataObjectPtr<FEquipmentConfig> local_32 = GetEquipmentConfig();
        TEUIModelRef<FM_Equipment> local_8_2 = this.GetCompareTarget();
        TDataObjectPtr<FEquipmentConfig> local_80 = GetEquipmentConfig();
        for (auto& local_96 : local_2.EquipmentDetailDisplayAttributes)
        {
            TEUIModelRef<FM_Equipment> local_8_3 = this.GetEquipment();
            float32 local_98 = ::FEquipmentUtils::FindAttributeValue(GetEquipmentConfig(), local_96.Attribute);
            TEUIModelRef<FM_Equipment> local_8_4 = this.GetCompareTarget();
            float32 local_97 = ::FEquipmentUtils::FindAttributeValue(GetEquipmentConfig(), local_96.Attribute);
            if (local_98 > local_97)
            {
                local_101 = 1;
            }
            else
            {
                if (local_98 < local_97)
                {
                    local_101 = 2;
                }
                else
                {
                    local_101 = 0;
                }
            }
            this.GetModify_CompareAttributes().Add(FEUIModelRef(::FVM_AttributeCompare::Create(this.GetContext().Manager)));
        }
        return;
    }
    TEUIModelRef<FM_Equipment> GetEquipment() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Equipment;
    }
    void SetEquipment(const TEUIModelRef<FM_Equipment> &inout __Value) property
    {
        TEUIModelRef<FM_Equipment> local_2;
        local_2 = this.m_Equipment;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Equipment = __Value;
        return;
    }
    TEUIModelRef<FM_Equipment> GetCompareTarget() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CompareTarget;
    }
    void SetCompareTarget(const TEUIModelRef<FM_Equipment> &inout __Value) property
    {
        TEUIModelRef<FM_Equipment> local_2;
        local_2 = this.m_CompareTarget;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CompareTarget = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetCompareAttributes() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_CompareAttributes() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCompareAttributes(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CompareAttributes = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_EquipmentCompare
{
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentCompare> Self;

    __GeneratedProperties_FVM_EquipmentCompare()
    {
        return;
    }
}

namespace FVM_EquipmentCompare
{
FVM_EquipmentCompare& Create(const UObject ContextObject, const TEUIModelRef<FM_Equipment> &inout Equipment, const TEUIModelRef<FM_Equipment> &inout CompareTarget)
{
    return FVM_EquipmentCompare::CreateByManager(EUIInternal::GetContextManager(ContextObject), Equipment, CompareTarget);
}
FVM_EquipmentCompare CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Equipment> &inout Equipment, const TEUIModelRef<FM_Equipment> &inout CompareTarget)
{
    FVM_EquipmentCompare __r;
    TEUIModelRef<FVM_EquipmentCompare> local_6 = TEUIModelRef<FVM_EquipmentCompare>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_EquipmentCompare::ModelId, 0, Equipment, CompareTarget));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CompareAttributes";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_EquipmentCompare>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_EquipmentCompare;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_EquipmentCompare;
}
TArray<FEUIModelRef> __UIGetter_CompareAttributes(const FVM_EquipmentCompare &inout Model)
{
    return Model.GetCompareAttributes();
}
TEUIModelRef<FVM_EquipmentCompare> __UIGetter_Self(const FVM_EquipmentCompare &inout Model)
{
    return TEUIModelRef<FVM_EquipmentCompare>(Model);
}
int __IndexOf_Equipment()
{
    return 0;
}
int __IndexOf_CompareTarget()
{
    return 1;
}
int __IndexOf_CompareAttributes()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_EquipmentCompare
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
