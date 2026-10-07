
enum EManipulateSlaveESMSyncType
{
    NoSync,
    SyncWithActionNormalizedTime,
    SyncWithStateNormalizedTime,
}


struct FESMManipulateEntityInstanceData
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    int ManipulateUpdateCount;


}

class UESMAction_ManipulateEntity : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;
    UPROPERTY()
    FName SocketName;
    UPROPERTY()
    FVector LocationOffset;
    UPROPERTY()
    FRotator RotationOffset;
    UPROPERTY()
    float32 AttachBlendKeepDuration;
    UPROPERTY()
    float32 AttachBlendInDuration;
    UPROPERTY()
    int AttachSocketUpdatePeriod;
    UPROPERTY()
    bool bOnlyStateTransition;
    UPROPERTY()
    bool bAttachMasterToSlave;
    UPROPERTY()
    FName SlaveTransitStateNameAtBegin;
    UPROPERTY()
    EManipulateSlaveESMSyncType SlaveStateSyncType;
    UPROPERTY()
    float32 SlaveStateSyncNormalizedTimeEnd;
    UPROPERTY()
    FName SlaveTransitStateNameAtEnd;
    UPROPERTY()
    FName MasterTransitStateNameAtBegin;
    UPROPERTY()
    bool bTargetIgnoreOtherAttack;
    UPROPERTY()
    bool bUseCurveOffset;
    UPROPERTY()
    FNameHandle_EntityBBVarVector RelativeLocationCurveBBVar;
    UPROPERTY()
    FNameHandle_EntityBBVarVector RelativeRotationCurveBBVar;
    UPROPERTY()
    float32 CurveSmoothSpeed;

    UESMAction_ManipulateEntity()
    {
        this.SocketName = NAME_None;
        this.AttachSocketUpdatePeriod = 1;
        this.bOnlyStateTransition = false;
        this.bAttachMasterToSlave = false;
        this.SlaveStateSyncType = EManipulateSlaveESMSyncType(0);
        this.SlaveStateSyncNormalizedTimeEnd = -1.0f;
        this.bUseCurveOffset = false;
        this.CurveSmoothSpeed = 0.0f;
        this.bAllowTickInLowCost = true;
        return;
    }
    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMManipulateEntityInstanceData);
    }
    UFUNCTION()
    bool AllowTickInLowCost_Implementation() const
    {
        return true;
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
        if (!((Info.GetParentState() != nullptr)))
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "Manipulate Entity can only add in state.");
        }
        if ((this.SlaveStateSyncNormalizedTimeEnd >= 0.0f && (int(this.NotifyType) != 1)))
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "NotifyType can only by span if specify SlaveStateSyncNormalizedTimeEnd.");
        }
        if ((this.bUseCurveOffset && this.bOnlyStateTransition))
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "bUseCurveOffset дёЋ bOnlyStateTransition дёЌиѓЅеђЊж—¶ејЂеђЇгЂ‚");
        }
        if (this.bUseCurveOffset)
        {
            if ((FName(this.RelativeLocationCurveBBVar.Name) == NAME_None))
            {
                Info.AddDataInvalidComment(EESMDataValidType(1), "RelativeLocationCurveBBVar is not set.");
            }
            if ((FName(this.RelativeRotationCurveBBVar.Name) == NAME_None))
            {
                Info.AddDataInvalidComment(EESMDataValidType(1), "RelativeRotationCurveBBVar is not set.");
            }
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
        FNameHandle_EntityBBVar local_4;
        local_4;
        if (Context.GetEntity().HasEntityBB(local_4))
        {
            FNameHandle_EntityBBVarBool local_10;
            local_10;
            Context.GetEntity().SetBB_Bool(local_10, MonsterThrowDetectUtils::MonsterCatchTargetLostBBVar);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_5;
        FNameHandle_EntityBBVarBool local_26;
        int local_60 = 0;
        int local_63 = 0;
        FECSEntity local_4;
        bool local_6 = !((local_4 == ENTITY_NULL));
        if (!(local_6))
        {
            FNameHandle_EntityBBVarEntity local_10;
            local_10;
            local_4 = Context.GetEntity().GetBB_Entity(local_10);
        }
        bool local_15 = local_6 && (!(local_4.IsValid()) || !(local_4.IsActive()));
        if (local_15)
        {
            FNameHandle_EntityBBVar local_22;
            bool local_16;
            local_5 = local_4.IsValid();
            local_16 = local_5 && local_4.IsActive();
            local_22;
            local_15 = Context.GetEntity().HasEntityBB(local_22);
            if (!(local_15))
            {
                local_15 = false;
            }
            else
            {
                local_26;
                local_15 = !(Context.GetEntity().GetBB_Bool(local_26));
            }
            if (local_15)
            {
                local_15 = true;
                local_26;
                Context.GetEntity().SetBB_Bool(local_26, MonsterThrowDetectUtils::MonsterCatchTargetLostBBVar);
                FString local_34;
                if (local_5)
                {
                    local_34 = "Inactive";
                }
                else
                {
                    local_34 = "Invalid";
                }
                XWarning(ELog(42), FString().Append("[Manipulate][TargetLost] Master=").Append(Context.GetEntity().GetIdValue()).Append(" Target=").Append(local_4.GetIdValue()).Append(" Reason=").Append(local_34).Append(" TargetValid=").Append(local_5).Append(" TargetActive=").Append(local_16).Append(" UseCurve=").Append(this.bUseCurveOffset).Append(" TargetBB=").Append(this.TargetEntityBBVar.Name).Append(" WorldTime=").Append(Time.WorldTime));
            }
            return;
        }
        bool local_17 = !(local_6);
        if (local_17)
        {
            FC_ManipulateActionLifecycle local_86;
            float32 local_69;
            Has local_42;
            FNameHandle_EntityBBVarEntity local_10;
            if (!(local_4.IsValid()))
            {
                local_15 = false;
            }
            else
            {
                local_15 = local_42.opCall();
            }
            if (local_15)
            {
                Get local_46;
                if (local_46.opCall())
                {
                    Get local_52;
                    const FC_PlayerController& local_54 = local_52.opCall();
                    if (local_54)
                    {
                        if (!((FECSEntity(local_54.GetPlayerPawnEntity()) == local_4)))
                        {
                            local_4 = local_54.GetPlayerPawnEntity();
                            local_10;
                            Context.GetEntity().SetBB_Entity(local_10, this.TargetEntityBBVar.Name);
                            local_10;
                            local_4.SetBB_Entity(local_10, MonsterThrowDetectUtils::CatchedByEntityBBVar);
                        }
                    }
                }
                this.ModifyInstanceData(Context).TargetEntity = local_4;
                this.NotifyOldMasterLost(Context, local_4, Time.WorldTime);
                local_60.SetMasterEntity(Context.GetEntity());
                local_60.SetSocketName(this.SocketName);
                local_60.SetLocationOffset(this.LocationOffset);
                local_60.SetRotationOffset(this.RotationOffset);
                local_60.SetAttachBlendKeepDuration(this.AttachBlendKeepDuration);
                local_60.SetAttachBlendInDuration(this.AttachBlendInDuration);
                local_60.SetAttachSocketUpdatePeriod(this.AttachSocketUpdatePeriod);
                local_60.SetbAttachMasterToSlave(this.bAttachMasterToSlave);
                local_60.SetbOnlyStateTransition(this.bOnlyStateTransition);
                local_60.SetBeginTransitStateName(this.SlaveTransitStateNameAtBegin);
                local_60.SetEndTransitStateName(this.SlaveTransitStateNameAtEnd);
                local_60.SetUpdateCounter((local_60.GetUpdateCounter() + 1));
                local_60.SetExitTime(FFPTime(-1));
                local_60.SetBeginTransitStateSyncNormalizedTime(-1.0f);
                local_60.SetbSyncWithMasterStateNormalizedTime((int(this.SlaveStateSyncType) == 2));
                if (this.SlaveStateSyncNormalizedTimeEnd >= 0.0f)
                {
                    local_69 = this.SlaveStateSyncNormalizedTimeEnd;
                }
                else
                {
                    local_69 = 1.0f;
                }
                local_60.SetMasterStateNormalizedTimeScale(local_69);
                local_60.SetbTargetIgnoreOtherAttack(this.bTargetIgnoreOtherAttack);
                if (this.bTargetIgnoreOtherAttack)
                {
                    FC_OnlyAcceptSpecificEntityAttack local_80;
                    Assign local_74;
                    local_74.opCall(local_80).SetAcceptedEntity(Context.GetEntity());
                }
                this.ModifyInstanceData(Context).ManipulateUpdateCount = local_60.GetUpdateCounter();
                local_86.MasterEntity = Context.GetEntity();
                local_86.UpdateCounter = local_60.GetUpdateCounter();
                local_86.LastTickTime = Time.WorldTime;
                local_63 = 0;
                local_86.MissedTickCount = local_63;
                if (this.bUseCurveOffset)
                {
                    local_5 = false;
                    Get local_90;
                    FC_ManipulatedByCurve local_92 = local_90.opCall();
                    if (local_92)
                    {
                        local_5 = (FECSEntity(local_92.GetMasterEntity()) == Context.GetEntity());
                    }
                    local_92.SetMasterEntity(Context.GetEntity());
                    local_92.SetSmoothSpeed(this.CurveSmoothSpeed);
                    local_92.SetRelativeLocationCurveBBVar(this.RelativeLocationCurveBBVar.Name);
                    local_92.SetRelativeRotationCurveBBVar(this.RelativeRotationCurveBBVar.Name);
                    if (!(local_5))
                    {
                        local_92.SetPhase(EManipulateCurvePhase(EManipulateCurvePhase(0)));
                        local_92.SetStartTime(Time.WorldTime);
                    }
                    XLog(ELog(42), local_34.Append("[ManipulateByCurve][Begin] Master=").Append(Context.GetEntity().GetIdValue()).Append(" Target=").Append(local_4.GetIdValue()).Append(" UpdateCounter=").Append(local_60.GetUpdateCounter()).Append(" BeginState=").Append(this.SlaveTransitStateNameAtBegin).Append(" EndState=").Append(this.SlaveTransitStateNameAtEnd).Append(" SmoothSpeed=").Append(this.CurveSmoothSpeed).Append(" WorldTime=").Append(Time.WorldTime));
                }
                if (!((this.MasterTransitStateNameAtBegin == NAME_None)))
                {
                    FESMExternalTransitHandle local_108 = Context.GetEntity().ESMExternalTransitMainSM(this.MasterTransitStateNameAtBegin, NAME_None);
                }
            }
        }
        if (!(local_4.IsValid()))
        {
            local_17 = false;
        }
        else
        {
            Has local_42;
            local_17 = local_42.opCall();
        }
        if (local_17)
        {
            FC_ManipulateActionLifecycle local_86;
            int local_117;
            local_117 = local_63;
            if (!(local_60))
            {
                local_17 = false;
            }
            else
            {
                local_17 = local_86;
            }
            local_17 = local_17 && (FECSEntity(local_60.GetMasterEntity()) == Context.GetEntity());
            local_17 = local_17 && (local_60.GetUpdateCounter() == local_117);
            local_17 = local_17 && (local_86.MasterEntity == Context.GetEntity());
            local_17 = local_17 && (int(local_86.UpdateCounter) == local_117);
            if (local_17)
            {
                local_86.LastTickTime = Time.WorldTime;
            }
        }
        if (!((this.SlaveTransitStateNameAtBegin == NAME_None)) && (int(this.SlaveStateSyncType) != 0) && local_4.IsValid())
        {
            float32 local_69;
            if (local_60)
            {
                float32 local_123;
                local_123 = local_60.GetBeginTransitStateSyncNormalizedTime();
                if (int(this.SlaveStateSyncType) == 1)
                {
                    local_69 = float32((FFPTime(Time.ActionTime) / Time.ActionDuration));
                }
                else
                {
                    local_69 = float32((FFPTime(Time.StateTime) / Context.State.GetStateLength()));
                }
                if (this.SlaveStateSyncNormalizedTimeEnd >= 0.0f)
                {
                    local_69 = FMath::Lerp(0.0f, this.SlaveStateSyncNormalizedTimeEnd, local_69);
                }
                if (local_123 > 0.0f && ((local_69 + 0.0001f) < local_123))
                {
                    local_60.SetBeginTransitStateSyncNormalizedTime(-1.0f);
                }
                else
                {
                    local_60.SetBeginTransitStateSyncNormalizedTime(local_69);
                }
            }
        }
        local_15 = this.bUseCurveOffset && local_4.IsValid();
        if (!(local_15))
        {
            local_15 = false;
        }
        else
        {
            Has local_42;
            local_15 = local_42.opCall();
        }
        if (local_15)
        {
            Modify local_132;
            FC_ManipulatedByCurve local_92_2 = local_132.opCall();
            if (local_92_2)
            {
                if (!((FFPTime(local_92_2.GetStartTime()) == Time.WorldTime) && (int(local_92_2.GetPhase()) == 0)))
                {
                    FNameHandle_EntityBBVarVector local_142;
                    local_142;
                    FVector local_148 = Context.GetEntity().GetBB_Vector(local_142);
                    local_142;
                    FVector local_138 = Context.GetEntity().GetBB_Vector(local_142);
                    if (int(local_92_2.GetPhase()) == 0 && (!(local_148.IsNearlyZero(9.999999747378752e-5)) || !(local_138.IsNearlyZero(9.999999747378752e-5))))
                    {
                        local_92_2.SetPhase(EManipulateCurvePhase(EManipulateCurvePhase(1)));
                    }
                    if (int(local_92_2.GetPhase()) == 1)
                    {
                        local_92_2.SetRelativeLocationOffset(local_148);
                        local_92_2.SetRelativeRotationOffset(FRotator::MakeFromEuler(local_138));
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        bool local_7;
        int local_5 = local_6;
        FECSEntity local_4;
        if (!(local_4.IsValid()))
        {
            local_7 = false;
        }
        else
        {
            Has local_12;
            local_7 = local_12.opCall();
        }
        if (local_7)
        {
            Get local_18;
            const FC_ManipulatedInfo& local_20 = local_18.opCall();
            if (local_20)
            {
                if ((FECSEntity(local_20.GetMasterEntity()) == Context.GetEntity()) && (local_20.GetUpdateCounter() == local_5))
                {
                    Modify local_28;
                    local_28.opCall().SetExitTime(Time.WorldTime);
                    if (this.bUseCurveOffset)
                    {
                        XLog(ELog(42), FString().Append("[ManipulateByCurve][ExitRequested] Master=").Append(Context.GetEntity().GetIdValue()).Append(" Target=").Append(local_4.GetIdValue()).Append(" UpdateCounter=").Append(local_5).Append(" Reason=ActionExit WorldTime=").Append(Time.WorldTime));
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_4;
        if (!((this.SocketName == NAME_None)) || this.bAttachMasterToSlave)
        {
            local_4 += "<";
            if (!((this.SocketName == NAME_None)))
            {
                local_4 += this.SocketName.ToString();
            }
            if (this.bAttachMasterToSlave)
            {
                local_4 += "(еЏЌеђ‘ Attach)";
            }
            local_4 += ">";
        }
        local_4 += "ж“Ќзєµз›®ж ‡";
        if (this.bOnlyStateTransition)
        {
            local_4 += "(д»…и·іиЅ¬)";
        }
        if (this.bUseCurveOffset)
        {
            local_4 += "(ж›ІзєїеЃЏз§»)";
        }
        if (!((FName(this.TargetEntityBBVar.Name) == NAME_None)))
        {
            FString local_16 = ((FString(" : [") + this.TargetEntityBBVar.Name.ToString()) + "]");
            local_4 += local_16;
        }
        bool local_8 = !((this.SlaveTransitStateNameAtBegin == NAME_None));
        bool local_7 = !((this.SlaveTransitStateNameAtEnd == NAME_None));
        FString local_12;
        if ((local_8 || local_7))
        {
            FString local_16;
            if (local_8)
            {
                local_16 = this.SlaveTransitStateNameAtBegin.ToString();
            }
            else
            {
                local_16 = "(None)";
            }
            FString local_26;
            if (local_7)
            {
                local_26 = this.SlaveTransitStateNameAtEnd.ToString();
            }
            else
            {
                local_26 = "(None)";
            }
            local_12 = ((FString(" -> {") + local_16) + ", ");
            FString local_20_2 = (local_12 + local_26);
            FString local_30_2 = (local_20_2 + "}");
            local_4 += local_30_2;
        }
        if ((!((this.SlaveTransitStateNameAtBegin == NAME_None)) && (int(this.SlaveStateSyncType) != 0)))
        {
            if (int(this.SlaveStateSyncType) == 1)
            {
                local_4 += " (ж—¶й•їеђЊж­Ґ Action)";
            }
            else
            {
                if (int(this.SlaveStateSyncType) == 2)
                {
                    local_4 += " (ж—¶й•їеђЊж­Ґ State)";
                }
            }
        }
        if (local_4.IsEmpty())
        {
            local_12 = "ж“Ќзєµз›®ж ‡(жњЄй…ЌзЅ®)";
        }
        else
        {
            local_12 = local_4;
        }
        return local_12;
    }
    FESMManipulateEntityInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMManipulateEntityInstanceData __r;
        return __r;
    }
    FESMManipulateEntityInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMManipulateEntityInstanceData __r;
        return __r;
    }
    void NotifyOldMasterLost(const FESMContext &inout Context, const FECSEntity &inout Target, const FFPTime &inout WorldTime) const
    {
        Has local_26;
        Get local_4;
        const FC_ManipulatedInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntity local_12 = FECSEntity(local_6.GetMasterEntity());
            if (local_12.IsValid())
            {
                bool local_7 = !((local_12 == Context.GetEntity()));
                if (!(local_7))
                {
                    local_7 = false;
                }
                else
                {
                    FNameHandle_EntityBBVar local_16;
                    local_16;
                    local_7 = local_12.HasEntityBB(local_16);
                }
                if (local_7)
                {
                    FNameHandle_EntityBBVarBool local_22;
                    local_22;
                    local_12.SetBB_Bool(local_22, MonsterThrowDetectUtils::MonsterCatchTargetLostBBVar);
                }
                if (!(local_6.GetbOnlyStateTransition()) && this.bOnlyStateTransition)
                {
                    bool local_17_2 = local_26.opCall();
                    if (local_17_2)
                    {
                        ::FManipulateUtils::CleanupManipulatedByCurve(Target, local_12);
                    }
                    else
                    {
                        if (local_6.GetbAttachMasterToSlave())
                        {
                            ::FAttachmentUtils::EntityDetachWithoutOffset(local_12, WorldTime, false, uint8(0));
                        }
                        else
                        {
                            ::FAttachmentUtils::EntityDetachWithoutOffset(Target, WorldTime, false, uint8(0));
                        }
                    }
                }
                else
                {
                    bool local_17_3 = local_26.opCall();
                    if (local_17_3)
                    {
                        if (!((local_12 == Context.GetEntity()) && this.bUseCurveOffset))
                        {
                            Remove local_32;
                            local_32.opCall();
                        }
                    }
                }
            }
            if (local_6.GetbTargetIgnoreOtherAttack())
            {
                Get local_36;
                const FC_OnlyAcceptSpecificEntityAttack& local_38 = local_36.opCall();
                if (local_38)
                {
                    if ((FECSEntity(local_38.GetAcceptedEntity()) == local_12))
                    {
                        Remove local_46;
                        local_46.opCall();
                    }
                }
            }
        }
        return;
    }
}

