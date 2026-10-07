

struct FStringArray
{
    UPROPERTY()
    TArray<FString> Value;

    FStringArray()
    {
        return;
    }
    FStringArray(const TArray<FString> &inout Arg)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FSimpleDictTreeNode
{
    UPROPERTY()
    FString NodeName;
    UPROPERTY()
    TMap<FString, FSimpleDictTreeNode> SubNode;
    UPROPERTY()
    TArray<FString> Keys;

    FSimpleDictTreeNode()
    {
        TMap<FString, FSimpleDictTreeNode> local_20;
        this.SubNode = local_20;
        this.Keys = TArray<FString>();
        return;
    }
}

struct FSimpleDictTree
{
    UPROPERTY()
    FSimpleDictTreeNode RootNode;

    FSimpleDictTree()
    {
        this.NodeName = FString();
        this.SubNode.Reset();
        return;
    }
    void AddElement(const TArray<FString> &inout ElementList)
    {
        if (ElementList.Num() <= 0)
        {
            return;
        }
        this.InternalAdd(this, ElementList, 0);
        return;
    }
    void InternalAdd(FSimpleDictTreeNode &inout CurNode, const TArray<FString> &inout ElementList, const int i)
    {
        FString local_4 = FString(ElementList[i]);
        if (local_4.IsEmpty())
        {
            return;
        }
        if (!(CurNode.SubNode.Contains(local_4)))
        {
            CurNode.Keys.Add(local_4);
            FSimpleDictTreeNode local_62;
            local_62.NodeName = local_4;
        }
        if ((i + 1) < ElementList.Num())
        {
            int local_6 = i + 1;
            this.InternalAdd(CurNode.SubNode[local_4], ElementList);
        }
        return;
    }
    TArray<FString> RandomValue(FRandomGenerator &inout Random) const
    {
        TArray<FString> local_4;
        this.InternalRandomValue(Random, this, local_4);
        return local_4;
    }
    void InternalRandomValue(FRandomGenerator &inout Random, const FSimpleDictTreeNode &inout CurNode, TArray<FString> &inout Ret) const
    {
        if (CurNode.Keys.Num() <= 0)
        {
            return;
        }
        const FString& local_10 = CurNode.Keys[FMath::RoundToInt(Random.NextRange(0.0f, (CurNode.Keys.Num() - 1)))];
        Ret.Add(local_10);
        const FSimpleDictTreeNode& local_12 = CurNode.SubNode[local_10];
        this.InternalRandomValue(Random, local_12, Ret);
        return;
    }
}

