

struct FItemOperationExpandInfo
{
    UPROPERTY()
    TSoftClassPtr<UUserWidget> ContentWidget;
    UPROPERTY()
    FEUIModelContainer ContentModels;

    FItemOperationExpandInfo()
    {
        return;
    }
}

UCLASS(Abstract)
class UItemOperationConfigBase : UObject
{
    UPROPERTY()
    FEUIInputAction InputAction;
    UPROPERTY()
    FText OperationName;

    UItemOperationConfigBase()
    {
        return;
    }
    bool ShowOperationForItem(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        return false;
    }
    bool IsExpandable() const
    {
        return false;
    }
    FItemOperationExpandInfo ExpandOperation(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        FItemOperationExpandInfo __r;
        return __r;
    }
}

