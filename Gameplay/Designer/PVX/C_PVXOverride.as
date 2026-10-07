

struct FPVPGameAttributeByLevelConfig
{
    UPROPERTY()
    FDataTablePtr GameAttributeDataTable;
    UPROPERTY()
    FName RowNamePrefix;

    FPVPGameAttributeByLevelConfig()
    {
        return;
    }
    bool IsValid() const
    {
        return !(this.IsNull());
    }
    TDataObjectPtr<FGameAttributeInitConfigBase> FindAttributeConfigByLevel(const int Level) const
    {
        if (this.IsNull())
        {
            return TDataObjectPtr<FGameAttributeInitConfigBase>(nullptr);
        }
        FName local_58 = FName(FString().Append(this.RowNamePrefix).Append("_").Append(Level));
        return TDataObjectPtr<FGameAttributeInitConfigBase>(this.FindDataObjectPtr(local_58));
    }
}

