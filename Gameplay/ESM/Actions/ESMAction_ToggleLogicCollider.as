

struct FEnableDisableColliderItem
{
    UPROPERTY()
    FName ColliderName;
    UPROPERTY()
    bool bColliderEnabled = true;


}

class UESMAction_ToggleLogicCollider : UESMBPBaseSpanAction
{
    UPROPERTY()
    TArray<FEnableDisableColliderItem> ExtraColliderList;
    UPROPERTY()
    bool bLegacyImported = false;
    UPROPERTY()
    FName ColliderName;
    UPROPERTY()
    bool bColliderEnabled = true;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_4;
        int local_1 = 0;
        for (; local_1 < this.ExtraColliderList.Num(); )
        {
            const FEnableDisableColliderItem& local_6 = this.ExtraColliderList[local_1];
            local_4 = !(local_6.bColliderEnabled);
            this.SetColiderDisabled(Context.GetEntity(), local_6.ColliderName, Time.WorldTime, local_4);
            ++local_1;
        }
        if (!(this.ColliderName.IsNone()) && !(this.bLegacyImported))
        {
            this.SetColiderDisabled(Context.GetEntity(), this.ColliderName, Time.WorldTime, !(this.bColliderEnabled));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_1 = 0;
        for (; local_1 < this.ExtraColliderList.Num(); )
        {
            const FEnableDisableColliderItem& local_6 = this.ExtraColliderList[local_1];
            this.SetColiderDisabled(Context.GetEntity(), local_6.ColliderName, Time.WorldTime, local_6.bColliderEnabled);
            ++local_1;
        }
        if (!(this.ColliderName.IsNone()) && !(this.bLegacyImported))
        {
            this.SetColiderDisabled(Context.GetEntity(), this.ColliderName, Time.WorldTime, this.bColliderEnabled);
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (!(this.bLegacyImported) == !(false))
        {
            this.bLegacyImported = true;
            if ((!((this.ColliderName == NAME_None))))
            {
                FEnableDisableColliderItem local_8;
                local_8.ColliderName = this.ColliderName;
                local_8.bColliderEnabled = this.bColliderEnabled;
                this.ExtraColliderList.Add(local_8);
            }
        }
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_4 = "";
        FString local_8 = "";
        int local_9 = 0;
        for (; local_9 < this.ExtraColliderList.Num(); ++local_9)
        {
            const FEnableDisableColliderItem& local_14 = this.ExtraColliderList[local_9];
            if (!(local_14.bColliderEnabled))
            {
                FString local_22 = (local_14.ColliderName.ToString() + ", ");
                local_4 += local_22;
                continue;
            }
            FString local_22_2 = (local_14.ColliderName.ToString() + ", ");
            local_8 += local_22_2;
        }
        if (local_4.Len() > 2)
        {
            local_4.RemoveFromEnd(", ", ESearchCase(1));
        }
        if (local_8.Len() > 2)
        {
            local_8.RemoveFromEnd(", ", ESearchCase(1));
        }
        if (local_4.IsEmpty() && local_8.IsEmpty())
        {
            return "жњЄй…ЌзЅ®зў°ж’ћ";
        }
        FString local_28 = "";
        if (!(local_4.IsEmpty()))
        {
            local_28 += FString().Append("е…ізў°ж’ћ: ").Append(local_4);
        }
        if (!(local_8.IsEmpty()))
        {
            if (!(local_28.IsEmpty()))
            {
                local_28 += "; ";
            }
            local_28 += FString().Append("ејЂзў°ж’ћ: ").Append(local_8);
        }
        if (local_28.Len() > 40)
        {
            local_28 = (local_28.Left(37) + "...");
        }
        return local_28;
    }
    void SetColiderDisabled(const FECSEntity &inout Entity, const FName &inout NameOfCollider, const FFPTime &inout Time, const bool bColliderDisabled) const
    {
        if (!((NameOfCollider == NAME_None)))
        {
            if (bColliderDisabled && FCollisionUtils::IsPushColliderDisable(Entity, NameOfCollider, Time))
            {
                XError(ELog(5), FString().Append("PushCollider '").Append(NameOfCollider).Append("' is already disabled, don't disable repeatedly, Action: '").Append(this.GetDataPathName()).Append("' "));
                return;
            }
            FCollisionUtils::DisablePushCollider(Entity, NameOfCollider, Time, bColliderDisabled);
        }
        return;
    }
}

