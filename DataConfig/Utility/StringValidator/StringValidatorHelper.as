

struct FStringValidationHelper
{
    UPROPERTY()
    UStringValidatorConfig Config;
    UPROPERTY()
    FString StringToValidate;
    UPROPERTY()
    TArray<FStringValidationContext> ValidatorContexts;
    UPROPERTY()
    TArray<EStringValidationResult> ValidationResults;
    UPROPERTY()
    bool bValidationStarted;
    UPROPERTY()
    EStringValidationResult CachedValidationResult;

    FStringValidationHelper()
    {
        this.bValidationStarted = false;
        this.CachedValidationResult = EStringValidationResult(2);
        return;
    }
    FStringValidationHelper(const UStringValidatorConfig InConfig, const FString &inout InStringToValidate)
    {
        this.Config = nullptr;
        this.bValidationStarted = false;
        this.CachedValidationResult = EStringValidationResult(2);
        this.StringToValidate = InStringToValidate;
        return;
    }
    void SetConfigAsset(const UStringValidatorConfig ConfigAsset)
    {
        if (IsValid(ConfigAsset))
        {
        }
        return;
    }
    void SetString(const FString &inout InString)
    {
        if ((!((this.StringToValidate == InString))))
        {
            this.StopValidation();
            this.StringToValidate = InString;
        }
        return;
    }
    void StartValidation()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void TickValidation()
    {
        if (!(this.IsInProgress()))
        {
            return;
        }
        bool local_2 = false;
        int local_3 = 0;
        for (; local_3 < this.Config.Validators.Num(); ++local_3)
        {
            if ((int(this.ValidationResults[local_3])) == 2)
            {
                EStringValidationResult local_6 = this.Config.Validators[local_3].TickValidation(this.ValidatorContexts[local_3]);
                this.ValidationResults[local_3] = local_6;
                switch (int(local_6))
                {
                case 0:
                {
                    break;
                }
                case 1:
                {
                    this.CachedValidationResult = EStringValidationResult(1);
                    return;
                }
                case 2:
                {
                    local_2 = true;
                    break;
                }
                }
            }
        }
        if (!(local_2))
        {
            this.CachedValidationResult = EStringValidationResult(0);
        }
        return;
    }
    void StopValidation()
    {
        if (!(this.bValidationStarted))
        {
            return;
        }
        int local_2 = 0;
        for (; local_2 < this.Config.Validators.Num(); ++local_2)
        {
            if (!(this.ValidationResults.IsValidIndex(local_2)))
            {
                continue;
            }
            if ((int(this.ValidationResults[local_2])) == 2)
            {
                this.Config.Validators[local_2].CancelValidation(this.ValidatorContexts[local_2]);
            }
        }
        this.ValidatorContexts.Empty(0);
        this.ValidationResults.Empty(0);
        this.bValidationStarted = false;
        this.CachedValidationResult = EStringValidationResult(EStringValidationResult(2));
        return;
    }
    EStringValidationResult GetValidationResult() const
    {
        return this.CachedValidationResult;
    }
    FText GetFailReason() const
    {
        if (this.bValidationStarted)
        {
            int local_2 = 0;
            for (; local_2 < this.ValidationResults.Num(); ++local_2)
            {
                if ((int(this.ValidationResults[local_2])) == 1)
                {
                    return this.ValidatorContexts[local_2].ErrorMessage;
                }
            }
        }
        return FText();
    }
    bool IsInProgress() const
    {
        return (this.bValidationStarted && (int(this.CachedValidationResult) == 2));
    }
    bool IsStarted() const
    {
        return this.bValidationStarted;
    }
}

