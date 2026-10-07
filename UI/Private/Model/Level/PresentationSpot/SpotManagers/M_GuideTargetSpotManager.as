
namespace FMS_GuideTargetSpotManager
{
    const int ModelId = 0;

}
struct FMS_GuideTargetSpotManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_SpotRegistry> m_SpotRegistry;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_GuideTargetSpot;

    FMS_GuideTargetSpotManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_GuideTargetSpotManager(const FMS_GuideTargetSpotManager &inout Other)
    {
        this.m_SpotRegistry = Other.m_SpotRegistry;
        this.m_GuideTargetSpot = Other.m_GuideTargetSpot;
        return;
    }
    FMS_GuideTargetSpotManager& opAssign(const FMS_GuideTargetSpotManager &inout Other)
    {
        this.m_SpotRegistry = Other.m_SpotRegistry;
        return Other.m_GuideTargetSpot;
    }
    void PostConstruct()
    {
        this.SetSpotRegistry(TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetDefaultRegistry(this.GetManager())));
        return;
    }
    void OnGuidingPathChanged(const FC_GuidingPathPoints &inout GuidingPathPoints)
    {
        TEUIModelRef<FM_SpotRegistry> local_6;
        const UPresentationSpotSettings local_18;
        if (!(GuidingPathPoints) || !(GuidingPathPoints.GetbLastFindPathSuccess()))
        {
            TEUIModelRef<FM_Spot> local_4 = this.GetGuideTargetSpot();
            if (!(::PresentationSpotUtils::IsEntitySpot(local_4)))
            {
                TEUIModelRef<FM_Spot> local_4_2 = this.GetGuideTargetSpot();
                local_6 = this.GetSpotRegistry();
                local_6.opArrow().RemoveSpot(local_4_2);
            }
            TEUIModelRef<FM_Spot> local_4_3 = this.GetGuideTargetSpot();
            if (local_4_3)
            {
                TEUIModelRef<FM_Spot> local_4_4 = this.GetGuideTargetSpot();
                ::RemoveDecoractor(local_4_4.opArrow(), EPresentationSpotDecoractor(0), local_6);
                this.SetGuideTargetSpot(local_4_4);
            }
            return;
        }
        if ((FECSEntity(GuidingPathPoints.GetTargetEntity()) == ENTITY_NULL))
        {
            TEUIModelRef<FM_Spot> local_4_5 = this.GetGuideTargetSpot();
            if (!(local_4_5) || (!((::GetOwnerEntityId(this.GetGuideTargetSpot().opArrow()) == ENTITY_ID_NULL))))
            {
                TEUIModelRef<FM_Spot> local_4_6 = this.GetGuideTargetSpot();
                if (local_4_6)
                {
                    TEUIModelRef<FM_Spot> local_4_7 = this.GetGuideTargetSpot();
                    ::RemoveDecoractor(local_4_7.opArrow(), EPresentationSpotDecoractor(0), local_6);
                }
                GetGameplaySettings<UPresentationSpotSettings> local_20;
                local_18 = local_20;
                local_6 = this.GetSpotRegistry();
                TEUIModelRef<FM_Spot> local_4_8 = TEUIModelRef<FM_Spot>(local_6.opArrow().CreateSpot());
                this.SetGuideTargetSpot(local_4_8);
                TEUIModelRef<FM_Spot> local_4_9 = this.GetGuideTargetSpot();
                ::SetPresentationConfig(local_4_9.opArrow(), local_18.PositionGuideTargetConfig, local_6);
                TEUIModelRef<FM_Spot> local_4_10 = this.GetGuideTargetSpot();
            }
            TEUIModelRef<FM_Spot> local_4_11 = this.GetGuideTargetSpot();
            local_4_11.opArrow().GetModify_Transform().SetPosition(GuidingPathPoints.GetTargetLocation());
        }
        else
        {
            TEUIModelRef<FM_Spot> local_4_12 = this.GetGuideTargetSpot();
            bool local_2 = local_4_12;
            if (local_2)
            {
                TEUIModelRef<FM_Spot> local_4_13 = this.GetGuideTargetSpot();
                if (!(::PresentationSpotUtils::IsEntitySpot(local_4_13)))
                {
                    TEUIModelRef<FM_Spot> local_4_14 = this.GetGuideTargetSpot();
                    local_6 = this.GetSpotRegistry();
                    local_6.opArrow().RemoveSpot(local_4_14);
                }
                TEUIModelRef<FM_Spot> local_4_15 = this.GetGuideTargetSpot();
                ::RemoveDecoractor(local_4_15.opArrow(), EPresentationSpotDecoractor(0), local_6);
            }
            TEUIModelRef<FM_Spot> local_4_16 = TEUIModelRef<FM_Spot>(::PresentationSpotUtils::RequireEntitySpot(this.GetContext().Manager, GuidingPathPoints.GetTargetEntity().GetId(), local_6));
            this.SetGuideTargetSpot(local_4_16);
        }
        TEUIModelRef<FM_Spot> local_4_17 = this.GetGuideTargetSpot();
        ::AddDecoractor(local_4_17.opArrow(), EPresentationSpotDecoractor(0), local_6);
        return;
    }
    TEUIModelRef<FM_SpotRegistry> GetSpotRegistry() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SpotRegistry;
    }
    void SetSpotRegistry(const TEUIModelRef<FM_SpotRegistry> &inout __Value) property
    {
        TEUIModelRef<FM_SpotRegistry> local_2;
        local_2 = this.m_SpotRegistry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SpotRegistry = __Value;
        return;
    }
    TEUIModelRef<FM_Spot> GetGuideTargetSpot() const property
    {
        this.TrackPropertyRead(1);
        return this.m_GuideTargetSpot;
    }
    void SetGuideTargetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_GuideTargetSpot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_GuideTargetSpot = __Value;
        return;
    }
}

namespace FMS_GuideTargetSpotManager
{
FMS_GuideTargetSpotManager& Get(const UObject ContextObject)
{
    return FMS_GuideTargetSpotManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_GuideTargetSpotManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_GuideTargetSpotManager __r;
    TEUIModelRef<FMS_GuideTargetSpotManager> local_6 = TEUIModelRef<FMS_GuideTargetSpotManager>(EUIInternal::MakeModelWithManager(Manager, FMS_GuideTargetSpotManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnGuidingPathChanged";
    local_14.ComponentType = FC_GuidingPathPoints;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_GuideTargetSpotManager;
}
void __OnGuidingPathChanged(FMS_GuideTargetSpotManager &inout Model, const FECSEntity &inout Entity, const FC_GuidingPathPoints &inout Component)
{
    Model.OnGuidingPathChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_SpotRegistry()
{
    return 0;
}
int __IndexOf_GuideTargetSpot()
{
    return 1;
}
}
