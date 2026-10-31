enum EStringValidationResult
{
    Success,
    Fail,
    Pending,
}

struct FStringValidationContext
{
    UPROPERTY()
    FText ErrorMessage;
    UPROPERTY()
    FInstancedStruct CustomData;

    FStringValidationContext()
    {
        return;
    }
}

UCLASS(Abstract)
class UStringValidatorBase : UObject
{
    UStringValidatorBase()
    {
        return;
    }
    EStringValidationResult ValidateString(const FString &inout String, FStringValidationContext &inout Context) const
    {
        FName local_2 = this.GetFName();
        FText local_6;
        FText::FromName(local_6);
        Context.ErrorMessage = FText::Format(NSLOCTEXT("Development", "StringValidator_NotImplemented", "无效的文本验证器 {0}"), local_6);
        return EStringValidationResult(1);
    }
    EStringValidationResult TickValidation(FStringValidationContext &inout Context) const
    {
        return EStringValidationResult(1);
    }
    void CancelValidation(FStringValidationContext &inout Context) const
    {
        return;
    }
}

