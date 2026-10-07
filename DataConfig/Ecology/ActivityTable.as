

struct FEcologyActivityDefinitionRow : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FDataObjectPtr m_Creature;
    UPROPERTY()
    FDataObjectPtr m_Resource;
    UPROPERTY()
    FName Behavior;
    UPROPERTY()
    TObjectPtr<UEcologyBehaviorDefine> BehaviorDefine;
    UPROPERTY()
    bool bIsDefaultBehavior;
    UPROPERTY()
    bool bCanUseWithoutSlot;
    UPROPERTY()
    FGameplayTag GameplayTagForResourceSlot;
    UPROPERTY()
    FEcologyDOTCondition DOTCondition;
    UPROPERTY()
    FEcologyUserCondition UserCondition;


    const TDataObjectPtr<FEcologyCreatureDefinitionRow> GetCreature() const property
    {
        const TDataObjectPtr<FEcologyCreatureDefinitionRow> __r;
        return __r;
    }
    void SetCreature(const TDataObjectPtr<FEcologyCreatureDefinitionRow> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FEcologyCreatureDefinitionRow>> local_2;
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

