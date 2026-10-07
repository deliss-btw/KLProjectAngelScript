

struct FMinimapBorderInfo
{
    UPROPERTY()
    EBorderType BorderType = EBorderType(0);
    UPROPERTY()
    UTexture2D BorderMask = nullptr;
    UPROPERTY()
    FBox2D BorderWorldPosition;


    bool IsValid() const
    {
        int local_3 = this.BorderMask == nullptr ? 0 : int(this.BorderWorldPosition.bIsValid);
        return (local_3 != 0);
    }
}

struct __Lambda_Gameplay_Level_Border_BorderUtils_53
{
    __Lambda_Gameplay_Level_Border_BorderUtils_53()
    {
        return;
    }
    bool opCall(const FMinimapBorderInfo &inout A, const FMinimapBorderInfo &inout B)
    {
        int local_3 = int(A.BorderType);
        int local_4 = int(B.BorderType);
        return (local_3 > local_4);
    }
}

namespace FBorderUtils
{
UFUNCTION()
TArray<FMinimapBorderInfo> GetAllActiveBorderMinimapInfos()
{
    AKLBorderActor local_40;
    TArray<FMinimapBorderInfo> local_4;
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    Get local_10;
    const FCS_ActiveBorders& local_12 = local_10.opCall();
    if (local_12)
    {
        for (auto& local_28 : local_12.GetBorderEntities())
        {
            if (!(local_28.IsValid()))
            {
                continue;
            }
            Get local_32;
            const FC_BorderActor& local_34 = local_32.opCall();
            if (local_34)
            {
                if (!(local_34.Border.IsValid()))
                {
                    continue;
                }
                AKLBorder local_36;
                local_40 = Cast<AKLBorderActor>(local_36);
                if (local_40 != nullptr)
                {
                    if (local_40.bDisplayOnMiniMap)
                    {
                        local_4.Add(local_40.GetBorderMinimapInfo());
                    }
                }
            }
        }
    }
    return local_4;
}
void FilterEntitiesOutsideBorder(TArray<FECSEntity> &inout Entities)
{
    bool local_14;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_ActiveBorders& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.GetBorderEntities().Num() <= 0)
        {
            return;
        }
        int local_13 = Entities.Num() - 1;
        for (; local_13 >= 0; --local_13)
        {
            local_14 = false;
            FECSEntity& local_16 = Entities[local_13];
            for (auto& local_30 : local_8.GetBorderEntities())
            {
                if (!(local_30.IsValid()))
                {
                    continue;
                }
                if (FBorderUtils::CheckEntityInsideBorder(local_16, local_30))
                {
                    local_14 = true;
                    break;
                }
            }
            if (!(local_14))
            {
                Entities.RemoveAt(local_13);
            }
        }
    }
    return;
}
bool CheckEntityInsideBorder(const FECSEntity &inout Entity, const FECSEntity &inout Border)
{
    AKLBorderActor local_14;
    if (!(Entity.IsValid()) || !(Border.IsValid()))
    {
        return false;
    }
    Get local_6;
    const FC_BorderActor& local_8 = local_6.opCall();
    if (local_8)
    {
        if (!(local_8.Border.IsValid()))
        {
            return false;
        }
        AKLBorder local_10;
        local_14 = (Cast<AKLBorderActor>(local_10));
        if (local_14 != nullptr)
        {
            Get local_18;
            const FC_Transform& local_20 = local_18.opCall();
            if (local_20)
            {
                FKLBorderQueryInfo local_46;
                local_46.InAgentLocation = local_20.GetPosition();
                float32 local_47 = local_14.GetRelevantDistance();
                local_14.Query(local_46);
                return local_46.OutIsInside;
            }
        }
    }
    return false;
}
}
