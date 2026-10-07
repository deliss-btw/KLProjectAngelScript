
namespace FVMS_Setting
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ShowInfoContent = FEUIModelCallbackSignature();

}
struct FVMS_Setting : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    UTexture2D m_ShowImage;
    UPROPERTY()
    FText m_ShowText;

    FVMS_Setting()
    {
        this.m_ShowImage = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_Setting(const FVMS_Setting &inout Other)
    {
        this.m_ShowImage = nullptr;
        this.m_ShowImage = Other.m_ShowImage;
        this.m_ShowText = Other.m_ShowText;
        return;
    }
    FVMS_Setting& opAssign(const FVMS_Setting &inout Other)
    {
        this.m_ShowImage = Other.m_ShowImage;
        return Other.m_ShowText;
    }
    void ShowInfoContent(const FName &inout HintName)
    {
        ::UCombatGlobalSettings::Get().AllHintInfoData[HintName].InfoImage.LoadBrush();
        FName local_48;
        UObject local_50 = local_48.ResourceObject;
        this.SetShowImage(Cast<UTexture2D>(local_50));
        this.SetShowText(::UCombatGlobalSettings::Get().AllHintInfoData[HintName].InfoContent);
        return;
    }
    UTexture2D GetShowImage() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ShowImage;
    }
    void SetShowImage(const UTexture2D __Value) property
    {
        if (this.m_ShowImage == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FText GetShowText() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_ShowText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetShowText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ShowText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_Setting
{
    UPROPERTY()
    TEUIModelRef<FVMS_Setting> Self;

    __GeneratedProperties_FVMS_Setting()
    {
        return;
    }
}

namespace FVMS_Setting
{
FVMS_Setting& Get(const UObject ContextObject)
{
    return FVMS_Setting::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_Setting GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_Setting __r;
    TEUIModelRef<FVMS_Setting> local_6 = TEUIModelRef<FVMS_Setting>(EUIInternal::MakeModelWithManager(Manager, FVMS_Setting::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ShowImage";
    local_14.TypeName = "UTexture2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_Setting>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_Setting;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_Setting;
}
UTexture2D __UIGetter_ShowImage(const FVMS_Setting &inout Model)
{
    return Model.GetShowImage();
}
FText __UIGetter_ShowText(const FVMS_Setting &inout Model)
{
    return Model.GetShowText();
}
TEUIModelRef<FVMS_Setting> __UIGetter_Self(const FVMS_Setting &inout Model)
{
    return TEUIModelRef<FVMS_Setting>(Model);
}
int __IndexOf_ShowImage()
{
    return 0;
}
int __IndexOf_ShowText()
{
    return 1;
}
}
namespace __GeneratedProperties_FVMS_Setting
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
