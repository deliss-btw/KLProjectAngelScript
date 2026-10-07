

class URichTextDecorator_Image : UEUIRichTextBlockBlueprintDecoratorBase
{
    URichTextDecorator_Image()
    {
        return;
    }
    UFUNCTION()
    bool Supports_Implementation(const FEUIRichTextBlockRunInfo &inout RunInfo) const
    {
        return (RunInfo.GetName() == "img") && RunInfo.HasMeta("id");
    }
    UFUNCTION()
    void Create_Implementation(FEUIRichTextBlockBlueprintDecoratorRunContext &inout RunContext) const
    {
        const URichTextSettings local_2;
        GetGameplaySettings<URichTextSettings> local_4;
        local_2 = local_4;
        if (local_2.CommonImageTable != nullptr)
        {
            FString local_18 = RunContext.GetRunInfo().GetMeta("id");
            FName local_20 = FName(local_18);
            UDataTable::FindDataObject local_50;
            TDataObjectPtr<FRichTextImageData> local_74 = local_50.opCall(local_20);
            if (local_74)
            {
                FSlateBrush local_120 = local_74.opArrow().Image.LoadBrush();
                if (RunContext.GetRunInfo().HasMeta("width"))
                {
                    FString local_18_2 = RunContext.GetRunInfo().GetMeta("width");
                    if (local_18_2.IsNumeric())
                    {
                        local_120.ImageSize.X = float32(String::Conv_StringToDouble(local_18_2));
                    }
                }
                if (RunContext.GetRunInfo().HasMeta("height"))
                {
                    FString local_168 = RunContext.GetRunInfo().GetMeta("height");
                    if (local_168.IsNumeric())
                    {
                        local_120.ImageSize.Y = float32(String::Conv_StringToDouble(local_168));
                    }
                }
                RunContext.CreateImageRun(local_120);
            }
        }
        return;
    }
}

