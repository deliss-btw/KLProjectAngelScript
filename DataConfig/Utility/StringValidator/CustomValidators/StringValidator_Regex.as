

class UStringValidator_Regex : UStringValidatorBase
{
    UPROPERTY()
    FString Regex;
    UPROPERTY()
    bool bMatchForSuccess;
    UPROPERTY()
    bool bCaseSensitive;
    UPROPERTY()
    FText ErrorMessage;

    UStringValidator_Regex()
    {
        super();
        return;
    }
    EStringValidationResult ValidateString(const FString &inout String, FStringValidationContext &inout Context) const
    {
        int local_6;
        if (this.bCaseSensitive)
        {
            int local_7;
            local_7 = 0;
            local_6 = local_7;
        }
        else
        {
            int local_7;
            local_7 = 1;
            local_6 = local_7;
        }
        FRegexPattern local_4 = FRegexPattern(this.Regex, ERegexPatternFlags(local_6));
        if (!(((!(FRegexMatcher(local_4, String).FindNext())) == !(this.bMatchForSuccess))))
        {
            Context.ErrorMessage = this.ErrorMessage;
            return EStringValidationResult(1);
        }
        return EStringValidationResult(0);
    }
}

