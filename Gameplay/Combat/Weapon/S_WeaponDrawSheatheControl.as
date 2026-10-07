

class US_WeaponDrawSheatheControl : UECSScriptSystem
{
    US_WeaponDrawSheatheControl()
    {
        return;
    }
    UFUNCTION()
    void Job_UpdateWeaponDrawSheatheInfo(const FECSEntity &inout Entity, const FC_CharacterPoseState &inout PoseState, FC_CharacterWeapon &inout CharacterWeapon, FC_WeaponDrawSheatheInfo &inout WeaponInfo, FC_WeaponAttachState &inout WeaponAttachState, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_5;
        int local_7;
        FWeaponDrawSheatheConfig local_4 = ::UCombatGlobalSettings::Get().WeaponDrawSheatheConfig;
        local_5 = PoseState.GetbIsAiming();
        local_7 = PoseState.GetKeepStrafeCounter();
        bool local_6 = Entity.MatchAnyGameplayTags(local_4.ListenGameplayTags);
        bool local_9 = WeaponAttachState.IsAttachBack();
        bool local_11 = !(local_5);
        if (!(WeaponInfo.GetbOldIsAiming()) != local_11)
        {
            if (!(local_5))
            {
                WeaponInfo.SetAimingExpireTime((FFPTime(FixedTime.Time) + FFPTime(local_4.AimExitProtectTime)));
            }
            WeaponInfo.SetbOldIsAiming(local_5);
        }
        if (WeaponInfo.GetOldKeepStrafeCounter() != local_7)
        {
            if (local_7 <= 0)
            {
                WeaponInfo.SetStrafeExpireTime((FFPTime(FixedTime.Time) + FFPTime(local_4.StrafeExitProtectTime)));
            }
            WeaponInfo.SetOldKeepStrafeCounter(local_7);
        }
        if (!(WeaponInfo.GetbOldMatchAnyGameplayTags()) != !(local_6))
        {
            if (!(local_6))
            {
                WeaponInfo.SetTagsExpireTime((FFPTime(FixedTime.Time) + FFPTime(local_4.TagsExitProtectTime)));
            }
            WeaponInfo.SetbOldMatchAnyGameplayTags(local_6);
        }
        bool local_11_3 = !(local_6);
        bool local_23 = (FFPTime(FixedTime.Time).opCmp(WeaponInfo.GetTagsExpireTime()) >= 0);
        if (local_4.bDrawWeaponOnAim)
        {
            local_11_3 = local_11_3 && !(local_5);
            local_23 = local_23 && (FFPTime(FixedTime.Time).opCmp(WeaponInfo.GetAimingExpireTime()) >= 0);
        }
        if (local_4.bDrawWeaponOnStrafe)
        {
            local_11_3 = local_11_3 && !((local_7 > 0));
            local_23 = local_23 && (FFPTime(FixedTime.Time).opCmp(WeaponInfo.GetStrafeExpireTime()) >= 0);
        }
        bool local_10 = local_9 && !(local_11_3);
        bool local_24 = !(local_9) && local_11_3 && local_23;
        if (!(WeaponInfo.GetbWeaponShouldDrawn()) != !(local_10))
        {
            WeaponInfo.SetbWeaponShouldDrawn(local_10);
        }
        bool local_25 = !(local_24);
        if (!(WeaponInfo.GetbWeaponShouldSheathe()) != local_25)
        {
            WeaponInfo.SetbWeaponShouldSheathe(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateWeaponDrawSheatheInfo() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        MarkModifiedIfDirty local_72;
        MarkModifiedIfDirty local_76;
        int local_212 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateWeaponDrawSheatheInfo(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_48);
                local_72.opCall(local_54);
                local_76.opCall(local_60);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_114 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Include local_134;
        local_134.opCall();
        Exclude(local_114).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_140 = 0;
        FECSRuntimeViewIterator local_174 = local_114.Iterator();
        for (; local_174.CanProceed;)
        {
            local_40 = local_174.Proceed();
            ++local_140;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateWeaponDrawSheatheInfo(local_212, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_48);
            local_72.opCall(local_54);
            local_76.opCall(local_60);
        }
        local_4.UpdateCachedEntityCount(local_140);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

