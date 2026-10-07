

struct FSocialViewPageOperatorContext
{
    UPROPERTY()
    ULocalPlayer LocalPlayer;
    UPROPERTY()
    FECSEntity LocalPlayerEntity;
    UPROPERTY()
    TEUIModelRef<FM_Player> TargetPlayerModel;
    UPROPERTY()
    uint TargetPlayerUid;
    UPROPERTY()
    bool bIsSelf;
    UPROPERTY()
    bool bIsFriend;
    UPROPERTY()
    ESocialViewPageTargetTeamStatus TargetTeamStatus;


}

UCLASS(Abstract)
class USocialViewPageOperator : UObject
{
    USocialViewPageOperator()
    {
        return;
    }
    bool ShouldShow(const FSocialViewPageOperatorContext &inout Context) const
    {
        return true;
    }
    void Execute(const FSocialViewPageOperatorContext &inout Context, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
    {
        FString local_6 = this.GetClass().GetName();
        return;
    }
}

class USocialViewPageSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<ESocialViewPageOperatorType, USocialViewPageOperator> Operators;
    UPROPERTY()
    UInteractCustomCheckCondition_BlackboardConditionAndArray SingleActionCondition;
    UPROPERTY()
    UInteractCustomCheckCondition_BlackboardConditionAndArray DualActionSourceCondition;
    UPROPERTY()
    UInteractCustomCheckCondition_BlackboardConditionAndArray DualActionTargetCondition;

    USocialViewPageSettings()
    {
        return;
    }
}

namespace SocialViewPageOperatorUtils
{
USocialViewPageOperator GetOperator(const ESocialViewPageOperatorType Type)
{
    const USocialViewPageSettings local_2;
    ESocialViewPageOperatorType local_12;
    GetGameplaySettings<USocialViewPageSettings> local_4;
    local_2 = local_4;
    if (local_2 == nullptr)
    {
        return nullptr;
    }
    if (local_2.Operators.Find(Type, local_12))
    {
        return local_12;
    }
    return nullptr;
}
}
