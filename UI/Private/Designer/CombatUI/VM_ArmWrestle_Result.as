
namespace FVM_ArmWrestle_Result
{
    const int ModelId = 0;

}
struct FVM_ArmWrestle_Result : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FSlateBrush m_ResultBrush;

    FVM_ArmWrestle_Result()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ArmWrestle_Result(const FVM_ArmWrestle_Result &inout Other)
    {
        this.m_ResultBrush = Other.m_ResultBrush;
        return;
    }
    FVM_ArmWrestle_Result& opAssign(const FVM_ArmWrestle_Result &inout Other)
    {
        return Other.m_ResultBrush;
    }
    void SetResultTexture(const UTexture2D Texture)
    {
        if (Texture != nullptr)
        {
            this.SetResultBrush(FEUIUtils::ConvertTextureToBrush(Texture, true));
        }
        return;
    }
    void PostConstruct()
    {
        return;
    }
    void Tick()
    {
        return;
    }
    const FSlateBrush GetResultBrush() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FSlateBrush GetModify_ResultBrush() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetResultBrush(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ResultBrush = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ArmWrestle_Result
{
    UPROPERTY()
    TEUIModelRef<FVM_ArmWrestle_Result> Self;

    __GeneratedProperties_FVM_ArmWrestle_Result()
    {
        return;
    }
}

namespace FVM_ArmWrestle_Result
{
FVM_ArmWrestle_Result& Create(const UObject ContextObject)
{
    return FVM_ArmWrestle_Result::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ArmWrestle_Result CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ArmWrestle_Result __r;
    TEUIModelRef<FVM_ArmWrestle_Result> local_6 = TEUIModelRef<FVM_ArmWrestle_Result>(EUIInternal::MakeModelWithManager(Manager, FVM_ArmWrestle_Result::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ResultBrush";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ArmWrestle_Result>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ArmWrestle_Result;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ArmWrestle_Result;
}
void __Tick(FVM_ArmWrestle_Result &inout Model)
{
    Model.Tick();
    return;
}
FSlateBrush __UIGetter_ResultBrush(const FVM_ArmWrestle_Result &inout Model)
{
    return Model.GetResultBrush();
}
TEUIModelRef<FVM_ArmWrestle_Result> __UIGetter_Self(const FVM_ArmWrestle_Result &inout Model)
{
    return TEUIModelRef<FVM_ArmWrestle_Result>(Model);
}
int __IndexOf_ResultBrush()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_ArmWrestle_Result
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
