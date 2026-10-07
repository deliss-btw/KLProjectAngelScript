

struct FStringValidatorCharRange
{
    UPROPERTY()
    int StartChar = 0;
    UPROPERTY()
    int EndChar = 0;


    bool IsCharInRange(const int Char) const
    {
        return Char >= this.StartChar && (Char <= this.EndChar);
    }
}

struct FStringValidatorCharRangeList
{
    UPROPERTY()
    TArray<FStringValidatorCharRange> CharRanges;

    FStringValidatorCharRangeList()
    {
        return;
    }
    TSet<FString> FindCharsIncluded(const FString &inout String) const
    {
        TSet<FString> local_20;
        int local_21 = 0;
        for (; local_21 < String::Len(String); ++local_21)
        {
            int local_23 = String::GetCharacterAsNumber(String, local_21);
            for (auto& local_40 : this)
            {
                if (local_40.IsCharInRange(local_23))
                {
                    local_20.Add(String::GetSubstring(String, local_21, 1));
                    break;
                }
            }
        }
        return local_20;
    }
    TSet<FString> FindCharsNotIncluded(const FString &inout String) const
    {
        bool local_26;
        TSet<FString> local_20;
        int local_21 = 0;
        for (; local_21 < String::Len(String); ++local_21)
        {
            int local_23 = String::GetCharacterAsNumber(String, local_21);
            local_26 = false;
            for (auto& local_40 : this)
            {
                if (local_40.IsCharInRange(local_23))
                {
                    local_26 = true;
                    break;
                }
            }
            if (!(local_26))
            {
                local_20.Add(String::GetSubstring(String, local_21, 1));
            }
        }
        return local_20;
    }
}

class UStringValidator_CharRange : UStringValidatorBase
{
    UPROPERTY()
    FStringValidatorCharRangeList CharRangeList;
    UPROPERTY()
    bool bIsWhiteList = true;
    UPROPERTY()
    FText ErrorMessage;
    UPROPERTY()
    FText InvalidCharListDelimiter = INVTEXT(", ");


    EStringValidationResult ValidateString(const FString &inout String, FStringValidationContext &inout Context) const
    {
        TSet<FString> local_62 = this.bIsWhiteList ? this.CharRangeList.FindCharsNotIncluded(String) : this.CharRangeList.FindCharsIncluded(String);
        if (local_62.IsEmpty())
        {
            return EStringValidationResult(0);
        }
        TArray<FText> local_88;
        for (auto& local_106 : local_62)
        {
            local_88.Add(FText::FromString(local_106));
        }
        TMap<FString, FFormatArgumentValue> local_132;
        FFormatArgumentValue local_140 = FFormatArgumentValue(local_88[0]);
        local_132.Add("InvalidChar", local_140);
        FFormatArgumentValue local_140_2 = FFormatArgumentValue(FText::Join(this.InvalidCharListDelimiter, local_88));
        local_132.Add("InvalidCharList", local_140_2);
        Context.ErrorMessage = FText::Format(this.ErrorMessage, local_132);
        return EStringValidationResult(1);
    }
}

