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
    bool bOnlyShowMainKey = false;

    FInputActionListConstructParamItem(const FEUIInputAction &inout InInputAction)
    {
        this.InputAction = InInputAction;
        return;
    }
    FInputActionListConstructParamItem(const FEUIInputAction &inout InInputAction, const FText &inout InActionNameOverride)
    {
        this.InputAction = InInputAction;
        this.ActionNameOverride = InActionNameOverride;
        this.bOverrideActionName = true;
        return;
    }
    FInputActionListConstructParamItem(const FEUIInputAction &inout InInputAction, const FSimpleModelEvent &inout InOnInputActionExecute)
    {
        this.InputAction = InInputAction;
        return;
    }
    FInputActionListConstructParamItem(const FEUIInputAction &inout InInputAction, const FSimpleModelEvent &inout InOnInputActionExecute, const FText &inout InActionNameOverride)
    {
        this.InputAction = InInputAction;
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

