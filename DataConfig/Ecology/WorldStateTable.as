
enum EHour
{
    Hour_00,
    Hour_01,
    Hour_02,
    Hour_03,
    Hour_04,
    Hour_05,
    Hour_06,
    Hour_07,
    Hour_08,
    Hour_09,
    Hour_10,
    Hour_11,
    Hour_12,
    Hour_13,
    Hour_14,
    Hour_15,
    Hour_16,
    Hour_17,
    Hour_18,
    Hour_19,
    Hour_20,
    Hour_21,
    Hour_22,
    Hour_23,
}

enum EMinute
{
    M_00 = 1,
    M_01 = 1,
    M_02,
    M_03,
    M_04,
    M_05,
    M_06,
    M_07,
    M_08,
    M_09,
    M_10,
    M_11,
    M_12,
    M_13,
    M_14,
    M_15,
    M_16,
    M_17,
    M_18,
    M_19,
    M_20,
    M_21,
    M_22,
    M_23,
    M_24,
    M_25,
    M_26,
    M_27,
    M_28,
    M_29,
    M_30,
    M_31,
    M_32,
    M_33,
    M_34,
    M_35,
    M_36,
    M_37,
    M_38,
    M_39,
    M_40,
    M_41,
    M_42,
    M_43,
    M_44,
    M_45,
    M_46,
    M_47,
    M_48,
    M_49,
    M_50,
    M_51,
    M_52,
    M_53,
    M_54,
    M_55,
    M_56,
    M_57,
    M_58,
    M_59,
}


// NOTE: class defaults are not authored in this module: FSpawnerCountRatioDefinitionRow (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FTODTagDefinitionRow : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    EHour StartHour;
    UPROPERTY()
    EMinute StartMinute;
    UPROPERTY()
    EHour EndHour;
    UPROPERTY()
    EMinute EndMinute;
    UPROPERTY()
    FGameplayTagContainer Tags;


}

struct FSpawnerCountRatioDefinitionRow : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FDataObjectPtr m_Creature;
    UPROPERTY()
    FDataObjectPtr m_Resource;
    UPROPERTY()
    FGameplayTagContainer WeatherElementTag;
    UPROPERTY()
    FGameplayTagContainer DaySegmentsTag;
    UPROPERTY()
    int Priority;
    UPROPERTY()
    float32 BatchCountSpawnRatio;
    UPROPERTY()
    float32 CreatureCountSpawnRatio;

    FSpawnerCountRatioDefinitionRow()
    {
        this.Priority = 1;
        this.BatchCountSpawnRatio = 1.0f;
        this.CreatureCountSpawnRatio = 1.0f;
        this.__InitDefaults();
        return;
    }
    FDataObjectValidationResult IsDataValidImpl_Implementation() const
    {
        FDataObjectValidationResult local_16;
        if (!(this.GetCreature().IsSet()))
        {
            local_16.Error = FString("CreatureдёЌиѓЅдёєз©єпјЃ");
            return local_16;
        }
        if (!(this.GetDataName().ToString().StartsWith(this.GetCreature().GetDataName().ToString(), ESearchCase(1))))
        {
            local_16.Warning = FString().Append("иЎЊ[").Append(this.GetDataName().ToString()).Append("]еє”иЇҐд»ҐеЇ№еє”зљ„Creature[").Append(this.GetCreature().GetDataName().ToString()).Append("]дёєе‰ЌзјЂпјЃ");
            return local_16;
        }
        return local_16;
    }
    const TDataObjectPtr<FCreatureDefinitionRow> GetCreature() const property
    {
        const TDataObjectPtr<FCreatureDefinitionRow> __r;
        return __r;
    }
    void SetCreature(const TDataObjectPtr<FCreatureDefinitionRow> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FCreatureDefinitionRow>> local_2;
        this.m_Creature = local_2;
        return;
    }
    TDataObjectPtr<FEcologyResourceDefinitionRow> GetResource() const property
    {
        TDataObjectPtr<FEcologyResourceDefinitionRow> __r;
        return __r;
    }
    void SetResource(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FEcologyResourceDefinitionRow>> local_2;
        this.m_Resource = local_2;
        return;
    }
}

