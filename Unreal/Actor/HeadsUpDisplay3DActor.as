

// NOTE: class defaults are not authored in this module: AHeadsUpDisplay3DActor (default scalar field UWidgetComponent.bReceiveHardwareInput has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class AHeadsUpDisplay3DActor : AActor
{
    UPROPERTY()
    USceneComponent SceneRoot;
    UPROPERTY()
    UEUIWidgetComponent WidgetComp;
    float32 DrawScale = 4.0f;


    UFUNCTION()
    void Tick_Implementation(const float32 DeltaSeconds)
    {
        APlayerController local_2 = Gameplay::GetPlayerController(__GetWorldContext(), 0);
        if ((local_2 == nullptr || ((local_2.PlayerCameraManager == nullptr))))
        {
            return;
        }
        FVector local_26 = this.GetActorLocation();
        if (float32(local_26.Distance(FVector(local_2.PlayerCameraManager.GetCameraLocation()))) < 1.0f)
        {
            return;
        }
        FRotator local_44 = FRotator(local_2.PlayerCameraManager.GetCameraRotation());
        this.SetActorRotation(FRotator::MakeFromXZ(local_44.GetForwardVector().opNeg(), local_44.GetUpVector()));
        FVector local_68 = this.GetActorRightVector();
        int local_75 = 1120403456;
        FVector2D local_80;
        FVector2D local_84;
        if (!(local_2.ProjectWorldLocationToScreen(local_26, local_80, false)))
        {
            return;
        }
        if (!(local_2.ProjectWorldLocationToScreen((local_26 + (local_68 * 100.0)), local_84, false)))
        {
            return;
        }
        float32 local_33 = float32(((local_84 - local_80).Size()));
        if (local_33 < 0.001f)
        {
            return;
        }
        float32 local_93 = (1.0f / ((local_33 / 100.0f) * this.DrawScale)) * WidgetLayout::GetViewportScale(__GetWorldContext());
        this.SetActorScale3D(FVector(local_93, local_93, local_93));
        return;
    }
    void SetupDisplay(const FEUIModelContainer &inout InModelContainer)
    {
        this.WidgetComp.SetModelContainer(InModelContainer);
        return;
    }
    void ClearDisplay()
    {
        this.WidgetComp.SetModelContainer(FEUIModelContainer());
        return;
    }
}

