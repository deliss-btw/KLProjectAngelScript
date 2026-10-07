

class UESMAction_ExternalTransitControl : UESMBPBaseSpanAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;
    UPROPERTY()
    FName TransitStateNameAtBegin;
    UPROPERTY()
    FName TransitStateNameAtEnd;

    UESMAction_ExternalTransitControl()
    {
        return;
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1);
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if ((!((Info.GetParentState() != nullptr))))
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "External Transit Control can only add in state.");
        }
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_3;
        if ((this.TransitStateNameAtBegin == NAME_None))
        {
            return;
        }
        FNameHandle_EntityBBVarEntity local_12;
        local_12;
        FECSEntity local_16 = Context.GetEntity().GetBB_Entity(local_12);
        if (!(local_16.IsValid()))
        {
            local_3 = false;
        }
        else
        {
            Has local_20;
            local_3 = local_20.opCall();
        }
        if (local_3)
        {
            FESMExternalTransitHandle local_30 = local_16.ESMExternalTransitMainSM(this.TransitStateNameAtBegin, NAME_None);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_3;
        if ((this.TransitStateNameAtEnd == NAME_None))
        {
            return;
        }
        FNameHandle_EntityBBVarEntity local_12;
        local_12;
        FECSEntity local_16 = Context.GetEntity().GetBB_Entity(local_12);
        if (!(local_16.IsValid()))
        {
            local_3 = false;
        }
        else
        {
            Has local_20;
            local_3 = local_20.opCall();
        }
        if (local_3)
        {
            FESMExternalTransitHandle local_30 = local_16.ESMExternalTransitMainSM(this.TransitStateNameAtEnd, NAME_None);
        }
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_4 = "жЋ§е€¶ESMе¤–йѓЁи·іиЅ¬";
        if ((!((FName(this.TargetEntityBBVar.Name) == NAME_None))))
        {
            FString local_20;
            local_20 = (FString(" : [") + this.TargetEntityBBVar.Name.ToString());
            FString local_16 = (local_20 + "]");
            local_4 += local_16;
        }
        bool local_7 = !((this.TransitStateNameAtBegin == NAME_None));
        bool local_21 = !((this.TransitStateNameAtEnd == NAME_None));
        if ((local_7 || local_21))
        {
            FString local_20;
            if (local_7)
            {
                local_20 = this.TransitStateNameAtBegin.ToString();
            }
            else
            {
                local_20 = "(None)";
            }
            FString local_26;
            if (local_21)
            {
                local_26 = this.TransitStateNameAtEnd.ToString();
            }
            else
            {
                local_26 = "(None)";
            }
            FString local_16_2 = (((FString(" -> {") + local_20) + ", ") + local_26);
            FString local_30_2 = (local_16_2 + "}");
            local_4 += local_30_2;
        }
        return local_4;
    }
}

