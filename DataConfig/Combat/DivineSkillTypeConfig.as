

struct FDivineSkillTypeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText TypeName;
    UPROPERTY()
    FSoftBrush TypeIcon;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    EAvatarIllustrate TargetIllustrate;
    UPROPERTY()
    FString RichTextImageName;


}

