
namespace FMS_ShippingCulture
{
    const int ModelId = 0;

}
struct FMS_ShippingCulture : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;

    FMS_ShippingCulture()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_ShippingCulture(const FMS_ShippingCulture &inout Other)
    {
        return;
    }
    FMS_ShippingCulture opAssign(const FMS_ShippingCulture &inout Other)
    {
        FMS_ShippingCulture __r;
        return __r;
    }
    void PostConstruct()
    {
        Internationalization::SetCurrentCulture("zh-Hans", false);
        return;
    }
}

namespace FMS_ShippingCulture
{
FMS_ShippingCulture& Get(const UObject ContextObject)
{
    return FMS_ShippingCulture::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_ShippingCulture GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_ShippingCulture __r;
    TEUIModelRef<FMS_ShippingCulture> local_6 = TEUIModelRef<FMS_ShippingCulture>(EUIInternal::MakeModelWithManager(Manager, FMS_ShippingCulture::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_ShippingCulture;
}
}
