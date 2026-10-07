

class UWidget_SkillResAnimCache : UObject
{
    UPROPERTY()
    UEUIUserWidget OwnerWidget;
    UPROPERTY()
    bool bInited = false;
    UPROPERTY()
    TArray<UWidgetAnimation> CachedAnims;
    UPROPERTY()
    TArray<UWidgetAnimation> CachedStopAnims;
    UPROPERTY()
    TArray<float> CachedStartTimes;
    bool bPendingVisible;


    void Init(const UEUIUserWidget InOwner)
    {
        if (this.bInited)
        {
            return;
        }
        this.OwnerWidget.SetTickAnimationsWhenHidden(true);
        this.bInited = true;
        return;
    }
    void Play(const UWidgetAnimation Anim)
    {
        this.OwnerWidget.PlayAnimation(Anim, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    void Stop(const UWidgetAnimation Anim)
    {
        this.OwnerWidget.StopAnimation(Anim);
        return;
    }
    void Clear()
    {
        this.CachedAnims.Empty(0);
        this.CachedStartTimes.Empty(0);
        this.CachedStopAnims.Empty(0);
        return;
    }
    void OnHandleActualVisibleStateChanged(const bool bVisible)
    {
        return;
    }
    UFUNCTION()
    void ApplyVisibilityChanged()
    {
        this.OnOwnerVisibilityChanged(this.bPendingVisible);
        return;
    }
    UFUNCTION()
    void OnOwnerVisibilityChanged(const bool bVisible)
    {
        if (this.OwnerWidget == nullptr)
        {
            return;
        }
        if (!(bVisible))
        {
            return;
        }
        this.ResyncFromCache();
        return;
    }
    void RecordPlay(const UWidgetAnimation Anim)
    {
        UWidgetAnimation local_12;
        float local_6 = this.GetNowRealTime();
        int local_7 = 0;
        for (; local_7 < this.CachedAnims.Num(); ++local_7)
        {
            local_12 = this.CachedAnims[local_7];
            if (local_12 == Anim)
            {
                this.CachedStartTimes[local_7] = local_6;
                return;
            }
        }
        this.CachedAnims.Add(Anim);
        this.CachedStartTimes.Add(local_6);
        return;
    }
    void RemoveFromCache(const UWidgetAnimation Anim)
    {
        UWidgetAnimation local_6;
        this.CachedStopAnims.Add(Anim);
        int local_2 = 0;
        for (; local_2 < this.CachedAnims.Num(); ++local_2)
        {
            local_6 = this.CachedAnims[local_2];
            if (local_6 == Anim)
            {
                this.CachedAnims.RemoveAt(local_2);
                this.CachedStartTimes.RemoveAt(local_2);
                break;
            }
        }
        return;
    }
    void ResyncFromCache()
    {
        int local_32;
        UWidgetAnimation local_34;
        for (auto& local_16 : this.CachedStopAnims)
        {
            this.OwnerWidget.StopAnimation(local_16);
        }
        float local_20 = this.GetNowRealTime();
        TArray<int> local_28 = this.GetIndicesSortedByStartTime();
        int local_29 = 0;
        for (; local_29 < local_28.Num(); ++local_29)
        {
            local_32 = local_28[local_29];
            local_34 = this.CachedAnims[local_32];
            if (local_34 == nullptr)
            {
                continue;
            }
            float local_36 = local_34.GetStartTime();
            float local_40 = local_34.GetEndTime();
            this.OwnerWidget.PlayAnimation(local_34, float32((FMath::Clamp(local_36 + (local_20 - this.CachedStartTimes[local_32]), local_36, local_40))), 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        return;
    }
    TArray<int> GetIndicesSortedByStartTime() const
    {
        int local_9;
        TArray<int> local_4;
        int local_5 = 0;
        for (; local_5 < this.CachedAnims.Num(); )
        {
            local_4.Add(local_5);
            ++local_5;
        }
        int local_5_2 = 1;
        for (; local_5_2 < local_4.Num(); )
        {
            local_9 = local_4[local_5_2];
            int local_6 = local_5_2 - 1;
            while (local_6 >= 0 && (this.CachedStartTimes[local_4[local_6]] > this.CachedStartTimes[local_9]))
            {
                local_4[(local_6 + 1)] = local_4[local_6];
                --local_6;
            }
            local_4[(local_6 + 1)] = local_9;
            ++local_5_2;
        }
        return local_4;
    }
    float GetNowRealTime() const
    {
        return ECS::GetContextTime().ToSeconds();
    }
}

