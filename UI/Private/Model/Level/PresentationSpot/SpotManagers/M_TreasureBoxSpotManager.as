
namespace FMS_TreasureBoxSpotManager
{
    const int ModelId = 0;

}
struct FMS_TreasureBoxSpotManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<TDataObjectPtr<FLevelObjectStatConfig>, TEUIModelRef<FM_Spot>> m_TreasureBoxSpots;

    FMS_TreasureBoxSpotManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_TreasureBoxSpotManager(const FMS_TreasureBoxSpotManager &inout Other)
    {
        this.m_TreasureBoxSpots = Other.m_TreasureBoxSpots;
        return;
    }
    FMS_TreasureBoxSpotManager& opAssign(const FMS_TreasureBoxSpotManager &inout Other)
    {
        return Other.m_TreasureBoxSpots;
    }
    void OnTreasureBoxStateChanged(const FMsg_TreasureBoxStateChanged &inout Msg)
    {
        bool local_93;
        TDataObjectPtr<FLevelObjectStatConfig> local_24 = Msg.TreasureBoxConfig;
        if (!(this.GetContext().World.IsValid()))
        {
            return;
        }
        FM_SpotRegistry& local_54 = ::PresentationSpotUtils::GetDefaultRegistry(this.GetManager());
        FMS_TreasureBoxData& local_56 = ::FMS_TreasureBoxData::Get(this.GetManager());
        TEUIModelRef<FM_Spot> local_58;
        if (!(this.GetTreasureBoxSpots().Find(local_24, local_58)))
        {
            local_58 = TEUIModelRef<FM_Spot>(local_54.CreateSpot());
            Get local_64;
            const FCS_TreasureBoxes& local_66 = local_64.opCall();
            if (local_66)
            {
                FECSEntity local_70 = local_66.GetTreasureBox(local_24);
                if (!((local_70.GetId() == ENTITY_ID_NULL)))
                {
                    ::PresentationSpotUtils::BindEntitySpot(local_58, local_70.GetId());
                    FVector local_82;
                    FVector3f local_85;
                    FECSEntity local_74 = ::FASCommonUtils::GetLocalUniquePlayerEntity();
                    if (local_74.IsValid() && local_74.GetWorld().IsValid())
                    {
                        if (::AttributeSampleUtils::SamplePosition(local_74, local_70.GetId(), local_82))
                        {
                            local_58.opArrow().GetModify_Transform().SetPosition(local_82);
                        }
                        if (::AttributeSampleUtils::SampleRotation(local_74, local_70.GetId(), local_85))
                        {
                            local_58.opArrow().GetModify_Transform().SetEulerRotation(local_85);
                        }
                    }
                }
            }
            this.GetModify_TreasureBoxSpots().Add(local_24, local_58);
        }
        TDataObjectPtr<FPresentationConfig> local_120;
        TDataObjectPtr<FPresentationRuleConfig> local_144;
        bool local_94 = this.ResolvePresentationConfig(local_24, local_56, local_120, local_144);
        if (!(local_94))
        {
            local_93 = false;
        }
        else
        {
            local_93 = local_120;
        }
        if (!(!(local_93)) && local_144)
        {
            this.SetupSpotConfigs(local_58, local_120, local_144, TEUIModelRef<FM_SpotRegistry>(local_54));
        }
        else
        {
            this.ClearSpotConfigs(local_58, TEUIModelRef<FM_SpotRegistry>(local_54));
        }
        return;
    }
    void InvalidateEntityCache()
    {
        FM_SpotRegistry& local_4 = ::PresentationSpotUtils::GetDefaultRegistry(this.GetManager());
        for (auto& local_24 : this.GetTreasureBoxSpots())
        {
            local_24;
            if (local_4.HasSpot())
            {
                local_4.RemoveSpot();
            }
        }
        this.GetModify_TreasureBoxSpots().Empty(0);
        return;
    }
    void SetupSpotConfigs(const TEUIModelRef<FM_Spot> &inout Spot, const TDataObjectPtr<FPresentationConfig> &inout PresentationConfig, const TDataObjectPtr<FPresentationRuleConfig> &inout RuleConfig, const TEUIModelRef<FM_SpotRegistry> &inout Registry)
    {
        bool local_2;
        ::SetPresentationConfig(Spot.opArrow(), PresentationConfig, Registry);
        TDataObjectPtr<FMinimapIconConfig> local_50;
        if (!(RuleConfig))
        {
            local_2 = false;
        }
        else
        {
            local_2 = RuleConfig.opArrow().bShowMinimapIcon;
        }
        if (local_2)
        {
            local_50 = RuleConfig.opArrow().GetMinimapIconSettings();
        }
        else
        {
            local_50 = TDataObjectPtr<FMinimapIconConfig>();
        }
        ::SetMinimapIconConfig(Spot.opArrow(), local_50);
        TDataObjectPtr<FIndicatorConfig> local_146;
        if (!(RuleConfig))
        {
            local_2 = false;
        }
        else
        {
            local_2 = RuleConfig.opArrow().bShowIndicator;
        }
        if (local_2)
        {
            local_146 = RuleConfig.opArrow().GetIndicatorConfig();
        }
        else
        {
            local_146 = TDataObjectPtr<FIndicatorConfig>();
        }
        ::SetIndicatorConfig(Spot.opArrow(), local_146);
        TDataObjectPtr<FNavigationBarIconConfig> local_242;
        if (!(RuleConfig))
        {
            local_2 = false;
        }
        else
        {
            local_2 = RuleConfig.opArrow().bShowNavigationBarIcon;
        }
        if (local_2)
        {
            local_242 = RuleConfig.opArrow().GetNavigationBarIconConfig();
        }
        else
        {
            local_242 = TDataObjectPtr<FNavigationBarIconConfig>();
        }
        ::SetNavigationBarIconConfig(Spot.opArrow(), local_242);
        TDataObjectPtr<FHeadsUpDisplayConfig> local_338;
        if (!(RuleConfig))
        {
            local_2 = false;
        }
        else
        {
            local_2 = RuleConfig.opArrow().bShowHeadsUpDisplay;
        }
        if (local_2)
        {
            local_338 = RuleConfig.opArrow().GetHeadsUpDisplayConfig();
        }
        else
        {
            local_338 = TDataObjectPtr<FHeadsUpDisplayConfig>();
        }
        ::SetHeadsUpDisplayConfig(Spot.opArrow(), local_338);
        return;
    }
    void ClearSpotConfigs(const TEUIModelRef<FM_Spot> &inout Spot, const TEUIModelRef<FM_SpotRegistry> &inout Registry)
    {
        ::SetPresentationConfig(Spot.opArrow(), TDataObjectPtr<FPresentationConfig>(), Registry);
        ::SetMinimapIconConfig(Spot.opArrow(), TDataObjectPtr<FMinimapIconConfig>(), Registry);
        ::SetIndicatorConfig(Spot.opArrow(), TDataObjectPtr<FIndicatorConfig>(), Registry);
        ::SetNavigationBarIconConfig(Spot.opArrow(), TDataObjectPtr<FNavigationBarIconConfig>(), Registry);
        ::SetHeadsUpDisplayConfig(Spot.opArrow(), TDataObjectPtr<FHeadsUpDisplayConfig>(), Registry);
        return;
    }
    bool ResolvePresentationConfig(const TDataObjectPtr<FLevelObjectStatConfig> &inout TreasureBoxLevelObjectStatConfig, const FMS_TreasureBoxData &inout TreasureBoxData, TDataObjectPtr<FPresentationConfig> &inout OutPresentationConfig, TDataObjectPtr<FPresentationRuleConfig> &inout OutPresentationRuleConfig) const
    {
        ETreasureBoxState local_1 = TreasureBoxData.GetTreasureBoxState(TreasureBoxLevelObjectStatConfig);
        Get local_6;
        const FCS_TreasureBoxes& local_8 = local_6.opCall();
        if (local_8)
        {
            FECSEntity local_14 = local_8.GetTreasureBox(TreasureBoxLevelObjectStatConfig);
            if ((!((local_14.GetId() == ENTITY_ID_NULL))))
            {
                if (local_8.GetTreasureBoxStateConfigs().Contains(local_14))
                {
                    TDataObjectPtr<FTreasureBoxStateConfig> local_44 = local_8.GetTreasureBoxStateConfigs()[local_14];
                    if (local_44.IsSet())
                    {
                        if (int(local_1) == 1)
                        {
                        }
                        else
                        {
                        }
                        TDataObjectPtr<FPresentationConfig> local_94;
                        OutPresentationConfig = local_94;
                        if (int(local_1) == 1)
                        {
                        }
                        else
                        {
                        }
                        TDataObjectPtr<FPresentationRuleConfig> local_118;
                        OutPresentationRuleConfig = local_118;
                        return true;
                    }
                }
            }
        }
        return false;
    }
    const TMap<TDataObjectPtr<FLevelObjectStatConfig>, TEUIModelRef<FM_Spot>> GetTreasureBoxSpots() const property
    {
        const TMap<TDataObjectPtr<FLevelObjectStatConfig>, TEUIModelRef<FM_Spot>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<TDataObjectPtr<FLevelObjectStatConfig>, TEUIModelRef<FM_Spot>> GetModify_TreasureBoxSpots() property
    {
        TMap<TDataObjectPtr<FLevelObjectStatConfig>, TEUIModelRef<FM_Spot>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTreasureBoxSpots(const TMap<TDataObjectPtr<FLevelObjectStatConfig>, TEUIModelRef<FM_Spot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TreasureBoxSpots = __Value;
        return;
    }
}

namespace FMS_TreasureBoxSpotManager
{
FMS_TreasureBoxSpotManager& Get(const UObject ContextObject)
{
    return FMS_TreasureBoxSpotManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_TreasureBoxSpotManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_TreasureBoxSpotManager __r;
    TEUIModelRef<FMS_TreasureBoxSpotManager> local_6 = TEUIModelRef<FMS_TreasureBoxSpotManager>(EUIInternal::MakeModelWithManager(Manager, FMS_TreasureBoxSpotManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnTreasureBoxStateChanged";
    local_14.MessageTypeName = "Msg_TreasureBoxStateChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_TreasureBoxSpotManager;
}
void __OnTreasureBoxStateChanged(FMS_TreasureBoxSpotManager &inout Model, const FMsg_TreasureBoxStateChanged &inout Message)
{
    Model.OnTreasureBoxStateChanged(Message);
    return;
}
int __IndexOf_TreasureBoxSpots()
{
    return 0;
}
}
