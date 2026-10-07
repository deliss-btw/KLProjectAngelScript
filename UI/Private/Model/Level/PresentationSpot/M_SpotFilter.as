
namespace FM_SpotFilter
{
    const int ModelId = 0;
}
namespace FMS_CommonSpotFilters
{
    const int ModelId = 0;

}
struct FSpotRefreshDeps
{
    UPROPERTY()
    bool bPlayerCombatSensitive;
    UPROPERTY()
    bool bEntityCombatSensitive;
    UPROPERTY()
    bool bDistanceSensitive;
    UPROPERTY()
    bool bStaticResult;
    UPROPERTY()
    bool bStaticValue;


    FString ToDebugString() const
    {
        return FString().Append("PCombat=").Append(this.bPlayerCombatSensitive).Append(" ECombat=").Append(this.bEntityCombatSensitive).Append(" Dist=").Append(this.bDistanceSensitive).Append(" Static=").Append(this.bStaticResult).Append("(").Append(this.bStaticValue).Append(")");
    }
}

struct FCombatSensitiveEntry
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;
    UPROPERTY()
    FPresentationDisplayRule Rule;

    FCombatSensitiveEntry()
    {
        return;
    }
}

struct FSpotRefreshResult
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;
    UPROPERTY()
    bool bShouldDisplay;


}

struct FSpotCompiledDisplayRuleBasic
{
    UPROPERTY()
    bool bEnableDisplay;
    UPROPERTY()
    float MinDistanceSq;
    UPROPERTY()
    float MaxDistanceSq;
    UPROPERTY()
    bool bHasMaxDistance;


}

struct FSpotCompiledDisplayConditionalRule
{
    UPROPERTY()
    EPresentationDisplayConditionRequirement PlayerInCombat;
    UPROPERTY()
    EPresentationDisplayConditionRequirement EntityInCombat;
    UPROPERTY()
    FSpotCompiledDisplayRuleBasic Rule;


}

struct FSpotCompiledDisplayRule
{
    UPROPERTY()
    FSpotCompiledDisplayRuleBasic DefaultRule;
    UPROPERTY()
    TArray<FSpotCompiledDisplayConditionalRule> ConditionalRules;
    UPROPERTY()
    bool bDisplayOnlyInCombat;


}

struct FSpotRefreshEntry
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;
    UPROPERTY()
    FSpotRefreshDeps EffectiveDeps;
    UPROPERTY()
    FSpotCompiledDisplayRule CompiledRule;

    FSpotRefreshEntry()
    {
        return;
    }
}

struct FSpotRefreshTracker
{
    UPROPERTY()
    TArray<FSpotRefreshEntry> NearSpots;
    UPROPERTY()
    TArray<FSpotRefreshEntry> FarSpots;
    UPROPERTY()
    TArray<FCombatSensitiveEntry> CombatSensitiveIndex;
    UPROPERTY()
    bool bLastPlayerInCombat;
    UPROPERTY()
    FVector LastPlayerPosition;
    UPROPERTY()
    int FarStaggerCursor;


    void AddSpot(const TEUIModelRef<FM_Spot> &inout Spot, const FPresentationDisplayRule &inout Rule, const bool bPlayerInCombat, const float32 NearDistanceThresholdSq, TArray<TEUIModelRef<FM_Spot>> &out OutStaticAdd, TArray<TEUIModelRef<FM_Spot>> &out OutStaticRemove)
    {
        TArray<TEUIModelRef<FM_Spot>> local_4;
        OutStaticAdd = local_4;
        OutStaticRemove = local_4;
        if (::FSpotRefreshDeps::Analyze(Rule).bPlayerCombatSensitive)
        {
            FCombatSensitiveEntry local_26;
            local_26.Spot = Spot;
            this.CombatSensitiveIndex.Add(local_26);
        }
        FSpotRefreshDeps local_12 = ::FSpotRefreshDeps::AnalyzeEffective(Rule, bPlayerInCombat);
        FSpotCompiledDisplayRule local_44 = ::FSpotCompiledDisplayRule::Compile(Rule);
        this.ClassifySpot(Spot, local_44, local_12, NearDistanceThresholdSq, OutStaticAdd, OutStaticRemove);
        return;
    }
    void RemoveSpot(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        this.RemoveFromArray(this, Spot);
        this.RemoveFromArray(this.FarSpots, Spot);
        int local_4 = this.CombatSensitiveIndex.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            TEUIModelRef<FM_Spot> local_8;
            local_8 = this.CombatSensitiveIndex[local_4].Spot;
            if ((local_8 == Spot.opImplConv()))
            {
                this.CombatSensitiveIndex.RemoveAtSwap(local_4);
                break;
            }
        }
        return;
    }
    void ReclassifySpot(const TEUIModelRef<FM_Spot> &inout Spot, const FPresentationDisplayRule &inout NewRule, const bool bPlayerInCombat, const float32 NearDistanceThresholdSq, TArray<TEUIModelRef<FM_Spot>> &out OutStaticAdd, TArray<TEUIModelRef<FM_Spot>> &out OutStaticRemove)
    {
        TArray<TEUIModelRef<FM_Spot>> local_4;
        OutStaticAdd = local_4;
        OutStaticRemove = local_4;
        this.RemoveFromArray(this, Spot);
        this.RemoveFromArray(this.FarSpots, Spot);
        int local_12 = this.CombatSensitiveIndex.Num() - 1;
        for (; local_12 >= 0; --local_12)
        {
            TEUIModelRef<FM_Spot> local_16;
            local_16 = this.CombatSensitiveIndex[local_12].Spot;
            if ((local_16 == Spot.opImplConv()))
            {
                this.CombatSensitiveIndex.RemoveAtSwap(local_12);
                break;
            }
        }
        if (::FSpotRefreshDeps::Analyze(NewRule).bPlayerCombatSensitive)
        {
            FCombatSensitiveEntry local_34;
            local_34.Spot = Spot;
            this.CombatSensitiveIndex.Add(local_34);
        }
        FSpotRefreshDeps local_22 = ::FSpotRefreshDeps::AnalyzeEffective(NewRule, bPlayerInCombat);
        FSpotCompiledDisplayRule local_50 = ::FSpotCompiledDisplayRule::Compile(NewRule);
        this.ClassifySpot(Spot, local_50, local_22, NearDistanceThresholdSq, OutStaticAdd, OutStaticRemove);
        return;
    }
    void ReclassifyOnCombatChange(const bool bPlayerInCombat, const float32 NearDistanceThresholdSq, TArray<TEUIModelRef<FM_Spot>> &out OutStaticAdd, TArray<TEUIModelRef<FM_Spot>> &out OutStaticRemove)
    {
        TArray<TEUIModelRef<FM_Spot>> local_4;
        OutStaticAdd = local_4;
        OutStaticRemove = local_4;
        int local_9 = 0;
        for (; local_9 < this.CombatSensitiveIndex.Num(); ++local_9)
        {
            FCombatSensitiveEntry& local_14 = this.CombatSensitiveIndex[local_9];
            if (!(local_14.Spot))
            {
                continue;
            }
            this.RemoveFromArray(this, local_14.Spot);
            this.RemoveFromArray(this.FarSpots, local_14.Spot);
            FSpotCompiledDisplayRule local_16;
            ::FSpotRefreshDeps::AnalyzeEffective(local_14.Rule, local_16);
        }
        return;
    }
    void Tick(const FVector &inout CurrentPlayerPos, const bool bCurrentPlayerInCombat, const float32 TeleportThresholdSq, const int StaggerBatchSize, const float32 NearDistanceThresholdSq, const float32 FarDemotionThresholdSq, TArray<FSpotRefreshResult> &out OutRefreshResults, TArray<TEUIModelRef<FM_Spot>> &out OutStaticAdd, TArray<TEUIModelRef<FM_Spot>> &out OutStaticRemove)
    {
        TArray<FSpotRefreshResult> local_4;
        OutRefreshResults = local_4;
        OutStaticAdd = TArray<TEUIModelRef<FM_Spot>>();
        OutStaticRemove = TArray<TEUIModelRef<FM_Spot>>();
        bool local_15 = (!(bCurrentPlayerInCombat) != !(this.bLastPlayerInCombat));
        bool local_14 = (CurrentPlayerPos.DistSquared(this.LastPlayerPosition) > TeleportThresholdSq);
        if (local_15)
        {
            this.ReclassifyOnCombatChange(bCurrentPlayerInCombat, NearDistanceThresholdSq, OutStaticAdd, OutStaticRemove);
        }
        if (local_14)
        {
            this.ReclassifyNearFar(NearDistanceThresholdSq);
        }
        int local_24 = this.Num() - 1;
        for (; local_24 >= 0; --local_24)
        {
            FSpotRefreshEntry& local_26 = this[local_24];
            if (!(local_26.Spot))
            {
                this.RemoveAtSwap(local_24);
                continue;
            }
            double local_20 = ::PresentationSpotUtils::GetDistanceToPlayerSq(local_26.Spot);
            OutRefreshResults.Add(this.MakeRefreshResult(local_26, bCurrentPlayerInCombat, local_20));
            if (local_20 > FarDemotionThresholdSq)
            {
                FSpotRefreshEntry local_50;
                this.RemoveAtSwap(local_24);
                this.FarSpots.Add(local_50);
            }
        }
        int local_21 = this.FarSpots.Num();
        if (local_21 > 0)
        {
            if (this.FarStaggerCursor >= local_21)
            {
                this.FarStaggerCursor = 0;
            }
            int local_51 = FMath::Min((this.FarStaggerCursor + StaggerBatchSize), local_21) - 1;
            for (; local_51 >= this.FarStaggerCursor; --local_51)
            {
                if (!(this.FarSpots[local_51].Spot))
                {
                    this.FarSpots.RemoveAtSwap(local_51);
                    continue;
                }
                double local_28 = ::PresentationSpotUtils::GetDistanceToPlayerSq(this.FarSpots[local_51].Spot);
                OutRefreshResults.Add(this.MakeRefreshResult(this.FarSpots[local_51], bCurrentPlayerInCombat, local_28));
                if (local_28 <= NearDistanceThresholdSq)
                {
                    FSpotRefreshEntry local_50;
                    this.FarSpots.RemoveAtSwap(local_51);
                    this.Add(local_50);
                }
            }
            this.FarStaggerCursor = FMath::Min(this.FarStaggerCursor + StaggerBatchSize, local_21);
            if (this.FarStaggerCursor >= this.FarSpots.Num())
            {
                this.FarStaggerCursor = 0;
            }
        }
        this.bLastPlayerInCombat = bCurrentPlayerInCombat;
        this.LastPlayerPosition = CurrentPlayerPos;
        return;
    }
    int GetTotalTrackedCount() const
    {
        return (this.Num() + this.FarSpots.Num());
    }
    const TArray<FSpotRefreshEntry> GetNearSpots() const
    {
        const TArray<FSpotRefreshEntry> __r;
        return __r;
    }
    const TArray<FSpotRefreshEntry> GetFarSpots() const
    {
        const TArray<FSpotRefreshEntry> __r;
        return __r;
    }
    const TArray<FCombatSensitiveEntry> GetCombatSensitiveIndex() const
    {
        const TArray<FCombatSensitiveEntry> __r;
        return __r;
    }
    bool GetLastPlayerInCombat() const
    {
        return this.bLastPlayerInCombat;
    }
    FSpotRefreshResult MakeRefreshResult(const FSpotRefreshEntry &inout Entry, const bool bPlayerInCombat, const float DistanceSq)
    {
        FSpotRefreshResult local_4;
        FSpotRefreshResult __r;
        local_4.Spot = Entry.Spot;
        local_4.bShouldDisplay = ::FSpotCompiledDisplayRule::Matches(Entry.Spot, Entry.CompiledRule, bPlayerInCombat, DistanceSq);
        return __r;
    }
    void ClassifySpot(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotCompiledDisplayRule &inout CompiledRule, const FSpotRefreshDeps &inout EffDeps, const float32 NearDistanceThresholdSq, TArray<TEUIModelRef<FM_Spot>> &out OutStaticAdd, TArray<TEUIModelRef<FM_Spot>> &out OutStaticRemove)
    {
        TArray<TEUIModelRef<FM_Spot>> local_4;
        OutStaticAdd = local_4;
        OutStaticRemove = local_4;
        if (EffDeps.bStaticResult)
        {
            if (EffDeps.bStaticValue)
            {
                OutStaticAdd.Add(Spot);
            }
            else
            {
                OutStaticRemove.Add(Spot);
            }
            return;
        }
        FSpotRefreshEntry local_28;
        local_28.Spot = Spot;
        local_28.EffectiveDeps = EffDeps;
        if (::PresentationSpotUtils::GetDistanceToPlayerSq(Spot) <= NearDistanceThresholdSq)
        {
            this.Add(local_28);
        }
        else
        {
            this.FarSpots.Add(local_28);
        }
        return;
    }
    void ReclassifyNearFar(const float32 NearDistanceThresholdSq)
    {
        int local_4 = this.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (!(this[local_4].Spot))
            {
                this.RemoveAtSwap(local_4);
                continue;
            }
            if (::PresentationSpotUtils::GetDistanceToPlayerSq(this[local_4].Spot) > NearDistanceThresholdSq)
            {
                FSpotRefreshEntry local_28;
                this.RemoveAtSwap(local_4);
                this.FarSpots.Add(local_28);
            }
        }
        int local_3 = this.FarSpots.Num() - 1;
        for (; local_3 >= 0; --local_3)
        {
            if (!(this.FarSpots[local_3].Spot))
            {
                this.FarSpots.RemoveAtSwap(local_3);
                continue;
            }
            if (::PresentationSpotUtils::GetDistanceToPlayerSq(this.FarSpots[local_3].Spot) <= NearDistanceThresholdSq)
            {
                FSpotRefreshEntry local_28;
                this.FarSpots.RemoveAtSwap(local_3);
                this.Add(local_28);
            }
        }
        this.FarStaggerCursor = 0;
        return;
    }
    void RemoveFromArray(TArray<FSpotRefreshEntry> &inout Arr, const TEUIModelRef<FM_Spot> &inout Spot)
    {
        int local_4 = Arr.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            TEUIModelRef<FM_Spot> local_8;
            local_8 = Arr[local_4].Spot;
            if ((local_8 == Spot.opImplConv()))
            {
                Arr.RemoveAtSwap(local_4);
                break;
            }
        }
        return;
    }
}

struct FM_SpotFilter : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TEUIModelRef<FM_SpotView> m_SpotView;
    UPROPERTY()
    USpotDisplayConfigBase m_DisplayConfig;
    UPROPERTY()
    TArray<TEUIModelRef<FM_Spot>> m_DisplayingSpots;
    UPROPERTY()
    uint m_DisplayingSpotsRevision;
    UPROPERTY()
    FSpotRefreshTracker m_RefreshTracker;
    UPROPERTY()
    float32 m_TeleportThreshold;
    UPROPERTY()
    int m_StaggerBatchSize;
    UPROPERTY()
    float32 m_NearDistanceThreshold;
    UPROPERTY()
    float32 m_FarDemotionMultiplier;

    FM_SpotFilter()
    {
        this.m_DisplayConfig = nullptr;
        this.m_DisplayingSpotsRevision = 0;
        this.m_TeleportThreshold = 5000.0f;
        this.m_StaggerBatchSize = 8;
        this.m_NearDistanceThreshold = 4000.0f;
        this.m_FarDemotionMultiplier = 1.25f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_SpotFilter' by default constructor.");
        return;
    }
    FM_SpotFilter(const FM_SpotFilter &inout Other)
    {
        this.m_DisplayConfig = nullptr;
        this.m_DisplayingSpotsRevision = 0;
        this.m_TeleportThreshold = 5000.0f;
        this.m_StaggerBatchSize = 8;
        this.m_NearDistanceThreshold = 4000.0f;
        this.m_FarDemotionMultiplier = 1.25f;
        this.m_SpotView = Other.m_SpotView;
        this.m_DisplayConfig = Other.m_DisplayConfig;
        this.m_DisplayingSpots = Other.m_DisplayingSpots;
        this.m_DisplayingSpotsRevision = int(Other.m_DisplayingSpotsRevision);
        this.m_TeleportThreshold = Other.m_TeleportThreshold;
        this.m_StaggerBatchSize = int(Other.m_StaggerBatchSize);
        this.m_NearDistanceThreshold = Other.m_NearDistanceThreshold;
        this.m_FarDemotionMultiplier = Other.m_FarDemotionMultiplier;
        return;
    }
    FM_SpotFilter(const USpotDisplayConfigBase InDisplayConfig)
    {
        FPresentationDisplayRule local_56;
        this.m_DisplayConfig = nullptr;
        this.m_DisplayingSpotsRevision = 0;
        this.m_TeleportThreshold = 5000.0f;
        this.m_StaggerBatchSize = 8;
        this.m_NearDistanceThreshold = 4000.0f;
        this.m_FarDemotionMultiplier = 1.25f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDisplayConfig(InDisplayConfig);
        if ((!((this.GetDisplayConfig() != nullptr))))
        {
            return;
        }
        int local_9 = int(this.GetDisplayConfig().GetInterestedDataType());
        this.SetSpotView(::FMS_CommonSpotViews::Get(this.GetContext().Manager).GetOrCreateDefaultView(this.GetContext().Manager));
        if (!(this.GetSpotView()))
        {
            return;
        }
        bool local_3 = ::FASCommonUtils::IsInCombat(this.GetContext().GetLocalPlayerPawn());
        int local_20 = this.GetNearDistanceThresholdSq();
        TArray<TEUIModelRef<FM_Spot>> local_24;
        TArray<TEUIModelRef<FM_Spot>> local_28;
        for (auto local_46 : this.GetSpotView().opArrow().GetAllInterestedSpots())
        {
            if (!(local_46))
            {
                continue;
            }
            if (this.GetDisplayConfig().GetDisplayRule(local_46, FSpotViewAdapter(this.GetSpotView()), local_56))
            {
                this.GetModify_RefreshTracker().AddSpot(local_46, local_56, local_3, local_20, local_24, local_28);
            }
        }
        for (auto local_46 : local_24)
        {
            this.AddDisplayingSpotIfNeeded(local_46);
        }
        return;
    }
    FM_SpotFilter opAssign(const FM_SpotFilter &inout Other)
    {
        FM_SpotFilter __r;
        this.m_SpotView = Other.m_SpotView;
        this.m_DisplayConfig = Other.m_DisplayConfig;
        this.m_DisplayingSpots = Other.m_DisplayingSpots;
        this.m_DisplayingSpotsRevision = int(Other.m_DisplayingSpotsRevision);
        this.m_TeleportThreshold = Other.m_TeleportThreshold;
        this.m_StaggerBatchSize = int(Other.m_StaggerBatchSize);
        this.m_NearDistanceThreshold = Other.m_NearDistanceThreshold;
        this.m_FarDemotionMultiplier = Other.m_FarDemotionMultiplier;
        return __r;
    }
    void LoadConfigDefault(const FM_SpotFilterConfigDefault &inout InConfig)
    {
        this.SetStaggerBatchSize(int(InConfig.StaggerBatchSize));
        this.SetNearDistanceThreshold(InConfig.NearDistanceThreshold);
        this.SetFarDemotionMultiplier(InConfig.FarDemotionMultiplier);
        this.SetTeleportThreshold(InConfig.TeleportThreshold);
        return;
    }
    float32 GetNearDistanceThresholdSq() const
    {
        return FMath::Square(this.GetNearDistanceThreshold());
    }
    float32 GetFarDemotionThresholdSq() const
    {
        return FMath::Square((this.GetNearDistanceThreshold() * this.GetFarDemotionMultiplier()));
    }
    uint GetDisplayingSpotsVersion() const
    {
        return this.GetDisplayingSpotsRevision();
    }
    void BumpDisplayingSpotsVersion()
    {
        this.SetDisplayingSpotsRevision((this.GetDisplayingSpotsRevision() + 1));
        return;
    }
    bool AddDisplayingSpotIfNeeded(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (!(Spot) || this.GetDisplayingSpots().Contains(Spot))
        {
            return false;
        }
        this.GetModify_DisplayingSpots().Add(Spot);
        this.BumpDisplayingSpotsVersion();
        return true;
    }
    bool RemoveDisplayingSpotIfNeeded(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (!(Spot) || !(this.GetDisplayingSpots().Contains(Spot)))
        {
            return false;
        }
        this.GetModify_DisplayingSpots().RemoveSingleSwap(Spot);
        this.BumpDisplayingSpotsVersion();
        return true;
    }
    void OnSpotAdded(const FMsg_InterestedSpotAdded &inout Message)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void OnSpotRemoved(const FMsg_InterestedSpotRemoved &inout Message)
    {
        FASProfilingScope local_1 = FASProfilingScope(n"PresentationSpotFilter_OnSpotRemoved", 0);
        this.GetModify_RefreshTracker().RemoveSpot(Message.Spot);
        this.RemoveDisplayingSpotIfNeeded(Message.Spot);
        return;
    }
    void OnSpotDataModified(const FMsg_InterestedSpotDataModified &inout Message)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void ManualAsyncTick()
    {
        bool local_75;
        if (!(this.GetSpotView()) || !((this.GetDisplayConfig() != nullptr)))
        {
            return;
        }
        FASProfilingScope local_8 = FASProfilingScope(n"PresentationSpotFilter_Tick", 2);
        TArray<FSpotRefreshResult> local_14;
        TArray<TEUIModelRef<FM_Spot>> local_18;
        TArray<TEUIModelRef<FM_Spot>> local_22;
        FVector local_34 = FTransformUtils::GetLocation(this.GetContext().GetLocalPlayerPawn(), FFPTime(-1));
        bool local_7 = ::FASCommonUtils::IsInCombat(this.GetContext().GetLocalPlayerPawn());
        float32 local_42 = this.GetFarDemotionThresholdSq();
        this.GetModify_RefreshTracker().Tick(local_34, local_7, FMath::Square(this.GetTeleportThreshold()), this.GetStaggerBatchSize(), this.GetNearDistanceThresholdSq(), local_42, local_14, local_18, local_22);
        auto local_52 = local_18.Iterator();
        for (; local_52.CanProceed;)
        {
            this.AddDisplayingSpotIfNeeded(local_52.Proceed());
        }
        auto local_58 = local_22.Iterator();
        for (; local_58.CanProceed;)
        {
            this.RemoveDisplayingSpotIfNeeded(local_58.Proceed());
        }
        for (auto& local_74 : local_14)
        {
            TEUIModelRef<FM_Spot>& local_60 = local_74.Spot;
            if (!(local_60))
            {
                continue;
            }
            local_75 = local_74.bShouldDisplay;
            bool local_3 = this.GetDisplayingSpots().Contains(local_60);
            if ((local_75 && !(local_3)))
            {
                this.AddDisplayingSpotIfNeeded(local_60);
                continue;
            }
            if (!(local_75) && local_3)
            {
                this.RemoveDisplayingSpotIfNeeded(local_60);
            }
        }
        return;
    }
    TEUIModelRef<FM_SpotView> GetSpotView() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SpotView;
    }
    void SetSpotView(const TEUIModelRef<FM_SpotView> &inout __Value) property
    {
        TEUIModelRef<FM_SpotView> local_2;
        local_2 = this.m_SpotView;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SpotView = __Value;
        return;
    }
    USpotDisplayConfigBase GetDisplayConfig() const property
    {
        this.TrackPropertyRead(1);
        return this.m_DisplayConfig;
    }
    void SetDisplayConfig(const USpotDisplayConfigBase __Value) property
    {
        if (this.m_DisplayConfig == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const TArray<TEUIModelRef<FM_Spot>> GetDisplayingSpots() const property
    {
        const TArray<TEUIModelRef<FM_Spot>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FM_Spot>> GetModify_DisplayingSpots() property
    {
        TArray<TEUIModelRef<FM_Spot>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDisplayingSpots(const TArray<TEUIModelRef<FM_Spot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplayingSpots = __Value;
        return;
    }
    uint GetDisplayingSpotsRevision() const property
    {
        this.TrackPropertyRead(3);
        return this.m_DisplayingSpotsRevision;
    }
    void SetDisplayingSpotsRevision(const uint __Value) property
    {
        if (this.m_DisplayingSpotsRevision == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DisplayingSpotsRevision = __Value;
        return;
    }
    const FSpotRefreshTracker GetRefreshTracker() const property
    {
        const FSpotRefreshTracker __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FSpotRefreshTracker GetModify_RefreshTracker() property
    {
        FSpotRefreshTracker __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetRefreshTracker(const FSpotRefreshTracker &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        return;
    }
    const float32 GetTeleportThreshold() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_TeleportThreshold() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetTeleportThreshold(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TeleportThreshold = __Value;
        return;
    }
    int GetStaggerBatchSize() const property
    {
        this.TrackPropertyRead(6);
        return this.m_StaggerBatchSize;
    }
    void SetStaggerBatchSize(const int __Value) property
    {
        if (this.m_StaggerBatchSize == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_StaggerBatchSize = __Value;
        return;
    }
    const float32 GetNearDistanceThreshold() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_NearDistanceThreshold() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetNearDistanceThreshold(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_NearDistanceThreshold = __Value;
        return;
    }
    const float32 GetFarDemotionMultiplier() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_FarDemotionMultiplier() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetFarDemotionMultiplier(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_FarDemotionMultiplier = __Value;
        return;
    }
}

struct FMS_CommonSpotFilters : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<EPresentationSpotUsage, TEUIModelWeakRef<FM_SpotFilter>> m_Filters;

    FMS_CommonSpotFilters()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CommonSpotFilters(const FMS_CommonSpotFilters &inout Other)
    {
        this.m_Filters = Other.m_Filters;
        return;
    }
    FMS_CommonSpotFilters& opAssign(const FMS_CommonSpotFilters &inout Other)
    {
        return Other.m_Filters;
    }
    TEUIModelRef<FM_SpotFilter> GetOrCreateFilter(const UObject WorldContext, const EPresentationSpotUsage Usage)
    {
        const UPresentationSpotDisplaySettings local_8;
        USpotDisplayConfigBase local_14;
        TEUIModelWeakRef<FM_SpotFilter> local_2;
        if (this.GetFilters().Find(Usage, local_2) && local_2.IsValid())
        {
            return local_2.AsRef();
        }
        GetGameplaySettings<UPresentationSpotDisplaySettings> local_10;
        local_8 = local_10;
        if (!(local_8.DisplayConfigs.Find(Usage, local_14)))
        {
            return TEUIModelRef<FM_SpotFilter>();
        }
        FM_SpotFilter& local_16 = ::FM_SpotFilter::Create(WorldContext, local_14);
        this.GetModify_Filters().Add(Usage, TEUIModelWeakRef<FM_SpotFilter>(local_16));
        return TEUIModelRef<FM_SpotFilter>(local_16);
    }
    const TMap<EPresentationSpotUsage, TEUIModelWeakRef<FM_SpotFilter>> GetFilters() const property
    {
        const TMap<EPresentationSpotUsage, TEUIModelWeakRef<FM_SpotFilter>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<EPresentationSpotUsage, TEUIModelWeakRef<FM_SpotFilter>> GetModify_Filters() property
    {
        TMap<EPresentationSpotUsage, TEUIModelWeakRef<FM_SpotFilter>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetFilters(const TMap<EPresentationSpotUsage, TEUIModelWeakRef<FM_SpotFilter>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Filters = __Value;
        return;
    }
}

namespace FSpotRefreshDeps
{
FSpotRefreshDeps Analyze(const FPresentationDisplayRule &inout Rule)
{
    FSpotRefreshDeps local_2;
    bool local_6 = (Rule.ConditionalRules.Num() > 0);
    if ((!(local_6) && !(Rule.bDisplayOnlyInCombat)))
    {
        if (!(Rule.bEnableDisplay))
        {
            local_2.bStaticResult = true;
            local_2.bStaticValue = false;
            return local_2;
        }
        if ((Rule.MinDistance <= 0.0f && (Rule.MaxDistance <= 0.0f)))
        {
            local_2.bStaticResult = true;
            local_2.bStaticValue = true;
            return local_2;
        }
        local_2.bDistanceSensitive = true;
        return local_2;
    }
    if (Rule.bDisplayOnlyInCombat)
    {
        local_2.bPlayerCombatSensitive = true;
    }
    for (auto& local_24 : Rule.ConditionalRules)
    {
        if (int(local_24.Condition.PlayerInCombat) != 0)
        {
            local_2.bPlayerCombatSensitive = true;
        }
        if (int(local_24.Condition.EntityInCombat) != 0)
        {
            local_2.bEntityCombatSensitive = true;
        }
        if ((local_24.Rule.MinDistance > 0.0f || (local_24.Rule.MaxDistance > 0.0f)))
        {
            local_2.bDistanceSensitive = true;
        }
    }
    if ((Rule.MinDistance > 0.0f || (Rule.MaxDistance > 0.0f)))
    {
        local_2.bDistanceSensitive = true;
    }
    return local_2;
}
FSpotRefreshDeps AnalyzeBasicRule(const bool bEnableDisplay, const float32 MinDistance, const float32 MaxDistance, const bool bEntityCombatSensitive)
{
    FSpotRefreshDeps local_2;
    local_2.bEntityCombatSensitive = bEntityCombatSensitive;
    if (!(bEnableDisplay))
    {
        local_2.bStaticResult = true;
        local_2.bStaticValue = false;
        return local_2;
    }
    if ((MinDistance <= 0.0f && (MaxDistance <= 0.0f)))
    {
        local_2.bStaticResult = true;
        local_2.bStaticValue = true;
        return local_2;
    }
    local_2.bDistanceSensitive = true;
    return local_2;
}
FSpotRefreshDeps AnalyzeEffective(const FPresentationDisplayRule &inout Rule, const bool bPlayerInCombat)
{
    bool local_2 = false;
    int local_1 = local_2;
    for (auto& local_16 : Rule.ConditionalRules)
    {
        if (int(local_16.Condition.EntityInCombat) != 0)
        {
            bool local_2_2 = true;
            local_1 = local_2_2;
        }
    }
    for (auto& local_16 : Rule.ConditionalRules)
    {
        if (int(local_16.Condition.PlayerInCombat) != 0)
        {
            bool local_2_3 = (int(local_16.Condition.PlayerInCombat) == 1);
            bool local_21 = !(bPlayerInCombat);
            if (!(local_2_3) != local_21)
            {
                continue;
            }
        }
        if (int(local_16.Condition.EntityInCombat) != 0)
        {
            bool local_21_2 = true;
            local_1 = local_21_2;
        }
        return FSpotRefreshDeps::AnalyzeBasicRule(local_16.Rule.bEnableDisplay, int(local_16.Rule.MinDistance), local_16.Rule.MaxDistance, (local_1 != 0));
    }
    if ((Rule.bDisplayOnlyInCombat && !(bPlayerInCombat)))
    {
        FSpotRefreshDeps local_28;
        local_28.bStaticResult = true;
        local_28.bStaticValue = false;
        return local_28;
    }
    return FSpotRefreshDeps::AnalyzeBasicRule(Rule.bEnableDisplay, int(Rule.MinDistance), Rule.MaxDistance, (local_1 != 0));
}
}
namespace FSpotCompiledDisplayRule
{
FSpotCompiledDisplayRuleBasic CompileBasicRule(const bool bEnableDisplay, const float32 MinDistance, const float32 MaxDistance)
{
    FSpotCompiledDisplayRuleBasic local_8;
    local_8.bEnableDisplay = bEnableDisplay;
    local_8.MinDistanceSq = FMath::Square(MinDistance);
    local_8.MaxDistanceSq = FMath::Square(MaxDistance);
    local_8.bHasMaxDistance = (MaxDistance > 0.0f);
    return local_8;
}
FSpotCompiledDisplayRule Compile(const FPresentationDisplayRule &inout Rule)
{
    FSpotCompiledDisplayRule local_14;
    FSpotCompiledDisplayRule __r;
    FSpotCompiledDisplayConditionalRule local_26;
    FSpotCompiledDisplayRule::CompileBasicRule(local_26, Rule.bEnableDisplay, int(Rule.MinDistance));
    local_14.DefaultRule = local_26;
    local_14.bDisplayOnlyInCombat = Rule.bDisplayOnlyInCombat;
    for (auto& local_40 : Rule.ConditionalRules)
    {
        FSpotCompiledDisplayConditionalRule local_50;
        local_50.PlayerInCombat = EPresentationDisplayConditionRequirement(local_40.Condition.PlayerInCombat);
        local_50.EntityInCombat = EPresentationDisplayConditionRequirement(local_40.Condition.EntityInCombat);
        FSpotCompiledDisplayRule::CompileBasicRule(local_26, local_40.Rule.bEnableDisplay, int(local_40.Rule.MinDistance));
        local_50.Rule = local_26;
        local_14.ConditionalRules.Add(local_50);
    }
    return __r;
}
bool MatchesBasicRule(const FSpotCompiledDisplayRuleBasic &inout Rule, const float DistanceSq)
{
    if (!(Rule.bEnableDisplay))
    {
        return false;
    }
    if (DistanceSq < Rule.MinDistanceSq)
    {
        return false;
    }
    if ((Rule.bHasMaxDistance && (DistanceSq > Rule.MaxDistanceSq)))
    {
        return false;
    }
    return true;
}
bool MatchesRequirement(const EPresentationDisplayConditionRequirement Requirement, const bool bCurrentValue)
{
    switch (int(Requirement))
    {
    case 0:
    {
        return true;
    }
    case 1:
    {
        return bCurrentValue;
    }
    case 2:
    {
        return !(bCurrentValue);
    }
    default:
    {
    }
    }
    return false;
}
bool IsSpotEntityInCombat(const TEUIModelRef<FM_Spot> &inout Spot)
{
    if (!(Spot))
    {
        return false;
    }
    FECSEntity local_6 = FECSEntity(GetOwnerEntityId(Spot.opArrow()));
    if (local_6)
    {
        FECSEntity local_16 = FASCommonUtils::GetControlledPawnEntity(local_6);
        if (local_16)
        {
            return FASCommonUtils::IsInCombat(local_16);
        }
    }
    return false;
}
bool Matches(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotCompiledDisplayRule &inout Rule, const bool bPlayerInCombat, const float DistanceSq)
{
    bool local_1 = false;
    bool local_3 = false;
    for (auto& local_18 : Rule.ConditionalRules)
    {
        if (!(FSpotCompiledDisplayRule::MatchesRequirement(EPresentationDisplayConditionRequirement(local_18.PlayerInCombat), bPlayerInCombat)))
        {
            continue;
        }
        if (int(local_18.EntityInCombat) != 0)
        {
            if (!(local_3))
            {
                local_1 = FSpotCompiledDisplayRule::IsSpotEntityInCombat(Spot);
                local_3 = true;
            }
            if (!(FSpotCompiledDisplayRule::MatchesRequirement(EPresentationDisplayConditionRequirement(local_18.EntityInCombat), local_1)))
            {
                continue;
            }
        }
        return FSpotCompiledDisplayRule::MatchesBasicRule(local_18.Rule, DistanceSq);
    }
    if ((Rule.bDisplayOnlyInCombat && !(bPlayerInCombat)))
    {
        return false;
    }
    return FSpotCompiledDisplayRule::MatchesBasicRule(Rule.DefaultRule, DistanceSq);
}
}
namespace FM_SpotFilter
{
FM_SpotFilter& Create(const UObject ContextObject, const USpotDisplayConfigBase DisplayConfig)
{
    return FM_SpotFilter::CreateByManager(EUIInternal::GetContextManager(ContextObject), DisplayConfig);
}
FM_SpotFilter CreateByManager(const UEUIManagerSubsystem Manager, const USpotDisplayConfigBase DisplayConfig)
{
    FM_SpotFilter __r;
    TEUIModelRef<FM_SpotFilter> local_6 = TEUIModelRef<FM_SpotFilter>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_SpotFilter::ModelId, 0, DisplayConfig));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FM_SpotFilter;
}
void __OnSpotAdded(FM_SpotFilter &inout Model, const FMsg_InterestedSpotAdded &inout Message)
{
    Model.OnSpotAdded(Message);
    return;
}
void __OnSpotRemoved(FM_SpotFilter &inout Model, const FMsg_InterestedSpotRemoved &inout Message)
{
    Model.OnSpotRemoved(Message);
    return;
}
void __OnSpotDataModified(FM_SpotFilter &inout Model, const FMsg_InterestedSpotDataModified &inout Message)
{
    Model.OnSpotDataModified(Message);
    return;
}
int __IndexOf_SpotView()
{
    return 0;
}
int __IndexOf_DisplayConfig()
{
    return 1;
}
int __IndexOf_DisplayingSpots()
{
    return 2;
}
int __IndexOf_DisplayingSpotsRevision()
{
    return 3;
}
int __IndexOf_RefreshTracker()
{
    return 4;
}
int __IndexOf_TeleportThreshold()
{
    return 5;
}
int __IndexOf_StaggerBatchSize()
{
    return 6;
}
int __IndexOf_NearDistanceThreshold()
{
    return 7;
}
int __IndexOf_FarDemotionMultiplier()
{
    return 8;
}
}
namespace FMS_CommonSpotFilters
{
FMS_CommonSpotFilters& Get(const UObject ContextObject)
{
    return FMS_CommonSpotFilters::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CommonSpotFilters GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_CommonSpotFilters __r;
    TEUIModelRef<FMS_CommonSpotFilters> local_6 = TEUIModelRef<FMS_CommonSpotFilters>(EUIInternal::MakeModelWithManager(Manager, FMS_CommonSpotFilters::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CommonSpotFilters;
}
int __IndexOf_Filters()
{
    return 0;
}
}
