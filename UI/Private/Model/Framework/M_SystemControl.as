namespace FMS_SystemControl
{
    const int ModelId = 0;

}
struct FWidgetTagSystemControlIndexer
{
    UPROPERTY()
    uint16 Num;
    UPROPERTY()
    uint16 Index;

}

struct FMsg_SystemControlAllNotify : FEUIMessage
{
    FMsg_SystemControlAllNotify()
    {
        return;
    }
}

struct FMsg_SystemBlockChanged : FEUIMessage
{
    FMsg_SystemBlockChanged()
    {
        return;
    }
}

struct FMS_SystemControl : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<ESystemModule, uint> m_SystemControlModuleMap;
    UPROPERTY()
    TSet<uint> m_GSLockSystemDataIdSet;
    UPROPERTY()
    TSet<uint> m_LocalLockSystemDataIdSet;
    UPROPERTY()
    TMap<uint, FText> m_GSForbiddenLockSystemTips;
    UPROPERTY()
    TSet<uint> m_GSBlockSystemDataIdSet;
    UPROPERTY()
    TMap<uint, FText> m_GSBlockSystemTips;
    UPROPERTY()
    TMap<uint, FText> m_LocalForbiddenLockSystemTips;
    UPROPERTY()
    TSet<uint> m_LevelLockSystemDataIdSet;
    UPROPERTY()
    TMap<uint, FText> m_LevelForbiddenLockSystemTips;
    UPROPERTY()
    TArray<uint> m_WidgetTagSystemControls;
    UPROPERTY()
    TMap<FGameplayTag, FWidgetTagSystemControlIndexer> m_WidgetTagSystemControlIndexer;

    FMS_SystemControl()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_SystemControl(const FMS_SystemControl &inout Other)
    {
        this.m_SystemControlModuleMap = Other.m_SystemControlModuleMap;
        this.m_GSLockSystemDataIdSet = Other.m_GSLockSystemDataIdSet;
        this.m_LocalLockSystemDataIdSet = Other.m_LocalLockSystemDataIdSet;
        this.m_GSForbiddenLockSystemTips = Other.m_GSForbiddenLockSystemTips;
        this.m_GSBlockSystemDataIdSet = Other.m_GSBlockSystemDataIdSet;
        this.m_GSBlockSystemTips = Other.m_GSBlockSystemTips;
        this.m_LocalForbiddenLockSystemTips = Other.m_LocalForbiddenLockSystemTips;
        this.m_LevelLockSystemDataIdSet = Other.m_LevelLockSystemDataIdSet;
        this.m_LevelForbiddenLockSystemTips = Other.m_LevelForbiddenLockSystemTips;
        this.m_WidgetTagSystemControls = Other.m_WidgetTagSystemControls;
        this.m_WidgetTagSystemControlIndexer = Other.m_WidgetTagSystemControlIndexer;
        return;
    }
    FMS_SystemControl& opAssign(const FMS_SystemControl &inout Other)
    {
        this.m_SystemControlModuleMap = Other.m_SystemControlModuleMap;
        this.m_GSLockSystemDataIdSet = Other.m_GSLockSystemDataIdSet;
        this.m_LocalLockSystemDataIdSet = Other.m_LocalLockSystemDataIdSet;
        this.m_GSForbiddenLockSystemTips = Other.m_GSForbiddenLockSystemTips;
        this.m_GSBlockSystemDataIdSet = Other.m_GSBlockSystemDataIdSet;
        this.m_GSBlockSystemTips = Other.m_GSBlockSystemTips;
        this.m_LocalForbiddenLockSystemTips = Other.m_LocalForbiddenLockSystemTips;
        this.m_LevelLockSystemDataIdSet = Other.m_LevelLockSystemDataIdSet;
        this.m_LevelForbiddenLockSystemTips = Other.m_LevelForbiddenLockSystemTips;
        this.m_WidgetTagSystemControls = Other.m_WidgetTagSystemControls;
        return Other.m_WidgetTagSystemControlIndexer;
    }
    void PostConstruct()
    {
        TArray<FGameplayTag> local_4;
        TArray<FGameplayTag> local_8;
        TArray<uint> local_12;
        TDataObjectIterator<FSystemControlConfig> local_28;
        for (; local_28; )
        {
            const FSystemControlConfig& local_32 = local_28.GetData();
            this.GetModify_SystemControlModuleMap().Add(local_32.SystemModule, local_32.DataId);
            for (auto& local_46 : local_32.GetLockWidgetConfigList())
            {
                if (local_46.IsSet())
                {
                    local_4.AddUnique(local_46.Get().WidgetTag);
                    local_12.Add(local_8.Add(local_46.Get().WidgetTag));
                }
            }
            local_28.Next();
        }
        for (auto& local_62 : local_4)
        {
            FWidgetTagSystemControlIndexer local_64;
            local_64.Index = this.GetModify_WidgetTagSystemControls().Num();
            int local_66 = 0;
            for (; local_66 < local_8.Num(); ++local_66)
            {
                if ((FGameplayTag(local_8[local_66]) == local_62))
                {
                    this.GetModify_WidgetTagSystemControls().Add(local_12[local_66]);
                }
            }
            local_64.Num = this.GetModify_WidgetTagSystemControls().Num();
            this.GetModify_WidgetTagSystemControlIndexer().Add(local_62, local_64);
        }
        this.ApplyLevelSystemControls();
        return;
    }
    void OnECSWorldBegin(const FMsg_ECSWorldBegin &inout Msg)
    {
        this.ApplyLevelSystemControls();
        return;
    }
    void InvalidateEntityCache()
    {
        this.ApplyLevelSystemControls();
        return;
    }
    void ApplyLevelSystemControls()
    {
        int local_113;
        this.GetModify_LevelLockSystemDataIdSet().Reset();
        this.GetModify_LevelForbiddenLockSystemTips().Reset();
        TDataObjectPtr<FLevelInfoConfig> local_48 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
        if (local_48.IsSet())
        {
            TDataObjectPtr<FGameRuleConfig> local_74 = local_48.Get().GetGameRuleConfig();
            if (local_74.IsSet())
            {
                for (auto& local_112 : local_74.Get().GetDisabledSystemControls())
                {
                    if (!(local_112.IsSet()))
                    {
                        continue;
                    }
                    int local_114 = local_112.Get().DataId;
                    local_113 = local_114;
                    this.GetModify_LevelLockSystemDataIdSet().Add(local_113);
                    if (!(local_112.Get().ForbiddenTips.IsEmpty()))
                    {
                        this.GetModify_LevelForbiddenLockSystemTips().FindOrAdd(local_113) = local_112.Get().ForbiddenTips;
                    }
                    XLog(ELog(73), FString().Append("[FMS_SystemControl]ApplyLevelSystemControls. LevelLockSystemDataId:[").Append(local_113).Append("]"));
                }
            }
        }
        this.RebuildLockedWidgetTags();
        return;
    }
    bool IsSystemDataIdLocked(const uint SystemDataId) const
    {
        return this.GetGSLockSystemDataIdSet().Contains(SystemDataId) || this.GetLocalLockSystemDataIdSet().Contains(SystemDataId) || this.GetLevelLockSystemDataIdSet().Contains(SystemDataId);
    }
    bool IsSystemDataIdBlocked(const uint SystemDataId) const
    {
        return this.GetGSBlockSystemDataIdSet().Contains(SystemDataId);
    }
    bool IsSystemDataIdDisabled(const uint SystemDataId) const
    {
        return this.IsSystemDataIdLocked(SystemDataId) || this.IsSystemDataIdBlocked(SystemDataId);
    }
    bool TryGetForbiddenTip(const uint SystemDataId, FText &inout OutTip) const
    {
        if (this.GetGSBlockSystemTips().Find(SystemDataId, OutTip) && !(OutTip.IsEmpty()))
        {
            return true;
        }
        if (this.GetGSForbiddenLockSystemTips().Find(SystemDataId, OutTip) && !(OutTip.IsEmpty()))
        {
            return true;
        }
        if (this.GetLocalForbiddenLockSystemTips().Find(SystemDataId, OutTip) && !(OutTip.IsEmpty()))
        {
            return true;
        }
        if (this.GetLevelForbiddenLockSystemTips().Find(SystemDataId, OutTip) && !(OutTip.IsEmpty()))
        {
            return true;
        }
        return false;
    }
    void RebuildLockedWidgetTags()
    {
        this.GetContext().Manager.ClearLockWidgetTagSet();
        for (auto local_18 : this.GetGSLockSystemDataIdSet())
        {
            this.AddLockedWidgetTagsForSystem(local_18);
        }
        for (auto local_18 : this.GetLocalLockSystemDataIdSet())
        {
            this.AddLockedWidgetTagsForSystem(local_18);
        }
        for (auto local_18 : this.GetLevelLockSystemDataIdSet())
        {
            this.AddLockedWidgetTagsForSystem(local_18);
        }
        for (auto local_18 : this.GetGSBlockSystemDataIdSet())
        {
            this.AddLockedWidgetTagsForSystem(local_18);
        }
        return;
    }
    void AddLockedWidgetTagsForSystem(const uint SystemDataId)
    {
        GetDataObjectByGSDataId<FSystemControlConfig> local_48;
        TDataObjectPtr<FSystemControlConfig> local_24 = local_48.opImplConv();
        if (!(local_24.IsSet()))
        {
            return;
        }
        for (auto& local_112 : local_24.Get().GetLockWidgetConfigList())
        {
            if (local_112.IsSet())
            {
                this.GetContext().Manager.AddLockWidgetTag(local_112.Get().WidgetTag);
            }
        }
        return;
    }
    bool IsSystemUnlock(const ESystemModule InModule, const bool bShowTips = true) const
    {
        int local_1;
        if (this.GetSystemControlModuleMap().Find(InModule, local_1))
        {
            bool local_2 = this.IsSystemDataIdDisabled(local_1);
            if ((bShowTips && local_2))
            {
                FText local_8;
                if (this.TryGetForbiddenTip(local_1, local_8))
                {
                    FCommonTipsParam local_12;
                    ::CommonPopup::WeakTips(local_8, local_12);
                }
            }
            return !(local_2);
        }
        return true;
    }
    bool IsSystemUnlock(const TDataObjectPtr<FSystemControlConfig> &inout InSystemControlConfig, const bool bShowTips = true) const
    {
        if (InSystemControlConfig.IsSet())
        {
            return this.IsSystemUnlock(InSystemControlConfig.Get().SystemModule, bShowTips);
        }
        return true;
    }
    bool IsSystemBlocked(const ESystemModule InModule) const
    {
        int local_1;
        if (this.GetSystemControlModuleMap().Find(InModule, local_1))
        {
            return this.IsSystemDataIdBlocked(local_1);
        }
        return false;
    }
    bool IsSystemBlocked(const TDataObjectPtr<FSystemControlConfig> &inout InSystemControlConfig) const
    {
        if (InSystemControlConfig.IsSet())
        {
            return this.IsSystemBlocked(InSystemControlConfig.Get().SystemModule);
        }
        return false;
    }
    bool IsSystemLockedByLockSources(const ESystemModule InModule) const
    {
        int local_1;
        if (this.GetSystemControlModuleMap().Find(InModule, local_1))
        {
            return this.IsSystemDataIdLocked(local_1);
        }
        return false;
    }
    bool IsSystemLockedByLockSources(const TDataObjectPtr<FSystemControlConfig> &inout InSystemControlConfig) const
    {
        if (InSystemControlConfig.IsSet())
        {
            return this.IsSystemLockedByLockSources(InSystemControlConfig.Get().SystemModule);
        }
        return false;
    }
    bool TryGetBlockTip(const ESystemModule InModule, FText &inout OutTip) const
    {
        int local_1;
        if (this.GetSystemControlModuleMap().Find(InModule, local_1))
        {
            if (this.GetGSBlockSystemTips().Find(local_1, OutTip) && !(OutTip.IsEmpty()))
            {
                return true;
            }
        }
        return false;
    }
    bool IsWidgetLocked(const FGameplayTag &inout WidgetTag) const
    {
        TConstRawPtr<FWidgetTagSystemControlIndexer> local_4 = this.GetWidgetTagSystemControlIndexer().Find(WidgetTag);
        if (local_4)
        {
            int local_6;
            int local_7 = local_4.opArrow().Index;
            local_6 = local_7;
            for (; local_6 < local_4.opArrow().Num; ++local_6)
            {
                if (this.IsSystemDataIdDisabled(this.GetWidgetTagSystemControls()[local_6]))
                {
                    return true;
                }
            }
        }
        return false;
    }
    void GS_OnSystemControlAllNotify(const FPbSystemControlAllNotify &inout Notify)
    {
        int local_15;
        GetDataObjectByGSDataId<FSystemControlConfig> local_64;
        XLog(ELog(73), FString().Append("[FMS_SystemControl]GS_OnSystemControlAllNotify."));
        this.GetModify_GSLockSystemDataIdSet().Reset();
        this.GetModify_GSForbiddenLockSystemTips().Reset();
        this.GetModify_GSBlockSystemDataIdSet().Reset();
        this.GetModify_GSBlockSystemTips().Reset();
        TArray<uint> local_10;
        Notify.GetLimitSystems(local_10);
        int local_11 = 0;
        for (; local_11 < local_10.Num(); )
        {
            local_15 = local_10[local_11];
            this.GetModify_GSLockSystemDataIdSet().Add(local_15);
            TDataObjectPtr<FSystemControlConfig> local_40 = local_64.opImplConv();
            if (local_40.IsSet())
            {
                this.GetModify_GSForbiddenLockSystemTips().Add(local_15, local_40.Get().ForbiddenTips);
            }
            XLog(ELog(73), FString().Append("[FMS_SystemControl]GS_OnSystemControlAllNotify. LimitSystemDataId:[").Append(local_15).Append("]"));
            ++local_11;
        }
        TArray<uint> local_116;
        Notify.GetBlockSystems(local_116);
        int local_11_2 = 0;
        for (; local_11_2 < local_116.Num(); )
        {
            local_15 = local_116[local_11_2];
            this.GetModify_GSBlockSystemDataIdSet().Add(local_15);
            TDataObjectPtr<FSystemControlConfig> local_40_2 = local_64.opImplConv();
            if (local_40_2.IsSet())
            {
                this.GetModify_GSBlockSystemTips().Add(local_15, local_40_2.Get().ForbiddenTips);
            }
            XLog(ELog(73), FString().Append("[FMS_SystemControl]GS_OnSystemControlAllNotify. BlockSystemDataId:[").Append(local_15).Append("]"));
            ++local_11_2;
        }
        this.RebuildLockedWidgetTags();
        FEUIModelRef local_122 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_122);
        return;
    }
    void GS_OnSystemControlOpenNotify(const FPbSystemControlOpenNotify &inout Notify)
    {
        int local_15;
        GetDataObjectByGSDataId<FSystemControlConfig> local_64;
        XLog(ELog(73), FString().Append("[FMS_SystemControl]GS_OnSystemControlOpenNotify."));
        TArray<uint> local_10;
        Notify.GetNewLimitSystems(local_10);
        int local_11 = 0;
        for (; local_11 < local_10.Num(); )
        {
            local_15 = local_10[local_11];
            this.GetModify_GSLockSystemDataIdSet().Add(local_15);
            TDataObjectPtr<FSystemControlConfig> local_40 = local_64.opImplConv();
            if (local_40.IsSet())
            {
                this.GetModify_GSForbiddenLockSystemTips().Add(local_15, local_40.Get().ForbiddenTips);
            }
            XLog(ELog(73), FString().Append("[FMS_SystemControl]GS_OnSystemControlOpenNotify. NewLimitSystemDataId:[").Append(local_15).Append("]"));
            ++local_11;
        }
        TArray<uint> local_116;
        Notify.GetNewOpenSystems(local_116);
        int local_11_2 = 0;
        for (; local_11_2 < local_116.Num(); ++local_11_2)
        {
            local_15 = local_116[local_11_2];
            if (this.GetModify_GSLockSystemDataIdSet().Remove(local_15))
            {
                this.GetModify_GSForbiddenLockSystemTips().Remove(local_15);
                TDataObjectPtr<FSystemControlConfig> local_40_2 = local_64.opImplConv();
                if (local_40_2.IsSet())
                {
                    FEUIModelRef local_122 = FEUIModelRef(this);
                    FEUIMessageBus::Publish(EUIMessageBus);
                    FMsg_SystemUnlockFromGS local_124;
                    local_124.SystemModule = local_40_2.Get().SystemModule;
                    if (local_40_2.Get().bShowUnlockMessageHint)
                    {
                        TArray<FTextArgument> local_130;
                        Make local_136;
                        local_130.Add(local_136.opImplConv());
                        ::MessageHintUtils::ShowMessageHint(this.GetContext().GetLocalPlayer(), ::UCombatGlobalSettings::Get().SystemUnlockHint, local_130);
                    }
                    if (local_40_2.Get().GetRedPointCfg().IsSet())
                    {
                        TArray<uint64> local_152;
                        for (auto local_166 : local_40_2.Get().ExtraArgs)
                        {
                            local_152.AddUnique(local_166);
                        }
                        ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(local_40_2.Get().GetRedPointCfg().Get().EventType, local_152);
                    }
                }
                XLog(ELog(73), FString().Append("[FMS_SystemControl]GS_OnSystemControlOpenNotify. NewOpenSystemDataId:[").Append(local_15).Append("]"));
            }
        }
        bool local_170 = false;
        TArray<uint> local_174;
        Notify.GetNewBlockSystems(local_174);
        int local_11_3 = 0;
        for (; local_11_3 < local_174.Num(); )
        {
            local_15 = local_174[local_11_3];
            this.GetModify_GSBlockSystemDataIdSet().Add(local_15);
            local_170 = true;
            TDataObjectPtr<FSystemControlConfig> local_40_3 = local_64.opImplConv();
            if (local_40_3.IsSet())
            {
                this.GetModify_GSBlockSystemTips().Add(local_15, local_40_3.Get().ForbiddenTips);
            }
            XLog(ELog(73), FString().Append("[FMS_SystemControl]GS_OnSystemControlOpenNotify. NewBlockSystemDataId:[").Append(local_15).Append("]"));
            ++local_11_3;
        }
        TArray<uint> local_178;
        Notify.GetNewUnblockSystems(local_178);
        int local_11_4 = 0;
        for (; local_11_4 < local_178.Num(); ++local_11_4)
        {
            local_15 = local_178[local_11_4];
            if (this.GetModify_GSBlockSystemDataIdSet().Remove(local_15))
            {
                this.GetModify_GSBlockSystemTips().Remove(local_15);
                local_170 = true;
                XLog(ELog(73), FString().Append("[FMS_SystemControl]GS_OnSystemControlOpenNotify. NewUnblockSystemDataId:[").Append(local_15).Append("]"));
            }
        }
        this.RebuildLockedWidgetTags();
        if (local_170)
        {
            FEUIModelRef local_122_2 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus).opCall(local_122_2);
        }
        return;
    }
    void GS_OnSystemControlLimitNotify(const FPbSystemControlLimitNotify &inout Notify)
    {
        XLog(ELog(73), FString().Append("[FMS_SystemControl]GS_OnSystemControlLimitNotify."));
        TArray<FPbSystemControlLimitInfo> local_10;
        Notify.GetLimitInfo(local_10);
        for (auto& local_26 : local_10)
        {
            int local_28 = local_26.GetSystemId();
            this.GetModify_GSLockSystemDataIdSet().Add(local_28);
            this.GetModify_GSForbiddenLockSystemTips().FindOrAdd(local_28) = FText::FromString(local_26.GetLimitTips());
            XLog(ELog(73), FString().Append("[FMS_SystemControl]GS_OnSystemControlLimitNotify. ForbiddenSystemDataId:[").Append(local_28).Append("]"));
        }
        this.RebuildLockedWidgetTags();
        return;
    }
    void NotifySystemControlChanged(const uint SystemDataId)
    {
        GetDataObjectByGSDataId<FSystemControlConfig> local_48;
        TDataObjectPtr<FSystemControlConfig> local_24 = local_48.opImplConv();
        if (local_24.IsSet())
        {
            FEUIModelRef local_104 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            FMsg_SystemUnlockFromGS local_106;
            local_106.SystemModule = local_24.Get().SystemModule;
        }
        return;
    }
    void OnLBPDisableSystemControl(const FCE_LBPDisableSystemControl &inout Event)
    {
        int local_1 = int(Event.SystemDataId);
        this.GetModify_LocalLockSystemDataIdSet().Add(local_1);
        if (!(Event.ForbiddenTips.IsEmpty()))
        {
            this.GetModify_LocalForbiddenLockSystemTips().FindOrAdd(local_1) = FText::FromString(Event.ForbiddenTips);
        }
        this.RebuildLockedWidgetTags();
        this.NotifySystemControlChanged(local_1);
        XLog(ELog(73), FString().Append("[FMS_SystemControl]OnLBPDisableSystemControl. SystemDataId:[").Append(local_1).Append("]"));
        return;
    }
    void OnLBPEnableSystemControl(const FCE_LBPEnableSystemControl &inout Event)
    {
        int local_1 = int(Event.SystemDataId);
        if (this.GetModify_LocalLockSystemDataIdSet().Remove(local_1))
        {
            this.GetModify_LocalForbiddenLockSystemTips().Remove(local_1);
            this.RebuildLockedWidgetTags();
            this.NotifySystemControlChanged(local_1);
        }
        XLog(ELog(73), FString().Append("[FMS_SystemControl]OnLBPEnableSystemControl. SystemDataId:[").Append(local_1).Append("]"));
        return;
    }
    void HandleOnCreateWidgetLocked(const FMsg_OnCreateWidgetLocked &inout Result)
    {
        FText local_4;
        if (!(!(Result.WidgetConfig.IsValid())) && ::UCombatGlobalSettings::Get().SystemWidgetLockHintMap.Find(TDataObjectPtr<FEUIWidgetConfig>(Result.WidgetConfig), local_4))
        {
            FCommonTipsParam local_38;
            ::CommonPopup::WeakTips(local_4, local_38);
        }
        return;
    }
    const TMap<ESystemModule, uint> GetSystemControlModuleMap() const property
    {
        const TMap<ESystemModule, uint> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<ESystemModule, uint> GetModify_SystemControlModuleMap() property
    {
        TMap<ESystemModule, uint> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSystemControlModuleMap(const TMap<ESystemModule, uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SystemControlModuleMap = __Value;
        return;
    }
    const TSet<uint> GetGSLockSystemDataIdSet() const property
    {
        const TSet<uint> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TSet<uint> GetModify_GSLockSystemDataIdSet() property
    {
        TSet<uint> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetGSLockSystemDataIdSet(const TSet<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_GSLockSystemDataIdSet = __Value;
        return;
    }
    const TSet<uint> GetLocalLockSystemDataIdSet() const property
    {
        const TSet<uint> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TSet<uint> GetModify_LocalLockSystemDataIdSet() property
    {
        TSet<uint> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetLocalLockSystemDataIdSet(const TSet<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LocalLockSystemDataIdSet = __Value;
        return;
    }
    const TMap<uint, FText> GetGSForbiddenLockSystemTips() const property
    {
        const TMap<uint, FText> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<uint, FText> GetModify_GSForbiddenLockSystemTips() property
    {
        TMap<uint, FText> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetGSForbiddenLockSystemTips(const TMap<uint, FText> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_GSForbiddenLockSystemTips = __Value;
        return;
    }
    const TSet<uint> GetGSBlockSystemDataIdSet() const property
    {
        const TSet<uint> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TSet<uint> GetModify_GSBlockSystemDataIdSet() property
    {
        TSet<uint> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetGSBlockSystemDataIdSet(const TSet<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_GSBlockSystemDataIdSet = __Value;
        return;
    }
    const TMap<uint, FText> GetGSBlockSystemTips() const property
    {
        const TMap<uint, FText> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TMap<uint, FText> GetModify_GSBlockSystemTips() property
    {
        TMap<uint, FText> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetGSBlockSystemTips(const TMap<uint, FText> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_GSBlockSystemTips = __Value;
        return;
    }
    const TMap<uint, FText> GetLocalForbiddenLockSystemTips() const property
    {
        const TMap<uint, FText> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TMap<uint, FText> GetModify_LocalForbiddenLockSystemTips() property
    {
        TMap<uint, FText> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetLocalForbiddenLockSystemTips(const TMap<uint, FText> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_LocalForbiddenLockSystemTips = __Value;
        return;
    }
    const TSet<uint> GetLevelLockSystemDataIdSet() const property
    {
        const TSet<uint> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TSet<uint> GetModify_LevelLockSystemDataIdSet() property
    {
        TSet<uint> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetLevelLockSystemDataIdSet(const TSet<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_LevelLockSystemDataIdSet = __Value;
        return;
    }
    const TMap<uint, FText> GetLevelForbiddenLockSystemTips() const property
    {
        const TMap<uint, FText> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TMap<uint, FText> GetModify_LevelForbiddenLockSystemTips() property
    {
        TMap<uint, FText> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetLevelForbiddenLockSystemTips(const TMap<uint, FText> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_LevelForbiddenLockSystemTips = __Value;
        return;
    }
    const TArray<uint> GetWidgetTagSystemControls() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TArray<uint> GetModify_WidgetTagSystemControls() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetWidgetTagSystemControls(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_WidgetTagSystemControls = __Value;
        return;
    }
    const TMap<FGameplayTag, FWidgetTagSystemControlIndexer> GetWidgetTagSystemControlIndexer() const property
    {
        const TMap<FGameplayTag, FWidgetTagSystemControlIndexer> __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    TMap<FGameplayTag, FWidgetTagSystemControlIndexer> GetModify_WidgetTagSystemControlIndexer() property
    {
        TMap<FGameplayTag, FWidgetTagSystemControlIndexer> __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetWidgetTagSystemControlIndexer(const TMap<FGameplayTag, FWidgetTagSystemControlIndexer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_WidgetTagSystemControlIndexer = __Value;
        return;
    }
}

namespace FMS_SystemControl
{
FMS_SystemControl& Get(const UObject ContextObject)
{
    return FMS_SystemControl::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_SystemControl& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FMS_SystemControl>(EUIInternal::MakeModelWithManager(Manager, FMS_SystemControl::ModelId)).Get();
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnECSWorldBegin";
    local_14.MessageTypeName = "Msg_ECSWorldBegin";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    FEUIModelProtoRspDefine local_24;
    local_24.FunctionName = "__GS_OnSystemControlAllNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnSystemControlOpenNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnSystemControlLimitNotify";
    Result.ProtoRspDefines.Add(local_24);
    FEUIModelEventDefine local_32;
    local_32.FunctionName = "__OnLBPDisableSystemControl";
    local_32.EventType = FCE_LBPDisableSystemControl;
    Result.EventFunctions.Add(local_32);
    local_32.FunctionName = "__OnLBPEnableSystemControl";
    local_32.EventType = FCE_LBPEnableSystemControl;
    Result.EventFunctions.Add(local_32);
    local_14.FunctionName = "__HandleOnCreateWidgetLocked";
    local_14.MessageTypeName = "Msg_OnCreateWidgetLocked";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_SystemControl;
}
void __OnECSWorldBegin(FMS_SystemControl &inout Model, const FMsg_ECSWorldBegin &inout Message)
{
    Model.OnECSWorldBegin(Message);
    return;
}
void __GS_OnSystemControlAllNotify(FMS_SystemControl &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnSystemControlAllNotify(FPbSystemControlAllNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnSystemControlOpenNotify(FMS_SystemControl &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnSystemControlOpenNotify(FPbSystemControlOpenNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnSystemControlLimitNotify(FMS_SystemControl &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnSystemControlLimitNotify(FPbSystemControlLimitNotify::FromWrapper(ProtoWrapper));
    return;
}
void __OnLBPDisableSystemControl(FMS_SystemControl &inout Model, const FCE_LBPDisableSystemControl &inout Event)
{
    Model.OnLBPDisableSystemControl(Event);
    return;
}
void __OnLBPEnableSystemControl(FMS_SystemControl &inout Model, const FCE_LBPEnableSystemControl &inout Event)
{
    Model.OnLBPEnableSystemControl(Event);
    return;
}
void __HandleOnCreateWidgetLocked(FMS_SystemControl &inout Model, const FMsg_OnCreateWidgetLocked &inout Message)
{
    Model.HandleOnCreateWidgetLocked(Message);
    return;
}
int __IndexOf_SystemControlModuleMap()
{
    return 0;
}
int __IndexOf_GSLockSystemDataIdSet()
{
    return 1;
}
int __IndexOf_LocalLockSystemDataIdSet()
{
    return 2;
}
int __IndexOf_GSForbiddenLockSystemTips()
{
    return 3;
}
int __IndexOf_GSBlockSystemDataIdSet()
{
    return 4;
}
int __IndexOf_GSBlockSystemTips()
{
    return 5;
}
int __IndexOf_LocalForbiddenLockSystemTips()
{
    return 6;
}
int __IndexOf_LevelLockSystemDataIdSet()
{
    return 7;
}
int __IndexOf_LevelForbiddenLockSystemTips()
{
    return 8;
}
int __IndexOf_WidgetTagSystemControls()
{
    return 9;
}
int __IndexOf_WidgetTagSystemControlIndexer()
{
    return 10;
}
}
