

class ATagTargetPoint : ATargetPoint
{
    UPROPERTY()
    FName Tag;

    ATagTargetPoint()
    {
        return;
    }
    UFUNCTION()
    void BeginPlay_Implementation()
    {
        UTagTargetPointManager local_4 = ::UTagTargetPointManager::Get();
        if (local_4 == nullptr)
        {
            return;
        }
        if (!(local_4.TagTargetPoints.Contains(this.Tag)))
        {
            local_4.TagTargetPoints.Add(this.Tag, this);
            return;
        }
        XError(ELog(22), FString().Append(this.Tag).Append(" already exist in ").Append(local_4.TagTargetPoints[this.Tag]));
        return;
    }
    UFUNCTION()
    void EndPlay_Implementation(const EEndPlayReason EndPlayReason)
    {
        if (::UTagTargetPointManager::Get() == nullptr)
        {
            return;
        }
        return;
    }
}

class UTagTargetPointManager : UScriptWorldSubsystem
{
    TMap<FName, ATagTargetPoint> TagTargetPoints;

    UTagTargetPointManager()
    {
        return;
    }
    TOptional<FTransform> GetTagTransform(const FName &inout Tag)
    {
        FName local_2;
        if (this.TagTargetPoints.Find(Tag, local_2))
        {
            return TOptional<FTransform>(local_2.GetActorTransform());
        }
        XError(ELog(22), FString().Append(Tag).Append(" not found in TagTargetPointManager"));
        return TOptional<FTransform>();
    }
}

