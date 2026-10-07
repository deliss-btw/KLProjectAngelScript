

class US_WeaponMaterialSystem : UECSScriptSystem
{
    US_WeaponMaterialSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateWeaponAttachMaterial(const FECSEntity &inout Entity, const FC_CharacterWeapon &inout CharacterWeapon) const
    {
        int local_10 = 0;
        FC_CurrentWeaponAttachInfo local_30;
        const FWeaponAttachData& local_2 = CharacterWeapon.GetCurrentAttachData(this.GetECSRuntime().Time);
        if (!(CharacterWeapon.GetCurrentWeaponEntity().IsValid()))
        {
            return;
        }
        Has local_14;
        bool local_3 = local_14.opCall();
        if (local_3)
        {
            FC_CurrentWeaponAttachInfo local_20;
            if (int(local_20.AttachSocket) == local_2.GetWeaponAttachDataIndex())
            {
                return;
            }
            local_30.AttachSocket = EAttachmentSocket(local_2.GetWeaponAttachDataIndex());
            if (int(local_30.AttachSocket) == 0 && (local_10.AttachToHandFadingMaterial.Num() > 0))
            {
                ::FMaterialUtils::LocalOnlyRequestChangeMaterialParam(CharacterWeapon.GetCurrentWeaponEntity(), FName("UpdateWeaponAttachMaterial"), local_10.AttachToHandFadingMaterial);
            }
            else
            {
                if (int(local_30.AttachSocket) == 1 && (local_10.AttachToBackFadingMaterial.Num() > 0))
                {
                    ::FMaterialUtils::LocalOnlyRequestChangeMaterialParam(CharacterWeapon.GetCurrentWeaponEntity(), FName("UpdateWeaponAttachMaterial"), local_10.AttachToBackFadingMaterial);
                }
            }
            return;
        }
        int local_21_2 = local_2.GetWeaponAttachDataIndex();
        local_30.AttachSocket = EAttachmentSocket(local_21_2);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateWeaponAttachMaterial() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_UpdateWeaponAttachMaterial(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateWeaponAttachMaterial(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

