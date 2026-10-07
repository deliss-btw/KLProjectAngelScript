
namespace __INTENRAL_FCS_CommonLoadingManager_NS
{
    const TECSComponentDerivedPtr<FCS_CommonLoadingManager> DerivedPtr = TECSComponentDerivedPtr<FCS_CommonLoadingManager>();
    const FCS_CommonLoadingManager DefaultValue = FCS_CommonLoadingManager();
}
namespace __INTENRAL_FCE_ShowLoadingPage_NS
{
    const TECSEventDerivedPtr<FCE_ShowLoadingPage> DerivedPtr = TECSEventDerivedPtr<FCE_ShowLoadingPage>();

}
struct FCS_CommonLoadingManager : FECSSingleton
{
    UPROPERTY()
    int PopupId;
    UPROPERTY()
    float32 QueuedPopupDisplayTime;
    UPROPERTY()
    float32 DisplayingPopupRemainingTime;
    UPROPERTY()
    float32 QueuedBlendInSpeed;
    UPROPERTY()
    float32 BlendInSpeed;
    UPROPERTY()
    float32 QueuedBlendOutSpeed;
    UPROPERTY()
    float32 BlendOutSpeed;
    UPROPERTY()
    bool bClosing = false;
    UPROPERTY()
    float32 FadeOutRemainingTime;
    UPROPERTY()
    FEUIWidgetRef LoadingPage;


}

struct FCE_ShowLoadingPage : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    float32 DisplayTime;
    UPROPERTY()
    float32 FadeInTime = -1.0f;
    UPROPERTY()
    float32 FadeOutTime = -1.0f;


}

namespace ECSFunc_FCS_CommonLoadingManager
{
UFUNCTION()
bool HasCommonLoadingManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommonLoadingManager);
}
FCS_CommonLoadingManager& AssignCommonLoadingManager(const FECSWorldPtr &inout World, const FCS_CommonLoadingManager &inout DefaultValue = FCS_CommonLoadingManager())
{
    UScriptStruct local_6 = FCS_CommonLoadingManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommonLoadingManager_BP(const FECSWorldPtr &inout World, const FCS_CommonLoadingManager &inout DefaultValue = FCS_CommonLoadingManager())
{
    ECSFunc_FCS_CommonLoadingManager::AssignCommonLoadingManager(World, DefaultValue);
    return;
}
FCS_CommonLoadingManager& ModifyCommonLoadingManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonLoadingManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommonLoadingManager& ModifyOrAddCommonLoadingManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonLoadingManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommonLoadingManager& GetCommonLoadingManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonLoadingManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommonLoadingManager GetCommonLoadingManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CommonLoadingManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_CommonLoadingManager::GetCommonLoadingManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CommonLoadingManager GetDefaultedCommonLoadingManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommonLoadingManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommonLoadingManager);
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
FCS_CommonLoadingManager GetDefaultedCommonLoadingManager_BP(const FECSWorldPtr &inout World)
{
    FCS_CommonLoadingManager __r;
    return __r;
}
UFUNCTION()
bool RemoveCommonLoadingManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommonLoadingManager);
}
}
void __MonitorCommonLoadingManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommonLoadingManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommonLoadingManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommonLoadingManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommonLoadingManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommonLoadingManager, bFixedFrame, Details);
    return;
}
