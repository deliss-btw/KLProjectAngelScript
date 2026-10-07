
namespace FVM_Image
{
    const int ModelId = 0;

}
struct FVM_Image : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FSoftBrush m_Image;

    FVM_Image()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_Image' by default constructor.");
        return;
    }
    FVM_Image(const FVM_Image &inout Other)
    {
        this.m_Image = Other.m_Image;
        return;
    }
    FVM_Image(const FSoftBrush &inout InImage)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetImage(InImage);
        return;
    }
    FVM_Image& opAssign(const FVM_Image &inout Other)
    {
        return Other.m_Image;
    }
    const FSoftBrush GetImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FSoftBrush GetModify_Image() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Image = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Image
{
    UPROPERTY()
    TEUIModelRef<FVM_Image> Self;

    __GeneratedProperties_FVM_Image()
    {
        return;
    }
}

namespace FVM_Image
{
FVM_Image& Create(const UObject ContextObject, const FSoftBrush &inout Image)
{
    return FVM_Image::CreateByManager(EUIInternal::GetContextManager(ContextObject), Image);
}
FVM_Image CreateByManager(const UEUIManagerSubsystem Manager, const FSoftBrush &inout Image)
{
    FVM_Image __r;
    TEUIModelRef<FVM_Image> local_6 = TEUIModelRef<FVM_Image>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Image::ModelId, 0, Image));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Image";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Image>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Image;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Image;
}
FSoftBrush __UIGetter_Image(const FVM_Image &inout Model)
{
    return Model.GetImage();
}
TEUIModelRef<FVM_Image> __UIGetter_Self(const FVM_Image &inout Model)
{
    return TEUIModelRef<FVM_Image>(Model);
}
int __IndexOf_Image()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_Image
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
