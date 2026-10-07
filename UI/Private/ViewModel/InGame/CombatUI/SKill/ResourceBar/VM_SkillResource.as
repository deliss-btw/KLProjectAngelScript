
namespace FMS_SkillBtnsManager
{
    const int ModelId = 0;

}
struct FMS_SkillBtnsManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;

    FMS_SkillBtnsManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_SkillBtnsManager(const FMS_SkillBtnsManager &inout Other)
    {
        return;
    }
    FMS_SkillBtnsManager opAssign(const FMS_SkillBtnsManager &inout Other)
    {
        FMS_SkillBtnsManager __r;
        return __r;
    }
    void PostConstruct()
    {
        ::FSkillBtnsUtils::SafeRebuildSkillResouce(this.GetContext());
        return;
    }
    void BeginDestroy()
    {
        ULocalPlayer local_8;
        if (local_8 != nullptr && ::UICommonUtil::IsValidPawnContext(this.GetContext().GetLocalPlayerPawn()))
        {
            ::FSkillBtnsUtils::SafeRebuildSkillResouce(this.GetContext());
        }
        return;
    }
    void InvalidateEntityCache()
    {
        ULocalPlayer local_8;
        if (local_8 != nullptr && ::UICommonUtil::IsValidPawnContext(this.GetContext().GetLocalPlayerPawn()))
        {
            ::FSkillBtnsUtils::SafeRebuildSkillResouce(this.GetContext());
        }
        return;
    }
}

namespace FSkillBtnsUtils
{
void SafeRebuildSkillResouce(const FEUIModelContext &inout Context)
{
    if ((int(UICommonUtil::GetCurrentInputType(nullptr))) == 2)
    {
        FEUIWidget::RemoveWidget(FEUIWidget::FindWidget(Context.UELocalPlayer, GameplayTags::UI_Type_HUD_MobileSkillBtns));
        FEUIWidgetRef local_8 = FEUIWidget::AddWidget(Context.UELocalPlayer, GameplayTags::UI_Type_HUD_MobileSkillBtns);
        return;
    }
    FEUIWidgetRef local_8_2 = FEUIWidget::FindWidget(Context.UELocalPlayer, GameplayTags::UI_Type_HUD_SkillBtn);
    FEUIWidgetRef local_6 = FEUIWidget::FindWidget(Context.UELocalPlayer, GameplayTags::UI_Type_HUD_GamepadSkillBtns);
    FEUIWidget::RemoveWidget(local_8_2);
    FEUIWidget::RemoveWidget(local_6);
    FEUIWidget::AddWidget(Context.UELocalPlayer, GameplayTags::UI_Type_HUD_SkillBtn);
    FEUIWidget::AddWidget(Context.UELocalPlayer, GameplayTags::UI_Type_HUD_GamepadSkillBtns);
    return;
}
}
namespace FMS_SkillBtnsManager
{
FMS_SkillBtnsManager& Get(const UObject ContextObject)
{
    return FMS_SkillBtnsManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_SkillBtnsManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_SkillBtnsManager __r;
    TEUIModelRef<FMS_SkillBtnsManager> local_6 = TEUIModelRef<FMS_SkillBtnsManager>(EUIInternal::MakeModelWithManager(Manager, FMS_SkillBtnsManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_SkillBtnsManager;
}
}
