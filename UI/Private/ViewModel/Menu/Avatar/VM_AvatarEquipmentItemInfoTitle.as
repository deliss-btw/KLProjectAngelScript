
namespace FVM_AvatarEquipmentItemInfoTitle
{
    const int ModelId = 0;

}
struct FVM_AvatarEquipmentItemInfoTitle : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_EquipmentInfo;
    UPROPERTY()
    FText m_EquipmentName;
    UPROPERTY()
    FText m_EquipmentDescription;
    UPROPERTY()
    FText m_EquipmentLevelText;

    FVM_AvatarEquipmentItemInfoTitle()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarEquipmentItemInfoTitle' by default constructor.");
        return;
    }
    FVM_AvatarEquipmentItemInfoTitle(const FVM_AvatarEquipmentItemInfoTitle &inout Other)
    {
        this.m_EquipmentInfo = Other.m_EquipmentInfo;
        this.m_EquipmentName = Other.m_EquipmentName;
        this.m_EquipmentDescription = Other.m_EquipmentDescription;
        this.m_EquipmentLevelText = Other.m_EquipmentLevelText;
        return;
    }
    FVM_AvatarEquipmentItemInfoTitle(const TEUIModelRef<FVM_EquipmentInfo> &inout InEquipmentInfo)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEquipmentInfo(InEquipmentInfo);
        return;
    }
    FVM_AvatarEquipmentItemInfoTitle& opAssign(const FVM_AvatarEquipmentItemInfoTitle &inout Other)
    {
        this.m_EquipmentInfo = Other.m_EquipmentInfo;
        this.m_EquipmentName = Other.m_EquipmentName;
        this.m_EquipmentDescription = Other.m_EquipmentDescription;
        return Other.m_EquipmentLevelText;
    }
    void PostConstruct()
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2 = this.GetEquipmentInfo();
        TDataObjectPtr<FEquipmentConfig> local_26;
        local_26.GetEquipmentConfig();
        if (local_26)
        {
            FText::AsCultureInvariant("Lv.{0}");
            FText local_60;
            this.SetEquipmentLevelText(local_60);
        }
        return;
    }
    TEUIModelRef<FVM_EquipmentInfo> GetEquipmentInfo() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EquipmentInfo;
    }
    void SetEquipmentInfo(const TEUIModelRef<FVM_EquipmentInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        local_2 = this.m_EquipmentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EquipmentInfo = __Value;
        return;
    }
    FText GetEquipmentName() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_EquipmentName() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEquipmentName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EquipmentName = __Value;
        return;
    }
    FText GetEquipmentDescription() const property
    {
        FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_EquipmentDescription() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetEquipmentDescription(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_EquipmentDescription = __Value;
        return;
    }
    FText GetEquipmentLevelText() const property
    {
        FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_EquipmentLevelText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEquipmentLevelText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EquipmentLevelText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarEquipmentItemInfoTitle
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> Self;

    __GeneratedProperties_FVM_AvatarEquipmentItemInfoTitle()
    {
        return;
    }
}

namespace FVM_AvatarEquipmentItemInfoTitle
{
FVM_AvatarEquipmentItemInfoTitle& Create(const UObject ContextObject, const TEUIModelRef<FVM_EquipmentInfo> &inout EquipmentInfo)
{
    return FVM_AvatarEquipmentItemInfoTitle::CreateByManager(EUIInternal::GetContextManager(ContextObject), EquipmentInfo);
}
FVM_AvatarEquipmentItemInfoTitle CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_EquipmentInfo> &inout EquipmentInfo)
{
    FVM_AvatarEquipmentItemInfoTitle __r;
    TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> local_6 = TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarEquipmentItemInfoTitle::ModelId, 0, EquipmentInfo));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EquipmentName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarEquipmentItemInfoTitle;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarEquipmentItemInfoTitle;
}
FText __UIGetter_EquipmentName(const FVM_AvatarEquipmentItemInfoTitle &inout Model)
{
    return Model.GetEquipmentName();
}
FText __UIGetter_EquipmentDescription(const FVM_AvatarEquipmentItemInfoTitle &inout Model)
{
    return Model.GetEquipmentDescription();
}
FText __UIGetter_EquipmentLevelText(const FVM_AvatarEquipmentItemInfoTitle &inout Model)
{
    return Model.GetEquipmentLevelText();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> __UIGetter_Self(const FVM_AvatarEquipmentItemInfoTitle &inout Model)
{
    return TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>(Model);
}
int __IndexOf_EquipmentInfo()
{
    return 0;
}
int __IndexOf_EquipmentName()
{
    return 1;
}
int __IndexOf_EquipmentDescription()
{
    return 2;
}
int __IndexOf_EquipmentLevelText()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_AvatarEquipmentItemInfoTitle
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
