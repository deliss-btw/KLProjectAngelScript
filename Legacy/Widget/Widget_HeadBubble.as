

class UWidget_HeadBubble : UASUserWidget
{
    UPROPERTY()
    UImage Image_Background;
    UPROPERTY()
    UImage Image_Emoji;
    UPROPERTY()
    UCanvasPanel BubblePanel;
    UPROPERTY()
    UCanvasPanel NoSignalPanel;
    UPROPERTY()
    UDataTable EmojiDataTable;
    UPROPERTY()
    URichTextBlock TextContent;
    FECSEntity LocalPlayerEntity;
    FECSEntity FlowTarget;
    AActor BubbleSenderActor;
    FEmojiData EmojiData;
    float32 DialogShowTimer = -1.0f;
    float32 DefaultDialogShowTime = 6.0f;
    float32 HideDistance = 2000.0f;


    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        float32 local_7;
        this.LocalPlayerEntity = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if ((this.LocalPlayerEntity == ENTITY_NULL))
        {
            return;
        }
        this.DialogShowTimer -= InDeltaTime;
        if (this.DialogShowTimer < 0.0f || !(this.FlowTarget.IsValid()))
        {
            this.SetVisibility(ESlateVisibility(2));
        }
        FECSEntity local_14;
        Get local_18;
        if (local_18.opCall())
        {
            local_14 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(this.FlowTarget);
            if (!((local_14 == this.FlowTarget)))
            {
                this.FlowTarget = local_14;
                ::HUD_Development::GetActor(this.FlowTarget, this.BubbleSenderActor);
            }
        }
        Has local_24;
        if (!((this.BubbleSenderActor != nullptr)) || !(local_24.opCall()))
        {
            return;
        }
        bool local_25 = true;
        Get local_30;
        float local_38 = local_30.opCall().GetPosition().Distance(this.BubbleSenderActor.GetActorLocation());
        if (local_38 <= this.HideDistance)
        {
        }
        else
        {
            local_25 = false;
        }
        float local_40 = FMath::Clamp(1.0 - ((local_38 - 200.0) / 2000.0), 0.2, 1.0);
        this.BubblePanel.SetRenderScale(FVector2D(local_40, local_40));
        FVector2D local_58;
        FVector local_64;
        if (this.BubbleSenderActor.DoesSocketExist(n"S_Head"))
        {
            local_64 = (this.BubbleSenderActor.GetSocketLocation(n"S_Head") + (FVector(FVector::UpVector) * 60.0));
        }
        else
        {
            FVector local_78_2 = (FVector(FVector::UpVector) * 250.0);
            local_64 = (this.BubbleSenderActor.GetActorLocation() + local_78_2);
        }
        this.GetOwningPlayer().ProjectWorldLocationToScreen(local_64, local_58, false);
        UPanelSlot local_82 = this.BubblePanel.Slot;
        UCanvasPanelSlot local_86 = (Cast<UCanvasPanelSlot>(local_82));
        if (local_86 != nullptr)
        {
            FGeometry local_102 = this.BubblePanel.GetParent().GetTickSpaceGeometry();
            FVector2D local_106;
            Slate::ScreenToWidgetLocal(__GetWorldContext(), local_102, local_58, local_106, false);
            if (local_106.X < 0.0 || (local_106.X > local_102.GetLocalSize().X) || (local_106.Y < 0.0) || (local_106.Y > local_102.GetLocalSize().Y))
            {
                local_25 = false;
            }
            if (local_25)
            {
                local_86.SetPosition(local_106);
            }
        }
        if (local_25)
        {
            local_7 = 1.0f;
        }
        else
        {
            local_7 = 0.0f;
        }
        this.SetRenderOpacity(local_7);
        return;
    }
    void Init(const FECSEntity &inout Sender, const FName &inout EmojiName, const FString &inout ShowContent, const bool bIsChaos = false)
    {
        this.FlowTarget = Sender;
        this.DialogShowTimer = this.DefaultDialogShowTime;
        ::HUD_Development::GetActor(this.FlowTarget, this.BubbleSenderActor);
        if (bIsChaos)
        {
            this.NoSignalPanel.SetVisibility(ESlateVisibility(0));
            this.Image_Background.SetVisibility(ESlateVisibility(2));
            this.Image_Emoji.SetVisibility(ESlateVisibility(2));
            return;
        }
        this.NoSignalPanel.SetVisibility(ESlateVisibility(2));
        this.Image_Background.SetVisibility(ESlateVisibility(0));
        this.Image_Emoji.SetVisibility(ESlateVisibility(0));
        if (EmojiName.IsNone() == false)
        {
            this.EmojiDataTable.FindRow(EmojiName, this.EmojiData);
            this.Image_Emoji.SetBrushFromTexture(this.EmojiData.EmojiIcon, false);
            return;
        }
        this.TextContent.SetText(Text::Conv_StringToText(ShowContent));
        return;
    }
}

