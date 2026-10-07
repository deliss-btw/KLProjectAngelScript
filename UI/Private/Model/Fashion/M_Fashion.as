
namespace FMS_FashionModel
{
    const int ModelId = 0;

}
struct FMsg_AvatarFashionChanged : FEUIMessage
{
    UPROPERTY()
    TArray<uint> AvatarIds;

    FMsg_AvatarFashionChanged()
    {
        return;
    }
}

struct FMsg_FashionMountChanged : FEUIMessage
{
    UPROPERTY()
    uint MountID;
    UPROPERTY()
    uint MountDecoID;


}

struct FFashionDecoPoint
{
    UPROPERTY()
    uint SlotType;
    UPROPERTY()
    uint FashionID;
    UPROPERTY()
    FVector AttachOffset;
    UPROPERTY()
    FVector AttachRotation;
    UPROPERTY()
    float32 AttachScale = 1.0f;


    void ApplyFromProto(const FPbDecoPointInfo &inout DecoInfo)
    {
        this.SlotType = DecoInfo.GetSlotType();
        this.FashionID = DecoInfo.GetFashionId();
        FPbFloat3 local_22 = DecoInfo.GetAttachOffset();
        this.AttachOffset = FVector(local_22.GetX(), local_22.GetY(), local_22.GetZ());
        FPbFloat3 local_12 = DecoInfo.GetAttachRotation();
        this.AttachRotation = FVector(local_12.GetX(), local_12.GetY(), local_12.GetZ());
        this.AttachScale = DecoInfo.GetAttachScale();
        return;
    }
    void FillProto(FPbDecoPointInfo &inout DecoInfo)
    {
        DecoInfo.SetSlotType(this.SlotType);
        DecoInfo.SetFashionId(this.FashionID);
        FPbFloat3 local_22 = DecoInfo.GetAttachOffset();
        local_22.SetX(float32(this.AttachOffset.X));
        local_22.SetY(float32(this.AttachOffset.Y));
        local_22.SetZ(float32(this.AttachOffset.Z));
        FPbFloat3 local_12 = DecoInfo.GetAttachRotation();
        local_12.SetX(float32(this.AttachRotation.X));
        local_12.SetY(float32(this.AttachRotation.Y));
        local_12.SetZ(float32(this.AttachRotation.Z));
        DecoInfo.SetAttachScale(this.AttachScale);
        return;
    }
}

struct FAvatarFashion
{
    UPROPERTY()
    uint AvatarID;
    UPROPERTY()
    uint HairID;
    UPROPERTY()
    uint TopID;
    UPROPERTY()
    uint BottomID;
    UPROPERTY()
    uint SuitID;
    UPROPERTY()
    TArray<FFashionDecoPoint> Decos;
    UPROPERTY()
    uint BathrobeTopID;
    UPROPERTY()
    uint BathrobeBottomID;


    void ApplyFromProto(const FPbAvatarFashionInfo &inout FashionInfo)
    {
        this.AvatarID = FashionInfo.GetAvatarId();
        this.HairID = FashionInfo.GetHairId();
        this.TopID = FashionInfo.GetTopId();
        this.BottomID = FashionInfo.GetBottomId();
        this.SuitID = FashionInfo.GetSuitId();
        this.BathrobeTopID = FashionInfo.GetBathrobeTopId();
        this.BathrobeBottomID = FashionInfo.GetBathrobeBottomId();
        this.Decos.Reset(0);
        TArray<FPbDecoPointInfo> local_6;
        FashionInfo.GetDecos(local_6);
        for (auto& local_22 : local_6)
        {
            FFashionDecoPoint local_38;
            local_38.ApplyFromProto(local_22);
            this.Decos.Add(local_38);
        }
        return;
    }
    void ApplyFromSnapshot(const FAvatarFashionNotifyData &inout FashionData)
    {
        this.AvatarID = FashionData.GetAvatarId();
        this.HairID = FashionData.GetHairId();
        this.TopID = FashionData.GetTopId();
        this.BottomID = FashionData.GetBottomId();
        this.SuitID = FashionData.GetSuitId();
        this.BathrobeTopID = FashionData.GetBathrobeTopId();
        this.BathrobeBottomID = FashionData.GetBathrobeBottomId();
        this.Decos.Reset(0);
        for (auto& local_18 : FashionData.GetDecos())
        {
            FFashionDecoPoint local_34;
            local_34.SlotType = local_18.GetSlotType();
            local_34.FashionID = local_18.GetFashionId();
            local_34.AttachOffset = FVector(local_18.GetAttachOffset().X, local_18.GetAttachOffset().Y, local_18.GetAttachOffset().Z);
            local_34.AttachRotation = FVector(local_18.GetAttachRotation().Pitch, local_18.GetAttachRotation().Yaw, local_18.GetAttachRotation().Roll);
            local_34.AttachScale = local_18.GetAttachScale();
            this.Decos.Add(local_34);
        }
        return;
    }
    void NormalizeForChangeAvatarFashionReq()
    {
        bool local_4;
        this.HairID = this.NormalizeFashionIdForSlot(this.HairID, EFashionSlotType(1));
        this.TopID = this.NormalizeFashionIdForSlot(this.TopID, EFashionSlotType(2));
        this.BottomID = this.NormalizeFashionIdForSlot(this.BottomID, EFashionSlotType(3));
        this.SuitID = this.NormalizeFashionIdForSlot(this.SuitID, EFashionSlotType(4));
        this.BathrobeTopID = this.NormalizeFashionIdForSlot(this.BathrobeTopID, EFashionSlotType(5));
        this.BathrobeBottomID = this.NormalizeFashionIdForSlot(this.BathrobeBottomID, EFashionSlotType(6));
        int local_3_4 = this.SuitID;
        if (local_3_4 != 0)
        {
            local_4 = true;
        }
        else
        {
            int local_3_5 = this.TopID;
            local_4 = (local_3_5 != 0);
        }
        if (local_4)
        {
            local_4 = true;
        }
        else
        {
            int local_3_6 = this.BottomID;
            local_4 = (local_3_6 != 0);
        }
        if (local_4)
        {
            int local_2_4 = this.BathrobeTopID;
            if (local_2_4 != 0)
            {
                local_4 = true;
            }
            else
            {
                int local_3_7 = this.BathrobeBottomID;
                local_4 = (local_3_7 != 0);
            }
            if (local_4)
            {
                XLog(ELog(79), FString().Append("[M_Fashion] Clear bathrobe fields for normal outfit ChangeAvatarFashionReq Suit=").Append(this.SuitID).Append(" Top=").Append(this.TopID).Append(" Bottom=").Append(this.BottomID).Append(" BathrobeTop=").Append(this.BathrobeTopID).Append(" BathrobeBottom=").Append(this.BathrobeBottomID));
            }
            this.BathrobeTopID = 0;
            this.BathrobeBottomID = 0;
        }
        return;
    }
    uint NormalizeFashionIdForSlot(const uint FashionId, const EFashionSlotType ExpectedSlotType) const
    {
        if (FashionId == 0)
        {
            return 0;
        }
        if (!(::FFashionConfig::GetByDataId(FashionId)))
        {
            XLog(ELog(79), FString().Append("[M_Fashion] Clear invalid ChangeAvatarFashionReq field FashionId=").Append(FashionId).Append(" ExpectedSlot=").Append(int(ExpectedSlotType)).Append(" ActualSlot=0"));
            return 0;
        }
        EFashionSlotType local_58;
        EFashionSlotType local_57 = local_58;
        if (int(local_57) != int(ExpectedSlotType))
        {
            XLog(ELog(79), FString().Append("[M_Fashion] Clear mismatched ChangeAvatarFashionReq field FashionId=").Append(FashionId).Append(" ExpectedSlot=").Append(int(ExpectedSlotType)).Append(" ActualSlot=").Append(int(local_57)));
            return 0;
        }
        return FashionId;
    }
    void FillProto(FPbAvatarFashionInfo &inout FashionInfo)
    {
        FashionInfo.SetAvatarId(this.AvatarID);
        FashionInfo.SetHairId(this.HairID);
        FashionInfo.SetTopId(this.TopID);
        FashionInfo.SetBottomId(this.BottomID);
        FashionInfo.SetSuitId(this.SuitID);
        FashionInfo.SetBathrobeTopId(this.BathrobeTopID);
        FashionInfo.SetBathrobeBottomId(this.BathrobeBottomID);
        FashionInfo.ClearDecos();
        for (auto& local_18 : this.Decos)
        {
            local_18.FillProto(FashionInfo.AddDecos());
        }
        return;
    }
}

struct FMS_FashionModel : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<uint, FAvatarFashion> m_AvatarFashionMap;
    UPROPERTY()
    uint m_MountID;
    UPROPERTY()
    uint m_MountDecoID;
    UPROPERTY()
    uint m_FacePresetID;
    UPROPERTY()
    TArray<uint> m_UnlockedFashionIDList;
    UPROPERTY()
    bool m_bFashionUnlockListInitialized;
    UPROPERTY()
    TMap<uint, FAvatarFashion> m_PendingAvatarFashionChangeMap;

    FMS_FashionModel()
    {
        this.m_MountID = 0;
        this.m_MountDecoID = 0;
        this.m_FacePresetID = 0;
        this.m_bFashionUnlockListInitialized = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_FashionModel(const FMS_FashionModel &inout Other)
    {
        this.m_MountID = 0;
        this.m_MountDecoID = 0;
        this.m_FacePresetID = 0;
        this.m_bFashionUnlockListInitialized = false;
        this.m_AvatarFashionMap = Other.m_AvatarFashionMap;
        this.m_MountID = int(Other.m_MountID);
        this.m_MountDecoID = int(Other.m_MountDecoID);
        this.m_FacePresetID = int(Other.m_FacePresetID);
        this.m_UnlockedFashionIDList = Other.m_UnlockedFashionIDList;
        this.m_bFashionUnlockListInitialized = Other.m_bFashionUnlockListInitialized;
        this.m_PendingAvatarFashionChangeMap = Other.m_PendingAvatarFashionChangeMap;
        return;
    }
    FMS_FashionModel& opAssign(const FMS_FashionModel &inout Other)
    {
        this.m_AvatarFashionMap = Other.m_AvatarFashionMap;
        this.m_MountID = int(Other.m_MountID);
        this.m_MountDecoID = int(Other.m_MountDecoID);
        this.m_FacePresetID = int(Other.m_FacePresetID);
        this.m_UnlockedFashionIDList = Other.m_UnlockedFashionIDList;
        this.m_bFashionUnlockListInitialized = Other.m_bFashionUnlockListInitialized;
        return Other.m_PendingAvatarFashionChangeMap;
    }
    bool IsFashionUnlocked(const uint FashionId) const
    {
        return this.GetUnlockedFashionIDList().Contains(FashionId);
    }
    TDataObjectPtr<FMountFashionConfig> GetCurrentMountFashionConfig() const
    {
        return this.ResolveMountFashionConfig(this.GetMountID());
    }
    void CollectUnlockedMountFashionConfigsForQuickSlot(TArray<TDataObjectPtr<FMountFashionConfig>> &inout OutConfigs) const
    {
        int local_54 = 0;
        int local_111 = 0;
        bool local_113 = false;
        OutConfigs.Empty(0);
        int local_53 = this.GetCurrentMountFashionConfig() ? local_54 : 0;
        TDataObjectIterator<FMountFashionConfig> local_70;
        for (; local_70; )
        {
            TDataObjectPtr<FMountFashionConfig> local_26 = local_70.GetDataPtr();
            bool local_52 = !(local_26);
            if (local_52)
            {
                local_52 = true;
            }
            else
            {
                int local_1 = local_111;
                local_113 = (local_1 != 0);
                local_52 = local_113;
            }
            local_52 = local_52 || (local_54 == local_53);
            local_52 = local_52 || local_113;
            CastTo local_118;
            local_52 = local_52 || !(this.IsFashionConfigUnlockedForDisplay(local_118.opCall()));
            if (local_52)
            {
            }
            else
            {
                OutConfigs.Add(local_26);
            }
            local_70.Next();
        }
        return;
    }
    bool IsFashionConfigUnlockedForDisplay(const TDataObjectPtr<FFashionConfig> &inout FashionConfig) const
    {
        bool local_2 = false;
        bool local_1 = !(FashionConfig);
        if (local_1)
        {
            return false;
        }
        local_2 = local_2 || local_1;
        return local_2;
    }
    bool ShouldGenerateNewFashionRedDot(const TDataObjectPtr<FFashionConfig> &inout FashionConfig) const
    {
        bool local_2 = false;
        int local_3 = 0;
        int local_6 = 0;
        if ((!(FashionConfig) || local_2))
        {
            return false;
        }
        int local_4 = local_3;
        if (local_4 != 0)
        {
            return false;
        }
        if (!(::FashionSettings::GetSlotConfig(EFashionSlotType(local_6))))
        {
            return false;
        }
        return this.HasFashionRedDotVisibleResource(FashionConfig);
    }
    bool HasFashionRedDotVisibleResource(const TDataObjectPtr<FFashionConfig> &inout FashionConfig) const
    {
        int local_2 = 0;
        bool local_57;
        TMapConstIterator<EBodyType, TSoftObjectPtr<USkeletalMesh>> local_66;
        bool local_1 = !(FashionConfig);
        if (local_1)
        {
            return false;
        }
        if (local_2 == -55)
        {
            CastTo local_8;
            if (!(local_8.opCall()))
            {
                local_57 = false;
            }
            else
            {
                local_1 = !local_1;
                local_57 = local_1;
            }
            return local_57;
        }
        for (; local_66.CanProceed;)
        {
            local_66.Proceed();
            if (!(IsNull()))
            {
                return true;
            }
        }
        return false;
    }
    void GenerateNewFashionRedDotIfNeeded(const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const FString &inout Source) const
    {
        int local_3 = 0;
        if (!(this.ShouldGenerateNewFashionRedDot(FashionConfig)))
        {
            return;
        }
        int local_2 = local_3;
        FMS_RedDotSystem& local_6 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        int64 local_8 = local_2;
        if (local_6.HasRedDot(GameplayTags::RedDotSystem_Fashion_NewFashion, local_8))
        {
            return;
        }
        TArray<uint64> local_12;
        int64 local_8_2 = local_2;
        local_12.Add(local_8_2);
        XLog(ELog(79), FString().Append("[M_Fashion] Generate new fashion red dot FashionId=").Append(local_2).Append(", Source=").Append(Source));
        local_6.GenerateRedDot(ERedPointEvent(21), local_12);
        return;
    }
    bool HasNewWardrobeFashionForAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig) const
    {
        int local_71 = 0;
        int local_77 = 0;
        if (!(AvatarConfig))
        {
            return false;
        }
        if (!(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(18), false)))
        {
            return false;
        }
        if (!(::FMS_PlayerAvatarData::Get(this.GetContext().Manager).IsAvatarUnlocked(AvatarConfig)))
        {
            return false;
        }
        TArray<EFashionSlotType> local_8;
        this.AppendKnownWardrobeSlotCandidates(local_8);
        for (auto local_21 : local_8)
        {
            if (!(::FashionSettings::GetSlotConfig(EFashionSlotType(local_21))) || !(this.CanShowMainTab(EFashionSlotMainTab(local_71))))
            {
                continue;
            }
            TArray<TDataObjectPtr<FFashionConfig>> local_76;
            this.CollectFashionConfigsForAvatarSlot(AvatarConfig, EFashionSlotType(local_21), EFashionSlotSubTab(local_77), local_76);
            for (auto& local_92 : local_76)
            {
                if (this.HasFashionNewRedDot(local_92))
                {
                    return true;
                }
            }
        }
        return false;
    }
    bool HasFashionNewRedDot(const TDataObjectPtr<FFashionConfig> &inout FashionConfig) const
    {
        bool local_2 = false;
        int local_3 = 0;
        if (!(FashionConfig) || local_2 || !(this.IsFashionConfigUnlocked(FashionConfig)))
        {
            return false;
        }
        int64 local_6 = local_3;
        return ::FMS_RedDotSystem::Get(this.GetContext().Manager).HasRedDot(GameplayTags::RedDotSystem_Fashion_NewFashion, local_6);
    }
    bool IsFashionConfigUnlocked(const TDataObjectPtr<FFashionConfig> &inout FashionConfig) const
    {
        return ::DisplayItemAdapter_Fashion::IsUnlocked(FashionConfig, ::FMS_FashionModel::Get(this.GetContext().Manager));
    }
    void CollectFashionConfigsForAvatarSlot(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig, const EFashionSlotType SlotType, const EFashionSlotSubTab SlotSubTab, TArray<TDataObjectPtr<FFashionConfig>> &inout OutConfigs) const
    {
        if (int(SlotSubTab) == 0)
        {
            if (int(SlotType) == -55)
            {
                TDataObjectIterator<FMountFashionConfig> local_20;
                for (; local_20; )
                {
                    TDataObjectPtr<FMountFashionConfig> local_60 = local_20.GetDataPtr();
                    CastTo local_64;
                    TDataObjectPtr<FFashionConfig> local_88 = local_64.opCall();
                    if (this.ShouldShowFashionConfigForAvatar(AvatarConfig, local_88, EFashionSlotType(SlotType)))
                    {
                        OutConfigs.Add(local_88);
                    }
                    local_20.Next();
                }
                return;
            }
            TDataObjectIterator<FClothFashionConfig> local_128;
            for (; local_128; )
            {
                TDataObjectPtr<FClothFashionConfig> local_168 = local_128.GetDataPtr();
                CastTo local_172;
                TDataObjectPtr<FFashionConfig> local_112 = local_172.opCall();
                if (this.ShouldShowFashionConfigForAvatar(AvatarConfig, local_112, EFashionSlotType(SlotType)))
                {
                    OutConfigs.Add(local_112);
                }
                local_128.Next();
            }
            return;
        }
        TDataObjectIterator<FDecoFashionConfig> local_188;
        for (; local_188; )
        {
            TDataObjectPtr<FDecoFashionConfig> local_228 = local_188.GetDataPtr();
            CastTo local_232;
            TDataObjectPtr<FFashionConfig> local_88_2 = local_232.opCall();
            if (this.ShouldShowFashionConfigForAvatar(AvatarConfig, local_88_2, EFashionSlotType(SlotType)))
            {
                OutConfigs.Add(local_88_2);
            }
            local_188.Next();
        }
        return;
    }
    bool ShouldShowFashionConfigForAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig, const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const EFashionSlotType SlotType) const
    {
        int local_6 = 0;
        if ((!(FashionConfig) || (0 != int(SlotType)) || !(AvatarConfig)))
        {
            return false;
        }
        int local_3 = local_6;
        if (local_3 != 0)
        {
            return false;
        }
        if (0 == this.GetDefaultFashionIdForSlot(AvatarConfig, EFashionSlotType(SlotType)))
        {
            return false;
        }
        if (GetAvatarTypes().Num() > 0 && !(GetAvatarTypes().Contains(AvatarConfig)))
        {
            return false;
        }
        return this.HasFashionUsableResourceForAvatar(AvatarConfig, FashionConfig, EFashionSlotType(SlotType));
    }
    bool HasFashionUsableResourceForAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig, const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const EFashionSlotType SlotType) const
    {
        bool local_57;
        bool local_1 = !(FashionConfig);
        if (local_1)
        {
            return false;
        }
        if ((int(SlotType)) == -55)
        {
            CastTo local_8;
            if (!(local_8.opCall()))
            {
                local_57 = false;
            }
            else
            {
                local_1 = !local_1;
                local_57 = local_1;
            }
            return local_57;
        }
        TSoftObjectPtr<USkeletalMesh> local_68;
        EBodyType local_70 = this.GetAvatarBodyType(AvatarConfig);
        if (!(unresolved.MeshAssets.Find(local_70, local_68)))
        {
            local_1 = false;
        }
        else
        {
            local_1 = !(local_68.IsNull());
        }
        if (local_1)
        {
            return true;
        }
        if ((int(local_70)) != 0 && local_1 && !(local_68.IsNull()))
        {
            return true;
        }
        return false;
    }
    EBodyType GetAvatarBodyType(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig) const
    {
        if (!(AvatarConfig))
        {
            return EBodyType(0);
        }
        return ::FashionUtils::GetBodyTypeFromAvatar(AvatarConfig);
    }
    uint GetDefaultFashionIdForSlot(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig, const EFashionSlotType SlotType) const
    {
        int local_3 = 0;
        const FCharacterDefaultFashionConfig& local_6;
        if (!(AvatarConfig) || !(GetDefaultFashion()))
        {
            return 0;
        }
        switch (int(SlotType))
        {
        case 1:
        {
            return this.GetFashionConfigDataId(local_6.GetInitHair());
        }
        case 2:
        {
            return this.GetFashionConfigDataId(local_6.GetInitTop());
        }
        case 3:
        {
            return this.GetFashionConfigDataId(local_6.GetInitBottom());
        }
        case 4:
        {
            return this.GetFashionConfigDataId(local_6.GetInitSuit());
        }
        case 5:
        {
            return this.GetFashionConfigDataId(local_6.GetInitBathrobeTop());
        }
        case 6:
        {
            return this.GetFashionConfigDataId(local_6.GetInitBathrobeBottom());
        }
        default:
        {
            local_3 = 0;
        }
        }
        return local_3;
    }
    uint GetFashionConfigDataId(const TDataObjectPtr<FFashionConfig> &inout FashionConfig) const
    {
        int local_3 = 0;
        int local_2 = FashionConfig ? local_3 : 0;
        return local_2;
    }
    bool CanShowMainTab(const EFashionSlotMainTab MainTab) const
    {
        if (int(MainTab) == 1)
        {
            return ::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(117), false);
        }
        return true;
    }
    void AppendKnownWardrobeSlotCandidates(TArray<EFashionSlotType> &inout OutSlots) const
    {
        OutSlots.Add(EFashionSlotType(1));
        OutSlots.Add(EFashionSlotType(2));
        OutSlots.Add(EFashionSlotType(3));
        OutSlots.Add(EFashionSlotType(4));
        OutSlots.Add(EFashionSlotType(5));
        OutSlots.Add(EFashionSlotType(6));
        OutSlots.Add(EFashionSlotType(101));
        OutSlots.Add(EFashionSlotType(102));
        OutSlots.Add(EFashionSlotType(103));
        OutSlots.Add(EFashionSlotType(104));
        OutSlots.Add(EFashionSlotType(105));
        OutSlots.Add(EFashionSlotType(106));
        OutSlots.Add(EFashionSlotType(107));
        OutSlots.Add(EFashionSlotType(108));
        OutSlots.Add(EFashionSlotType(201));
        OutSlots.Add(EFashionSlotType(202));
        return;
    }
    void AddUnlockedFashionId(const uint FashionId, const bool bAllowHint, const FString &inout Source, const bool bAllowGuideTrigger = false)
    {
        if (FashionId == 0)
        {
            return;
        }
        bool local_2 = this.GetUnlockedFashionIDList().Contains(FashionId);
        bool local_4 = this.GetModify_UnlockedFashionIDList().AddUnique(FashionId) || !(bAllowHint) || !(this.GetbFashionUnlockListInitialized());
        if (local_4)
        {
            return;
        }
        TDataObjectPtr<FFashionConfig> local_52 = ::FFashionConfig::GetByDataId(FashionId);
        bool local_3 = !(local_52);
        if (local_3)
        {
            XWarning(ELog(79), FString().Append("[M_Fashion] Skip new fashion hint, config not found. FashionId=").Append(FashionId).Append(", Source=").Append(Source));
            return;
        }
        this.GenerateNewFashionRedDotIfNeeded(local_52, Source);
        if (!(bAllowGuideTrigger))
        {
            local_3 = false;
        }
        else
        {
            local_4 = !local_4;
            local_3 = local_4;
        }
        if (local_3)
        {
            this.TriggerInitialLockedFashionGuide(FashionId, Source);
        }
        TDataObjectPtr<FMessageHintConfig> local_106 = ::FashionSettings::GetNewUnlockLargeHint();
        if (!(local_106))
        {
            XWarning(ELog(79), FString().Append("[M_Fashion] Skip new fashion hint, DA_FashionSettings.NewUnlockLargeHint is empty. FashionId=").Append(FashionId).Append(", Source=").Append(Source));
            return;
        }
        TArray<FTextArgument> local_110;
        Make local_116;
        local_110.Add(local_116.opImplConv());
        XLog(ELog(79), FString().Append("[M_Fashion] Show new fashion hint FashionId=").Append(FashionId).Append(", Source=").Append(Source));
        ::MessageHintUtils::ShowMessageHint(this.GetContext().GetLocalPlayer(), local_106, local_110);
        return;
    }
    void TriggerInitialLockedFashionGuide(const uint FashionId, const FString &inout Source)
    {
        if (!(this.GetContext().GetLocalPlayer().IsValid()))
        {
            XWarning(ELog(79), FString().Append("[M_Fashion] Skip initial locked fashion guide trigger, LocalPlayer invalid. FashionId=").Append(FashionId).Append(", Source=").Append(Source));
            return;
        }
        FFPTime local_20 = FFPTime(-1);
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        FCE_ClientConditionTriggerReason local_14;
        local_14.Reason = EClientConditionTriggerReason(2);
        XLog(ELog(79), FString().Append("[M_Fashion] Trigger initial locked fashion guide FashionId=").Append(FashionId).Append(", Source=").Append(Source));
        return;
    }
    TDataObjectPtr<FMountFashionConfig> ResolveMountFashionConfig(const uint InMountID) const
    {
        if (InMountID > 0)
        {
            ::FFashionConfig::GetByDataId(InMountID);
            CastTo local_54;
            TDataObjectPtr<FMountFashionConfig> local_78 = local_54.opCall();
            if (local_78)
            {
                return local_78;
            }
        }
        UDataObjectManager::GetSingletonDataObject<FFashionGlobalConfig> local_126;
        TDataObjectPtr<FFashionGlobalConfig> local_150 = local_126.opImplConv();
        if (!(!(local_150)) && GetDefaultMount())
        {
            return GetDefaultMount();
        }
        return TDataObjectPtr<FMountFashionConfig>();
    }
    void RequestUnlockFashion(const uint FashionId)
    {
        if (FashionId == 0)
        {
            XLog(ELog(79), "[M_Fashion] Skip UnlockFashionReq FashionId=0");
            return;
        }
        FPbUnlockFashionReq local_8;
        local_8.SetFashionId(FashionId);
        XLog(ELog(79), FString().Append("[M_Fashion] UnlockFashionReq FashionId=").Append(FashionId));
        this.SendProto(local_8.ToWrapper());
        return;
    }
    void RequestChangeAvatarFashion(const FAvatarFashion &inout Fashion)
    {
        if (int(Fashion.AvatarID) == 0)
        {
            XLog(ELog(79), "[M_Fashion] Skip ChangeAvatarFashionReq AvatarID=0");
            return;
        }
        FAvatarFashion local_16;
        local_16.NormalizeForChangeAvatarFashionReq();
        FPbChangeAvatarFashionReq local_32;
        FPbAvatarFashionInfo local_52 = local_32.GetAvatarFashion();
        local_16.FillProto(local_52);
        XLog(ELog(79), FString().Append("[M_Fashion] ChangeAvatarFashionReq Avatar=").Append(local_16.AvatarID).Append(" Hair=").Append(local_16.HairID).Append(" Top=").Append(local_16.TopID).Append(" Bottom=").Append(local_16.BottomID).Append(" Suit=").Append(local_16.SuitID).Append(" BathrobeTop=").Append(local_16.BathrobeTopID).Append(" BathrobeBottom=").Append(local_16.BathrobeBottomID).Append(" DecoCount=").Append(local_16.Decos.Num()));
        this.SendProto(local_32.ToWrapper());
        return;
    }
    void RequestChangeMount(const uint InMountID, const uint InMountDecoID)
    {
        FPbChangeMountReq local_4;
        local_4.SetMountId(InMountID);
        local_4.SetMountDecoId(InMountDecoID);
        XLog(ELog(79), FString().Append("[M_Fashion] ChangeMountReq MountId=").Append(InMountID).Append(" MountDecoId=").Append(InMountDecoID));
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void RequestChangeFacePreset(const uint InFacePresetID)
    {
        FPbChangeFacePresetReq local_4;
        local_4.SetFacePresetId(InFacePresetID);
        XLog(ELog(79), FString().Append("[M_Fashion] ChangeFacePresetReq FacePresetId=").Append(InFacePresetID));
        this.SendProto(local_4.ToWrapper());
        return;
    }
    FPlayerFashionNotifySnapshot MakeSnapshotFromProto(const FPbAllAvatarFashionNotify &inout Notify) const
    {
        FPlayerFashionNotifySnapshot local_10;
        local_10.SetMountId(Notify.GetMountId());
        local_10.SetMountDecoId(Notify.GetMountDecoId());
        local_10.SetFacePresetId(Notify.GetFacePresetId());
        TArray<FPbAvatarFashionInfo> local_16;
        Notify.GetAvatarFashionList(local_16);
        for (auto& local_32 : local_16)
        {
            FAvatarFashionNotifyData local_46;
            local_46.SetAvatarId(local_32.GetAvatarId());
            local_46.SetHairId(local_32.GetHairId());
            local_46.SetTopId(local_32.GetTopId());
            local_46.SetBottomId(local_32.GetBottomId());
            local_46.SetSuitId(local_32.GetSuitId());
            local_46.SetBathrobeTopId(local_32.GetBathrobeTopId());
            local_46.SetBathrobeBottomId(local_32.GetBathrobeBottomId());
            TArray<FPbDecoPointInfo> local_50;
            local_32.GetDecos(local_50);
            for (auto& local_64 : local_50)
            {
                FAvatarFashionDecoNotifyData local_74;
                local_74.SetSlotType(local_64.GetSlotType());
                local_74.SetFashionId(local_64.GetFashionId());
                FPbFloat3 local_94 = local_64.GetAttachOffset();
                local_74.SetAttachOffset(FVector3f(local_94.GetX(), local_94.GetY(), local_94.GetZ()));
                FPbFloat3 local_84 = local_64.GetAttachRotation();
                local_74.SetAttachRotation(FRotator3f(local_84.GetX(), local_84.GetY(), local_84.GetZ()));
                local_74.SetAttachScale(local_64.GetAttachScale());
                local_46.GetModify_Decos().Add(local_74);
            }
            local_10.GetModify_AvatarFashions().Add(local_46);
        }
        return local_10;
    }
    void ApplyFashionSnapshot(const FPlayerFashionNotifySnapshot &inout Snapshot, const FString &inout SourceName)
    {
        int local_1;
        int local_3;
        int local_56 = 0;
        local_1 = this.GetMountID();
        local_3 = this.GetMountDecoID();
        this.GetModify_AvatarFashionMap().Empty(0);
        TArray<uint> local_8;
        XLog(ELog(79), FString().Append("[M_Fashion] ").Append(SourceName).Append(" AvatarCount=").Append(Snapshot.GetAvatarFashions().Num()).Append(" MountId=").Append(Snapshot.GetMountId()).Append(" MountDecoId=").Append(Snapshot.GetMountDecoId()).Append(" FacePresetId=").Append(Snapshot.GetFacePresetId()));
        for (auto& local_32 : Snapshot.GetAvatarFashions())
        {
            XLog(ELog(79), FString().Append("[M_Fashion]   Avatar=").Append(local_32.GetAvatarId()).Append(" Hair=").Append(local_32.GetHairId()).Append(" Top=").Append(local_32.GetTopId()).Append(" Bottom=").Append(local_32.GetBottomId()).Append(" Suit=").Append(local_32.GetSuitId()).Append(" BathrobeTop=").Append(local_32.GetBathrobeTopId()).Append(" BathrobeBottom=").Append(local_32.GetBathrobeBottomId()).Append(" DecoCount=").Append(local_32.GetDecos().Num()));
            for (auto& local_50 : local_32.GetDecos())
            {
                XLog(ELog(79), FString().Append("[M_Fashion]     Deco Avatar=").Append(local_32.GetAvatarId()).Append(" SlotType=").Append(local_50.GetSlotType()).Append(" FashionId=").Append(local_50.GetFashionId()).Append(" Offset=(").Append(local_50.GetAttachOffset().X).Append(",").Append(local_50.GetAttachOffset().Y).Append(",").Append(local_50.GetAttachOffset().Z).Append(") Rotation=(").Append(local_50.GetAttachRotation().Pitch).Append(",").Append(local_50.GetAttachRotation().Yaw).Append(",").Append(local_50.GetAttachRotation().Roll).Append(") Scale=").Append(local_50.GetAttachScale()));
            }
            FAvatarFashion& local_54 = this.GetModify_AvatarFashionMap().FindOrAdd(local_32.GetAvatarId());
            local_54.ApplyFromSnapshot(local_32);
            local_8.Add(local_32.GetAvatarId());
        }
        this.SetMountID(Snapshot.GetMountId());
        this.SetMountDecoID(Snapshot.GetMountDecoId());
        this.SetFacePresetID(Snapshot.GetFacePresetId());
        this.GetModify_PendingAvatarFashionChangeMap().Empty(0);
        FEUIModelRef local_62 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus);
        local_56.AvatarIds = local_8;
        if (local_1 != this.GetMountID() || (local_3 != this.GetMountDecoID()))
        {
            FMsg_FashionMountChanged local_66;
            FEUIModelRef local_62_2 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus);
            local_66.MountID = this.GetMountID();
            local_66.MountDecoID = this.GetMountDecoID();
        }
        return;
    }
    void HandleAllAvatarFashionNotify(const FPbAllAvatarFashionNotify &inout Notify)
    {
        this.ApplyFashionSnapshot(this.MakeSnapshotFromProto(Notify), "AllAvatarFashionNotify");
        return;
    }
    void OnReceivePlayerFashionSnapshot(const FCE_OnReceivePlayerFashionSnapshot &inout Event)
    {
        this.ApplyFashionSnapshot(Event.Snapshot, "ECSyncSelfFashionSnapshot");
        return;
    }
    void HandleFashionUnlockNotify(const FPbFashionUnlockNotify &inout Notify)
    {
        TArray<uint> local_4;
        Notify.GetFashionIdList(local_4);
        XLog(ELog(79), FString().Append("[M_Fashion] FashionUnlockNotify Count=").Append(local_4.Num()));
        if (!(this.GetbFashionUnlockListInitialized()))
        {
            this.GetModify_UnlockedFashionIDList().Empty(0);
            for (auto local_25 : local_4)
            {
                XLog(ELog(79), FString().Append("[M_Fashion]   Init Unlocked FashionId=").Append(local_25));
                this.AddUnlockedFashionId(local_25, false, "FashionUnlockNotify.Init", false);
            }
            this.SetbFashionUnlockListInitialized(true);
            return;
        }
        for (auto local_25 : local_4)
        {
            XLog(ELog(79), FString().Append("[M_Fashion]   Unlocked FashionId=").Append(local_25));
            this.AddUnlockedFashionId(local_25, true, "FashionUnlockNotify.Diff", true);
        }
        return;
    }
    void HandleFashionItemUnlockNotify(const FPbFashionItemUnlockNotify &inout Notify)
    {
        XLog(ELog(79), FString().Append("[M_Fashion] FashionItemUnlockNotify FashionId=").Append(Notify.GetFashionId()));
        this.AddUnlockedFashionId(Notify.GetFashionId(), true, "FashionItemUnlockNotify", true);
        return;
    }
    void HandleUnlockFashionRsp(const FPbUnlockFashionRsp &inout Rsp)
    {
        XLog(ELog(79), FString().Append("[M_Fashion] UnlockFashionRsp Retcode=").Append(Rsp.GetRetcode()).Append(" FashionId=").Append(Rsp.GetFashionId()));
        if (Rsp.GetRetcode() != 0)
        {
            return;
        }
        this.AddUnlockedFashionId(Rsp.GetFashionId(), true, "UnlockFashionRsp", true);
        return;
    }
    void HandleChangeAvatarFashionRsp(const FPbChangeAvatarFashionRsp &inout Rsp)
    {
        XLog(ELog(79), FString().Append("[M_Fashion] ChangeAvatarFashionRsp Retcode=").Append(Rsp.GetRetcode()).Append(" Avatar=").Append(Rsp.GetAvatarId()));
        int local_6 = Rsp.GetAvatarId();
        if (Rsp.GetRetcode() != 0)
        {
            return;
        }
        XLog(ELog(79), FString().Append("[M_Fashion] ChangeAvatarFashionRsp success, wait authoritative fashion snapshot Avatar=").Append(Rsp.GetAvatarId()));
        return;
    }
    void HandleChangeMountRsp(const FPbChangeMountRsp &inout Rsp)
    {
        bool local_10;
        XLog(ELog(79), FString().Append("[M_Fashion] ChangeMountRsp Retcode=").Append(Rsp.GetRetcode()).Append(" MountId=").Append(Rsp.GetMountId()).Append(" MountDecoId=").Append(Rsp.GetMountDecoId()));
        if (Rsp.GetRetcode() != 0)
        {
            return;
        }
        if (!(::FASCommonUtils::GetControlledPawnEntity(this.GetContext().GetLocalPlayer()).IsValid()))
        {
            local_10 = false;
        }
        else
        {
            Has local_26;
            local_10 = local_26.opCall();
        }
        if (local_10)
        {
            FCommonTipsParam local_36;
            ::CommonPopup::Tips(NSLOCTEXT("Fashion", "Fashion_ChangeMountWhileRidingApplyNextSummon", "еќђйЄ‘зЉ¶жЂЃдё­пјЊдё‹ж¬ЎеЏ¬е”¤еќђйЄ‘ж—¶з”џж•€"), local_36);
        }
        XLog(ELog(79), FString().Append("[M_Fashion] ChangeMountRsp success, wait authoritative fashion snapshot MountId=").Append(Rsp.GetMountId()).Append(" MountDecoId=").Append(Rsp.GetMountDecoId()));
        return;
    }
    void HandleChangeFacePresetRsp(const FPbChangeFacePresetRsp &inout Rsp)
    {
        XLog(ELog(79), FString().Append("[M_Fashion] ChangeFacePresetRsp Retcode=").Append(Rsp.GetRetcode()).Append(" FacePresetId=").Append(Rsp.GetFacePresetId()));
        if (Rsp.GetRetcode() != 0)
        {
            return;
        }
        this.SetFacePresetID(Rsp.GetFacePresetId());
        return;
    }
    const TMap<uint, FAvatarFashion> GetAvatarFashionMap() const property
    {
        const TMap<uint, FAvatarFashion> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<uint, FAvatarFashion> GetModify_AvatarFashionMap() property
    {
        TMap<uint, FAvatarFashion> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAvatarFashionMap(const TMap<uint, FAvatarFashion> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarFashionMap = __Value;
        return;
    }
    uint GetMountID() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MountID;
    }
    void SetMountID(const uint __Value) property
    {
        if (this.m_MountID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MountID = __Value;
        return;
    }
    uint GetMountDecoID() const property
    {
        this.TrackPropertyRead(2);
        return this.m_MountDecoID;
    }
    void SetMountDecoID(const uint __Value) property
    {
        if (this.m_MountDecoID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MountDecoID = __Value;
        return;
    }
    uint GetFacePresetID() const property
    {
        this.TrackPropertyRead(3);
        return this.m_FacePresetID;
    }
    void SetFacePresetID(const uint __Value) property
    {
        if (this.m_FacePresetID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_FacePresetID = __Value;
        return;
    }
    const TArray<uint> GetUnlockedFashionIDList() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<uint> GetModify_UnlockedFashionIDList() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetUnlockedFashionIDList(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_UnlockedFashionIDList = __Value;
        return;
    }
    bool GetbFashionUnlockListInitialized() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bFashionUnlockListInitialized;
    }
    void SetbFashionUnlockListInitialized(const bool __Value) property
    {
        if (!(this.m_bFashionUnlockListInitialized) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bFashionUnlockListInitialized = __Value;
        return;
    }
    const TMap<uint, FAvatarFashion> GetPendingAvatarFashionChangeMap() const property
    {
        const TMap<uint, FAvatarFashion> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TMap<uint, FAvatarFashion> GetModify_PendingAvatarFashionChangeMap() property
    {
        TMap<uint, FAvatarFashion> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetPendingAvatarFashionChangeMap(const TMap<uint, FAvatarFashion> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_PendingAvatarFashionChangeMap = __Value;
        return;
    }
}

struct __Lambda_UI_Private_Model_Fashion_M_Fashion_328
{
    __Lambda_UI_Private_Model_Fashion_M_Fashion_328()
    {
        return;
    }
    bool opCall(const TDataObjectPtr<FMountFashionConfig> &inout A, const TDataObjectPtr<FMountFashionConfig> &inout B)
    {
        int local_1 = 0;
        int local_2 = 0;
        int local_8 = 0;
        int local_3 = local_1;
        int local_4 = local_2;
        if (local_3 != local_4)
        {
            local_4 = local_1;
            local_3 = local_2;
            local_8 = local_3;
            return (local_4 > local_8);
        }
        if (local_8 == local_3)
        {
            return (0 < 0);
        }
        return (local_3 > local_4);
    }
}

namespace FMS_FashionModel
{
FMS_FashionModel& Get(const UObject ContextObject)
{
    return FMS_FashionModel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_FashionModel GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_FashionModel __r;
    TEUIModelRef<FMS_FashionModel> local_6 = TEUIModelRef<FMS_FashionModel>(EUIInternal::MakeModelWithManager(Manager, FMS_FashionModel::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__HandleAllAvatarFashionNotify";
    Result.ProtoRspDefines.Add(local_10);
    FEUIModelEventDefine local_18;
    local_18.FunctionName = "__OnReceivePlayerFashionSnapshot";
    local_18.EventType = FCE_OnReceivePlayerFashionSnapshot;
    Result.EventFunctions.Add(local_18);
    local_10.FunctionName = "__HandleFashionUnlockNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__HandleFashionItemUnlockNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__HandleUnlockFashionRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__HandleChangeAvatarFashionRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__HandleChangeMountRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__HandleChangeFacePresetRsp";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_FashionModel;
}
void __HandleAllAvatarFashionNotify(FMS_FashionModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.HandleAllAvatarFashionNotify(FPbAllAvatarFashionNotify::FromWrapper(ProtoWrapper));
    return;
}
void __OnReceivePlayerFashionSnapshot(FMS_FashionModel &inout Model, const FCE_OnReceivePlayerFashionSnapshot &inout Event)
{
    Model.OnReceivePlayerFashionSnapshot(Event);
    return;
}
void __HandleFashionUnlockNotify(FMS_FashionModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.HandleFashionUnlockNotify(FPbFashionUnlockNotify::FromWrapper(ProtoWrapper));
    return;
}
void __HandleFashionItemUnlockNotify(FMS_FashionModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.HandleFashionItemUnlockNotify(FPbFashionItemUnlockNotify::FromWrapper(ProtoWrapper));
    return;
}
void __HandleUnlockFashionRsp(FMS_FashionModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.HandleUnlockFashionRsp(FPbUnlockFashionRsp::FromWrapper(ProtoWrapper));
    return;
}
void __HandleChangeAvatarFashionRsp(FMS_FashionModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.HandleChangeAvatarFashionRsp(FPbChangeAvatarFashionRsp::FromWrapper(ProtoWrapper));
    return;
}
void __HandleChangeMountRsp(FMS_FashionModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.HandleChangeMountRsp(FPbChangeMountRsp::FromWrapper(ProtoWrapper));
    return;
}
void __HandleChangeFacePresetRsp(FMS_FashionModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.HandleChangeFacePresetRsp(FPbChangeFacePresetRsp::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_AvatarFashionMap()
{
    return 0;
}
int __IndexOf_MountID()
{
    return 1;
}
int __IndexOf_MountDecoID()
{
    return 2;
}
int __IndexOf_FacePresetID()
{
    return 3;
}
int __IndexOf_UnlockedFashionIDList()
{
    return 4;
}
int __IndexOf_bFashionUnlockListInitialized()
{
    return 5;
}
int __IndexOf_PendingAvatarFashionChangeMap()
{
    return 6;
}
}
