

class UASAbilityTest : UAbilityASWritableBase
{
    UPROPERTY()
    bool Config_Bool = false;
    UPROPERTY()
    FBuffConfigRef Config_Buff;
    UPROPERTY()
    FCapability_Float Capability_Float;
    UPROPERTY()
    int Runtime_Int = 0;
    UPROPERTY()
    float32 Runtime_Float = 0.0f;


    UFUNCTION()
    void RegisterListenerFunctions_Implementation()
    {
        this.RegisterAttributeChangedListener(UGameAttribute_HP, n"OnHPChanged");
        this.RegisterGameplayTagChangedListener(GameplayTags::ESM_Ban_Skill, n"OnTagChanged");
        this.RegisterEntityBBIntChangedListener(n"iPhase", n"OnBBChanged");
        this.RegisterBuffListener(this.Config_Buff, n"OnBuffAdd");
        this.RegisterAbilityEffectListener(EAbilityEffectEvent(2), n"Hit", n"OnProjectileHit");
        return;
    }
    UFUNCTION()
    void OnAdd_Implementation()
    {
        Print("AbilityTest OnAdd", 5.0f, FLinearColor::LucBlue);
        return;
    }
    UFUNCTION()
    void OnSignal_Implementation(const FName &inout Signal)
    {
        Print(FString().Append("AbilityTest OnSignal, Signal: ").Append(Signal), 5.0f, FLinearColor::LucBlue);
        return;
    }
    UFUNCTION()
    void OnHPChanged(const FEASAbilityAttributeChangeEventParam &inout Param)
    {
        Print(FString().Append("AbilityTest OnHPChanged, NewValue: ").Append(Param.NewValue), 5.0f, FLinearColor::LucBlue);
        return;
    }
    UFUNCTION()
    void OnTagChanged(const bool bHasTag)
    {
        Print(FString().Append("AbilityTest OnTagChanged, NewValue: ").Append(bHasTag), 5.0f, FLinearColor::LucBlue);
        return;
    }
    UFUNCTION()
    void OnBBChanged(const FEASAbilityESMBBChangeEventIntParam &inout Param)
    {
        Print(FString().Append("AbilityTest OnBBChanged, NewValue: ").Append(Param.NewValue), 5.0f, FLinearColor::LucBlue);
        return;
    }
    UFUNCTION()
    void OnBuffAdd(const FEASAbilityBuffEventParam &inout Param)
    {
        Print(FString().Append("AbilityTest OnBuffAdd, NewValue: ").Append(Param.FromEntity.ToString()), 5.0f, FLinearColor::LucBlue);
        return;
    }
    UFUNCTION()
    void OnProjectileHit(const FAbilityEffectEventData_ProjectileHit &inout Param)
    {
        Print(FString().Append("AbilityTest OnProjectileHit, HitEntity: ").Append(Param.HitEntity.ToString()), 5.0f, FLinearColor::LucBlue);
        return;
    }
}

