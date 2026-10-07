

struct FTalentTreeNode
{
    UPROPERTY()
    int Row;
    UPROPERTY()
    int Column;
    UPROPERTY()
    TDataObjectPtr<FTalentConfig> NodeConfig;


}

struct FTalentLayoutTreeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    int Priority;
    UPROPERTY()
    FDataObjectPtr m_Avatar;
    UPROPERTY()
    FDataObjectPtr m_TalentBaseData;
    UPROPERTY()
    FText TitleName;
    UPROPERTY()
    FSoftBrush TitleImage;
    UPROPERTY()
    TArray<FTalentTreeNode> TalentTreeArray;


    TDataObjectPtr<FAvatarMappingConfig> GetAvatar() const property
    {
        TDataObjectPtr<FAvatarMappingConfig> __r;
        return __r;
    }
    void SetAvatar(const TDataObjectPtr<FAvatarMappingConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAvatarMappingConfig>> local_2;
        this.m_Avatar = local_2;
        return;
    }
    const TDataObjectPtr<FTalentConfig> GetTalentBaseData() const property
    {
        const TDataObjectPtr<FTalentConfig> __r;
        return __r;
    }
    void SetTalentBaseData(const TDataObjectPtr<FTalentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FTalentConfig>> local_2;
        this.m_TalentBaseData = local_2;
        return;
    }
}

