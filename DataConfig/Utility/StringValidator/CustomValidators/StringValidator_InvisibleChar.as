
enum EInvisibleCharValidationMode
{
    DisallowAny,
    DisallowAllInvisible,
}


class UStringValidator_InvisibleChar : UStringValidatorBase
{
    UPROPERTY()
    EInvisibleCharValidationMode ValidationMode = EInvisibleCharValidationMode(0);
    UPROPERTY()
    FText ErrorMessage;


    EStringValidationResult ValidateString(const FString &inout String, FStringValidationContext &inout Context) const
    {
        int local_9;
        int local_2 = String::Len(String);
        if (local_2 == 0)
        {
            return EStringValidationResult(0);
        }
        int local_5 = 0;
        int local_6 = 0;
        int local_7 = 0;
        while (local_7 < local_2)
        {
            int local_1 = String::GetCharacterAsNumber(String, local_7);
            local_9 = local_1;
            if ((local_1 >= 55296 && (local_1 <= 56319) && ((local_7 + 1) < local_2)))
            {
                int local_12 = String::GetCharacterAsNumber(String, local_7 + 1);
                if ((local_12 >= 56320 && (local_12 <= 57343)))
                {
                    int local_11 = (local_1 - 55296) << 10;
                    local_9 = (local_11 + 65536) + (local_12 - 56320);
                    local_7 = local_7 + 2;
                }
                else
                {
                    ++local_7;
                }
            }
            else
            {
                ++local_7;
            }
            ++local_6;
            if (this.IsInvisibleOrWhitespace(local_9))
            {
                ++local_5;
                if (int(this.ValidationMode) == 0)
                {
                    Context.ErrorMessage = this.ErrorMessage;
                    return EStringValidationResult(1);
                }
            }
        }
        if ((int(this.ValidationMode) == 1 && (local_6 > 0) && (local_5 == local_6)))
        {
            Context.ErrorMessage = this.ErrorMessage;
            return EStringValidationResult(1);
        }
        return EStringValidationResult(0);
    }
    bool IsInvisibleOrWhitespace(const int CP) const
    {
        if (CP < 9 || (CP > 917999))
        {
            return false;
        }
        if (CP >= 9 && (CP <= 13))
        {
            return true;
        }
        if (CP == 32)
        {
            return true;
        }
        if (CP == 160)
        {
            return true;
        }
        if (CP == 173)
        {
            return true;
        }
        if (CP == 847)
        {
            return true;
        }
        if (CP == 1564)
        {
            return true;
        }
        if (CP >= 4447 && (CP <= 4448))
        {
            return true;
        }
        if (CP == 5760)
        {
            return true;
        }
        if (CP >= 6068 && (CP <= 6069))
        {
            return true;
        }
        if (CP >= 6155 && (CP <= 6158))
        {
            return true;
        }
        if (CP >= 8192 && (CP <= 8207))
        {
            return true;
        }
        if (CP >= 8234 && (CP <= 8239))
        {
            return true;
        }
        if (CP >= 8287 && (CP <= 8303))
        {
            return true;
        }
        if (CP == 10240)
        {
            return true;
        }
        if (CP == 12288)
        {
            return true;
        }
        if (CP == 12644)
        {
            return true;
        }
        if (CP >= 65024 && (CP <= 65039))
        {
            return true;
        }
        if (CP == 65279)
        {
            return true;
        }
        if (CP == 65440)
        {
            return true;
        }
        if (CP >= 65529 && (CP <= 65532))
        {
            return true;
        }
        if (CP == 78844)
        {
            return true;
        }
        if (CP == 118784 || (CP == 119024) || (CP == 119040) || (CP == 119081))
        {
            return true;
        }
        if (CP == 119088 || (CP == 119103) || (CP == 119104) || (CP == 119109))
        {
            return true;
        }
        if (CP == 119120 || (CP == 119129))
        {
            return true;
        }
        if (CP >= 119155 && (CP <= 119162))
        {
            return true;
        }
        if (CP == 917505)
        {
            return true;
        }
        if (CP >= 917536 && (CP <= 917631))
        {
            return true;
        }
        if (CP >= 917760 && (CP <= 917999))
        {
            return true;
        }
        return false;
    }
}

