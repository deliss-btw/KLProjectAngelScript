

struct FT_EventToESMTriggerFilterConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EventToESMTriggerFilterConfig_Defination;
    UPROPERTY()
    FC_EventToESMTriggerFilterConfig Config_FC_EventToESMTriggerFilterConfig;

    default CustomName = FName("AbilityиЅ¬ESMTriggerиї‡ж»¤й…ЌзЅ® (FT_AbilityEventToESMTriggerFilterConfig)");

    FT_EventToESMTriggerFilterConfig()
    {
        this.FC_EventToESMTriggerFilterConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EventToESMTriggerFilterConfig, NAME_None);
        this.__InitDefaults();
        return;
    }
    FString ValidateConfig(const AECSPrefab Prefab) const
    {
        if (this.Config_FC_EventToESMTriggerFilterConfig.BeginOverlapFilter.Num() > 8)
        {
            int local_1 = this.Config_FC_EventToESMTriggerFilterConfig.BeginOverlapFilter.Num();
            FString local_12 = Prefab.GetPathName(nullptr);
            FString local_8 = FString();
            return FString(local_8.Append("Prefab [").Append(local_12).Append("] ValidateConfig Fail: BeginOverlapFilterзљ„ж•°й‡Џ(").Append(local_1).Append(")дёЌж”ЇжЊЃе¤§дєЋ8"));
        }
        if (this.Config_FC_EventToESMTriggerFilterConfig.OnTakeDamageFilter.Num() > 8)
        {
            int local_1_2 = this.Config_FC_EventToESMTriggerFilterConfig.OnTakeDamageFilter.Num();
            FString local_8_2 = Prefab.GetPathName(nullptr);
            FString local_16 = FString();
            return FString(local_16.Append("Prefab [").Append(local_8_2).Append("] ValidateConfig Fail: OnTakeDamageFilterзљ„ж•°й‡Џ(").Append(local_1_2).Append(")дёЌж”ЇжЊЃе¤§дєЋ8!"));
        }
        if (this.Config_FC_EventToESMTriggerFilterConfig.OnBeingHitFilter.Num() > 8)
        {
            int local_1_3 = this.Config_FC_EventToESMTriggerFilterConfig.OnBeingHitFilter.Num();
            FString local_16_2 = Prefab.GetPathName(nullptr);
            FString local_12_2 = FString();
            return FString(local_12_2.Append("Prefab [").Append(local_16_2).Append("] ValidateConfig Fail: OnBeingHitFilterзљ„ж•°й‡Џ(").Append(local_1_3).Append(")дёЌж”ЇжЊЃе¤§дєЋ8!"));
        }
        if (this.Config_FC_EventToESMTriggerFilterConfig.CustomInteractFilter.Num() > 8)
        {
            int local_1_4 = this.Config_FC_EventToESMTriggerFilterConfig.CustomInteractFilter.Num();
            FString local_12_3 = Prefab.GetPathName(nullptr);
            FString local_8_3 = FString();
            return FString(local_8_3.Append("Prefab [").Append(local_12_3).Append("] ValidateConfig Fail: CustomInteractFilterзљ„ж•°й‡Џ(").Append(local_1_4).Append(")дёЌж”ЇжЊЃе¤§дєЋ8!"));
        }
        if (this.Config_FC_EventToESMTriggerFilterConfig.GlobalLevelEventFilter.Num() > 8)
        {
            int local_1_5 = this.Config_FC_EventToESMTriggerFilterConfig.GlobalLevelEventFilter.Num();
            FString local_8_4 = Prefab.GetPathName(nullptr);
            FString local_16_3 = FString();
            return FString(local_16_3.Append("Prefab [").Append(local_8_4).Append("] ValidateConfig Fail: GlobalLevelEventFilterзљ„ж•°й‡Џ(").Append(local_1_5).Append(")дёЌж”ЇжЊЃе¤§дєЋ8!"));
        }
        if (this.Config_FC_EventToESMTriggerFilterConfig.PropEcologyEventFilter.Num() > 8)
        {
            int local_1_6 = this.Config_FC_EventToESMTriggerFilterConfig.PropEcologyEventFilter.Num();
            FString local_16_4 = Prefab.GetPathName(nullptr);
            FString local_12_4 = FString();
            return FString(local_12_4.Append("Prefab [").Append(local_16_4).Append("] ValidateConfig Fail: PropEcologyEventFilterзљ„ж•°й‡Џ(").Append(local_1_6).Append(")дёЌж”ЇжЊЃе¤§дєЋ8!"));
        }
        if (this.Config_FC_EventToESMTriggerFilterConfig.GameAttributeChangedEventToESMTriggerFilter.Num() > 8)
        {
            int local_1_7 = this.Config_FC_EventToESMTriggerFilterConfig.GameAttributeChangedEventToESMTriggerFilter.Num();
            FString local_12_5 = Prefab.GetPathName(nullptr);
            FString local_8_5 = FString();
            return FString(local_8_5.Append("Prefab [").Append(local_12_5).Append("] ValidateConfig Fail: GameAttributeChangedEventToESMTriggerFilterзљ„ж•°й‡Џ(").Append(local_1_7).Append(")дёЌж”ЇжЊЃе¤§дєЋ8!"));
        }
        return "";
    }
}

