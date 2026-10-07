

// NOTE: class defaults are not authored in this module: FMissionAction_RemoveItem (default scalar field FMissionActionBase.ActionType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FMissionItemInfo
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> ItemConfig;
    UPROPERTY()
    uint ItemCount = 1;


}

struct FMissionAction_RemoveItemCallback
{
    UPROPERTY()
    FECSEntity PlayerEntity;
    UPROPERTY()
    int ExecutionEntryId;
    UPROPERTY()
    int ActionIndex;


    void opCall(const EAwaitGsResourceResult Result, bool &inout bIsConfirmed)
    {
        XLog(ELog(63), FString().Append("OpCall RemoveItemActionCallback ").Append(Result));
        if (!(this.IsValid()))
        {
            XError(ELog(63), FString().Append("RemoveItem opCall Failed to get PlayerEntity, PlayerEntityId=").Append(this.GetIdValue()));
            return;
        }
        Modify local_12;
        FC_MissionExecution& local_14 = local_12.opCall();
        if (local_14)
        {
            for (auto& local_32 : local_14.ExecutionEntries)
            {
                int local_33 = local_32.GetKey();
                if (local_33 != this.ExecutionEntryId)
                {
                    continue;
                }
                if ((this.ActionIndex < 0 || (this.ActionIndex >= local_33)))
                {
                    XError(ELog(63), FString().Append("RemoveItem opCall Failed to get ActionIndex, ActionIndex=").Append(this.ActionIndex).Append(", ExecutionEntryId=").Append(this.ExecutionEntryId));
                    return;
                }
                int local_34 = this.ActionIndex;
                if (int(Result) == 2)
                {
                    bIsConfirmed = true;
                }
                else
                {
                    bIsConfirmed = false;
                }
                break;
            }
            return;
        }
        XWarning(ELog(63), FString().Append("RemoveItem opCall Failed to get MissionExecution, PlayerEntity=").Append(this.GetEntityName()));
        return;
    }
}

struct FMissionAction_RemoveItem : FMissionActionBase
{
    FMissionActionBase _base_FMissionActionBase;
    UPROPERTY()
    TArray<FMissionItemInfo> ItemInfos;

    FMissionAction_RemoveItem()
    {
        this.__InitDefaults();
        return;
    }
    EMissionActionStatus TickAction_Implementation(const FMissionActionContext &inout Context)
    {
        if (int(Context.LastStatus) == 2)
        {
            return EMissionActionStatus(2);
        }
        if (!(this.SendRemoveItemRequest(Context)))
        {
            return EMissionActionStatus(4);
        }
        return EMissionActionStatus(2);
    }
    bool SendRemoveItemRequest(const FMissionActionContext &inout Context)
    {
        FPbGetGsResourceReq local_4;
        int local_91 = 0;
        FPbGsResource local_24 = local_4.GetResource();
        for (auto& local_40 : this.ItemInfos)
        {
            if (!(local_40.ItemConfig.IsSet()))
            {
                XError(ELog(63), FString().Append("RemoveItem opCall Failed to get ItemConfig, ItemConfig=").Append(local_40.ItemConfig.ToString()));
                return false;
            }
            FPbGsCostItem local_80 = local_24.AddContentList().GetCostItem();
            local_80.SetItemId(local_91);
            local_80.SetCount(int(local_40.ItemCount));
        }
        FMissionAction_RemoveItemCallback local_98;
        local_98.PlayerEntity = Context.ContextEntity;
        local_98.ExecutionEntryId = int(Context.EntryId);
        local_98.ActionIndex = int(Context.ActionIndex);
        FPbGetGsResourceReq local_106;
        FInstancedStruct::Make(local_106);
        UGameDSConnectionSubsystem local_102 = ::UGameDSConnectionSubsystem::Get();
        return true;
    }
}

struct FMissionAction_AddMetaBuff : FMissionActionBase
{
    FMissionActionBase _base_FMissionActionBase;
    UPROPERTY()
    TDataObjectPtr<FMetaBuffConfig> MetaBuffConfig;

    FMissionAction_AddMetaBuff()
    {
        this.__InitDefaults();
        return;
    }
    EMissionActionStatus TickAction_Implementation(const FMissionActionContext &inout Context)
    {
        if (!(this.MetaBuffConfig.IsSet()))
        {
            XError(ELog(63), FString().Append("AddMetaBuff action failed, MetaBuffConfig is not set"));
            return EMissionActionStatus(4);
        }
        Has local_12;
        if (!(local_12.opCall()))
        {
            XError(ELog(63), FString().Append("AddMetaBuff action failed, Player Controller is not found"));
            return EMissionActionStatus(4);
        }
        if (!(::FMetaBuffUtils::AddMetaBuff(Context.ContextEntity, this.MetaBuffConfig, TArray<TDataObjectPtr<FGameplayModifierConfig>>(), TArray<TDataObjectPtr<FMetaBuffCapabilityConfig>>())))
        {
            XError(ELog(63), FString().Append("AddMetaBuff action failed, meta buff config=").Append(this.MetaBuffConfig.GetDataName()));
            return EMissionActionStatus(4);
        }
        return EMissionActionStatus(3);
    }
}

