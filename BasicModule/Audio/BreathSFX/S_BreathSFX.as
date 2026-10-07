
const FConsoleVariable CVar_BreathSFXSystem_EnableDebug = FConsoleVariable();
const FConsoleVariable CVar_BreathSFXSystem_ShowBitFlag = FConsoleVariable();

class US_BreathSFX : UECSScriptSystem
{
    US_BreathSFX()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Monitor_SFXStateAssign(const FECSEntity &inout Entity, const FC_SFXState &inout State) const
    {
        int64 local_8 = 0;
        int local_14 = FMath::Min(State.GetEnableCountersNum(), 64);
        int local_15 = 0;
        for (; local_15 < local_14; ++local_15)
        {
            if (State.IsSFXActive(local_15))
            {
                local_8 = local_8 | (1 << local_15);
            }
        }
        FC_SFXStatePresentation local_6;
        local_6.LastEnableBitFlags = local_8;
        this.HandleSFXStateChange(Entity, State, local_8, 0);
        return;
    }
    UFUNCTION()
    void Monitor_SFXStateModify(const FECSEntity &inout Entity, const FC_SFXState &inout State) const
    {
        int64 local_8 = 0;
        int local_14 = FMath::Min(State.GetEnableCountersNum(), 64);
        int local_15 = 0;
        for (; local_15 < local_14; ++local_15)
        {
            if (State.IsSFXActive(local_15))
            {
                local_8 = local_8 | (1 << local_15);
            }
        }
        FC_SFXStatePresentation local_6;
        int64 local_18 = local_6.LastEnableBitFlags;
        if (local_8 != local_18)
        {
            local_6.LastEnableBitFlags = local_8;
            this.HandleSFXStateChange(Entity, State, local_8, local_18);
        }
        return;
    }
    UFUNCTION()
    void Monitor_SFXStateRemove(const FECSEntity &inout Entity, const FC_SFXState &inout State) const
    {
        FC_SFXStatePresentation local_8;
        int local_28 = 0;
        if (!(Entity.IsValid()))
        {
            return;
        }
        XLogIf(CVar_BreathSFXSystem_EnableDebug.GetBool(), ELog(1), FString().Append("Monitor_SFXStateRemove: е®ћдЅ“ ").Append(Entity.ToString()).Append(" зљ„FC_SFXStateз»„д»¶иў«з§»й™¤"));
        Has local_22;
        bool local_1 = local_22.opCall();
        if (local_1)
        {
            XLogIf(CVar_BreathSFXSystem_EnableDebug.GetBool(), ELog(1), FString().Append("Monitor_SFXStateRemove: жЈЂжџҐеЃњж­ўжЁЎејЏпјЊж•°й‡Џ: ").Append(local_28.BreathDisablePatterns.Num()));
            int local_30 = 0;
            for (; local_30 < local_28.BreathDisablePatterns.Num(); ++local_30)
            {
                int64 local_36 = local_8.LastEnableBitFlags & (1 << local_30);
                if (local_36 != 0)
                {
                    XLogIf(CVar_BreathSFXSystem_EnableDebug.GetBool(), ELog(1), FString().Append("Monitor_SFXStateRemove: з»„д»¶ ").Append(local_30).Append(" д№‹е‰ЌжЇеђЇз”Ёзљ„пјЊе‡†е¤‡ж’­ж”ѕеЃњж­ўйџіж•€"));
                    ::BreathSFXUtils::PlayDisableBreathAudio(Entity, local_30);
                    continue;
                }
                XLogIf(CVar_BreathSFXSystem_EnableDebug.GetBool(), ELog(1), FString().Append("Monitor_SFXStateRemove: з»„д»¶ ").Append(local_30).Append(" д№‹е‰ЌдёЌжЇеђЇз”Ёзљ„пјЊи·іиї‡еЃњж­ўйџіж•€"));
            }
        }
        else
        {
            XLogIf(CVar_BreathSFXSystem_EnableDebug.GetBool(), ELog(1), FString().Append("Monitor_SFXStateRemove: е®ћдЅ“ ").Append(Entity.ToString()).Append(" жІЎжњ‰FC_SFXStateConfigз»„д»¶"));
        }
        local_8.LastEnableBitFlags = 0;
        XLogIf(CVar_BreathSFXSystem_EnableDebug.GetBool(), ELog(1), FString().Append("Monitor_SFXStateRemove: е·Іжё…й›¶LastEnableBitFlags"));
        return;
    }
    UFUNCTION()
    void Job_DebugSFXStates(const FECSEntity &inout Entity, const FC_SFXState &inout State, const FC_SFXStateConfig &inout Config, const FC_SFXStatePresentation &inout Presentation) const
    {
        FString local_312;
        if (!(CVar_BreathSFXSystem_EnableDebug.GetBool()))
        {
            return;
        }
        FString local_6 = "Unknown";
        if (int(::GetPrefabType(Entity)) == 2)
        {
            local_6 = ::FASCommonUtils::GetMonsterConfigData(Entity).DisplayName.ToString();
        }
        else
        {
            local_6 = "Entity";
        }
        int local_9 = State.GetEnableCountersNum();
        int local_314 = 0;
        int local_315 = 0;
        for (; local_315 < State.GetEnableCountersNum(); ++local_315)
        {
            if (State.IsSFXActive(local_315))
            {
                ++local_314;
            }
        }
        Print(FString().Append("=== е®ћдЅ“: ").Append(local_6).Append(" (ID: ").Append(Entity.GetId().GetIdValue()).Append(") ==="), 99999.0f, FLinearColor::Yellow);
        Print(FString().Append("жЂ»з»„д»¶ж•°: ").Append(local_9).Append(" | жґ»и·ѓ: ").Append(local_314).Append(" | йќћжґ»и·ѓ: ").Append((local_9 - local_314)), 99999.0f, FLinearColor::White);
        int local_8 = Config.AudioComponentNames.Num();
        if (local_8 > 0)
        {
            Print("йџійў‘з»„д»¶е€—иЎЁ:", 99999.0f, FLinearColor(FColor::Cyan));
            int local_315_2 = 0;
            while (local_315_2 < local_8)
            {
                Print(FString().Append("  з»„д»¶ ").Append(local_315_2).Append(": ").Append(Config.AudioComponentNames[local_315_2]), 99999.0f, FLinearColor(FColor::Cyan));
                ++local_315_2;
                local_8 = Config.AudioComponentNames.Num();
            }
        }
        if (State.GetEnableCountersNum() > 0)
        {
            Print("з»„д»¶зЉ¶жЂЃиЇ¦жѓ…:", 99999.0f, FLinearColor::Green);
            int local_315_3 = 0;
            for (; local_315_3 < State.GetEnableCountersNum(); )
            {
                bool local_1 = State.IsSFXActive(local_315_3);
                int local_323 = State.GetEnableCounterValue(local_315_3);
                int local_325 = State.GetDisableCounterValue(local_315_3);
                FString local_330 = "жњЄзџҐз»„д»¶";
                if (local_315_3 < Config.AudioComponentNames.Num())
                {
                    local_330 = Config.AudioComponentNames[local_315_3].ToString();
                }
                FString local_334 = "None";
                if (local_315_3 < Config.BreathEnablePatterns.Num() && Config.BreathEnablePatterns[local_315_3].EnterEvent.IsValid())
                {
                    local_334 = Config.BreathEnablePatterns[local_315_3].EnterEvent.GetAssetName();
                }
                FString local_340 = "Root";
                if (local_315_3 < Config.BreathEnablePatterns.Num())
                {
                    FAudioSourceConfig local_342;
                    if (int(local_342.SourceType) == 2)
                    {
                        local_340 = local_342.Socket.ToString();
                    }
                    else
                    {
                        if (int(local_342.SourceType) == 1)
                        {
                            local_340 = "Part";
                        }
                    }
                }
                FString local_348 = "жњЄзџҐ";
                if (local_315_3 < Config.DefaultStates.Num())
                {
                    if (Config.DefaultStates[local_315_3])
                    {
                        local_312 = "еђЇз”Ё";
                    }
                    else
                    {
                        local_312 = "з¦Ѓз”Ё";
                    }
                    local_348 = local_312;
                }
                if (local_1)
                {
                    local_312 = "жґ»и·ѓ";
                }
                else
                {
                    local_312 = "йќћжґ»и·ѓ";
                }
                if (local_1)
                {
                }
                else
                {
                }
                FLinearColor local_356;
                Print(FString().Append("  [").Append(local_315_3).Append("] ").Append(local_330).Append(": ").Append(local_312).Append(" (еђЇз”Ё:").Append(local_323).Append(" з¦Ѓз”Ё:").Append(local_325).Append(" й»и®¤:").Append(local_348).Append(")"), 99999.0f, local_356);
                Print(FString().Append("      дє‹д»¶: ").Append(local_334).Append(", жєђ: ").Append(local_340), 99999.0f, FLinearColor::Gray);
                ++local_315_3;
            }
        }
        Print("й…ЌзЅ®дїЎжЃЇ:", 99999.0f, FLinearColor::Blue);
        Print(FString().Append("  еђЇз”ЁжЁЎејЏж•°й‡Џ: ").Append(Config.BreathEnablePatterns.Num()), 99999.0f, FLinearColor::Blue);
        Print(FString().Append("  з¦Ѓз”ЁжЁЎејЏж•°й‡Џ: ").Append(Config.BreathDisablePatterns.Num()), 99999.0f, FLinearColor::Blue);
        Print(FString().Append("  й»и®¤зЉ¶жЂЃж•°й‡Џ: ").Append(Config.DefaultStates.Num()), 99999.0f, FLinearColor::Blue);
        Print(FString().Append("  з»„д»¶еђЌз§°ж•°й‡Џ: ").Append(Config.AudioComponentNames.Num()), 99999.0f, FLinearColor::Blue);
        Print("=== и°ѓиЇ•дїЎжЃЇз»“жќџ ===", 99999.0f, FLinearColor::Yellow);
        return;
    }
    void HandleSFXStateChange(const FECSEntity &inout Entity, const FC_SFXState &inout State, const uint64 CurrentBitFlags, const uint64 OldBitFlags) const
    {
        if (CVar_BreathSFXSystem_ShowBitFlag.GetBool())
        {
            FString local_10 = this.ConvertToBinaryString(OldBitFlags);
            FString local_6 = this.ConvertToBinaryString(CurrentBitFlags);
            Print(FString().Append("HandleSFXStateChange: OldBitFlags = ").Append(OldBitFlags).Append(" (дєЊиї›е€¶: ").Append(local_10).Append(")"), 99999.0f, FLinearColor(FColor::Orange));
            FString local_14_2 = FString();
            Print(local_14_2.Append("HandleSFXStateChange: CurrentBitFlags = ").Append(CurrentBitFlags).Append(" (дєЊиї›е€¶: ").Append(local_6).Append(")"), 99999.0f, FLinearColor(FColor::Red));
        }
        int local_23 = FMath::Min(State.GetEnableCountersNum(), 64);
        int local_24 = 0;
        for (; local_24 < local_23; ++local_24)
        {
            int64 local_26 = 1 << local_24;
            int64 local_28 = OldBitFlags & local_26;
            bool local_1 = (local_28 != 0);
            int64 local_32 = CurrentBitFlags & local_26;
            bool local_29 = (local_32 != 0);
            if (!(local_1) != !(local_29))
            {
                ::BreathSFXUtils::HandleBreathStateChange(Entity, local_24, local_29);
            }
        }
        return;
    }
    FString ConvertToBinaryString(const uint64 Value) const
    {
        FString local_4 = "";
        bool local_5 = false;
        int local_7 = 63;
        for (; local_7 >= 0; --local_7)
        {
            int64 local_14 = Value & (1 << local_7);
            bool local_6 = (local_14 != 0);
            bool local_15 = !(local_5) && !(local_6);
            if (local_15)
            {
                continue;
            }
            local_5 = true;
            FString local_24;
            if (local_6)
            {
                local_24 = "1";
            }
            else
            {
                local_24 = "0";
            }
            local_4 += local_24;
            if (local_7 <= 0)
            {
                local_15 = false;
            }
            else
            {
                int local_9 = local_7 % 4;
                local_15 = (local_9 == 0);
            }
            if (local_15)
            {
                local_4 += " ";
            }
        }
        if (local_4.IsEmpty())
        {
            local_4 = "0";
        }
        return local_4;
    }
    UFUNCTION()
    void Run_Monitor_SFXStateAssign() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorSFXStateOnAssignView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_SFXStateAssign(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_SFXStateModify() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorSFXStateOnModifyView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_SFXStateModify(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_SFXStateRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorSFXStateOnRemoveView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_SFXStateRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DebugSFXStates() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        int local_184 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(10))))
        {
            return;
        }
        int local_8 = 0;
        int local_7 = local_8;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_2.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_DebugSFXStates(local_38, local_40, local_46, local_52);
            }
            local_2.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        local_102.opCall();
        Exclude(local_94).opCall();
        bool local_6 = local_2.BeginViewCacheBuild();
        int local_5 = local_2.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_38 = local_146.Proceed();
            ++local_112;
            if (local_6)
            {
                local_2.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_DebugSFXStates(local_184, local_40, local_46, local_52);
        }
        local_2.UpdateCachedEntityCount(local_112);
        if (local_6)
        {
            local_2.CommitViewCacheBuild(local_5);
        }
        return;
    }
}

