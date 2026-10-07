

struct FAttributePresentation
{
    UPROPERTY()
    TDataObjectPtr<FAttributePresentationConfig> Preset;
    UPROPERTY()
    bool bOverrideDisplayName = false;
    UPROPERTY()
    bool bOverrideDescription = false;
    UPROPERTY()
    bool bOverrideIcon = false;
    UPROPERTY()
    bool bOverrideThemeColor = false;
    UPROPERTY()
    FText OverrideDisplayName;
    UPROPERTY()
    FText OverrideDescription;
    UPROPERTY()
    FSoftBrush OverrideIcon;
    UPROPERTY()
    FLinearColor OverrideThemeColor = FLinearColor(1.0f, 1.0f, 1.0f, 1.0f);


    FText GetDisplayName() const
    {
        if (this.bOverrideDisplayName)
        {
            return this.OverrideDisplayName;
        }
        if (this)
        {
            return this.opArrow().DisplayName;
        }
        return FText();
    }
    FText GetDescription() const
    {
        if (this.bOverrideDescription)
        {
            return this.OverrideDescription;
        }
        if (this)
        {
            return this.opArrow().Description;
        }
        return FText();
    }
    FSoftBrush GetIcon() const
    {
        if (this.bOverrideIcon)
        {
            return this.OverrideIcon;
        }
        if (this)
        {
            return this.opArrow().Icon;
        }
        return FSoftBrush();
    }
    FLinearColor GetThemeColor() const
    {
        if (this.bOverrideThemeColor)
        {
            return this.OverrideThemeColor;
        }
        if (this)
        {
            return this.opArrow().ThemeColor;
        }
        return FLinearColor(1.0f, 1.0f, 1.0f, 1.0f);
    }
}

