

struct FRedDotNodeData
{
    UPROPERTY()
    uint64 ExtraDataId;
    UPROPERTY()
    FGameplayTag NodeTag;

    FRedDotNodeData(const FGameplayTag &inout InNodeTag, const uint64 InExtraDataId = 0)
    {
        this.NodeTag = InNodeTag;
        this.ExtraDataId = InExtraDataId;
        return;
    }
    uint Hash() const
    {
        int local_1 = 0;
        int local_4 = this.ExtraDataId & 4294967295;
        int local_2 = local_4;
        local_1 = HashCombine(local_1, local_2);
        int local_7 = 32;
        local_1 = HashCombine(local_1, ((this.ExtraDataId >> local_7) & 4294967295));
        local_1 = HashCombine(local_1, this.NodeTag.GetTagName().GetHash());
        return local_1;
    }
}

