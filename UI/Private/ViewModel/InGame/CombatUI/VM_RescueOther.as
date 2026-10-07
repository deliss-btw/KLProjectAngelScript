
namespace FVM_RevivalTimeProgressBar
{
    const int ModelId = 0;
}
namespace FVM_RescueOther
{
    const int ModelId = 0;

}
struct FVM_RevivalTimeProgressBar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_Progress;

    FVM_RevivalTimeProgressBar()
    {
        this.m_Progress = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_RevivalTimeProgressBar(const FVM_RevivalTimeProgressBar &inout Other)
    {
        this.m_Progress = 0.0f;
        this.m_Progress = Other.m_Progress;
        return;
    }
    FVM_RevivalTimeProgressBar opAssign(const FVM_RevivalTimeProgressBar &inout Other)
    {
        FVM_RevivalTimeProgressBar __r;
        this.m_Progress = Other.m_Progress;
        return __r;
    }
    float32 GetProgress() const property
    {
        float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_Progress() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetProgress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Progress = __Value;
        return;
    }
}

struct FVM_RescueOther : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_RevivalTimeProgressBar> m_RescuedProgressModel;

    FVM_RescueOther()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_RescueOther(const FVM_RescueOther &inout Other)
    {
        this.m_RescuedProgressModel = Other.m_RescuedProgressModel;
        return;
    }
    FVM_RescueOther& opAssign(const FVM_RescueOther &inout Other)
    {
        return Other.m_RescuedProgressModel;
    }
    void PostConstruct()
    {
        this.SetRescuedProgressModel(TEUIModelRef<FVM_RevivalTimeProgressBar>(::FVM_RevivalTimeProgressBar::Create(this.GetContext().Manager)));
        return;
    }
    void Tick()
    {
        float32 local_1 = this.GetRescuedProgress();
        TEUIModelRef<FVM_RevivalTimeProgressBar> local_4 = this.GetRescuedProgressModel();
        local_1.SetProgress();
        return;
    }
    float32 GetRescuedProgress() const
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        bool local_15 = local_4;
        if (!(local_15))
        {
            local_15 = false;
        }
        else
        {
            FECSEntity local_14 = this.GetContext().GetLocalPlayer();
            Has local_8;
            local_15 = local_8.opCall();
        }
        if (local_15)
        {
            FECSEntity local_14_2 = this.GetContext().GetLocalPlayer();
            Get local_24;
            FECSEntity local_20 = local_24.opCall().GetPlayerPawnEntity();
            if (local_20)
            {
                FECSEntity local_4_2 = ::FASCommonUtils::GetRiderEntity(local_20);
                Get local_32;
                const FC_LocalInteractProgress& local_34 = local_32.opCall();
                if (local_34)
                {
                    return (local_34.ProgressValue / local_34.MaxProgressValue);
                }
            }
        }
        return 1.0f;
    }
    FText GetRescuedReaminingTimeSecond() const
    {
        bool local_15 = this.GetContext().GetLocalPlayer();
        if (!(local_15))
        {
            local_15 = false;
        }
        else
        {
            FECSEntity local_14 = this.GetContext().GetLocalPlayer();
            Has local_8;
            local_15 = local_8.opCall();
        }
        if (local_15)
        {
            FECSEntity local_14_2 = this.GetContext().GetLocalPlayer();
            Get local_24;
            FECSEntity local_20 = local_24.opCall().GetPlayerPawnEntity();
            if (local_20)
            {
                ::FASCommonUtils::GetRiderEntity(local_20);
                Get local_32;
                const FC_LocalInteractProgress& local_34 = local_32.opCall();
                if (local_34)
                {
                    if (local_34.CurProgressSpeed > 0.0f)
                    {
                        FNumberFormattingOptions local_43;
                        local_43.SetMaximumFractionalDigits(1);
                        local_43.SetMinimumFractionalDigits(1);
                        return FText::AsNumber((local_34.MaxProgressValue - local_34.ProgressValue) / local_34.CurProgressSpeed, local_43);
                    }
                }
            }
        }
        return FText::FromString("");
    }
    TEUIModelRef<FVM_RevivalTimeProgressBar> GetRescuedProgressModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_RescuedProgressModel;
    }
    void SetRescuedProgressModel(const TEUIModelRef<FVM_RevivalTimeProgressBar> &inout __Value) property
    {
        TEUIModelRef<FVM_RevivalTimeProgressBar> local_2;
        local_2 = this.m_RescuedProgressModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_RescuedProgressModel = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_RevivalTimeProgressBar
{
    UPROPERTY()
    TEUIModelRef<FVM_RevivalTimeProgressBar> Self;

    __GeneratedProperties_FVM_RevivalTimeProgressBar()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_RescueOther
{
    UPROPERTY()
    float32 RescuedProgress;
    UPROPERTY()
    FText RescuedReaminingTimeSecond;
    UPROPERTY()
    TEUIModelRef<FVM_RescueOther> Self;


}

namespace FVM_RevivalTimeProgressBar
{
FVM_RevivalTimeProgressBar& Create(const UObject ContextObject)
{
    return FVM_RevivalTimeProgressBar::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_RevivalTimeProgressBar CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_RevivalTimeProgressBar __r;
    TEUIModelRef<FVM_RevivalTimeProgressBar> local_6 = TEUIModelRef<FVM_RevivalTimeProgressBar>(EUIInternal::MakeModelWithManager(Manager, FVM_RevivalTimeProgressBar::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Progress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (1 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_RevivalTimeProgressBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_RevivalTimeProgressBar;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_RevivalTimeProgressBar;
}
float32 __UIGetter_Progress(const FVM_RevivalTimeProgressBar &inout Model)
{
    return Model.GetProgress();
}
void __UISetter_Progress(FVM_RevivalTimeProgressBar &inout Model, const float32 &inout Value)
{
    Model.SetProgress(Value);
    return;
}
TEUIModelRef<FVM_RevivalTimeProgressBar> __UIGetter_Self(const FVM_RevivalTimeProgressBar &inout Model)
{
    return TEUIModelRef<FVM_RevivalTimeProgressBar>(Model);
}
int __IndexOf_Progress()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_RevivalTimeProgressBar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_RescueOther
{
FVM_RescueOther& Create(const UObject ContextObject)
{
    return FVM_RescueOther::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_RescueOther CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_RescueOther __r;
    TEUIModelRef<FVM_RescueOther> local_6 = TEUIModelRef<FVM_RescueOther>(EUIInternal::MakeModelWithManager(Manager, FVM_RescueOther::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RescuedProgressModel";
    local_14.TypeName = "TEUIModelRef<FVM_RevivalTimeProgressBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RescuedProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RescuedReaminingTimeSecond";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_RescueOther>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_RescueOther;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_RescueOther;
}
void __Tick(FVM_RescueOther &inout Model)
{
    Model.Tick();
    return;
}
TEUIModelRef<FVM_RevivalTimeProgressBar> __UIGetter_RescuedProgressModel(const FVM_RescueOther &inout Model)
{
    return Model.GetRescuedProgressModel();
}
float32 __UIGetter_RescuedProgress(const FVM_RescueOther &inout Model)
{
    return Model.GetRescuedProgress();
}
FText __UIGetter_RescuedReaminingTimeSecond(const FVM_RescueOther &inout Model)
{
    return Model.GetRescuedReaminingTimeSecond();
}
TEUIModelRef<FVM_RescueOther> __UIGetter_Self(const FVM_RescueOther &inout Model)
{
    return TEUIModelRef<FVM_RescueOther>(Model);
}
int __IndexOf_RescuedProgressModel()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_RescueOther
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
