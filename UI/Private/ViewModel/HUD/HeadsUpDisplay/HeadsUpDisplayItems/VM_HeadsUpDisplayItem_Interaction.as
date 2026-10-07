
namespace FVMS_HeadsUpDisplayItem_Interaction_InternalCache
{
    const int ModelId = 0;
}
namespace FVM_HeadsUpDisplayItem_Interaction
{
    const int ModelId = 0;

}
struct FVMS_HeadsUpDisplayItem_Interaction_InternalCache : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FECSEntityId m_CachedTargetEntityId;

    FVMS_HeadsUpDisplayItem_Interaction_InternalCache()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_HeadsUpDisplayItem_Interaction_InternalCache(const FVMS_HeadsUpDisplayItem_Interaction_InternalCache &inout Other)
    {
        this.m_CachedTargetEntityId = Other.m_CachedTargetEntityId;
        return;
    }
    FVMS_HeadsUpDisplayItem_Interaction_InternalCache& opAssign(const FVMS_HeadsUpDisplayItem_Interaction_InternalCache &inout Other)
    {
        return Other.m_CachedTargetEntityId;
    }
    void RefreshTargetEntityId()
    {
        FVector local_6;
        FVector2D local_10;
        FString local_14;
        bool local_16 = false;
        FString local_15 = local_16;
        FSoftBrush local_60;
        FVector local_66;
        FVector2D local_70;
        bool local_16_2 = false;
        FVector2D local_71 = local_16_2;
        FECSEntity local_76;
        if (::FInteractUtils::GetCurrentInteractTargetInfoForUI(this.GetContext().GetLocalPlayerPawn(), EInteractMode(1), local_6, local_10, local_14, local_15, local_60, local_66, local_70, local_71, local_76))
        {
            this.SetCachedTargetEntityId(::FASCommonUtils::GetUniquePlayerEntity(local_76).GetId());
        }
        else
        {
            this.SetCachedTargetEntityId(ENTITY_ID_NULL);
        }
        return;
    }
    bool HasSocialInteraction(const FECSEntityId &inout TargetEntityId)
    {
        return !((TargetEntityId == ENTITY_ID_NULL)) && (FECSEntityId(this.GetCachedTargetEntityId()) == TargetEntityId);
    }
    const FECSEntityId GetCachedTargetEntityId() const property
    {
        const FECSEntityId __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntityId GetModify_CachedTargetEntityId() property
    {
        FECSEntityId __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCachedTargetEntityId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CachedTargetEntityId = __Value;
        return;
    }
}

struct FVM_HeadsUpDisplayItem_Interaction : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache> m_InternalCache;

    FVM_HeadsUpDisplayItem_Interaction()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_HeadsUpDisplayItem_Interaction' by default constructor.");
        return;
    }
    FVM_HeadsUpDisplayItem_Interaction(const FVM_HeadsUpDisplayItem_Interaction &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_InternalCache = Other.m_InternalCache;
        return;
    }
    FVM_HeadsUpDisplayItem_Interaction(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_HeadsUpDisplayItem_Interaction& opAssign(const FVM_HeadsUpDisplayItem_Interaction &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        return Other.m_InternalCache;
    }
    void PostConstruct()
    {
        this.SetInternalCache(TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache>(::FVMS_HeadsUpDisplayItem_Interaction_InternalCache::Get(this.GetManager())));
        return;
    }
    bool HasSocialInteraction() const
    {
        return this.GetInternalCache().opArrow().HasSocialInteraction(::GetOwnerEntityId(this.GetSpot().opArrow()));
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Spot = __Value;
        return;
    }
    TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache> GetInternalCache() const property
    {
        this.TrackPropertyRead(1);
        return this.m_InternalCache;
    }
    void SetInternalCache(const TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache> &inout __Value) property
    {
        TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache> local_2;
        local_2 = this.m_InternalCache;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_InternalCache = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_HeadsUpDisplayItem_Interaction_InternalCache
{
    UPROPERTY()
    TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache> Self;

    __GeneratedProperties_FVMS_HeadsUpDisplayItem_Interaction_InternalCache()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_HeadsUpDisplayItem_Interaction
{
    UPROPERTY()
    bool HasSocialInteraction;
    UPROPERTY()
    TEUIModelRef<FVM_HeadsUpDisplayItem_Interaction> Self;


}

namespace FVMS_HeadsUpDisplayItem_Interaction_InternalCache
{
FVMS_HeadsUpDisplayItem_Interaction_InternalCache& Get(const UObject ContextObject)
{
    return FVMS_HeadsUpDisplayItem_Interaction_InternalCache::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_HeadsUpDisplayItem_Interaction_InternalCache GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_HeadsUpDisplayItem_Interaction_InternalCache __r;
    TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache> local_6 = TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache>(EUIInternal::MakeModelWithManager(Manager, FVMS_HeadsUpDisplayItem_Interaction_InternalCache::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_HeadsUpDisplayItem_Interaction_InternalCache;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshTargetEntityId";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_HeadsUpDisplayItem_Interaction_InternalCache;
}
TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache> __UIGetter_Self(const FVMS_HeadsUpDisplayItem_Interaction_InternalCache &inout Model)
{
    return TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache>(Model);
}
int __IndexOf_CachedTargetEntityId()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_HeadsUpDisplayItem_Interaction_InternalCache
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_HeadsUpDisplayItem_Interaction
{
FVM_HeadsUpDisplayItem_Interaction& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_HeadsUpDisplayItem_Interaction::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_HeadsUpDisplayItem_Interaction CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_HeadsUpDisplayItem_Interaction __r;
    TEUIModelRef<FVM_HeadsUpDisplayItem_Interaction> local_6 = TEUIModelRef<FVM_HeadsUpDisplayItem_Interaction>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_HeadsUpDisplayItem_Interaction::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "HasSocialInteraction";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_HeadsUpDisplayItem_Interaction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_HeadsUpDisplayItem_Interaction;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_HeadsUpDisplayItem_Interaction;
}
bool __UIGetter_HasSocialInteraction(const FVM_HeadsUpDisplayItem_Interaction &inout Model)
{
    return Model.HasSocialInteraction();
}
TEUIModelRef<FVM_HeadsUpDisplayItem_Interaction> __UIGetter_Self(const FVM_HeadsUpDisplayItem_Interaction &inout Model)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_Interaction>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_InternalCache()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_HeadsUpDisplayItem_Interaction
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
