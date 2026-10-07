
namespace FVM_SettingMemory
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature RefreshVideoMemory = FEUIModelCallbackSignature();

// NOTE: class defaults are not authored in this module: FVM_SettingMemory (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

}
struct FVM_SettingMemory : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Name;
    UPROPERTY()
    FText m_TotalMemoryText;
    UPROPERTY()
    FText m_OurMemoryText;
    UPROPERTY()
    FText m_OtherMemoryText;
    UPROPERTY()
    float32 m_TotalMemory;
    UPROPERTY()
    float32 m_CurrentMemory;
    UPROPERTY()
    float32 m_OurMemory;
    UPROPERTY()
    float32 m_OtherMemory;
    UPROPERTY()
    float32 m_CurrentMemoryPercent;
    UPROPERTY()
    float32 m_OurMemoryPercent;
    UPROPERTY()
    bool m_bIsFull;
    UPROPERTY()
    FText m_IsFullText;
    UPROPERTY()
    FLinearColor m_SelfColor;

    FVM_SettingMemory()
    {
        this.m_TotalMemory = 8191.0f;
        this.m_CurrentMemory = 6490.0f;
        this.m_OurMemory = 4924.0f;
        this.m_OtherMemory = 1566.0f;
        this.m_CurrentMemoryPercent = 0.0f;
        this.m_OurMemoryPercent = 0.0f;
        this.m_bIsFull = false;
        this.m_SelfColor = FLinearColor(1.0f, 0.658f, 0.15f, 1.0f);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
        }
        else
        {
        }
        this.__InitDefaults();
        return;
    }
    FVM_SettingMemory(const FVM_SettingMemory &inout Other)
    {
        this.m_TotalMemory = 8191.0f;
        this.m_CurrentMemory = 6490.0f;
        this.m_OurMemory = 4924.0f;
        this.m_OtherMemory = 1566.0f;
        this.m_CurrentMemoryPercent = 0.0f;
        this.m_OurMemoryPercent = 0.0f;
        this.m_bIsFull = false;
        this.m_SelfColor = FLinearColor(1.0f, 0.658f, 0.15f, 1.0f);
        this.m_Name = Other.m_Name;
        this.m_TotalMemoryText = Other.m_TotalMemoryText;
        this.m_OurMemoryText = Other.m_OurMemoryText;
        this.m_OtherMemoryText = Other.m_OtherMemoryText;
        this.m_TotalMemory = Other.m_TotalMemory;
        this.m_CurrentMemory = Other.m_CurrentMemory;
        this.m_OurMemory = Other.m_OurMemory;
        this.m_OtherMemory = Other.m_OtherMemory;
        this.m_CurrentMemoryPercent = Other.m_CurrentMemoryPercent;
        this.m_OurMemoryPercent = Other.m_OurMemoryPercent;
        this.m_bIsFull = Other.m_bIsFull;
        this.m_IsFullText = Other.m_IsFullText;
        this.m_SelfColor = Other.m_SelfColor;
        this.__InitDefaults();
        return;
    }
    FVM_SettingMemory& opAssign(const FVM_SettingMemory &inout Other)
    {
        this.m_Name = Other.m_Name;
        this.m_TotalMemoryText = Other.m_TotalMemoryText;
        this.m_OurMemoryText = Other.m_OurMemoryText;
        this.m_OtherMemoryText = Other.m_OtherMemoryText;
        this.m_TotalMemory = Other.m_TotalMemory;
        this.m_CurrentMemory = Other.m_CurrentMemory;
        this.m_OurMemory = Other.m_OurMemory;
        this.m_OtherMemory = Other.m_OtherMemory;
        this.m_CurrentMemoryPercent = Other.m_CurrentMemoryPercent;
        this.m_OurMemoryPercent = Other.m_OurMemoryPercent;
        this.m_bIsFull = Other.m_bIsFull;
        this.m_IsFullText = Other.m_IsFullText;
        return Other.m_SelfColor;
    }
    void PostConstruct()
    {
        this.SetName(NSLOCTEXT("SettingPage", "MemoryName", "жѕе­"));
        this.RefreshVideoMemory();
        ::FVMS_SettingPage::Get(this.GetContext().UELocalPlayer).GetOnSettingsChanged().Add(this, FVM_SettingMemory::RefreshVideoMemory);
        return;
    }
    void OnOwnerWidgetUnbind_Implementation()
    {
        return;
    }
    void RefreshVideoMemory()
    {
        FKLVideoMemoryInfo local_14 = KLProfilingFunctionRuntime::GetVideoMemoryInfo();
        if (!(local_14.bValid))
        {
            return;
        }
        this.SetTotalMemory(local_14.TotalMB);
        this.SetOurMemory(local_14.CurrentProcessUsedMB);
        if (local_14.bSystemWideValid)
        {
            this.SetOtherMemory(local_14.OtherProcessUsedMB);
            this.SetCurrentMemory((this.GetOurMemory() + this.GetOtherMemory()));
        }
        else
        {
            this.SetOtherMemory(0.0f);
            this.SetCurrentMemory(this.GetOurMemory());
        }
        return;
    }
    void OnMemoryChanged()
    {
        float32 local_5 = this.GetCurrentMemory();
        this.SetTotalMemoryText(FText::FromString(FString().Append(FMath::RoundToInt(local_5)).Append("/").Append(FMath::RoundToInt(this.GetTotalMemory())).Append("MB")));
        this.SetOurMemoryText(FText::FromString(FString().Append(FMath::RoundToInt(this.GetOurMemory())).Append("MB")));
        this.SetOtherMemoryText(FText::FromString(FString().Append(FMath::RoundToInt(this.GetOtherMemory())).Append("MB")));
        this.SetCurrentMemoryPercent((this.GetCurrentMemory() / this.GetTotalMemory()));
        this.SetOurMemoryPercent((this.GetOurMemory() / this.GetTotalMemory()));
        this.SetbIsFull((this.GetCurrentMemoryPercent() >= 0.85f));
        return;
    }
    void OnIsFullChanged()
    {
        if (this.GetbIsFull())
        {
            this.SetSelfColor(FLinearColor(0.51f, 0.05f, 0.05f, 1.0f));
            this.SetIsFullText(NSLOCTEXT("SettingPage", "IsFullText", "жѕе­еЌ з”Ёиѕѓе¤§пјЊеЏЇиѓЅеј•еЏ‘иїђиЎЊеј‚еёёж€–жЂ§иѓЅй—®йў"));
            return;
        }
        this.SetSelfColor(FLinearColor(1.0f, 0.658f, 0.15f, 1.0f));
        this.SetIsFullText(NSLOCTEXT("SettingPage", "", ""));
        return;
    }
    FText GetName() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Name() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Name = __Value;
        return;
    }
    const FText GetTotalMemoryText() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_TotalMemoryText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTotalMemoryText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TotalMemoryText = __Value;
        return;
    }
    const FText GetOurMemoryText() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_OurMemoryText() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOurMemoryText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_OurMemoryText = __Value;
        return;
    }
    const FText GetOtherMemoryText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_OtherMemoryText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetOtherMemoryText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_OtherMemoryText = __Value;
        return;
    }
    const float32 GetTotalMemory() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_TotalMemory() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetTotalMemory(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TotalMemory = __Value;
        return;
    }
    const float32 GetCurrentMemory() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_CurrentMemory() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCurrentMemory(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CurrentMemory = __Value;
        return;
    }
    const float32 GetOurMemory() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_OurMemory() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetOurMemory(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_OurMemory = __Value;
        return;
    }
    const float32 GetOtherMemory() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_OtherMemory() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetOtherMemory(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_OtherMemory = __Value;
        return;
    }
    const float32 GetCurrentMemoryPercent() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_CurrentMemoryPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetCurrentMemoryPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CurrentMemoryPercent = __Value;
        return;
    }
    const float32 GetOurMemoryPercent() const property
    {
        const float32 __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    float32 GetModify_OurMemoryPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetOurMemoryPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_OurMemoryPercent = __Value;
        return;
    }
    bool GetbIsFull() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bIsFull;
    }
    void SetbIsFull(const bool __Value) property
    {
        if (!(this.m_bIsFull) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bIsFull = __Value;
        return;
    }
    const FText GetIsFullText() const property
    {
        const FText __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FText GetModify_IsFullText() property
    {
        FText __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetIsFullText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_IsFullText = __Value;
        return;
    }
    const FLinearColor GetSelfColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FLinearColor GetModify_SelfColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetSelfColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_SelfColor = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SettingMemory
{
    UPROPERTY()
    TEUIModelRef<FVM_SettingMemory> Self;

    __GeneratedProperties_FVM_SettingMemory()
    {
        return;
    }
}

namespace FVM_SettingMemory
{
FVM_SettingMemory& Create(const UObject ContextObject)
{
    return FVM_SettingMemory::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SettingMemory CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SettingMemory __r;
    TEUIModelRef<FVM_SettingMemory> local_6 = TEUIModelRef<FVM_SettingMemory>(EUIInternal::MakeModelWithManager(Manager, FVM_SettingMemory::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Name";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TotalMemoryText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OurMemoryText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OtherMemoryText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TotalMemory";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentMemory";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OurMemory";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OtherMemory";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentMemoryPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OurMemoryPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsFull";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsFullText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelfColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SettingMemory>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SettingMemory;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnMemoryChanged";
    local_24.DirtyFlags.Set(FVM_SettingMemory::__IndexOf_TotalMemory());
    local_24.DirtyFlags.Set(FVM_SettingMemory::__IndexOf_OurMemory());
    local_24.DirtyFlags.Set(FVM_SettingMemory::__IndexOf_OtherMemory());
    local_24.DirtyFlags.Set(FVM_SettingMemory::__IndexOf_CurrentMemory());
    Result.DirtyFunctions.Add(local_24);
    local_24.FunctionName = "__OnIsFullChanged";
    local_24.DirtyFlags.Set(FVM_SettingMemory::__IndexOf_bIsFull());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SettingMemory;
}
void __OnMemoryChanged(FVM_SettingMemory &inout Model)
{
    Model.OnMemoryChanged();
    return;
}
void __OnIsFullChanged(FVM_SettingMemory &inout Model)
{
    Model.OnIsFullChanged();
    return;
}
FText __UIGetter_Name(const FVM_SettingMemory &inout Model)
{
    return Model.GetName();
}
FText __UIGetter_TotalMemoryText(const FVM_SettingMemory &inout Model)
{
    return Model.GetTotalMemoryText();
}
FText __UIGetter_OurMemoryText(const FVM_SettingMemory &inout Model)
{
    return Model.GetOurMemoryText();
}
FText __UIGetter_OtherMemoryText(const FVM_SettingMemory &inout Model)
{
    return Model.GetOtherMemoryText();
}
float32 __UIGetter_TotalMemory(const FVM_SettingMemory &inout Model)
{
    return Model.GetTotalMemory();
}
float32 __UIGetter_CurrentMemory(const FVM_SettingMemory &inout Model)
{
    return Model.GetCurrentMemory();
}
float32 __UIGetter_OurMemory(const FVM_SettingMemory &inout Model)
{
    return Model.GetOurMemory();
}
float32 __UIGetter_OtherMemory(const FVM_SettingMemory &inout Model)
{
    return Model.GetOtherMemory();
}
float32 __UIGetter_CurrentMemoryPercent(const FVM_SettingMemory &inout Model)
{
    return Model.GetCurrentMemoryPercent();
}
float32 __UIGetter_OurMemoryPercent(const FVM_SettingMemory &inout Model)
{
    return Model.GetOurMemoryPercent();
}
bool __UIGetter_bIsFull(const FVM_SettingMemory &inout Model)
{
    return Model.GetbIsFull();
}
FText __UIGetter_IsFullText(const FVM_SettingMemory &inout Model)
{
    return Model.GetIsFullText();
}
FLinearColor __UIGetter_SelfColor(const FVM_SettingMemory &inout Model)
{
    return Model.GetSelfColor();
}
TEUIModelRef<FVM_SettingMemory> __UIGetter_Self(const FVM_SettingMemory &inout Model)
{
    return TEUIModelRef<FVM_SettingMemory>(Model);
}
int __IndexOf_Name()
{
    return 0;
}
int __IndexOf_TotalMemoryText()
{
    return 1;
}
int __IndexOf_OurMemoryText()
{
    return 2;
}
int __IndexOf_OtherMemoryText()
{
    return 3;
}
int __IndexOf_TotalMemory()
{
    return 4;
}
int __IndexOf_CurrentMemory()
{
    return 5;
}
int __IndexOf_OurMemory()
{
    return 6;
}
int __IndexOf_OtherMemory()
{
    return 7;
}
int __IndexOf_CurrentMemoryPercent()
{
    return 8;
}
int __IndexOf_OurMemoryPercent()
{
    return 9;
}
int __IndexOf_bIsFull()
{
    return 10;
}
int __IndexOf_IsFullText()
{
    return 11;
}
int __IndexOf_SelfColor()
{
    return 12;
}
}
namespace __GeneratedProperties_FVM_SettingMemory
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
