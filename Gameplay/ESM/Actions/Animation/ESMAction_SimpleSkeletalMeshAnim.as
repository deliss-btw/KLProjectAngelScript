
const FConsoleVariable CVar_SimpleSkeletalMeshAnim_DebugLog = FConsoleVariable();

struct FESMSimpleSkeletalMeshAnimInstanceData
{
    UPROPERTY()
    TWeakObjectPtr<USkeletalMeshComponent> CachedSkeletalMeshComponent;

    FESMSimpleSkeletalMeshAnimInstanceData()
    {
        return;
    }
}

class UESMAction_SimpleSkeletalMeshAnim : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FName MeshComponentName = NAME_None;
    UPROPERTY()
    UAnimSequence MeshAnim;
    UPROPERTY()
    bool bLoop = true;


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMSimpleSkeletalMeshAnimInstanceData);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_16;
        if (this.MeshAnim != nullptr)
        {
            local_16 = this.MeshAnim.GetName();
        }
        else
        {
            local_16 = "(ж— еЉЁз”»)";
        }
        FString local_4;
        if (this.bLoop)
        {
            local_4 = "Loop";
        }
        else
        {
            local_4 = "Once";
        }
        FString local_20;
        if (this.MeshComponentName.IsNone())
        {
            local_20 = "(ж— з»„д»¶еђЌ)";
        }
        else
        {
            local_20 = this.MeshComponentName.ToString();
        }
        return FString().Append("еЉЁз”»: ").Append(local_16).Append(" [").Append(local_4).Append("] @").Append(local_20);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if ((!((this.MeshAnim != nullptr))))
        {
            return;
        }
        FESMSimpleSkeletalMeshAnimInstanceData& local_6 = this.ModifyViewInstanceData(Context);
        USkeletalMeshComponent local_8 = this.FindSkeletalMeshComponent(Context);
        if ((!((local_8 != nullptr))))
        {
            return;
        }
        local_6.CachedSkeletalMeshComponent = local_8;
        local_8.SetAnimationMode(EAnimationMode(1), false);
        local_8.SetAnimation(this.MeshAnim);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if ((!((this.MeshAnim != nullptr))))
        {
            return;
        }
        const FESMSimpleSkeletalMeshAnimInstanceData& local_6 = this.GetViewInstanceData(Context);
        if (local_6.CachedSkeletalMeshComponent.IsValid())
        {
        }
        else
        {
        }
        USkeletalMeshComponent local_10;
        USkeletalMeshComponent local_12 = local_10;
        if (local_12 != nullptr)
        {
            local_12.SetAnimation(nullptr);
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        float local_30;
        if ((!((this.MeshAnim != nullptr))))
        {
            return;
        }
        FESMSimpleSkeletalMeshAnimInstanceData& local_6 = this.ModifyViewInstanceData(Context);
        if (local_6.CachedSkeletalMeshComponent.IsValid())
        {
        }
        else
        {
        }
        USkeletalMeshComponent local_10;
        USkeletalMeshComponent local_12 = local_10;
        if (local_12 == nullptr)
        {
            local_12 = this.FindSkeletalMeshComponent(Context);
            if (local_12 == nullptr)
            {
                XError(ELog(5), FString().Append("SimpleSkeletalMeshAnim: ").Append(this.DebugGetPath()).Append(" ж‰ѕдёЌе€°LogicNameдёє[").Append(this.MeshComponentName).Append("]зљ„з»„д»¶пјЊиЇ·жЈЂжџҐй…ЌзЅ®"));
                return;
            }
            local_6.CachedSkeletalMeshComponent = local_12;
        }
        float32 local_23 = this.MeshAnim.GetPlayLength();
        if (this.bLoop)
        {
            local_30 = Time.ActionTime.ToSeconds() % local_23;
        }
        else
        {
            local_30 = Time.ActionTime.ToSeconds();
        }
        float32 local_22 = float32(local_30);
        local_12.SetPosition(local_22, false);
        XLogIf(CVar_SimpleSkeletalMeshAnim_DebugLog.GetBool(), ELog(5), FString().Append("SimpleSkeletalMeshAnim: ").Append(this.DebugGetPath()).Append(" Anim=").Append(this.MeshAnim.GetName()).Append(" Progress=").Append(FString::ApplyFormat(local_22, ".2f")).Append("/").Append(FString::ApplyFormat(local_23, ".2f")).Append("s (").Append(FString::ApplyFormat(((local_22 / local_23) * 100.0f), ".1f")).Append("%) Loop=").Append(this.bLoop));
        return;
    }
    const FESMSimpleSkeletalMeshAnimInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMSimpleSkeletalMeshAnimInstanceData __r;
        return __r;
    }
    FESMSimpleSkeletalMeshAnimInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMSimpleSkeletalMeshAnimInstanceData __r;
        return __r;
    }
    USkeletalMeshComponent FindSkeletalMeshComponent(const FESMViewContext &inout Context) const
    {
        USkeletalMeshComponent local_44;
        AGameActor local_6 = (Cast<AGameActor>(Context.GetEntity().GetActor()));
        if (local_6 != nullptr)
        {
            TArray<USceneComponent> local_16 = local_6.GetCachedSceneComponentByLogicName(this.MeshComponentName);
            if (local_16.IsEmpty())
            {
                XError(ELog(5), FString().Append("SimpleSkeletalMeshAnim: ").Append(this.DebugGetPath()).Append(" ж‰ѕдёЌе€°LogicNameдёє[").Append(this.MeshComponentName).Append("]зљ„з»„д»¶пјЊиЇ·жЈЂжџҐй…ЌзЅ®"));
                return FString();
            }
            for (auto local_42 : local_16)
            {
                local_44 = Cast<USkeletalMeshComponent>(local_42);
                if (local_44 != nullptr)
                {
                    return local_44;
                }
            }
            XError(ELog(5), local_28.Append("SimpleSkeletalMeshAnim: ").Append(this.DebugGetPath()).Append(" LogicName[").Append(this.MeshComponentName).Append("]дё‹ж‰ѕдёЌе€°SkeletalMeshComponentпјЊиЇ·жЈЂжџҐз»„д»¶з±»ећ‹"));
        }
        return nullptr;
    }
}

