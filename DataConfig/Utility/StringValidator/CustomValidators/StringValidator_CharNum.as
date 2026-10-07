

class UStringValidator_CharNum : UStringValidatorBase
{
    UPROPERTY()
    int MinNum = 0;
    UPROPERTY()
    int MaxNum = 14;
    UPROPERTY()
    int NonAsciiCharCountNum = 2;
    UPROPERTY()
    FText LargerThanMaxNumErrorMessage;
    UPROPERTY()
    FText LessThanMinNumErrorMessage;


    EStringValidationResult ValidateString(const FString &inout String, FStringValidationContext &inout Context) const
    {
        int local_1 = String::Len(String);
        if (local_1 > this.MaxNum)
        {
            Context.ErrorMessage = this.MakeErrorMessage(this.LargerThanMaxNumErrorMessage);
            return EStringValidationResult(1);
        }
        int local_10 = 0;
        int local_11 = 0;
        for (; local_11 < local_1; ++local_11)
        {
            if (String::GetCharacterAsNumber(String, local_11) > 255)
            {
                local_10 = local_10 + this.NonAsciiCharCountNum;
                continue;
            }
            ++local_10;
        }
        if (local_10 < this.MinNum)
        {
            Context.ErrorMessage = this.MakeErrorMessage(this.LessThanMinNumErrorMessage);
            return EStringValidationResult(1);
        }
        if (local_10 > this.MaxNum)
        {
            Context.ErrorMessage = this.MakeErrorMessage(this.LargerThanMaxNumErrorMessage);
            return EStringValidationResult(1);
        }
        return EStringValidationResult(0);
    }
    FText MakeErrorMessage(const FText &inout ErrorMessage) const
    {
        TMap<FString, FFormatArgumentValue> local_20;
        local_20.Add("MinNum", FFormatArgumentValue(this.MinNum));
        local_20.Add("MaxNum", FFormatArgumentValue(this.MaxNum));
        return FText::Format(ErrorMessage, local_20);
    }
}

