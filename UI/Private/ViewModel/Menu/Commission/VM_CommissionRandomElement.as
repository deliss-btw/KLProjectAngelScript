
namespace FVM_CommissionRandomElement
{
    const int ModelId = 0;

}
struct FVM_CommissionRandomElement : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FSoftBrush m_Image;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    FText m_Desc;
    UPROPERTY()
    FText m_AdditionalDesc;
    UPROPERTY()
    FEUIModelContainer m_ImageAndTitleAndDesc;

    FVM_CommissionRandomElement()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionRandomElement' by default constructor.");
        return;
    }
    FVM_CommissionRandomElement(const FVM_CommissionRandomElement &inout Other)
    {
        this.m_Image = Other.m_Image;
        this.m_Title = Other.m_Title;
        this.m_Desc = Other.m_Desc;
        this.m_AdditionalDesc = Other.m_AdditionalDesc;
        this.m_ImageAndTitleAndDesc = Other.m_ImageAndTitleAndDesc;
        return;
    }
    FVM_CommissionRandomElement(const FSoftBrush &inout InImage, const FText &inout InTitle, const FText &inout InDesc, const FText &inout InAdditionalDesc)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetImage(InImage);
        this.SetTitle(InTitle);
        this.SetDesc(InDesc);
        this.SetAdditionalDesc(InAdditionalDesc);
        return;
    }
    FVM_CommissionRandomElement& opAssign(const FVM_CommissionRandomElement &inout Other)
    {
        this.m_Image = Other.m_Image;
        this.m_Title = Other.m_Title;
        this.m_Desc = Other.m_Desc;
        this.m_AdditionalDesc = Other.m_AdditionalDesc;
        return Other.m_ImageAndTitleAndDesc;
    }
    void PostConstruct()
    {
        FEUIModelRef local_4;
        this.GetModify_ImageAndTitleAndDesc().AddModel(local_4, false);
        this.GetModify_ImageAndTitleAndDesc().AddModel(local_4, false);
        if (!(this.GetAdditionalDesc().IsEmpty()))
        {
            this.GetModify_ImageAndTitleAndDesc().AddModel(local_4, false);
        }
        return;
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
    FText GetTitle() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_Title() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Title = __Value;
        return;
    }
    FText GetDesc() const property
    {
        FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_Desc() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Desc = __Value;
        return;
    }
    const FText GetAdditionalDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_AdditionalDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAdditionalDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AdditionalDesc = __Value;
        return;
    }
    const FEUIModelContainer GetImageAndTitleAndDesc() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelContainer GetModify_ImageAndTitleAndDesc() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetImageAndTitleAndDesc(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ImageAndTitleAndDesc = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionRandomElement
{
    UPROPERTY()
    TEUIModelRef<FVM_CommissionRandomElement> Self;

    __GeneratedProperties_FVM_CommissionRandomElement()
    {
        return;
    }
}

namespace FVM_CommissionRandomElement
{
FVM_CommissionRandomElement& Create(const UObject ContextObject, const FSoftBrush &inout Image, const FText &inout Title, const FText &inout Desc, const FText &inout AdditionalDesc)
{
    return FVM_CommissionRandomElement::CreateByManager(EUIInternal::GetContextManager(ContextObject), Image, Title, Desc, AdditionalDesc);
}
FVM_CommissionRandomElement CreateByManager(const UEUIManagerSubsystem Manager, const FSoftBrush &inout Image, const FText &inout Title, const FText &inout Desc, const FText &inout AdditionalDesc)
{
    FVM_CommissionRandomElement __r;
    TEUIModelRef<FVM_CommissionRandomElement> local_6 = TEUIModelRef<FVM_CommissionRandomElement>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionRandomElement::ModelId, 0, Image, Title, Desc, AdditionalDesc));
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
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Desc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AdditionalDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ImageAndTitleAndDesc";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionRandomElement>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionRandomElement;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionRandomElement;
}
FSoftBrush __UIGetter_Image(const FVM_CommissionRandomElement &inout Model)
{
    return Model.GetImage();
}
FText __UIGetter_Title(const FVM_CommissionRandomElement &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Desc(const FVM_CommissionRandomElement &inout Model)
{
    return Model.GetDesc();
}
FText __UIGetter_AdditionalDesc(const FVM_CommissionRandomElement &inout Model)
{
    return Model.GetAdditionalDesc();
}
FEUIModelContainer __UIGetter_ImageAndTitleAndDesc(const FVM_CommissionRandomElement &inout Model)
{
    return Model.GetImageAndTitleAndDesc();
}
TEUIModelRef<FVM_CommissionRandomElement> __UIGetter_Self(const FVM_CommissionRandomElement &inout Model)
{
    return TEUIModelRef<FVM_CommissionRandomElement>(Model);
}
int __IndexOf_Image()
{
    return 0;
}
int __IndexOf_Title()
{
    return 1;
}
int __IndexOf_Desc()
{
    return 2;
}
int __IndexOf_AdditionalDesc()
{
    return 3;
}
int __IndexOf_ImageAndTitleAndDesc()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_CommissionRandomElement
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
