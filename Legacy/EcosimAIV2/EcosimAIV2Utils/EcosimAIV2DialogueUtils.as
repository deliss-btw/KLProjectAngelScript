
namespace FEcosimAIV2Utils
{
void UpdateSyncSpeakToAndOptionInfoByPlayerEntity(const FECSEntity &inout Entity, const TArray<FECSEntity> &inout PlayerEntityList)
{
    int local_26 = 0;
    int local_32 = 0;
    for (auto& local_16 : PlayerEntityList)
    {
        TArray<TDataObjectPtr<FInteractSimpleSpeakToAndOption>> local_20;
        if (!(local_32))
        {
            break;
        }
        if (FEcosimAIV2Utils::GetValidInteractSimpleSpeakToAndOptionByTargetPlayerEntity(Entity, local_16, local_32.SpeakToAndOptionList, local_20))
        {
            local_26.GetModify_HasSpeakToAndOptionPlayerEntityList().Add(local_16);
        }
        else
        {
        }
    }
    return;
}
bool ChooseInteractOption(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const TDataObjectPtr<FInteractSimpleSpeakToAndOption> &inout Data, const int SelectIndex)
{
    FEcosimAIV2DialogueOptionConditionBase local_52;
    if (SelectIndex >= 0)
    {
        return false;
    }
    FEcosimAIV2DialogueOption local_14;
    bool local_27 = true;
    for (auto& local_42 : local_14.ConditionList)
    {
        if (FInstancedStruct::GetPtr(local_42).opCall())
        {
            if (!(InventoryUtils::HasItemInInventory(InteractSource, local_52)))
            {
                local_27 = false;
                break;
            }
        }
    }
    if (local_27)
    {
        for (auto& local_42 : local_14.ConditionList)
        {
            if (FInstancedStruct::GetPtr(local_42).opCall())
            {
                InventoryUtils::RemoveInventoryItem(InteractSource, local_52, 1);
            }
        }
        return true;
    }
    return false;
}
bool GetInteractOption(TDataObjectPtr<FInteractSimpleSpeakToAndOption> &inout Data, TArray<FString> &out OptionList)
{
    TArrayConstIterator<FEcosimAIV2DialogueOption> local_10;
    TArray<FString> local_4;
    OptionList = local_4;
    for (; local_10.CanProceed;)
    {
        const FEcosimAIV2DialogueOption& local_20 = local_10.Proceed();
        FString local_24 = local_20.OptionContent;
        int local_25 = 0;
        for (; local_25 < local_20.ConditionList.Num(); ++local_25)
        {
            if (FInstancedStruct::GetPtr(local_20.ConditionList[local_25]).opCall())
            {
                FString local_40;
                local_40.ToString();
                local_24 = local_24.Replace(FString().AppendChar(int16(123)).Append(local_25).AppendChar(int16(125)), local_40, ESearchCase(1));
            }
        }
        OptionList.Add(local_24);
    }
    return !(OptionList.IsEmpty());
}
void ClearInteractDialogueInfo(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget)
{
    int local_6 = 0;
    int local_14 = 0;
    int local_24 = 0;
    int local_32 = 0;
    if (!(local_6))
    {
        return;
    }
    if (!(local_14))
    {
        return;
    }
    FECSEntity local_18 = local_14.GetPlayerEntity();
    local_24.SetCurrentSpeakToEntity(FTargetEntity(ENTITY_NULL));
    local_32.CurrentSpeakToEntity = FTargetEntity(ENTITY_NULL);
    local_6.CurrentSpeakToAndOption = TDataObjectPtr<FInteractSimpleSpeakToAndOption>(nullptr);
    return;
}
bool TryTriggerNextInteractDialogue(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const int SelectIndex = -1)
{
    int local_8 = 0;
    int local_22 = 0;
    if (FEcosimAIV2Utils::UpdateInteractDialogue(InteractSource, InteractTarget, SelectIndex))
    {
        local_8.SetCurrentSpeakToEntity(FTargetEntity(InteractSource));
        Get local_14;
        if (local_14.opCall())
        {
            local_22.CurrentSpeakToEntity = FTargetEntity(InteractTarget);
        }
        return true;
    }
    return false;
}
bool UpdateInteractDialogue(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const int SelectIndex = -1)
{
    int local_6 = 0;
    int local_18 = 0;
    FC_EcosimAIV2DialogueMemory local_24;
    int local_132 = 0;
    int local_146 = 0;
    if (!(local_6))
    {
        return false;
    }
    FECSEntity local_12 = local_6.GetPlayerEntity();
    if ((!(local_18) || !(local_24)))
    {
        return false;
    }
    TArray<TDataObjectPtr<FInteractSimpleSpeakToAndOption>> local_30;
    FName local_32(NAME_None);
    if (SelectIndex >= 0)
    {
        TDataObjectPtr<FInteractSimpleSpeakToAndOption>& local_36 = local_24.CurrentSpeakToAndOption;
        if (local_36 && local_36.IsSet())
        {
            if (SelectIndex >= 0)
            {
                return false;
            }
            if (FEcosimAIV2Utils::ChooseInteractOption(InteractSource, InteractTarget, local_36, SelectIndex))
            {
            }
            else
            {
            }
        }
    }
    bool local_25 = !(local_32.IsNone());
    if (local_25)
    {
        UCombatGlobalSettings local_38 = UCombatGlobalSettings::Get();
        UDataTable::FindDataObject local_44;
        local_30.Add(local_44.opCall(local_32));
    }
    else
    {
        local_30.Append(local_18.SpeakToAndOptionList);
    }
    TArray<TDataObjectPtr<FInteractSimpleSpeakToAndOption>> local_96;
    if (FEcosimAIV2Utils::GetValidInteractSimpleSpeakToAndOptionByTargetPlayerEntity(InteractTarget, local_12, local_30, local_96))
    {
        TArrayConstIterator<FString> local_116;
        TDataObjectPtr<FInteractSimpleSpeakToAndOption>& local_36_2 = local_96[0];
        local_24.CurrentSpeakToAndOption = local_36_2;
        TArray<FString> local_100;
        if (FEcosimAIV2Utils::GetInteractOption(local_36_2, local_100))
        {
            local_100.Add("з¦»ејЂ");
        }
        FStoryDialogInfoBuilder local_110;
        local_25 = !local_25;
        if (local_25)
        {
        }
        for (; local_116.CanProceed;)
        {
            local_110.EntitySay(InteractTarget, local_116.Proceed(), "");
        }
        if (!(local_100.IsEmpty()))
        {
            local_110.EntityChoose(InteractSource, local_100);
        }
        if (!(local_110.IsEmpty()))
        {
            FFPTime local_130 = FFPTime(-1);
            local_132.TargetEntity = InteractTarget;
            local_146.OptionList = local_100;
            return true;
        }
    }
    return false;
}
void AddEntityDialogueSpeakToContent(const FECSEntity &inout Entity, const TDataObjectPtr<FInteractSimpleSpeakToAndOption> &inout DialogueData)
{
    int local_8 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (!(DialogueData) || !(DialogueData.IsSet()))
    {
        return;
    }
    local_8.SpeakToAndOptionList.Add(DialogueData);
    ModifyOrAdd local_14;
    local_14.opCall();
    return;
}
void ClearEntityDialogueSpeakToContent(const FECSEntity &inout Entity)
{
    Modify local_4;
    FC_EcosimAIV2InteractSimpleSpeakToAndOption& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.SpeakToAndOptionList.Empty(0);
    }
    return;
}
bool GetValidInteractSimpleSpeakToAndOptionByTargetPlayerEntity(const FECSEntity &inout Entity, const FECSEntity &inout PlayerEntity, const TArray<TDataObjectPtr<FInteractSimpleSpeakToAndOption>> &inout CandidateDataList, TArray<TDataObjectPtr<FInteractSimpleSpeakToAndOption>> &inout ValidDataList)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
}
