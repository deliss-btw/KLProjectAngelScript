

struct FVMS_PlayerKeyMappingsConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    FPlayerKeyMappingsConfig Config;

    FVMS_PlayerKeyMappingsConfigDefault()
    {
        return;
    }
}

struct FOnPlayerKeyMappingChanged : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FOnPlayerKeyMappingChanged()
    {
        FEUIModelEvent local_22 = FEUIModelEvent("", "");
        return;
    }
    void Broadcast() const
    {
        Z__CastTemplate local_4;
        local_4.opCall().Broadcast();
        return;
    }
}

namespace __FVM_PlayerKeyMapping_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayerKeyMapping> __ModelContainer_Require_FVM_PlayerKeyMapping(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayerKeyMapping>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayerKeyMapping(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayerKeyMapping>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayerKeyMapping>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayerKeyMapping>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_PlayerMappableKey_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayerMappableKey> __ModelContainer_Require_FVM_PlayerMappableKey(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayerMappableKey>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayerMappableKey(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayerMappableKey>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayerMappableKey>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayerMappableKey>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_PlayerKeyMappingPair_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayerKeyMappingPair> __ModelContainer_Require_FVM_PlayerKeyMappingPair(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayerKeyMappingPair>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayerKeyMappingPair(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayerKeyMappingPair>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayerKeyMappingPair>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVMS_PlayerKeyMappings_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_PlayerKeyMappings> __ModelContainer_Require_FVMS_PlayerKeyMappings(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_PlayerKeyMappings>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_PlayerKeyMappings(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_PlayerKeyMappings>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_PlayerKeyMappings>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_PlayerKeyMappings>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
