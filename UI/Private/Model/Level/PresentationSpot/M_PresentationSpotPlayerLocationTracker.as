
namespace FMS_PresentationSpotPlayerLocationTracker
{
    const int ModelId = 0;

}
struct FMS_PresentationSpotPlayerLocationTracker : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FVector m_CachedRulePlayerPosition;

    FMS_PresentationSpotPlayerLocationTracker()
    {
        this.m_CachedRulePlayerPosition = FVector(-99999.0, -99999.0, -99999.0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_PresentationSpotPlayerLocationTracker(const FMS_PresentationSpotPlayerLocationTracker &inout Other)
    {
        this.m_CachedRulePlayerPosition = FVector(-99999.0, -99999.0, -99999.0);
        this.m_CachedRulePlayerPosition = Other.m_CachedRulePlayerPosition;
        return;
    }
    FMS_PresentationSpotPlayerLocationTracker& opAssign(const FMS_PresentationSpotPlayerLocationTracker &inout Other)
    {
        return Other.m_CachedRulePlayerPosition;
    }
    FVector GetRulePlayerPosition()
    {
        this.UpdatePlayerPosition();
        return this.GetCachedRulePlayerPosition();
    }
    void TickPlayerPosition()
    {
        this.UpdatePlayerPosition();
        return;
    }
    void UpdatePlayerPosition()
    {
        if (!(this.GetContext().GetLocalPlayerPawn()))
        {
            return;
        }
        FVector local_16 = FTransformUtils::GetLocation(this.GetContext().GetLocalPlayerPawn(), FFPTime(-1));
        if (this.GetCachedRulePlayerPosition().DistSquared2D(local_16) > FMath::Square(100.0))
        {
            this.SetCachedRulePlayerPosition(local_16);
        }
        return;
    }
    const FVector GetCachedRulePlayerPosition() const property
    {
        const FVector __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FVector GetModify_CachedRulePlayerPosition() property
    {
        FVector __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCachedRulePlayerPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CachedRulePlayerPosition = __Value;
        return;
    }
}

namespace FMS_PresentationSpotPlayerLocationTracker
{
FMS_PresentationSpotPlayerLocationTracker& Get(const UObject ContextObject)
{
    return FMS_PresentationSpotPlayerLocationTracker::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PresentationSpotPlayerLocationTracker GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_PresentationSpotPlayerLocationTracker __r;
    TEUIModelRef<FMS_PresentationSpotPlayerLocationTracker> local_6 = TEUIModelRef<FMS_PresentationSpotPlayerLocationTracker>(EUIInternal::MakeModelWithManager(Manager, FMS_PresentationSpotPlayerLocationTracker::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.TickFunction.FunctionName = "__TickPlayerPosition";
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_PresentationSpotPlayerLocationTracker;
}
void __TickPlayerPosition(FMS_PresentationSpotPlayerLocationTracker &inout Model)
{
    Model.TickPlayerPosition();
    return;
}
int __IndexOf_CachedRulePlayerPosition()
{
    return 0;
}
}
