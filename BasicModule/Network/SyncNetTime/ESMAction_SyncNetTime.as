
enum ESyncNetTimePreset
{
    Default,
    BeHit,
    Connect,
    Interaction,
    SyncAfterHit,
    RefreshSync,
}

const FFPTime MinSyncEnterRange = FFPTime();
const FFPTime MinSyncActiveRange = FFPTime();
const FFPTime MinSyncExitRange = FFPTime();

class UESMAction_SyncNetTime : UESMSyncNetTimeAction
{
    UPROPERTY()
    ESyncNetTimePreset Preset;
    UPROPERTY()
    bool bNeedSyncEnter = false;
    UPROPERTY()
    bool bNeedSyncExit = false;
    UPROPERTY()
    FFPTime SimpleEnterDuration = 0.25;
    UPROPERTY()
    bool bNoSimpleExitDuration = false;
    UPROPERTY()
    FFPTime SimpleExitTime = 0.6;


    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        UEnum local_2 = UEnum::GetEnumType(n"ESyncNetTimePreset");
        int64 local_14 = int(this.Preset);
        return FString().Append("SyncNetTime: ").Append(local_2.GetDisplayNameTextByValue(local_14).ToString());
    }
    UFUNCTION()
    void OnPostInitData_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        return;
    }
    UFUNCTION()
    void OnExtraTimeStampChanged_Implementation(const int Index, const FESMExtraTimeStamp &inout ChangedExtraTimeStamp)
    {
        if (Index == 0)
        {
            this.SimpleEnterDuration = ChangedExtraTimeStamp.ActionTime.ToSeconds();
            return;
        }
        this.SimpleExitTime = ChangedExtraTimeStamp.ActionTime.ToSeconds();
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        bool local_2;
        bool local_1 = false;
        bool local_3 = false;
        bool local_4 = false;
        bool local_5 = false;
        bool local_6 = false;
        bool local_7 = false;
        bool local_8 = false;
        bool local_9 = false;
        FFPTime local_12 = 0.0;
        FFPTime local_16 = 0.0;
        bool local_17 = false;
        switch (int(this.Preset))
        {
        case 0:
        {
            local_3 = true;
            local_4 = true;
            local_8 = true;
            local_9 = true;
            local_12 = this.SimpleEnterDuration;
            local_16 = (FFPTime(this.GetDuration()) - this.SimpleExitTime);
            break;
        }
        case 1:
        {
            local_1 = true;
            local_3 = false;
            local_4 = false;
            local_8 = false;
            local_9 = true;
            local_12 = 0;
            local_16 = (FFPTime(this.GetDuration()) - this.SimpleExitTime);
            break;
        }
        case 2:
        {
            local_6 = true;
            break;
        }
        case 3:
        {
            local_3 = false;
            local_4 = false;
            local_8 = true;
            local_9 = true;
            local_12 = this.SimpleEnterDuration;
            local_16 = (FFPTime(this.GetDuration()) - this.SimpleExitTime);
            break;
        }
        case 4:
        {
            local_7 = true;
            local_4 = true;
            local_9 = true;
            local_16 = (FFPTime(this.GetDuration()) - this.SimpleExitTime);
            break;
        }
        case 5:
        {
            local_3 = true;
            local_4 = true;
            local_8 = true;
            local_9 = true;
            local_12 = this.SimpleEnterDuration;
            local_16 = (FFPTime(this.GetDuration()) - this.SimpleExitTime);
            local_5 = true;
            break;
        }
        }
        bool local_28 = this.bNoSimpleExitDuration || (int(this.NotifyType) == 2);
        if (local_28)
        {
            local_9 = false;
            local_16 = 0.0;
        }
        if (local_17)
        {
            local_28 = true;
        }
        else
        {
            local_2 = !(this.GetbForBeHit());
            local_2 = (local_2 != !(local_1));
            local_28 = local_2;
        }
        if (local_28)
        {
            local_28 = true;
        }
        else
        {
            local_2 = !(this.GetbShrinkEntryOnServer());
            local_2 = (local_2 != !(local_3));
            local_28 = local_2;
        }
        if (local_28)
        {
            local_28 = true;
        }
        else
        {
            local_2 = !(this.GetbExtendExitOnServer());
            local_2 = (local_2 != !(local_4));
            local_28 = local_2;
        }
        if (local_28)
        {
            local_28 = true;
        }
        else
        {
            local_2 = !(this.GetbRefreshSyncWeight());
            local_2 = (local_2 != !(local_5));
            local_28 = local_2;
        }
        if (local_28)
        {
            local_28 = true;
        }
        else
        {
            local_2 = !(this.GetbMaintainOnEntry());
            local_2 = (local_2 != !(local_6));
            local_28 = local_2;
        }
        if (local_28)
        {
            local_28 = true;
        }
        else
        {
            local_2 = !(this.GetbUseToFadeOutOnly());
            local_2 = (local_2 != !(local_7));
            local_28 = local_2;
        }
        if (local_28)
        {
            local_28 = true;
        }
        else
        {
            local_2 = !(this.bNeedSyncEnter);
            local_2 = (local_2 != !(local_8));
            local_28 = local_2;
        }
        if (local_28)
        {
            local_28 = true;
        }
        else
        {
            local_2 = !(this.bNeedSyncExit);
            local_2 = (local_2 != !(local_9));
            local_28 = local_2;
        }
        local_2 = local_28 || !((FFPTime(this.SyncEnterDuration) == local_12));
        if (local_2 || !((FFPTime(this.SyncExitDuration) == local_16)))
        {
            local_2 = true;
            this.SetbForBeHit(local_1);
            this.SetbShrinkEntryOnServer(local_3);
            this.SetbExtendExitOnServer(local_4);
            this.SetbRefreshSyncWeight(local_5);
            this.SetbMaintainOnEntry(local_6);
            this.SetbUseToFadeOutOnly(local_7);
            this.bNeedSyncEnter = local_8;
            this.bNeedSyncExit = local_9;
            this.SyncEnterDuration = local_12;
            this.SyncExitDuration = local_16;
        }
        return;
    }
}

