

struct FESMPreviewAdditionalData
{
    UPROPERTY()
    bool bDisplay = true;
    UPROPERTY()
    TSoftClassPtr<AActor> ActorType;
    UPROPERTY()
    FTransform Transform;
    UPROPERTY()
    bool bAttachToMainPreview = true;
    UPROPERTY()
    FName AttachSocket;
    UPROPERTY()
    TWeakObjectPtr<AActor> ActorInstance;


}

class UESMAction_PreviewAdditional : UESMBPBaseSpanAction
{
    UPROPERTY()
    FESMPreviewAdditionalData PreviewData;

    UESMAction_PreviewAdditional()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Preview_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        return;
    }
    UFUNCTION()
    void PreviewClear_Implementation(const FESMPreviewContext &inout Context)
    {
        if ((!((this.PreviewData.ActorInstance == nullptr))))
        {
            this.PreviewData.ActorInstance.opArrow().DestroyActor();
            this.PreviewData.ActorInstance = nullptr;
        }
        return;
    }
}

