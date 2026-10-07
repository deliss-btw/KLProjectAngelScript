
enum ESocketType
{
    None,
    Head,
    Root,
    Spine,
    LockPoint,
    L_Hand,
    R_Hand,
    L_Foot,
    R_Foot,
    L_Weapon,
    R_Weapon,
    L_Weapon_Back,
    R_Weapon_Back,
    SideArm,
    L_Weapon_Root,
    R_Weapon_Root,
}


class UESMAction_ParentSocketControl : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FName MeshComponentName = NAME_None;
    UPROPERTY()
    ESocketType OriginalSocketType = ESocketType(0);
    UPROPERTY()
    ESocketType TargetSocketType = ESocketType(0);


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        UMeshComponent local_26;
        FName local_5 = this.GetSocketNameFromEnum(this.TargetSocketType);
        if (((this.MeshComponentName == NAME_None) || (local_5 == NAME_None)))
        {
            return;
        }
        FECSActorComponentProxy local_12 = Context.GetEntity().ModifyActorComponent(this.MeshComponentName);
        if (local_12)
        {
            FName local_18;
            if (Context.GetEntity().GetActor() != nullptr)
            {
                if (local_26 != nullptr)
                {
                    USceneComponent local_30 = local_26.GetAttachParent();
                    if (local_30 != nullptr)
                    {
                        local_18 = local_30.GetFName();
                    }
                }
            }
            local_12.AttachTo(local_18, local_5, FVector::ZeroVector, FQuat::Identity);
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        UMeshComponent local_26;
        FName local_5 = this.GetSocketNameFromEnum(this.OriginalSocketType);
        if (((this.MeshComponentName == NAME_None) || (local_5 == NAME_None)))
        {
            return;
        }
        FECSActorComponentProxy local_12 = Context.GetEntity().ModifyActorComponent(this.MeshComponentName);
        if (local_12)
        {
            FName local_18;
            if (Context.GetEntity().GetActor() != nullptr)
            {
                if (local_26 != nullptr)
                {
                    USceneComponent local_30 = local_26.GetAttachParent();
                    if (local_30 != nullptr)
                    {
                        local_18 = local_30.GetFName();
                    }
                }
            }
            local_12.AttachTo(local_18, local_5, FVector::ZeroVector, FQuat::Identity);
        }
        return;
    }
    FName GetSocketNameFromEnum(const ESocketType SocketType) const
    {
        switch (int(SocketType))
        {
        case 0:
        {
            return NAME_None;
        }
        case 1:
        {
            return FName("S_Head");
        }
        case 2:
        {
            return FName("S_Root");
        }
        case 3:
        {
            return FName("S_Spine_01");
        }
        case 4:
        {
            return FName("S_LockPoint");
        }
        case 5:
        {
            return FName("S_L_Hand");
        }
        case 6:
        {
            return FName("S_R_Hand");
        }
        case 7:
        {
            return FName("S_L_Foot");
        }
        case 8:
        {
            return FName("S_R_Foot");
        }
        case 9:
        {
            return FName("S_L_Weapon_Hand");
        }
        case 10:
        {
            return FName("S_R_Weapon_Hand");
        }
        case 11:
        {
            return FName("S_L_Weapon_Back");
        }
        case 12:
        {
            return FName("S_R_Weapon_Back");
        }
        case 13:
        {
            return FName("S_SideArm_01");
        }
        case 14:
        {
            return FName("S_L_Weapon_Root");
        }
        case 15:
        {
            return FName("S_R_Weapon_Root");
        }
        }
        return NAME_None;
    }
}

