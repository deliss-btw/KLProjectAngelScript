

// NOTE: class defaults are not authored in this module: FMissionAction_NotifyChapterStart (default scalar field FMissionActionBase.ActionType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FMissionAction_NotifyChapterStart : FMissionActionBase
{
    FMissionActionBase _base_FMissionActionBase;
    UPROPERTY()
    TDataObjectPtr<FChapterConfig> ChapterConfig;

    FMissionAction_NotifyChapterStart()
    {
        this.__InitDefaults();
        return;
    }
    EMissionActionStatus TickAction_Implementation(const FMissionActionContext &inout Context)
    {
        int local_18 = 0;
        int local_48 = 0;
        if (!(this.ChapterConfig.IsSet()))
        {
            XError(ELog(63), FString().Append("ChapterConfig is not set, NotifyChapterStart Action is invalid"));
            return EMissionActionStatus(4);
        }
        FFPTime local_14 = FFPTime(-1);
        local_18.ChapterConfig = this.ChapterConfig;
        FFPTime local_14_2 = FFPTime(-1);
        local_48.ChapterConfig = this.ChapterConfig;
        return EMissionActionStatus(3);
    }
}

struct FMissionAction_NotifyChapterEnd : FMissionActionBase
{
    FMissionActionBase _base_FMissionActionBase;
    UPROPERTY()
    TDataObjectPtr<FChapterConfig> ChapterConfig;

    FMissionAction_NotifyChapterEnd()
    {
        this.__InitDefaults();
        return;
    }
    EMissionActionStatus TickAction_Implementation(const FMissionActionContext &inout Context)
    {
        int local_18 = 0;
        int local_48 = 0;
        if (!(this.ChapterConfig.IsSet()))
        {
            XError(ELog(63), FString().Append("ChapterConfig is not set, NotifyChapterEnd Action is invalid"));
            return EMissionActionStatus(4);
        }
        FFPTime local_14 = FFPTime(-1);
        local_18.ChapterConfig = this.ChapterConfig;
        FFPTime local_14_2 = FFPTime(-1);
        local_48.ChapterConfig = this.ChapterConfig;
        return EMissionActionStatus(3);
    }
}

