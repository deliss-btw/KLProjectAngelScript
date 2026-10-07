
enum EAISpecialTokenDispatchMode
{
    SendToAll,
    SendToEntityArray,
}

enum EAISpecialCombatTokenGenNumType
{
    ReceiverRatio,
    AbsoluteValue,
}

enum EAISpecialCombatTokenFilterByTokenType
{
    NoSpecifiedToken,
    NoAnyToken,
    HasSpecifiedToken,
}


struct FAISpecialCombatTokenGenNum
{
    UPROPERTY()
    EAISpecialCombatTokenGenNumType Type = EAISpecialCombatTokenGenNumType(0);
    UPROPERTY()
    float32 Num = 1.0f;


    int CalculateNum(const int ReceiverNum) const
    {
        int local_2 = int(this.Type);
        if (local_2 <= 1)
        {
            if (local_2 != 0)
            {
                if (local_2 != 1)
                {
                }
            }
            else
            {
                return FMath::CeilToInt((this.Num * ReceiverNum));
            }
        }
        return 0;
    }
}

struct FAISpecialCombatTokenConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FString Comments;
    UPROPERTY()
    float32 ValidDuration = 5.0f;
    UPROPERTY()
    FAISpecialCombatTokenGenNum GenerateTokenNum;
    UPROPERTY()
    TArray<FAISmartValuePackItem> Params;
    UPROPERTY()
    EESMBlackboardConditionTagQueryType FilterByTagType = EESMBlackboardConditionTagQueryType(0);
    UPROPERTY()
    FGameplayTagContainer FilterByTags;
    UPROPERTY()
    EAISpecialCombatTokenFilterByTokenType FilterByTokenType = EAISpecialCombatTokenFilterByTokenType(0);
    UPROPERTY()
    TArray<FDataObjectPtr> m_FilterByTokens;


    int GetParamIndex(const FName &inout InName) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    bool PassTokenFilter(const uint64 TargetOwnedTokenUid) const
    {
        if (int(this.FilterByTokenType) == 1)
        {
            return (TargetOwnedTokenUid == 0);
        }
        if (int(this.FilterByTokenType) == 0)
        {
            return !(this.FilterByTokensContains(TargetOwnedTokenUid));
        }
        if (int(this.FilterByTokenType) == 2)
        {
            return this.FilterByTokensContains(TargetOwnedTokenUid);
        }
        return true;
    }
    bool FilterByTokensContains(const uint64 CurrentTokenUid) const
    {
        for (auto& local_16 : this.GetFilterByTokens())
        {
            if (local_16.GetUniqueID() == CurrentTokenUid)
            {
                return true;
            }
        }
        return false;
    }
    const TArray<TDataObjectPtr<FAISpecialCombatTokenConfig>> GetFilterByTokens() const property
    {
        const TArray<TDataObjectPtr<FAISpecialCombatTokenConfig>> __r;
        return __r;
    }
    void SetFilterByTokens(const TArray<TDataObjectPtr<FAISpecialCombatTokenConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FAISpecialCombatTokenConfig>>> local_2;
        this.m_FilterByTokens = local_2;
        return;
    }
}

