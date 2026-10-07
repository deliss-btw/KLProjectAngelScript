
enum ECombatTeamRule
{
    None,
    GroupBySocialTeam,
    AllInOne,
    PVX,
}


struct FGameRuleConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FString GameRuleName;
    UPROPERTY()
    uint TeamMaxNum;
    UPROPERTY()
    uint SquadNum;
    UPROPERTY()
    bool CanChangeSquad;
    UPROPERTY()
    bool CanChangePlan;
    UPROPERTY()
    bool bCanSavePosition;
    UPROPERTY()
    bool bShouldWaitAllPlayerReady;
    UPROPERTY()
    ECombatTeamRule CombatTeamRule;
    UPROPERTY()
    FName DivineSkillDisplayTag;
    UPROPERTY()
    TArray<FDataObjectPtr> m_DisabledSystemControls;
    UPROPERTY()
    FCombatRestrictionSettings CombatRestriction;


    const TArray<TDataObjectPtr<FSystemControlConfig>> GetDisabledSystemControls() const property
    {
        const TArray<TDataObjectPtr<FSystemControlConfig>> __r;
        return __r;
    }
    void SetDisabledSystemControls(const TArray<TDataObjectPtr<FSystemControlConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FSystemControlConfig>>> local_2;
        this.m_DisabledSystemControls = local_2;
        return;
    }
}

namespace FGameRuleConfig
{
TDataObjectPtr<FGameRuleConfig> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FGameRuleConfig>();
}
}
