

class UASWaitForTutorialGraphicClosedWrapper : UECSAsyncActionBase
{
    UPROPERTY()
    FASWaitForTutorialGraphicClosed Action;
    UPROPERTY()
    FECSEntity PlayerEntity;
    UPROPERTY()
    TDataObjectPtr<FGuideGroupConfig> GraphicConfig;
    UPROPERTY()
    FECSAsyncActionDelegate OnClosed;

    UASWaitForTutorialGraphicClosedWrapper()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetAsyncActionClass_Implementation() const
    {
        return FASWaitForTutorialGraphicClosed;
    }
}

namespace FECSAsyncActionFactory_ASWaitForTutorialGraphicClosed
{
UASWaitForTutorialGraphicClosedWrapper MakeWrapper(const FASWaitForTutorialGraphicClosed &inout ActionData)
{
    return UASWaitForTutorialGraphicClosedWrapper.GetDefaultObject();
}
UFUNCTION()
UASWaitForTutorialGraphicClosedWrapper Init_FECSEntity_TDataObjectPtr_FGuideGroupConfig_(const FECSEntity &inout InPlayerEntity, const TDataObjectPtr<FGuideGroupConfig> &inout InGraphicConfig)
{
    FASWaitForTutorialGraphicClosed local_38;
    local_38.Init(InPlayerEntity, InGraphicConfig);
    return FECSAsyncActionFactory_ASWaitForTutorialGraphicClosed::MakeWrapper(local_38);
}
}
