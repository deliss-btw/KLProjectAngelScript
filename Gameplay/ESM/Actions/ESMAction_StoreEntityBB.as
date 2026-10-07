

class UESMAction_StoreEntityBB : UESMBPBaseSpanAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarFloat FloatNameHandle;

    UESMAction_StoreEntityBB()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.GetModify_FloatStore().Add(this.FloatNameHandle.Name, Context.GetEntity().GetBB_Float(this.FloatNameHandle));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (local_6)
        {
        }
        return;
    }
}

namespace StoreEntityBB
{
UFUNCTION()
float32 GetStoredFloatValue(const FECSEntity &inout Entity, const FNameHandle_EntityBBVarFloat &inout NameHandle, bool &out bIsExisted)
{
    int local_8 = 0;
    bIsExisted = false;
    if (local_8)
    {
        FName local_10;
        bIsExisted = local_8.GetFloatStore().Find(NameHandle.Name, local_10);
        return local_10;
    }
    else
    {
        bIsExisted = false;
        return 0.0f;
    }
}
}
