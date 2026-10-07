

// NOTE: class defaults are not authored in this module: FAICommand_UpdateFollowEntityInfo (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FAICommand_UpdateFollowEntityInfo : FAICommandScript
{
    FAICommandScript _base_FAICommandScript;

    FAICommand_UpdateFollowEntityInfo()
    {
        this.__InitDefaults();
        return;
    }
    const UScriptStruct GetInstanceDataType_Implementation() const
    {
        UScriptStruct local_2 = FAICommand_UpdateFollowEntityInfo;
        return local_2;
    }
    FAICommand_UpdateFollowEntityInfo GetInstanceData(const FAICommandParams &inout Params) const
    {
        FAICommand_UpdateFollowEntityInfo __r;
        return __r;
    }
    void Tick_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime, const FFPTime &inout DeltaTime)
    {
        int local_26 = 0;
        FECSEntity local_4 = Params.GetPawnProxy();
        FNameHandle_EntityBBVarEntity local_14;
        local_14;
        FECSEntity local_18 = local_4.GetBB_Entity(local_14);
        if (local_18.IsValid())
        {
            FNameHandle_EntityBBVarBool local_46;
            FNameHandle_EntityBBVarInt local_40;
            FRotator local_32 = local_26.GetRotation().Rotator();
            FNameHandle_EntityBBVarRotator local_36;
            local_36;
            local_40;
            int local_9 = local_18.GetBB_Int(local_40);
            local_40;
            local_4.SetBB_Int(local_40, n"iPhase");
            local_46;
            bool local_19 = local_18.GetBB_Bool(local_46);
            local_46;
            local_4.SetBB_Bool(local_46, n"bIsOnTree");
        }
        return;
    }
}

class UBTService_UpdateFollowEntityInfo : UBTService_AICommandScript
{
    UPROPERTY()
    FBlackboardKeySelector FollowCombatTargetEntity;
    FBlackboardKeySelector FollowTargetEntityDistanceXY;
    FBlackboardKeySelector FollowOffset;
    UPROPERTY()
    FAICommand_UpdateFollowEntityInfo AICommand;

    UBTService_UpdateFollowEntityInfo()
    {
        this.FollowCombatTargetEntity.SelectedKeyName = n"FollowCombatTargetEntity";
        this.FollowCombatTargetEntity.AddEntityIdFilter(this, n"FollowCombatTargetEntity");
        this.FollowTargetEntityDistanceXY.SelectedKeyName = n"FollowTargetEntityDistanceXY";
        this.FollowTargetEntityDistanceXY.AddVectorFilter(this, n"FollowTargetEntityDistanceXY");
        this.FollowOffset.SelectedKeyName = n"TargetOffset";
        this.FollowOffset.AddVectorFilter(this, n"TargetOffset");
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        int local_6 = 0;
        int local_26 = 0;
        UBlackboardComponent local_8 = Context.GetOwnerComponent().GetBlackboardComponent();
        FECSEntity local_22 = FECSEntity(local_8.GetValueAsEntityId(this.FollowCombatTargetEntity.SelectedKeyName));
        if (local_22.IsValid())
        {
            FNameHandle_EntityBBVarEntity local_66;
            local_8.SetValueAsFloat(this.FollowTargetEntityDistanceXY.SelectedKeyName, float32((local_6.GetPosition().Dist2D((FVector(local_26.GetPosition()) + local_26.GetRotation().RotateVector(local_8.GetValueAsVector(this.FollowOffset.SelectedKeyName)))))));
            local_66;
            FECSEntity local_22_2 = Context.PawnEntity.GetBB_Entity(local_66);
            Get local_70;
            if (local_70.opCall())
            {
                local_66;
            }
            else
            {
                FNameHandle_EntityBBVar local_76;
                local_76;
                Context.PawnEntity.ResetBB_Value(local_76);
            }
        }
        return;
    }
}

