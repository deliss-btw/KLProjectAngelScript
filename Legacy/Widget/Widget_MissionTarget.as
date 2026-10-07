

class UWidget_MissionTarget : UASUserWidget
{
    UPROPERTY()
    FString MissionContent;
    UPROPERTY()
    FString SubMissionContent;
    UPROPERTY()
    FString SubMissionSubContent;
    UPROPERTY()
    UTextBlock AS_TextBlock_Title;
    UPROPERTY()
    UTextBlock AS_TextBlock_TitleSub;
    UPROPERTY()
    UTextBlock TextBlock_VHint;
    UPROPERTY()
    UImage Frame_Title;
    UPROPERTY()
    UImage Frame_SubTitle;

    UWidget_MissionTarget()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        FECSEntity local_8 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (!(ECS::GetECSWorld().IsValid()))
        {
            return;
        }
        if ((local_8 == ENTITY_NULL))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void SetMissionTarget(const FString &inout Content)
    {
        this.MissionContent = Content;
        this.AS_TextBlock_Title.SetVisibility(ESlateVisibility(0));
        this.TextBlock_VHint.SetVisibility(ESlateVisibility(0));
        this.Frame_Title.SetVisibility(ESlateVisibility(0));
        return;
    }
    UFUNCTION()
    void SetSubMissionTarget(const FString &inout Content, const FString &inout SubContent)
    {
        this.SubMissionContent = Content;
        this.SubMissionSubContent = SubContent;
        if (Content.IsEmpty())
        {
            this.AS_TextBlock_TitleSub.SetVisibility(ESlateVisibility(2));
            this.Frame_SubTitle.SetVisibility(ESlateVisibility(2));
            return;
        }
        this.AS_TextBlock_TitleSub.SetVisibility(ESlateVisibility(0));
        this.Frame_SubTitle.SetVisibility(ESlateVisibility(0));
        return;
    }
}

