

class UItemActionTrigger_MotionUnlock : UItemActionTriggerBase
{
    UPROPERTY()
    TDataObjectPtr<FMotionData> MotionData;

    UItemActionTrigger_MotionUnlock()
    {
        super();
        return;
    }
    void Execute(const FItemActionSource &inout ActionSource) const
    {
        ::MotionUtil::UnlockMotion(ActionSource.GetItemOwner(), this.MotionData);
        return;
    }
}

class UItemActionTrigger_EquipItem : UItemActionTriggerBase
{
    UItemActionTrigger_EquipItem()
    {
        super();
        return;
    }
    void Execute(const FItemActionSource &inout ActionSource) const
    {
        int local_30 = 0;
        if (!(ECS::GetRuntimeInfo().IsClient))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Get local_8;
        if (!(local_8.opCall().bClientSingularTick))
        {
            return;
        }
        if (!(::ItemConfigUtils::IsEquipment(ActionSource.GetItemConfig())))
        {
            XError(ELog(47), FString().Append("Failed to equip item, item config is null or item category is not equipment. ItemUid: ").Append(ActionSource.GetItemUid()).Append(", ItemConfig: ").Append(ActionSource.GetItemConfig().GetDataName().ToString()));
            return;
        }
        APlayerController local_26 = ::FASCommonUtils::GetLocalPlayerController();
        if ((!((local_26 != nullptr))))
        {
            XWarning(ELog(47), "Failed to open page, can not find LocalPlayerController.");
        }
        TEUIModelRef<FM_Equipment> local_28 = ::FMS_EquipmentDataCache::Get(local_26).GetEquipment(ActionSource.GetItemUid());
        ::ECSWorldLifetimePage::Open(GameplayTags::UI_Type_Avatar_FastEquip, FEUIModelContainer(local_30));
        return;
    }
}

