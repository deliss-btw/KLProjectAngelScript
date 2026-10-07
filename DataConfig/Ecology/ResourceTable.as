

struct FEcologyResourceDefinitionRow : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FName ResourceName;
    UPROPERTY()
    FDataObjectPtr m_BaseResource;
    UPROPERTY()
    bool LimitSlot = false;
    UPROPERTY()
    FGameplayTagContainer GameplayTags;
    UPROPERTY()
    TSubclassOf<AActor> Preview;


    FString GetDesc() const
    {
        return this.ResourceName.ToString();
    }
    const TDataObjectPtr<FEcologyResourceDefinitionRow> GetBaseResource() const property
    {
        const TDataObjectPtr<FEcologyResourceDefinitionRow> __r;
        return __r;
    }
    void SetBaseResource(const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FEcologyResourceDefinitionRow>> local_2;
        this.m_BaseResource = local_2;
        return;
    }
}

