

struct FAvatarMappingConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    TArray<FDataObjectPtr> m_Avatar;


    TArray<TDataObjectPtr<FAvatarPrefabConfig>> GetAvatar() const property
    {
        TArray<TDataObjectPtr<FAvatarPrefabConfig>> __r;
        return __r;
    }
    void SetAvatar(const TArray<TDataObjectPtr<FAvatarPrefabConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FAvatarPrefabConfig>>> local_2;
        this.m_Avatar = local_2;
        return;
    }
}

