
namespace FVM_CameraModifier
{
    const int ModelId = 0;

}
struct FVM_CameraModifier : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FPresentationCameraConfig m_CameraConfig;
    UPROPERTY()
    FCameraHandle m_CameraHandle;

    FVM_CameraModifier()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CameraModifier(const FVM_CameraModifier &inout Other)
    {
        this.m_CameraHandle = Other.m_CameraHandle;
        return;
    }
    FVM_CameraModifier opAssign(const FVM_CameraModifier &inout Other)
    {
        FVM_CameraModifier __r;
        this.m_CameraHandle = Other.m_CameraHandle;
        return __r;
    }
    void LoadConfig(const FConfigVM_CameraModifier &inout InConfig)
    {
        this.SetCameraConfig(InConfig.CameraConfig);
        return;
    }
    void PostLoad()
    {
        if (this.GetCameraConfig().IsValid())
        {
            this.GetContext().GetLocalPlayerPawn();
            FECSEntity local_12 = this.GetContext().GetLocalPlayer();
            FCameraHandle local_14;
            this.SetCameraHandle(local_14);
        }
        return;
    }
    void BeginDestroy()
    {
        if (this.GetCameraHandle().IsValid())
        {
            ::PresentationCameraUtils::PopPresentationCameraByHandle(this.GetContext().GetLocalPlayer(), this.GetCameraHandle(), false);
        }
        return;
    }
    const FPresentationCameraConfig GetCameraConfig() const property
    {
        const FPresentationCameraConfig __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FPresentationCameraConfig GetModify_CameraConfig() property
    {
        FPresentationCameraConfig __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCameraConfig(const FPresentationCameraConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FCameraHandle GetCameraHandle() const property
    {
        const FCameraHandle __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FCameraHandle GetModify_CameraHandle() property
    {
        FCameraHandle __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCameraHandle(const FCameraHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CameraHandle = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CameraModifier
{
    UPROPERTY()
    TEUIModelRef<FVM_CameraModifier> Self;

    __GeneratedProperties_FVM_CameraModifier()
    {
        return;
    }
}

namespace FVM_CameraModifier
{
FVM_CameraModifier& Create(const UObject ContextObject)
{
    return FVM_CameraModifier::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CameraModifier CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CameraModifier __r;
    TEUIModelRef<FVM_CameraModifier> local_6 = TEUIModelRef<FVM_CameraModifier>(EUIInternal::MakeModelWithManager(Manager, FVM_CameraModifier::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CameraModifier>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CameraModifier;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CameraModifier;
}
TEUIModelRef<FVM_CameraModifier> __UIGetter_Self(const FVM_CameraModifier &inout Model)
{
    return TEUIModelRef<FVM_CameraModifier>(Model);
}
int __IndexOf_CameraConfig()
{
    return 0;
}
int __IndexOf_CameraHandle()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CameraModifier
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
