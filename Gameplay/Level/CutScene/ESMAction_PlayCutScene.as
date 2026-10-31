class UESMAction_PlayCutScene : UESMBPBaseInstantAction
{
    UPROPERTY()
    TDataObjectPtr<FCutSceneData> CutSceneData;
    UPROPERTY()
    bool bCrossDS = false;

    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_30 = 0;
        int local_36 = 0;
        if (!(this.CutSceneData))
        {
            return;
        }
        const FCutSceneData& local_4 = this.CutSceneData.Get();
        TMap<FName, FECSEntity> local_24;
        FVector local_42 = local_30.GetPosition();
        local_42.Z -= (local_36.GetScaledHeight() * 0.5f);
        FRotator local_54 = local_30.GetRotation().Rotator();
        FName local_62(n"Player0");
        TConstRawPtr<FCutSceneEntityInfo> local_66 = local_4.EntityInfos.Find(local_62);
        if (local_66)
        {
            TOptional<FTransform> local_100 = ::UTagTargetPointManager::Get().GetTagTransform(local_66.opArrow().StartLocationTag);
            if (local_100.IsSet())
            {
                local_42 = local_100.GetValue().GetLocation();
                local_54 = local_100.GetValue().Rotator();
            }
        }
        ::CutSceneUtils::PlayCutScene(Context.GetEntity(), local_62, this.CutSceneData, local_24, local_42, local_54, this.bCrossDS);
        return;
    }
}

