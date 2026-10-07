

class URichTextSettings : UGameplaySettingsBase
{
    UPROPERTY()
    UDataTable CommonImageTable;
    UPROPERTY()
    UDataTable KeyHintTable;
    UPROPERTY()
    float32 KeyHintFontSizeScale = 1.3f;
    UPROPERTY()
    TSubclassOf<UEUIUserWidget> KeyHintWidgetClass;
    UPROPERTY()
    FLinearColor HrefLinkColor = FLinearColor(0.2f, 0.5f, 1.0f, 1.0f);
    UPROPERTY()
    bool bHrefShowUnderline = true;
    UPROPERTY()
    FLinearColor ActionLinkColor = FLinearColor(0.2f, 0.8f, 0.3f, 1.0f);
    UPROPERTY()
    bool bActionShowUnderline = true;


}

