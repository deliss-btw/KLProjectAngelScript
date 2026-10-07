
enum EAttributeShowType
{
    Hide,
    InSide,
    AlwaysShow,
}


struct FAttributeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    FText AttributeName;
    UPROPERTY()
    EAttributeDisplayType DisplayType;
    UPROPERTY()
    FText AttributeDescription;
    UPROPERTY()
    FText AttributeRichIconName;
    UPROPERTY()
    FSoftBrush AttributeIcon;
    UPROPERTY()
    EAttributeShowType ShowType = EAttributeShowType(0);
    UPROPERTY()
    FAttributePresentation Presentation;


}

namespace FAttributeConfig
{
TArray<TDataObjectPtr<FAttributeConfig>> GetAttributeConfigsByShowType(const int ShowType)
{
    const UAvatarBuildSettings local_6;
    TArray<TDataObjectPtr<FAttributeConfig>> local_4;
    int local_99 = 0;
    GetGameplaySettings<UAvatarBuildSettings> local_8;
    local_6 = local_8;
    if (!(local_6.AttributeConfigDataTable.IsNull()))
    {
        FDataTableIterator local_26 = FDataTableIterator(FDataTablePtr(local_6.AttributeConfigDataTable));
        for (; local_26; )
        {
            TDataObjectPtr<FAttributeConfig> local_98 = TDataObjectPtr<FAttributeConfig>(local_26.GetDataPtr());
            int local_100 = ShowType & (1 << local_99);
            if (local_100 != 0)
            {
                local_4.Add(local_98);
            }
            local_26.opPreInc();
        }
    }
    return local_4;
}
TDataObjectPtr<FAttributeConfig> GetAttributeConfigByAttribute(const FGameAttributeRef &inout Attribute)
{
    const UAvatarBuildSettings local_2;
    GetGameplaySettings<UAvatarBuildSettings> local_4;
    local_2 = local_4;
    if (!(local_2.AttributeConfigDataTable.IsNull()))
    {
        FDataTableIterator local_22 = FDataTableIterator(FDataTablePtr(local_2.AttributeConfigDataTable));
        for (; local_22; )
        {
            TDataObjectPtr<FAttributeConfig> local_94 = TDataObjectPtr<FAttributeConfig>(local_22.GetDataPtr());
            if (0 == Attribute.GetGlobalIndex())
            {
                return local_94;
            }
            local_22.opPreInc();
        }
    }
    return TDataObjectPtr<FAttributeConfig>(nullptr);
}
}
