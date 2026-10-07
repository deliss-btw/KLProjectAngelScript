

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
        FVector local_42 = local_30.GetPosition();
        local_42.Z -= (local_36.GetScaledHeight() * 0.5f);
        local_30.GetRotation().Rotator();
        FCutSceneData local_4;
        TConstRawPtr<FCutSceneEntityInfo> local_66 = local_4.EntityInfos.Find(FName(n"Player0"));
        if (local_66)
        {
            if (::UTagTargetPointManager::Get().GetTagTransform(local_66.opArrow().StartLocationTag).IsSet())
            {
                FVector local_134;
                local_134.GetLocation();
                local_42 = local_134;
                FRotator local_60;
                local_60.Rotator();
            }
        }
        bool local_1 = this.bCrossDS;
        return;
    }
}

