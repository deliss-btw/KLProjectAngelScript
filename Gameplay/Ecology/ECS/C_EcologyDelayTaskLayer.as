
namespace __INTENRAL_FCS_EcologyDelayTaskLayer_NS
{
    const TECSComponentDerivedPtr<FCS_EcologyDelayTaskLayer> DerivedPtr = TECSComponentDerivedPtr<FCS_EcologyDelayTaskLayer>();
    const FCS_EcologyDelayTaskLayer DefaultValue = FCS_EcologyDelayTaskLayer();

}
struct FCS_EcologyDelayTaskLayer : FECSSingleton
{
    UPROPERTY()
    FDelayTaskLayer SpawnTaskLayer;
    UPROPERTY()
    FDelayTaskLayer TargetUpdateLayer;
    UPROPERTY()
    FDelayTaskLayer ActivityUpdateLayer;

    FCS_EcologyDelayTaskLayer()
    {
        return;
    }
    bool IsEmpty()
    {
        return this.IsEmpty() && this.TargetUpdateLayer.IsEmpty() && this.ActivityUpdateLayer.IsEmpty();
    }
}

namespace ECSFunc_FCS_EcologyDelayTaskLayer
{
UFUNCTION()
bool HasEcologyDelayTaskLayer(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcologyDelayTaskLayer);
}
FCS_EcologyDelayTaskLayer& AssignEcologyDelayTaskLayer(const FECSWorldPtr &inout World, const FCS_EcologyDelayTaskLayer &inout DefaultValue = FCS_EcologyDelayTaskLayer())
{
    UScriptStruct local_6 = FCS_EcologyDelayTaskLayer;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcologyDelayTaskLayer_BP(const FECSWorldPtr &inout World, const FCS_EcologyDelayTaskLayer &inout DefaultValue = FCS_EcologyDelayTaskLayer())
{
    ECSFunc_FCS_EcologyDelayTaskLayer::AssignEcologyDelayTaskLayer(World, DefaultValue);
    return;
}
FCS_EcologyDelayTaskLayer& ModifyEcologyDelayTaskLayer(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyDelayTaskLayer;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcologyDelayTaskLayer& ModifyOrAddEcologyDelayTaskLayer(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyDelayTaskLayer;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcologyDelayTaskLayer& GetEcologyDelayTaskLayer(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyDelayTaskLayer;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcologyDelayTaskLayer GetEcologyDelayTaskLayer_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcologyDelayTaskLayer __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcologyDelayTaskLayer::GetEcologyDelayTaskLayer(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcologyDelayTaskLayer GetDefaultedEcologyDelayTaskLayer(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcologyDelayTaskLayer __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcologyDelayTaskLayer);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_EcologyDelayTaskLayer GetDefaultedEcologyDelayTaskLayer_BP(const FECSWorldPtr &inout World)
{
    FCS_EcologyDelayTaskLayer __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyDelayTaskLayer(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcologyDelayTaskLayer);
}
}
void __MonitorEcologyDelayTaskLayerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcologyDelayTaskLayer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyDelayTaskLayerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcologyDelayTaskLayer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyDelayTaskLayerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcologyDelayTaskLayer, bFixedFrame, Details);
    return;
}
