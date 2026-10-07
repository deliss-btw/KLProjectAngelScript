
namespace FMS_Unstuck
{
    const int ModelId = 0;

}
struct FMS_Unstuck : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FFPTime m_LastUnstuckTime;

    FMS_Unstuck()
    {
        this.m_LastUnstuckTime = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_Unstuck(const FMS_Unstuck &inout Other)
    {
        this.m_LastUnstuckTime = 0;
        this.m_LastUnstuckTime = Other.m_LastUnstuckTime;
        return;
    }
    FMS_Unstuck& opAssign(const FMS_Unstuck &inout Other)
    {
        return Other.m_LastUnstuckTime;
    }
    void Unstuck()
    {
        const UUtilitySettings local_2;
        GetGameplaySettings<UUtilitySettings> local_4;
        local_2 = local_4;
        FFPTime local_8 = (local_2.UnstuckCooldown - (FFPTime(this.GetContext().Time) - this.GetLastUnstuckTime()));
        if (local_8.opCmp(0.0) > 0)
        {
            FText local_30;
            FNumberFormattingOptions local_24 = FNumberFormattingOptions();
            FText::AsNumber(local_30, local_8.ToSeconds());
            FText::Format(NSLOCTEXT("Unstuck", "UnstuckCooldown", "и„±з¦»еЌЎж­»еЉџиѓЅе†·еЌґдё­пјЊиЇ·{0}з§’еђЋзЁЌеђЋе†ЌиЇ•"), local_30);
            return;
        }
        FFPTime local_12 = FFPTime(-1);
        FECSEntity local_46 = this.GetContext().GetLocalPlayerPawn();
        SendEvent local_50;
        local_50.opCall(local_12);
        this.SetLastUnstuckTime(this.GetContext().Time);
        return;
    }
    const FFPTime GetLastUnstuckTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FFPTime GetModify_LastUnstuckTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLastUnstuckTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LastUnstuckTime = __Value;
        return;
    }
}

namespace FMS_Unstuck
{
FMS_Unstuck& Get(const UObject ContextObject)
{
    return FMS_Unstuck::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_Unstuck GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_Unstuck __r;
    TEUIModelRef<FMS_Unstuck> local_6 = TEUIModelRef<FMS_Unstuck>(EUIInternal::MakeModelWithManager(Manager, FMS_Unstuck::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_Unstuck;
}
int __IndexOf_LastUnstuckTime()
{
    return 0;
}
}
