namespace FTalentUtils
{
TArray<uint> GetAllChildrenTalentIdByFoundationTalentId(const uint FoundationTalentId)
{
    TArray<uint> local_4;
    TDataObjectIterator<FTalentConfig> local_20;
    for (; local_20; )
    {
        if (!(local_20.GetData().GetFoundationTalent()))
        {
        }
        else
        {
            FTalentConfig local_384;
            if (int(local_384.DataId) == FoundationTalentId)
            {
                local_4.Add(local_20.GetData().DataId);
            }
        }
        local_20.opPreInc();
    }
    return local_4;
}
TArray<TDataObjectPtr<FTalentConfig>> GetAllChildrenTalentByFoundationTalentId(const uint FoundationTalentId)
{
    TArray<TDataObjectPtr<FTalentConfig>> local_4;
    TDataObjectIterator<FTalentConfig> local_20;
    for (; local_20; )
    {
        if (!(local_20.GetData().GetFoundationTalent()))
        {
        }
        else
        {
            FTalentConfig local_384;
            if (int(local_384.DataId) == FoundationTalentId)
            {
                local_4.Add(local_20.GetDataPtr());
            }
        }
        local_20.opPreInc();
    }
    return local_4;
}
bool TalentIsChildOfFoundationTalent(const uint TalentId, const uint FoundationTalentId)
{
    GetDataObjectByGSDataId<FTalentConfig> local_48;
    TDataObjectPtr<FTalentConfig> local_24 = local_48.opImplConv();
    if (local_24)
    {
        if (local_24.Get().GetFoundationTalent())
        {
            FTalentConfig local_460;
            if (int(local_460.DataId) == FoundationTalentId)
            {
                return true;
            }
        }
    }
    return false;
}
TDataObjectPtr<FSkillInitConfig> GetSkillInitConfigByTalentId(const uint TalentId)
{
    bool local_239;
    GetDataObjectByGSDataId<FTalentConfig> local_48;
    TDataObjectPtr<FTalentConfig> local_24 = local_48.opImplConv();
    bool local_97 = !(local_24);
    if (local_97)
    {
        return TDataObjectPtr<FSkillInitConfig>();
    }
    const FTalentConfig& local_148 = local_24.Get();
    TDataObjectPtr<FTalentConfig> local_72 = local_148.GetBaseTalent() ? local_148.GetBaseTalent() : local_24;
    TDataObjectPtr<FTalentConfig> local_220;
    int local_221 = 0;
    TDataObjectIterator<FTalentConfig> local_238;
    for (; local_238; )
    {
        local_239 = false;
        if ((local_238.GetDataPtr() == local_72.opImplConv()))
        {
            local_239 = true;
        }
        else
        {
            if (local_238.GetData().GetBaseTalent() && (local_238.GetData().GetBaseTalent() == local_72.opImplConv()))
            {
                local_239 = true;
            }
        }
        if (!(local_239) || !(local_238.GetData().GetSkillConfig()))
        {
        }
        else
        {
            if (!(local_220) || ((local_238.GetData().TalentLevel > local_221)))
            {
                local_220 = local_238.GetDataPtr();
                local_221 = local_238.GetData().TalentLevel;
            }
        }
        local_238.opPreInc();
    }
    if (!(local_220))
    {
        local_97 = false;
    }
    else
    {
        local_97 = local_220.Get().GetSkillConfig();
    }
    if (local_97)
    {
        return local_220.Get().GetSkillConfig();
    }
    return TDataObjectPtr<FSkillInitConfig>();
}
uint GetHighestUnlockedTalentIdInChain(const uint TalentId, const TArray<TDataObjectPtr<FTalentConfig>> &inout UnlockTalentList)
{
    GetDataObjectByGSDataId<FTalentConfig> local_48;
    TDataObjectPtr<FTalentConfig> local_24 = local_48.opImplConv();
    if (!(local_24))
    {
        return TalentId;
    }
    const FTalentConfig& local_100 = local_24.Get();
    TDataObjectPtr<FTalentConfig> local_72 = local_100.GetBaseTalent() ? local_100.GetBaseTalent() : local_24;
    int local_149 = TalentId;
    int local_150 = int(local_100.TalentLevel);
    for (auto& local_166 : UnlockTalentList)
    {
        if (!(local_166))
        {
            continue;
        }
        const FTalentConfig& local_168 = local_166.Get();
        TDataObjectPtr<FTalentConfig> local_124;
        if (local_168.GetBaseTalent())
        {
            local_124 = local_168.GetBaseTalent();
        }
        else
        {
            local_124 = local_166;
        }
        if ((!((local_124 == local_72.opImplConv()))))
        {
            continue;
        }
        if (int(local_168.TalentLevel) > local_150)
        {
            local_150 = int(local_168.TalentLevel);
            local_149 = int(local_168.DataId);
        }
    }
    return local_149;
}
}
