

struct FInputActionListConstructParamItem
{
    UPROPERTY()
    FEUIInputAction InputAction;
    UPROPERTY()
    FSimpleModelEvent OnInputActionExecute;
    UPROPERTY()
    FText ActionNameOverride;
    UPROPERTY()
    FEUIActionBinding ActionBinding;
    UPROPERTY()
    bool bOverrideActionName;
    UPROPERTY()
    bool bOnlyShowMainKey;

    FInputActionListConstructParamItem()
    {
        this.bOverrideActionName = false;
        this.bOnlyShowMainKey = false;
        return;
    }
    FInputActionListConstructParamItem(const FEUIInputAction &inout InInputAction)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FInputActionListConstructParamItem(const FEUIInputAction &inout InInputAction, const FText &inout InActionNameOverride)
    {
        this.bOverrideActionName = false;
        this.bOnlyShowMainKey = false;
        this.ActionNameOverride = InActionNameOverride;
        this.bOverrideActionName = true;
        return;
    }
    FInputActionListConstructParamItem(const FEUIInputAction &inout InInputAction, const FSimpleModelEvent &inout InOnInputActionExecute)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FInputActionListConstructParamItem(const FEUIInputAction &inout InInputAction, const FSimpleModelEvent &inout InOnInputActionExecute, const FText &inout InActionNameOverride)
    {
        this.bOverrideActionName = false;
        this.bOnlyShowMainKey = false;
        this.ActionNameOverride = InActionNameOverride;
        this.bOverrideActionName = true;
        return;
    }
}

struct FInputActionListConstructParam
{
    UPROPERTY()
    TArray<FInputActionListConstructParamItem> InputActionListConstructParamItems;

    FInputActionListConstructParam()
    {
        return;
    }
}

