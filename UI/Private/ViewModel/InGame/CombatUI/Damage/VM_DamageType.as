
namespace FVM_DamageType
{
    const int ModelId = 0;

}
struct FVM_DamageType : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EDamageType m_DamageType;
    UPROPERTY()
    FSoftBrush m_DamageIcon;
    UPROPERTY()
    FText m_DamageName;
    UPROPERTY()
    FText m_DamageDescription;
    UPROPERTY()
    FEUIModelContainer m_TitleAndDesc;

    FVM_DamageType()
    {
        this.m_DamageType = EDamageType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_DamageType' by default constructor.");
        return;
    }
    FVM_DamageType(const FVM_DamageType &inout Other)
    {
        this.m_DamageType = EDamageType(0);
        this.m_DamageType = Other.m_DamageType;
        this.m_DamageIcon = Other.m_DamageIcon;
        this.m_DamageName = Other.m_DamageName;
        this.m_DamageDescription = Other.m_DamageDescription;
        this.m_TitleAndDesc = Other.m_TitleAndDesc;
        return;
    }
    FVM_DamageType(const EDamageType InDamageType)
    {
        this.m_DamageType = EDamageType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDamageType(EDamageType(InDamageType));
        return;
    }
    FVM_DamageType& opAssign(const FVM_DamageType &inout Other)
    {
        this.m_DamageType = Other.m_DamageType;
        this.m_DamageIcon = Other.m_DamageIcon;
        this.m_DamageName = Other.m_DamageName;
        this.m_DamageDescription = Other.m_DamageDescription;
        return Other.m_TitleAndDesc;
    }
    void PostConstruct()
    {
        const UDamageSettings local_2;
        GetGameplaySettings<UDamageSettings> local_4;
        local_2 = local_4;
        if (local_2 != nullptr)
        {
            TRawPtr<FDamageTypeInfoConfig> local_10 = local_2.DamageTypeInfos.Find(this.GetDamageType());
            if (local_10)
            {
                if (UICommonUtil::CVar_UI_UseAttributePresentation.GetBool())
                {
                    this.SetDamageIcon(local_10.opArrow().DamagePresentation.GetIcon());
                    this.SetDamageName(local_10.opArrow().DamagePresentation.GetDisplayName());
                    this.SetDamageDescription(local_10.opArrow().DamagePresentation.GetDescription());
                }
                else
                {
                    this.SetDamageIcon(local_10.opArrow().DamageIcon);
                    this.SetDamageName(local_10.opArrow().DamageName);
                    this.SetDamageDescription(local_10.opArrow().DamageDescription);
                }
            }
        }
        FEUIModelRef local_62;
        this.GetModify_TitleAndDesc().AddModel(local_62, false);
        return;
    }
    EDamageType GetDamageType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DamageType;
    }
    void SetDamageType(const EDamageType __Value) property
    {
        if (int(this.m_DamageType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DamageType = __Value;
        return;
    }
    const FSoftBrush GetDamageIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSoftBrush GetModify_DamageIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDamageIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DamageIcon = __Value;
        return;
    }
    const FText GetDamageName() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_DamageName() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDamageName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DamageName = __Value;
        return;
    }
    const FText GetDamageDescription() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_DamageDescription() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetDamageDescription(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DamageDescription = __Value;
        return;
    }
    const FEUIModelContainer GetTitleAndDesc() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelContainer GetModify_TitleAndDesc() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetTitleAndDesc(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TitleAndDesc = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_DamageType
{
    UPROPERTY()
    TEUIModelRef<FVM_DamageType> Self;

    __GeneratedProperties_FVM_DamageType()
    {
        return;
    }
}

namespace FVM_DamageType
{
FVM_DamageType& Create(const UObject ContextObject, const EDamageType DamageType)
{
    return FVM_DamageType::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_DamageType CreateByManager(const UEUIManagerSubsystem Manager, const EDamageType DamageType)
{
    FVM_DamageType __r;
    TEUIModelRef<FVM_DamageType> local_6 = TEUIModelRef<FVM_DamageType>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_DamageType::ModelId, 0, DamageType));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DamageType";
    local_14.TypeName = "EDamageType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DamageIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DamageName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DamageDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TitleAndDesc";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_DamageType>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_DamageType;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_DamageType;
}
EDamageType __UIGetter_DamageType(const FVM_DamageType &inout Model)
{
    return Model.GetDamageType();
}
FSoftBrush __UIGetter_DamageIcon(const FVM_DamageType &inout Model)
{
    return Model.GetDamageIcon();
}
FText __UIGetter_DamageName(const FVM_DamageType &inout Model)
{
    return Model.GetDamageName();
}
FText __UIGetter_DamageDescription(const FVM_DamageType &inout Model)
{
    return Model.GetDamageDescription();
}
FEUIModelContainer __UIGetter_TitleAndDesc(const FVM_DamageType &inout Model)
{
    return Model.GetTitleAndDesc();
}
TEUIModelRef<FVM_DamageType> __UIGetter_Self(const FVM_DamageType &inout Model)
{
    return TEUIModelRef<FVM_DamageType>(Model);
}
int __IndexOf_DamageType()
{
    return 0;
}
int __IndexOf_DamageIcon()
{
    return 1;
}
int __IndexOf_DamageName()
{
    return 2;
}
int __IndexOf_DamageDescription()
{
    return 3;
}
int __IndexOf_TitleAndDesc()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_DamageType
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
