
enum ETextArgLevelEventInfoProperty
{
    EventTitle,
    EventDescription,
    EventRewardBuffDesc,
    EventRewardBriefDesc,
}


struct FTextArg_LevelEventInfo : FTextArgConfig
{
    FTextArgConfig _base_FTextArgConfig;
    UPROPERTY()
    ETextArgLevelEventInfoProperty Property;


}

class UTextArgParser_LevelEventInfo : UBlueprintTextArgParser
{
    UTextArgParser_LevelEventInfo()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetConfigType_Implementation() const
    {
        return FTextArg_LevelEventInfo;
    }
    UFUNCTION()
    bool ParseArgValue_Implementation(const FDataObjectPtr &inout Config, const FTextArgument &inout Arg, FText &inout OutResult) const
    {
        FTextArg_LevelEventInfo local_26;
        int local_32 = 0;
        CastTo local_112;
        TDataObjectPtr<FTextArg_LevelEventInfo> local_24 = TDataObjectPtr<FTextArg_LevelEventInfo>(Config);
        TDataObjectPtr<FLevelEventInfoConfigBase> local_56 = TDataObjectPtr<FLevelEventInfoConfigBase>(local_32);
        if (local_56)
        {
            switch (int(local_26.Property))
            {
            case 0:
            {
                if (local_56.opArrow().GetPresentationConfig().IsSet())
                {
                    if (local_56.opArrow().EventTargetTitle.IsEmpty())
                    {
                    }
                    else
                    {
                    }
                }
                else
                {
                    OutResult = local_56.opArrow().EventTargetTitle;
                }
                break;
            }
            case 1:
            {
                if (local_56.opArrow().GetPresentationConfig().IsSet())
                {
                    if (local_56.opArrow().EventDescription.IsEmpty())
                    {
                    }
                    else
                    {
                    }
                }
                else
                {
                    OutResult = local_56.opArrow().EventDescription;
                }
                break;
            }
            case 2:
            {
                TDataObjectPtr<FLevelRandomEventInfoConfig> local_136 = local_112.opCall();
                if (local_136)
                {
                    OutResult = local_136.opArrow().EventRewardBuffDesc;
                }
                break;
            }
            case 3:
            {
                TDataObjectPtr<FLevelRandomEventInfoConfig> local_108 = local_112.opCall();
                if (local_108)
                {
                    OutResult = local_108.opArrow().EventRewardBriefDesc;
                }
                break;
            }
            default:
            {
                return false;
            }
            }
        }
        return true;
    }
}

