

struct FDialogueGraphScriptBase : FDialogueGraphBase
{
    FDialogueGraphBase _base_FDialogueGraphBase;
    UPROPERTY()
    FInstancedStruct AttachedOption;

    FDialogueGraphScriptBase()
    {
        return;
    }
    FInstancedStruct GetNode(const uint InNodeId) const
    {
        for (auto& local_16 : this)
        {
            if (FInstancedStruct::GetPtr(local_16).opCall() && (0 == InNodeId))
            {
                return local_16;
            }
        }
        return FInstancedStruct();
    }
    TConstRawPtr<FDialogueNodeBase> GetNodePtr(const uint InNodeId) const
    {
        for (auto& local_16 : this)
        {
            TConstRawPtr<FDialogueNodeBase> local_22 = FInstancedStruct::GetPtr(local_16).opCall();
            if ((local_22 && (0 == InNodeId)))
            {
                return local_22;
            }
        }
        return TConstRawPtr<FDialogueNodeBase>();
    }
    TArray<FInstancedStruct> GetNodesToOption(const uint StartAtNodeId, const bool bIncludeStartNode = true) const
    {
        TArray<FInstancedStruct> local_4;
        bool local_23 = false;
        int local_26 = 0;
        FInstancedStruct local_8 = this.GetNode(StartAtNodeId);
        if (bIncludeStartNode)
        {
            local_4.Add(local_8);
        }
        FInstancedStruct::GetPtr local_18;
        while (true)
        {
            if ((local_18.opCall() == nullptr) || local_23)
            {
                break;
            }
            if (local_26.Num() > 1)
            {
                for (auto local_41 : local_26)
                {
                    FInstancedStruct local_12 = this.GetNode(local_41);
                    if (FInstancedStruct::GetPtr(local_12).opCall())
                    {
                        local_4.Add(local_12);
                    }
                    else
                    {
                    }
                }
                break;
            }
            local_4.Add(this.GetNode(local_26[0]));
        }
        return local_4;
    }
    TDataObjectPtr<FDialogueLineConfig> FindFirstSpeakerLine() const
    {
        TArrayConstIterator<TDataObjectPtr<FDialogueLineConfig>> local_30;
        for (auto& local_16 : this)
        {
            if ((FInstancedStruct::GetPtr(local_16).opCall() == nullptr))
            {
                continue;
            }
            for (; local_30.CanProceed;)
            {
                const TDataObjectPtr<FDialogueLineConfig>& local_38 = local_30.Proceed();
                if (GetSpeakerNPC().IsSet())
                {
                    return local_38;
                }
            }
        }
        return TDataObjectPtr<FDialogueLineConfig>();
    }
    TDataObjectPtr<FNPCMainConfig> FindFirstSpeakerNPC() const
    {
        TArrayConstIterator<TDataObjectPtr<FDialogueLineConfig>> local_30;
        for (auto& local_16 : this)
        {
            if ((FInstancedStruct::GetPtr(local_16).opCall() == nullptr))
            {
                continue;
            }
            for (; local_30.CanProceed;)
            {
                local_30.Proceed();
                if (GetSpeakerNPC().IsSet())
                {
                    return GetSpeakerNPC();
                }
            }
        }
        return TDataObjectPtr<FNPCMainConfig>();
    }
    bool HasAttachPoint() const
    {
        bool local_13 = false;
        for (auto& local_16 : this)
        {
            if (FInstancedStruct::GetPtr(local_16).opCall() && local_13)
            {
                return true;
            }
        }
        return false;
    }
    bool IsAttachable() const
    {
        return (!((FInstancedStruct::GetPtr(this.AttachedOption).opCall() == nullptr)));
    }
}

class UDialogueGraphAsset : UDataAsset
{
    UPROPERTY()
    FDialogueGraphScriptBase DialogueGraphData;

    UDialogueGraphAsset()
    {
        return;
    }
}

