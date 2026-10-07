
namespace FVM_InputContext
{
    const int ModelId = 0;

}
struct FVM_InputContext : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FEnhancedInputContextConfig> m_InputContext;

    FVM_InputContext()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_InputContext(const FVM_InputContext &inout Other)
    {
        this.m_InputContext = Other.m_InputContext;
        return;
    }
    FVM_InputContext& opAssign(const FVM_InputContext &inout Other)
    {
        return Other.m_InputContext;
    }
    void LoadConfig(const FConfigVM_InputContext &inout InConfig)
    {
        this.SetInputContext(InConfig.InputContext);
        return;
    }
    void PostLoad()
    {
        FDataObjectPtr local_26;
        local_26;
        UKLEnhancedInputManagerSubsystem::Get(this.GetContext().UELocalPlayer).RequireInputContext(local_26);
        return;
    }
    void BeginDestroy()
    {
        FDataObjectPtr local_26;
        local_26;
        UKLEnhancedInputManagerSubsystem::Get(this.GetContext().UELocalPlayer).ReleaseInputContext(local_26);
        return;
    }
    const TDataObjectPtr<FEnhancedInputContextConfig> GetInputContext() const property
    {
        const TDataObjectPtr<FEnhancedInputContextConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FEnhancedInputContextConfig> GetModify_InputContext() property
    {
        TDataObjectPtr<FEnhancedInputContextConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetInputContext(const TDataObjectPtr<FEnhancedInputContextConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_InputContext = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_InputContext
{
    UPROPERTY()
    TEUIModelRef<FVM_InputContext> Self;

    __GeneratedProperties_FVM_InputContext()
    {
        return;
    }
}

namespace FVM_InputContext
{
FVM_InputContext& Create(const UObject ContextObject)
{
    return FVM_InputContext::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_InputContext CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_InputContext __r;
    TEUIModelRef<FVM_InputContext> local_6 = TEUIModelRef<FVM_InputContext>(EUIInternal::MakeModelWithManager(Manager, FVM_InputContext::ModelId));
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
    local_14.TypeName = "TEUIModelRef<FVM_InputContext>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InputContext;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InputContext;
}
TEUIModelRef<FVM_InputContext> __UIGetter_Self(const FVM_InputContext &inout Model)
{
    return TEUIModelRef<FVM_InputContext>(Model);
}
int __IndexOf_InputContext()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_InputContext
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
