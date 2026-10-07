

class UESMAction_HideMesh : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bUnHideOnExit = true;
    UPROPERTY()
    TArray<FName> HideMeshNames;
    UPROPERTY()
    bool bSpecificEntity = false;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity SpecificEntityId;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.HideMeshNames.Num() == 0)
        {
            return;
        }
        FECSEntity local_8 = Context.GetEntity();
        if (this.bSpecificEntity)
        {
            local_8 = Context.GetEntity().GetBB_Entity(this.SpecificEntityId);
        }
        if (local_8.IsValid())
        {
            for (auto& local_26 : this.HideMeshNames)
            {
                if ((local_26 == NAME_None))
                {
                    continue;
                }
                ::FVisibilityUtils::SetEntityMeshHidden(local_8, local_26, true);
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.bUnHideOnExit))
        {
            return;
        }
        if (this.HideMeshNames.Num() == 0)
        {
            return;
        }
        FECSEntity local_8 = Context.GetEntity();
        if (this.bSpecificEntity)
        {
            FNameHandle_EntityBBVarInt local_12;
            local_12;
            local_8 = FECSEntity(Context.GetEntity().GetBB_Int(local_12));
        }
        if (local_8.IsValid())
        {
            for (auto& local_30 : this.HideMeshNames)
            {
                if ((local_30 == NAME_None))
                {
                    continue;
                }
                ::FVisibilityUtils::SetEntityMeshHidden(local_8, local_30, false);
            }
        }
        return;
    }
}

