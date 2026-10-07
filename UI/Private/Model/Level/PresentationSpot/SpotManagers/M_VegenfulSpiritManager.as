
namespace FM_VegenfulSpiritManager
{
    const int ModelId = 0;

}
struct FM_VegenfulSpiritManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_SpotRegistry> m_SpotRegistry;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_VegenfulSpiritSpotModel;

    FM_VegenfulSpiritManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_VegenfulSpiritManager(const FM_VegenfulSpiritManager &inout Other)
    {
        this.m_SpotRegistry = Other.m_SpotRegistry;
        this.m_VegenfulSpiritSpotModel = Other.m_VegenfulSpiritSpotModel;
        return;
    }
    FM_VegenfulSpiritManager& opAssign(const FM_VegenfulSpiritManager &inout Other)
    {
        this.m_SpotRegistry = Other.m_SpotRegistry;
        return Other.m_VegenfulSpiritSpotModel;
    }
    void PostConstruct()
    {
        this.SetSpotRegistry(TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetDefaultRegistry(this.GetManager())));
        return;
    }
    void UpdateVegenfulSpirit()
    {
        int local_8 = 0;
        if (!(this.GetContext().World))
        {
            return;
        }
        if (!(local_8) || local_8.GetDisplayName().IsEmpty() || (FECSEntity(local_8.GetVegenfulSpiritEntity()) == ENTITY_NULL))
        {
            TEUIModelRef<FM_Spot> local_20 = this.GetVegenfulSpiritSpotModel();
            if (local_20)
            {
                TEUIModelRef<FM_Spot> local_20_2 = this.GetVegenfulSpiritSpotModel();
                this.GetSpotRegistry().opArrow().RemoveSpot(local_20_2);
                this.SetVegenfulSpiritSpotModel(local_20_2);
            }
            return;
        }
        TEUIModelRef<FM_Spot> local_20_3 = this.GetVegenfulSpiritSpotModel();
        if (!(local_20_3))
        {
            TEUIModelRef<FM_Spot> local_20_4 = TEUIModelRef<FM_Spot>(::PresentationSpotUtils::RequireEntitySpot(this.GetManager(), local_8.GetVegenfulSpiritEntity().GetId(), this.GetSpotRegistry()));
            this.SetVegenfulSpiritSpotModel(local_20_4);
        }
        else
        {
            TEUIModelRef<FM_Spot> local_20_5 = this.GetVegenfulSpiritSpotModel();
            if ((!((local_20_5.opArrow().GetEntityId() == local_8.GetVegenfulSpiritEntity().GetId()))))
            {
                TEUIModelRef<FM_Spot> local_20_6 = this.GetVegenfulSpiritSpotModel();
                this.GetSpotRegistry().opArrow().RemoveSpot(local_20_6);
                TEUIModelRef<FM_Spot> local_20_7 = TEUIModelRef<FM_Spot>(::PresentationSpotUtils::RequireEntitySpot(this.GetManager(), local_8.GetVegenfulSpiritEntity().GetId(), this.GetSpotRegistry()));
                this.SetVegenfulSpiritSpotModel(local_20_7);
            }
        }
        TEUIModelRef<FM_SpotRegistry> local_22 = this.GetSpotRegistry();
        FText local_32 = FText::FromString(local_8.GetDisplayName());
        TEUIModelRef<FM_Spot> local_20_8 = this.GetVegenfulSpiritSpotModel();
        ::SetSpotName(local_20_8.opArrow(), local_32, local_22);
        return;
    }
    void InvalidateEntityCache()
    {
        TEUIModelRef<FM_Spot> local_4 = this.GetVegenfulSpiritSpotModel();
        this.GetSpotRegistry().opArrow().RemoveSpot(local_4);
        this.SetVegenfulSpiritSpotModel(local_4);
        return;
    }
    void BeginDestroy()
    {
        this.GetSpotRegistry().opArrow().RemoveSpot(this.GetVegenfulSpiritSpotModel());
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
    TEUIModelRef<FM_Spot> GetVegenfulSpiritSpotModel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_VegenfulSpiritSpotModel;
    }
    void SetVegenfulSpiritSpotModel(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_VegenfulSpiritSpotModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_VegenfulSpiritSpotModel = __Value;
        return;
    }
}

namespace FM_VegenfulSpiritManager
{
FM_VegenfulSpiritManager& Get(const UObject ContextObject)
{
    return FM_VegenfulSpiritManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_VegenfulSpiritManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FM_VegenfulSpiritManager __r;
    TEUIModelRef<FM_VegenfulSpiritManager> local_6 = TEUIModelRef<FM_VegenfulSpiritManager>(EUIInternal::MakeModelWithManager(Manager, FM_VegenfulSpiritManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelEffectDefine local_8;
    local_8.FunctionName = "UpdateVegenfulSpirit";
    Result.EffectFunctions.Add(local_8);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_VegenfulSpiritManager;
}
int __IndexOf_SpotRegistry()
{
    return 0;
}
int __IndexOf_VegenfulSpiritSpotModel()
{
    return 1;
}
}
