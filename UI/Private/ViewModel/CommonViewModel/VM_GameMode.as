
namespace FVMS_GameMode
{
    const int ModelId = 0;

}
struct FVMS_GameMode : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    bool m_bIsPVPGame;

    FVMS_GameMode()
    {
        this.m_bIsPVPGame = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_GameMode(const FVMS_GameMode &inout Other)
    {
        this.m_bIsPVPGame = true;
        this.m_bIsPVPGame = Other.m_bIsPVPGame;
        return;
    }
    FVMS_GameMode opAssign(const FVMS_GameMode &inout Other)
    {
        FVMS_GameMode __r;
        this.m_bIsPVPGame = Other.m_bIsPVPGame;
        return __r;
    }
    ESlateVisibility VisibleInPVPGame() const
    {
        int local_2;
        if (this.GetbIsPVPGame())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    void PostConstruct()
    {
        int local_6 = 0;
        int local_11;
        if (!(local_6))
        {
            local_11 = 0;
        }
        else
        {
            local_11 = (int(local_6.GetGameModeType()) != 0);
        }
        this.SetbIsPVPGame((local_11 != 0));
        return;
    }
    bool GetbIsPVPGame() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bIsPVPGame;
    }
    void SetbIsPVPGame(const bool __Value) property
    {
        if (!(this.m_bIsPVPGame) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bIsPVPGame = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_GameMode
{
    UPROPERTY()
    ESlateVisibility VisibleInPVPGame;
    UPROPERTY()
    TEUIModelRef<FVMS_GameMode> Self;


}

namespace FVMS_GameMode
{
FVMS_GameMode& Get(const UObject ContextObject)
{
    return FVMS_GameMode::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_GameMode GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_GameMode __r;
    TEUIModelRef<FVMS_GameMode> local_6 = TEUIModelRef<FVMS_GameMode>(EUIInternal::MakeModelWithManager(Manager, FVMS_GameMode::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bIsPVPGame";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VisibleInPVPGame";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_GameMode>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_GameMode;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_GameMode;
}
bool __UIGetter_bIsPVPGame(const FVMS_GameMode &inout Model)
{
    return Model.GetbIsPVPGame();
}
ESlateVisibility __UIGetter_VisibleInPVPGame(const FVMS_GameMode &inout Model)
{
    return Model.VisibleInPVPGame();
}
TEUIModelRef<FVMS_GameMode> __UIGetter_Self(const FVMS_GameMode &inout Model)
{
    return TEUIModelRef<FVMS_GameMode>(Model);
}
int __IndexOf_bIsPVPGame()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_GameMode
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
