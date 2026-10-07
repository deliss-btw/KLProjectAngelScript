
namespace FEcosimAIV2Utils
{
bool IsEntityInteractingWithTarget(const FECSEntity &inout Entity, const bool bIsTargetEntityIDVar, const FECSEntity &inout TargetEntity, const bool bByIndex, const TSoftClassPtr<UInteractionBehaviorBase> &inout InteractBehaviorClass, const int InteractPointIndexValue, const int InteractBehaviorIndexValue)
{
    Get local_4;
    const FC_InteractionInfoForESM& local_6 = local_4.opCall();
    if (local_6)
    {
        if (!(bIsTargetEntityIDVar))
        {
            if (!((FECSEntity(local_6.GetTargetEntity()) == TargetEntity)))
            {
                return false;
            }
        }
        if (bByIndex)
        {
            if (InteractPointIndexValue == local_6.GetTargetPointAndBehaviorIndex().GetPointIndex() && (InteractBehaviorIndexValue == local_6.GetTargetPointAndBehaviorIndex().GetBehaviorIndex()))
            {
                return true;
            }
        }
        else
        {
            if (InteractBehaviorClass.IsValid())
            {
                TArray<FInteractionPointAndBehaviorIndex> local_18;
                FInteractUtils::GetAllInteractionPointAndBehaviorIndexByBehaviorClass(local_6.GetTargetEntity(), InteractBehaviorClass.Get(), local_18, false);
                for (auto& local_34 : local_18)
                {
                    if (local_34.GetPointIndex() == local_6.GetTargetPointAndBehaviorIndex().GetPointIndex() && (local_34.GetBehaviorIndex() == local_6.GetTargetPointAndBehaviorIndex().GetBehaviorIndex()))
                    {
                        return true;
                    }
                }
            }
        }
    }
    return false;
}
}
