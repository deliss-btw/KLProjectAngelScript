

struct FSmallSideHintDataWithBuffStack : FCommonSideHintData
{
    FCommonSideHintData _base_FCommonSideHintData;
    UPROPERTY()
    int MaxStack;
    UPROPERTY()
    int CurStack;


}

