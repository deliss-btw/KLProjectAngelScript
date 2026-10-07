
namespace FVM_PVP_Match
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnEnterButtonClicked = FEUIModelCallbackSignature();

}
struct FVM_PVP_Match : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FM_ModeItem> m_Mode;
    UPROPERTY()
    uint m_LevelKey;

    FVM_PVP_Match()
    {
        this.m_LevelKey = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PVP_Match' by default constructor.");
        return;
    }
    FVM_PVP_Match(const FVM_PVP_Match &inout Other)
    {
        this.m_LevelKey = 0;
        this.m_Mode = Other.m_Mode;
        this.m_LevelKey = int(Other.m_LevelKey);
        return;
    }
    FVM_PVP_Match(const TEUIModelWeakRef<FM_ModeItem> &inout InMode)
    {
        this.m_LevelKey = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMode(InMode);
        return;
    }
    FVM_PVP_Match opAssign(const FVM_PVP_Match &inout Other)
    {
        FVM_PVP_Match __r;
        this.m_Mode = Other.m_Mode;
        this.m_LevelKey = int(Other.m_LevelKey);
        return __r;
    }
    void PostConstruct()
    {
        int local_57 = 0;
        bool local_3 = this.GetMode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_ModeItem> local_2 = this.GetMode();
            local_3 = GetMatchConfig().IsSet();
        }
        if (local_3)
        {
            TEUIModelWeakRef<FM_ModeItem> local_2_2 = this.GetMode();
            CastTo local_32;
            if (local_32.opCall())
            {
                if (GetLevelConfig().IsSet())
                {
                    this.SetLevelKey(local_57);
                }
            }
        }
        return;
    }
    void OnEnterButtonClicked(const FString &inout Token)
    {
        FPbEnterArenaReq local_4;
        local_4.SetLevelKey(this.GetLevelKey());
        local_4.SetToken(String::Conv_StringToInt(Token));
        ::UGameClientConnectionSubsystem::Get().SendProtoWrapper(local_4.ToWrapper());
        return;
    }
    TEUIModelWeakRef<FM_ModeItem> GetMode() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Mode;
    }
    void SetMode(const TEUIModelWeakRef<FM_ModeItem> &inout __Value) property
    {
        TEUIModelWeakRef<FM_ModeItem> local_2;
        local_2 = this.m_Mode;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Mode = __Value;
        return;
    }
    uint GetLevelKey() const property
    {
        this.TrackPropertyRead(1);
        return this.m_LevelKey;
    }
    void SetLevelKey(const uint __Value) property
    {
        if (this.m_LevelKey == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_LevelKey = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PVP_Match
{
    UPROPERTY()
    TEUIModelRef<FVM_PVP_Match> Self;

    __GeneratedProperties_FVM_PVP_Match()
    {
        return;
    }
}

namespace FVM_PVP_Match
{
FVM_PVP_Match& Create(const UObject ContextObject, const TEUIModelWeakRef<FM_ModeItem> &inout Mode)
{
    return FVM_PVP_Match::CreateByManager(EUIInternal::GetContextManager(ContextObject), Mode);
}
FVM_PVP_Match CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FM_ModeItem> &inout Mode)
{
    FVM_PVP_Match __r;
    TEUIModelRef<FVM_PVP_Match> local_6 = TEUIModelRef<FVM_PVP_Match>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PVP_Match::ModelId, 0, Mode));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PVP_Match>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PVP_Match;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PVP_Match;
}
TEUIModelRef<FVM_PVP_Match> __UIGetter_Self(const FVM_PVP_Match &inout Model)
{
    return TEUIModelRef<FVM_PVP_Match>(Model);
}
int __IndexOf_Mode()
{
    return 0;
}
int __IndexOf_LevelKey()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_PVP_Match
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
