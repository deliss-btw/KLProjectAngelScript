
namespace FVM_ForgeWeaponTitle
{
    const int ModelId = 0;

}
struct FVM_ForgeWeaponTitle : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_WeaponIndex;
    UPROPERTY()
    FSoftBrush m_Image;
    UPROPERTY()
    FText m_DisplayName;
    UPROPERTY()
    float32 m_WidthOverride;

    FVM_ForgeWeaponTitle()
    {
        this.m_WeaponIndex = 0;
        this.m_WidthOverride = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ForgeWeaponTitle' by default constructor.");
        return;
    }
    FVM_ForgeWeaponTitle(const FVM_ForgeWeaponTitle &inout Other)
    {
        this.m_WeaponIndex = 0;
        this.m_WidthOverride = 0.0f;
        this.m_WeaponIndex = int(Other.m_WeaponIndex);
        this.m_Image = Other.m_Image;
        this.m_DisplayName = Other.m_DisplayName;
        this.m_WidthOverride = Other.m_WidthOverride;
        return;
    }
    FVM_ForgeWeaponTitle(const int InWeaponIndex, const FSoftBrush &inout InImage, const FText &inout InDisplayName, const float32 InWidthOverride)
    {
        this.m_WeaponIndex = 0;
        this.m_WidthOverride = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetWeaponIndex(InWeaponIndex);
        this.SetImage(InImage);
        this.SetDisplayName(InDisplayName);
        this.SetWidthOverride(InWidthOverride);
        return;
    }
    FVM_ForgeWeaponTitle opAssign(const FVM_ForgeWeaponTitle &inout Other)
    {
        FVM_ForgeWeaponTitle __r;
        this.m_WeaponIndex = int(Other.m_WeaponIndex);
        this.m_Image = Other.m_Image;
        this.m_DisplayName = Other.m_DisplayName;
        this.m_WidthOverride = Other.m_WidthOverride;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    int GetActiveIndexBG() const
    {
        return (this.GetWeaponIndex() % 2);
    }
    int GetWeaponIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_WeaponIndex;
    }
    void SetWeaponIndex(const int __Value) property
    {
        if (this.m_WeaponIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_WeaponIndex = __Value;
        return;
    }
    const FSoftBrush GetImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSoftBrush GetModify_Image() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Image = __Value;
        return;
    }
    FText GetDisplayName() const property
    {
        FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_DisplayName() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDisplayName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplayName = __Value;
        return;
    }
    float32 GetWidthOverride() const property
    {
        float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_WidthOverride() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetWidthOverride(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_WidthOverride = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ForgeWeaponTitle
{
    UPROPERTY()
    int ActiveIndexBG;
    UPROPERTY()
    TEUIModelRef<FVM_ForgeWeaponTitle> Self;


}

namespace FVM_ForgeWeaponTitle
{
FVM_ForgeWeaponTitle& Create(const UObject ContextObject, const int WeaponIndex, const FSoftBrush &inout Image, const FText &inout DisplayName, const float32 WidthOverride)
{
    return FVM_ForgeWeaponTitle::CreateByManager(EUIInternal::GetContextManager(ContextObject), WeaponIndex, Image, DisplayName, WidthOverride);
}
FVM_ForgeWeaponTitle CreateByManager(const UEUIManagerSubsystem Manager, const int WeaponIndex, const FSoftBrush &inout Image, const FText &inout DisplayName, const float32 WidthOverride)
{
    FVM_ForgeWeaponTitle __r;
    TEUIModelRef<FVM_ForgeWeaponTitle> local_6 = TEUIModelRef<FVM_ForgeWeaponTitle>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ForgeWeaponTitle::ModelId, 0, WeaponIndex, Image, DisplayName, WidthOverride));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Image";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WidthOverride";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActiveIndexBG";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ForgeWeaponTitle>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ForgeWeaponTitle;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ForgeWeaponTitle;
}
FSoftBrush __UIGetter_Image(const FVM_ForgeWeaponTitle &inout Model)
{
    return Model.GetImage();
}
FText __UIGetter_DisplayName(const FVM_ForgeWeaponTitle &inout Model)
{
    return Model.GetDisplayName();
}
float32 __UIGetter_WidthOverride(const FVM_ForgeWeaponTitle &inout Model)
{
    return Model.GetWidthOverride();
}
int __UIGetter_ActiveIndexBG(const FVM_ForgeWeaponTitle &inout Model)
{
    return Model.GetActiveIndexBG();
}
TEUIModelRef<FVM_ForgeWeaponTitle> __UIGetter_Self(const FVM_ForgeWeaponTitle &inout Model)
{
    return TEUIModelRef<FVM_ForgeWeaponTitle>(Model);
}
int __IndexOf_WeaponIndex()
{
    return 0;
}
int __IndexOf_Image()
{
    return 1;
}
int __IndexOf_DisplayName()
{
    return 2;
}
int __IndexOf_WidthOverride()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_ForgeWeaponTitle
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
