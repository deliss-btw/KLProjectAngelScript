
namespace FVM_WorldMapUtils
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature CloseWorldMapAndOpenHalfScreenMinimap = FEUIModelCallbackSignature();

}
struct FVM_WorldMapUtils : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;

    FVM_WorldMapUtils()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_WorldMapUtils(const FVM_WorldMapUtils &inout Other)
    {
        return;
    }
    FVM_WorldMapUtils opAssign(const FVM_WorldMapUtils &inout Other)
    {
        FVM_WorldMapUtils __r;
        return __r;
    }
    void CloseWorldMapAndOpenHalfScreenMinimap()
    {
        FEUIWidgetRef local_2 = FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_WorldMap);
        if (local_2)
        {
            FEUIWidget::RemoveWidget(local_2);
        }
        if (!(FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Minimap)))
        {
            FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Minimap);
        }
        return;
    }
}

struct __GeneratedProperties_FVM_WorldMapUtils
{
    UPROPERTY()
    TEUIModelRef<FVM_WorldMapUtils> Self;

    __GeneratedProperties_FVM_WorldMapUtils()
    {
        return;
    }
}

namespace FVM_WorldMapUtils
{
FVM_WorldMapUtils& Get(const UObject ContextObject)
{
    return FVM_WorldMapUtils::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_WorldMapUtils GetByManager(const UEUIManagerSubsystem Manager)
{
    FVM_WorldMapUtils __r;
    TEUIModelRef<FVM_WorldMapUtils> local_6 = TEUIModelRef<FVM_WorldMapUtils>(EUIInternal::MakeModelWithManager(Manager, FVM_WorldMapUtils::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_WorldMapUtils>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_WorldMapUtils;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_WorldMapUtils;
}
TEUIModelRef<FVM_WorldMapUtils> __UIGetter_Self(const FVM_WorldMapUtils &inout Model)
{
    return TEUIModelRef<FVM_WorldMapUtils>(Model);
}
}
namespace __GeneratedProperties_FVM_WorldMapUtils
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
