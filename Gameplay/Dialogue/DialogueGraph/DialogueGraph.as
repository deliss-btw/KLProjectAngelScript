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
        for (auto& local_16 : this._base_FDialogueGraphBase)
        {
            TConstRawPtr<FDialogueNodeBase> local_22 = FInstancedStruct::GetPtr(local_16).opCall();
            if (local_22 && (int(local_22.Get().NodeId) == InNodeId))
            {
                return local_16;
            }
        }
        return FInstancedStruct();
    }
    TConstRawPtr<FDialogueNodeBase> GetNodePtr(const uint InNodeId) const
    {
        for (auto& local_16 : this._base_FDialogueGraphBase)
        {
            TConstRawPtr<FDialogueNodeBase> local_22 = FInstancedStruct::GetPtr(local_16).opCall();
            if (local_22 && (int(local_22.Get().NodeId) == InNodeId))
            {
                return local_22;
            }
        }
        return TConstRawPtr<FDialogueNodeBase>();
    }
    TArray<FInstancedStruct> GetNodesToOption(const uint StartAtNodeId, const bool bIncludeStartNode = true) const
    {
        TArray<FInstancedStruct> local_4;
        int local_26 = 0;
        FInstancedStruct local_8 = this.GetNode(StartAtNodeId);
        if (bIncludeStartNode)
        {
            local_4.Add(local_8);
        }
        while (true)
        {
            FInstancedStruct::GetPtr local_18;
            TConstRawPtr<FDialogueNodeBase> local_20 = local_18.opCall();
            if ((local_20 == nullptr) || local_20.Get().NextNodeIds.IsEmpty())
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
        for (auto& local_16 : this._base_FDialogueGraphBase)
        {
            TConstRawPtr<FDialogueNode_Speech> local_22 = FInstancedStruct::GetPtr(local_16).opCall();
            if ((local_22 == nullptr))
            {
                continue;
            }
            for (auto& local_38 : local_22.Get().DialogueLines)
            {
                if (local_38.Get().GetSpeakerNPC().IsSet())
                {
                    return local_38;
                }
            }
        }
        return TDataObjectPtr<FDialogueLineConfig>();
    }
    TDataObjectPtr<FNPCMainConfig> FindFirstSpeakerNPC() const
    {
        for (auto& local_16 : this._base_FDialogueGraphBase)
        {
            TConstRawPtr<FDialogueNode_Speech> local_22 = FInstancedStruct::GetPtr(local_16).opCall();
            if ((local_22 == nullptr))
            {
                continue;
            }
            for (auto& local_38 : local_22.Get().DialogueLines)
            {
                if (local_38.Get().GetSpeakerNPC().IsSet())
                {
                    return local_38.Get().GetSpeakerNPC();
                }
            }
        }
        return TDataObjectPtr<FNPCMainConfig>();
    }
    bool HasAttachPoint() const
    {
        for (auto& local_16 : this._base_FDialogueGraphBase)
        {
            TConstRawPtr<FDialogueNode_Speech> local_22 = FInstancedStruct::GetPtr(local_16).opCall();
            if (!(!(local_22)) && local_22.Get().bIsAttachPoint)
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

