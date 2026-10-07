

class UESMConditionFailedCallback_BanInputCache : UESMConditionFailedCallback
{
    UPROPERTY()
    UESMInputTriggerAsset BanTrigger;

    UESMConditionFailedCallback_BanInputCache()
    {
        return;
    }
    UFUNCTION()
    void OnConditionFailed_Implementation(const FESMContext &inout Context)
    {
        int local_10 = 0;
        if (this.BanTrigger == nullptr)
        {
            XError(ELog(0), "[UESMConditionFailedCallback_BanInputCache] BanTrigger == nullptr");
            return;
        }
        Has local_8;
        if (!(local_8.opCall()))
        {
            XError(ELog(0), "[UESMConditionFailedCallback_BanInputCache] !Context.Entity.Has<FC_ESMTrigger>()");
            return;
        }
        local_10.Storage.AddBanTrigger(this.BanTrigger.OutputTrigger, Context.Time.WorldTime, FFPTime(this.BanTrigger.CoreTriggerItem.ValidateTime));
        return;
    }
}

