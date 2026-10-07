

struct FESMHitStateInstanceData
{
    UPROPERTY()
    int HitStateIndex = -1;


}

class UESMAction_HitState : UESMBPBaseSpanAction
{
    UPROPERTY()
    EHitReactionState HitState = EHitReactionState(0);


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMHitStateInstanceData);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (int(this.HitState) == 0)
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "дёЌеЏЇй…ЌзЅ®HitStateдёєNone");
        }
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Modify local_8;
        FC_HitReaction& local_4 = local_8.opCall();
        if (local_4)
        {
            this.ModifyInstanceData(Context).HitStateIndex = local_4.PushHitState(this.HitState);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        Modify local_8;
        FC_HitReaction& local_4 = local_8.opCall();
        if (local_4)
        {
            local_4.DiscardHitState(local_10);
        }
        this.ModifyInstanceData(Context).HitStateIndex = -1;
        return;
    }
    FESMHitStateInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMHitStateInstanceData __r;
        return __r;
    }
    FESMHitStateInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMHitStateInstanceData __r;
        return __r;
    }
}

