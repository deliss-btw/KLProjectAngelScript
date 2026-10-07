

class UWidget_DamageNumber : UASUserWidget
{
    UPROPERTY()
    UTextBlock AS_Text_DamageNumber;
    UPROPERTY()
    UImage Image_WeakDamageType;
    UPROPERTY()
    int Damage;
    UPROPERTY()
    FVector HitPosition;
    UPROPERTY()
    EDamageType DamageType;
    UPROPERTY()
    bool IsLocalDamage;
    UPROPERTY()
    bool HitWeakness;
    UPROPERTY()
    bool IsAttenuated;
    UPROPERTY()
    bool IsCritical = false;
    UPROPERTY()
    bool IsWeakDamageType = false;
    UPROPERTY()
    FVector2D NoLocalScale = FVector2D(0.5, 0.5);
    UPROPERTY()
    FSlateColor Color_NoLocal;
    UPROPERTY()
    FSlateColor Color_Attenuated;
    UPROPERTY()
    FSlateColor Color_Physical_Weakness;
    UPROPERTY()
    FSlateColor Color_Physical;
    UPROPERTY()
    FSlateColor Color_Power;
    UPROPERTY()
    FSlateColor Color_Fire;
    UPROPERTY()
    FSlateColor Color_Thunder;
    UPROPERTY()
    FSlateColor Color_Ice;
    UPROPERTY()
    float32 RandomScreenRadius = 20.0f;
    UPROPERTY()
    float32 DamageNumberRandomRatio = 1.0f;
    UPROPERTY()
    float32 CurrentTime = 0.0f;
    UPROPERTY()
    FVector2D RandomOffset;


    UFUNCTION()
    void Construct_Implementation()
    {
        FVector2D local_4;
        this.GetOwningPlayer().ProjectWorldLocationToScreen(this.HitPosition, local_4, false);
        this.RandomOffset = FMath::RandPointInCircle((this.RandomScreenRadius * this.DamageNumberRandomRatio));
        this.SetPositionInViewport((local_4 + this.RandomOffset), true);
        if (this.IsWeakDamageType)
        {
            this.Image_WeakDamageType.SetVisibility(ESlateVisibility(0));
        }
        this.CurrentTime = 0.0f;
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        this.CurrentTime += InDeltaTime;
        if (!(this.IsLocalDamage))
        {
            this.AS_Text_DamageNumber.SetRenderScale(this.NoLocalScale);
        }
        APlayerController local_6 = this.GetOwningPlayer();
        if (local_6 != nullptr)
        {
            FVector2D local_10;
            local_6.ProjectWorldLocationToScreen(this.HitPosition, local_10, false);
            this.SetPositionInViewport((local_10 + this.RandomOffset), true);
        }
        return;
    }
    UFUNCTION()
    FSlateColor GetDamageNumberColor()
    {
        FSlateColor local_5;
        if (!(this.IsLocalDamage))
        {
            local_5 = this.Color_NoLocal;
        }
        if (this.IsAttenuated)
        {
            local_5 = this.Color_Attenuated;
        }
        switch (int(this.DamageType))
        {
        case 0:
        {
            local_5 = this.HitWeakness ? this.Color_Physical_Weakness : this.Color_Physical;
            break;
        }
        case 1:
        {
            local_5 = this.Color_Power;
            break;
        }
        case 2:
        {
            local_5 = this.Color_Fire;
            break;
        }
        case 4:
        {
            local_5 = this.Color_Ice;
            break;
        }
        case 3:
        {
            local_5 = this.Color_Thunder;
            break;
        }
        default:
        {
            local_5 = this.Color_Physical;
        }
        }
        return local_5;
    }
}

