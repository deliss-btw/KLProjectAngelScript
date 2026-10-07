

class UStringValidator_Emoji : UStringValidatorBase
{
    UPROPERTY()
    FText ErrorMessage;

    UStringValidator_Emoji()
    {
        super();
        return;
    }
    EStringValidationResult ValidateString(const FString &inout String, FStringValidationContext &inout Context) const
    {
        if (!(KLText::ContainsEmoji(String)))
        {
            return EStringValidationResult(0);
        }
        Context.ErrorMessage = this.ErrorMessage;
        return EStringValidationResult(1);
    }
}

