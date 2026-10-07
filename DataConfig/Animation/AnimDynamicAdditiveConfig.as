

struct FAnimDynamicAdditiveConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSoftObjectPtr<UAnimSequence> SourceSequence;
    UPROPERTY()
    TSoftObjectPtr<UAnimSequence> TargetSequence;

    FAnimDynamicAdditiveConfig()
    {
        return;
    }
}

