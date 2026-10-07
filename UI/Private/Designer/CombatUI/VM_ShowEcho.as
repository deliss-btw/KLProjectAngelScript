
namespace FVM_ShowEcho
{
    const int ModelId = 0;

}
struct FVM_ShowEcho : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_TextContent;
    UPROPERTY()
    int m_CachedIState;

    FVM_ShowEcho()
    {
        this.m_CachedIState = -999;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ShowEcho(const FVM_ShowEcho &inout Other)
    {
        this.m_CachedIState = -999;
        this.m_TextContent = Other.m_TextContent;
        this.m_CachedIState = int(Other.m_CachedIState);
        return;
    }
    FVM_ShowEcho opAssign(const FVM_ShowEcho &inout Other)
    {
        FVM_ShowEcho __r;
        this.m_TextContent = Other.m_TextContent;
        this.m_CachedIState = int(Other.m_CachedIState);
        return __r;
    }
    void RefreshTextContent()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void PostConstruct()
    {
        this.RefreshTextContent();
        return;
    }
    void Tick()
    {
        this.RefreshTextContent();
        return;
    }
    FText GetTextContent() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_TextContent() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTextContent(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TextContent = __Value;
        return;
    }
    int GetCachedIState() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CachedIState;
    }
    void SetCachedIState(const int __Value) property
    {
        if (this.m_CachedIState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CachedIState = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ShowEcho
{
    UPROPERTY()
    TEUIModelRef<FVM_ShowEcho> Self;

    __GeneratedProperties_FVM_ShowEcho()
    {
        return;
    }
}

namespace FVM_ShowEcho
{
FVM_ShowEcho& Create(const UObject ContextObject)
{
    return FVM_ShowEcho::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ShowEcho CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ShowEcho __r;
    TEUIModelRef<FVM_ShowEcho> local_6 = TEUIModelRef<FVM_ShowEcho>(EUIInternal::MakeModelWithManager(Manager, FVM_ShowEcho::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TextContent";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ShowEcho>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ShowEcho;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ShowEcho;
}
void __Tick(FVM_ShowEcho &inout Model)
{
    Model.Tick();
    return;
}
FText __UIGetter_TextContent(const FVM_ShowEcho &inout Model)
{
    return Model.GetTextContent();
}
TEUIModelRef<FVM_ShowEcho> __UIGetter_Self(const FVM_ShowEcho &inout Model)
{
    return TEUIModelRef<FVM_ShowEcho>(Model);
}
int __IndexOf_TextContent()
{
    return 0;
}
int __IndexOf_CachedIState()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_ShowEcho
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
