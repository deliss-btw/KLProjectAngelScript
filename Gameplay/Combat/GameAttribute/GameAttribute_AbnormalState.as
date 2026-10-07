

// NOTE: class defaults are not authored in this module: UGameAttribute_Burning_AccumulationMax (default scalar field UGameAttribute.bExposeToView has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UGameAttribute_Burning_AccumulationMax : UGameAttribute
{
    UGameAttribute_Burning_AccumulationMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        float32 local_9 = (0.GetAttributeValue(Attribute::Burning_Accumulation, Time) / OldValue) * NewValue;
        FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::Burning_Accumulation, Time, local_9, -1.0f);
        return;
    }
}

class UGameAttribute_Burning_AccumulationCoefficient : UGameAttribute
{
    UGameAttribute_Burning_AccumulationCoefficient()
    {
        return;
    }
}

class UGameAttribute_Burning_RecoverDelay : UGameAttribute
{
    UGameAttribute_Burning_RecoverDelay()
    {
        return;
    }
}

class UGameAttribute_Burning_RecoverSpeed : UGameAttribute
{
    UGameAttribute_Burning_RecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_Burning_Accumulation : UGameAttributeConsumable
{
    UGameAttribute_Burning_Accumulation()
    {
        return;
    }
}

class UGameAttribute_Poisoning_AccumulationMax : UGameAttribute
{
    UGameAttribute_Poisoning_AccumulationMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        float32 local_9 = (0.GetAttributeValue(Attribute::Poisoning_Accumulation, Time) / OldValue) * NewValue;
        FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::Poisoning_Accumulation, Time, local_9, -1.0f);
        return;
    }
}

class UGameAttribute_Poisoning_AccumulationCoefficient : UGameAttribute
{
    UGameAttribute_Poisoning_AccumulationCoefficient()
    {
        return;
    }
}

class UGameAttribute_Poisoning_RecoverDelay : UGameAttribute
{
    UGameAttribute_Poisoning_RecoverDelay()
    {
        return;
    }
}

class UGameAttribute_Poisoning_RecoverSpeed : UGameAttribute
{
    UGameAttribute_Poisoning_RecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_Poisoning_Accumulation : UGameAttributeConsumable
{
    UGameAttribute_Poisoning_Accumulation()
    {
        return;
    }
}

class UGameAttribute_Dizzy_AccumulationMax : UGameAttribute
{
    UGameAttribute_Dizzy_AccumulationMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        float32 local_9 = (0.GetAttributeValue(Attribute::Dizzy_Accumulation, Time) / OldValue) * NewValue;
        FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::Dizzy_Accumulation, Time, local_9, -1.0f);
        return;
    }
}

class UGameAttribute_Dizzy_AccumulationCoefficient : UGameAttribute
{
    UGameAttribute_Dizzy_AccumulationCoefficient()
    {
        return;
    }
}

class UGameAttribute_Dizzy_RecoverDelay : UGameAttribute
{
    UGameAttribute_Dizzy_RecoverDelay()
    {
        return;
    }
}

class UGameAttribute_Dizzy_RecoverSpeed : UGameAttribute
{
    UGameAttribute_Dizzy_RecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_Dizzy_Accumulation : UGameAttributeConsumable
{
    UGameAttribute_Dizzy_Accumulation()
    {
        return;
    }
}

class UGameAttribute_Doomed_AccumulationMax : UGameAttribute
{
    UGameAttribute_Doomed_AccumulationMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        float32 local_9 = (0.GetAttributeValue(Attribute::Doomed_Accumulation, Time) / OldValue) * NewValue;
        FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::Doomed_Accumulation, Time, local_9, -1.0f);
        return;
    }
}

class UGameAttribute_Doomed_AccumulationCoefficient : UGameAttribute
{
    UGameAttribute_Doomed_AccumulationCoefficient()
    {
        return;
    }
}

class UGameAttribute_Doomed_RecoverDelay : UGameAttribute
{
    UGameAttribute_Doomed_RecoverDelay()
    {
        return;
    }
}

class UGameAttribute_Doomed_RecoverSpeed : UGameAttribute
{
    UGameAttribute_Doomed_RecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_Doomed_Accumulation : UGameAttributeConsumable
{
    UGameAttribute_Doomed_Accumulation()
    {
        return;
    }
}

class UGameAttribute_HotSpring_AccumulationMax : UGameAttribute
{
    UGameAttribute_HotSpring_AccumulationMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        float32 local_9 = (0.GetAttributeValue(Attribute::HotSpring_Accumulation, Time) / OldValue) * NewValue;
        FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::HotSpring_Accumulation, Time, local_9, -1.0f);
        return;
    }
}

class UGameAttribute_HotSpring_AccumulationCoefficient : UGameAttribute
{
    UGameAttribute_HotSpring_AccumulationCoefficient()
    {
        return;
    }
}

class UGameAttribute_HotSpring_RecoverDelay : UGameAttribute
{
    UGameAttribute_HotSpring_RecoverDelay()
    {
        return;
    }
}

class UGameAttribute_HotSpring_RecoverSpeed : UGameAttribute
{
    UGameAttribute_HotSpring_RecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_HotSpring_Accumulation : UGameAttributeConsumable
{
    UGameAttribute_HotSpring_Accumulation()
    {
        return;
    }
}

class UGameAttribute_LeylineMiasma_AccumulationMax : UGameAttribute
{
    UGameAttribute_LeylineMiasma_AccumulationMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        float32 local_9 = (0.GetAttributeValue(Attribute::LeylineMiasma_Accumulation, Time) / OldValue) * NewValue;
        FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::LeylineMiasma_Accumulation, Time, local_9, -1.0f);
        return;
    }
}

class UGameAttribute_LeylineMiasma_AccumulationCoefficient : UGameAttribute
{
    UGameAttribute_LeylineMiasma_AccumulationCoefficient()
    {
        return;
    }
}

class UGameAttribute_LeylineMiasma_RecoverDelay : UGameAttribute
{
    UGameAttribute_LeylineMiasma_RecoverDelay()
    {
        return;
    }
}

class UGameAttribute_LeylineMiasma_RecoverSpeed : UGameAttribute
{
    UGameAttribute_LeylineMiasma_RecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_LeylineMiasma_Accumulation : UGameAttributeConsumable
{
    UGameAttribute_LeylineMiasma_Accumulation()
    {
        return;
    }
}

class UGameAttribute_Freeze_AccumulationMax : UGameAttribute
{
    UGameAttribute_Freeze_AccumulationMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        float32 local_9 = (0.GetAttributeValue(Attribute::Freeze_Accumulation, Time) / OldValue) * NewValue;
        FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::Freeze_Accumulation, Time, local_9, -1.0f);
        return;
    }
}

class UGameAttribute_Freeze_AccumulationCoefficient : UGameAttribute
{
    UGameAttribute_Freeze_AccumulationCoefficient()
    {
        return;
    }
}

class UGameAttribute_Freeze_RecoverDelay : UGameAttribute
{
    UGameAttribute_Freeze_RecoverDelay()
    {
        return;
    }
}

class UGameAttribute_Freeze_RecoverSpeed : UGameAttribute
{
    UGameAttribute_Freeze_RecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_Freeze_Accumulation : UGameAttributeConsumable
{
    UGameAttribute_Freeze_Accumulation()
    {
        return;
    }
}

class UGameAttribute_Electrified_AccumulationMax : UGameAttribute
{
    UGameAttribute_Electrified_AccumulationMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        float32 local_9 = (0.GetAttributeValue(Attribute::Electrified_Accumulation, Time) / OldValue) * NewValue;
        FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::Electrified_Accumulation, Time, local_9, -1.0f);
        return;
    }
}

class UGameAttribute_Electrified_AccumulationCoefficient : UGameAttribute
{
    UGameAttribute_Electrified_AccumulationCoefficient()
    {
        return;
    }
}

class UGameAttribute_Electrified_RecoverDelay : UGameAttribute
{
    UGameAttribute_Electrified_RecoverDelay()
    {
        return;
    }
}

class UGameAttribute_Electrified_RecoverSpeed : UGameAttribute
{
    UGameAttribute_Electrified_RecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_Electrified_Accumulation : UGameAttributeConsumable
{
    UGameAttribute_Electrified_Accumulation()
    {
        return;
    }
}

class UGameAttribute_Light_AccumulationMax : UGameAttribute
{
    UGameAttribute_Light_AccumulationMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        float32 local_9 = (0.GetAttributeValue(Attribute::Light_Accumulation, Time) / OldValue) * NewValue;
        FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::Light_Accumulation, Time, local_9, -1.0f);
        return;
    }
}

class UGameAttribute_Light_AccumulationCoefficient : UGameAttribute
{
    UGameAttribute_Light_AccumulationCoefficient()
    {
        return;
    }
}

class UGameAttribute_Light_RecoverDelay : UGameAttribute
{
    UGameAttribute_Light_RecoverDelay()
    {
        return;
    }
}

class UGameAttribute_Light_RecoverSpeed : UGameAttribute
{
    UGameAttribute_Light_RecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_Light_Accumulation : UGameAttributeConsumable
{
    UGameAttribute_Light_Accumulation()
    {
        return;
    }
}

class UGameAttribute_Dark_AccumulationMax : UGameAttribute
{
    UGameAttribute_Dark_AccumulationMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        float32 local_9 = (0.GetAttributeValue(Attribute::Dark_Accumulation, Time) / OldValue) * NewValue;
        FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::Dark_Accumulation, Time, local_9, -1.0f);
        return;
    }
}

class UGameAttribute_Dark_AccumulationCoefficient : UGameAttribute
{
    UGameAttribute_Dark_AccumulationCoefficient()
    {
        return;
    }
}

class UGameAttribute_Dark_RecoverDelay : UGameAttribute
{
    UGameAttribute_Dark_RecoverDelay()
    {
        return;
    }
}

class UGameAttribute_Dark_RecoverSpeed : UGameAttribute
{
    UGameAttribute_Dark_RecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_Dark_Accumulation : UGameAttributeConsumable
{
    UGameAttribute_Dark_Accumulation()
    {
        return;
    }
}

