

UCLASS(Abstract)
class UInteractionBehavior_RemnantPickup : UInteractionBehaviorBase
{
    default InteractType = EInteractType(4);

    UInteractionBehavior_RemnantPickup()
    {
        super();
        return;
    }
    void OnInteractSuccess(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return;
        }
        Get local_6;
        const FC_CollectItem& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.GetItems().Num() != 1)
            {
                XError(ELog(42), FString().Append("жЌЎиµ·е’’з‰©ж—¶пјЊеЊ…еђ«зљ„з‰©е“Ѓз§Ќз±»ж•°й‡ЏдёЌж­ЈзЎ®пјЊжњџжњ›ж•°й‡Џдёє1пјЊе®ћй™…ж•°й‡Џпјљ").Append(local_8.GetItems().Num()));
            }
            if (local_8.GetItems().Num() > 0)
            {
                TDataObjectPtr<FItemConfig> local_40 = local_8.GetItems()[0];
                CastTo local_92;
                TDataObjectPtr<FRemnantItemConfig> local_116 = local_92.opCall();
                if (local_116)
                {
                    int local_117;
                    local_117 = 0;
                    Get local_122;
                    const FC_RemnantDropItemInfo& local_124 = local_122.opCall();
                    if (local_124)
                    {
                        local_117 = local_124.GetRemainUsableCount();
                    }
                    else
                    {
                        local_117 = local_116.opArrow().UsableCount;
                    }
                    ::RemnantUtils::PickupRemnant(InteractSource, local_116, local_117);
                    Super::OnInteractSuccess(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
                    FDataObjectPtr local_172;
                    local_172;
                    ::DropItemsUtils::ServerDataTrackTreasureCollect(InteractSource, InteractTarget);
                    InteractTarget.DestroyDeferred();
                    return;
                }
                XError(ELog(42), FString().Append("жЌЎиµ·е’’з‰©ж—¶пјЊItemConfigз±»ећ‹й”™иЇЇ"));
            }
        }
        return;
    }
    FText GetHUDContent(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const int ShowFailConditionIndex, const bool bShowFailFromSource = false) const
    {
        int local_16 = 0;
        FText local_8 = Super::GetHUDContent(SourceEntity, TargetEntity, ShowFailConditionIndex, bShowFailFromSource);
        if (ShowFailConditionIndex < 0)
        {
            if (local_16 && (local_16.GetItems().Num() == 1))
            {
                if (local_16.GetItems()[0].IsSet())
                {
                    FString local_22 = local_8.ToString();
                    FString local_26 = (local_22 + " ");
                    return FText::FromString(local_22);
                }
            }
        }
        return local_8;
    }
}

