
namespace FVMS_TeleportPoint_Page
{
    const int ModelId = 0;

}
struct FVMS_TeleportPoint_Page : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FText m_TeleportTitle;
    UPROPERTY()
    TArray<FEUIModelRef> m_ItemRefs;

    FVMS_TeleportPoint_Page()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_TeleportPoint_Page(const FVMS_TeleportPoint_Page &inout Other)
    {
        this.m_TeleportTitle = Other.m_TeleportTitle;
        this.m_ItemRefs = Other.m_ItemRefs;
        return;
    }
    FVMS_TeleportPoint_Page& opAssign(const FVMS_TeleportPoint_Page &inout Other)
    {
        this.m_TeleportTitle = Other.m_TeleportTitle;
        return Other.m_ItemRefs;
    }
    void PostConstruct()
    {
        bool local_21;
        this.SetTeleportTitle(NSLOCTEXT("TeleportTitle", "дј йЂЃењ°и„‰"));
        FUIInteractAbilityGroup local_10 = ::UIInteractAbilityConfig::GetUIInteractAbilityGroup(n"Teleport");
        int local_15 = 0;
        while (local_15 < 0)
        {
            FUIItemInteractAbility& local_20 = local_10.GroupItems[local_15];
            if (!(local_20.UnlockSystemControl.IsSet()))
            {
                local_21 = false;
            }
            else
            {
                local_21 = false;
                local_21 = !(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(local_20.UnlockSystemControl, local_21));
            }
            if (local_21)
            {
            }
            else
            {
                this.GetModify_ItemRefs().Add(FEUIModelRef(::FVM_CommonBGItemMenu::Create(this.GetContext().Manager, n"Teleport", local_15, local_20.Signal, local_20.bIsInteractTarget, local_20.bSetVisibility)));
            }
            ++local_15;
        }
        return;
    }
    void BeginDestroy()
    {
        int local_38 = 0;
        FECSEntity local_8 = ::FASCommonUtils::GetRiderEntity(this.GetContext().GetLocalPlayerPawn());
        Get local_16;
        const FC_InteractionInfoForESM& local_18 = local_16.opCall();
        if (local_18)
        {
            if (local_18.GetTargetEntity().IsValid())
            {
                FECSEntity local_24 = FECSEntity(local_18.GetTargetEntity());
                FInteractionPointAndBehaviorIndex local_26;
                local_26 = local_18.GetTargetPointAndBehaviorIndex();
                ::FInteractUtils::ExecuteInteractEndActionPresentationOnly(local_8, local_24, local_26);
                FFPTime local_34 = FFPTime(-1);
                local_38.TargetEntity = local_24;
                local_38.InteractTargetPointAndBehaviorIndex = local_26;
            }
        }
        return;
    }
    const FText GetTeleportTitle() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_TeleportTitle() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTeleportTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeleportTitle = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetItemRefs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_ItemRefs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetItemRefs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemRefs = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_TeleportPoint_Page
{
    UPROPERTY()
    TEUIModelRef<FVMS_TeleportPoint_Page> Self;

    __GeneratedProperties_FVMS_TeleportPoint_Page()
    {
        return;
    }
}

namespace FVMS_TeleportPoint_Page
{
FVMS_TeleportPoint_Page& Get(const UObject ContextObject)
{
    return FVMS_TeleportPoint_Page::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_TeleportPoint_Page GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_TeleportPoint_Page __r;
    TEUIModelRef<FVMS_TeleportPoint_Page> local_6 = TEUIModelRef<FVMS_TeleportPoint_Page>(EUIInternal::MakeModelWithManager(Manager, FVMS_TeleportPoint_Page::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TeleportTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemRefs";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_TeleportPoint_Page>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_TeleportPoint_Page;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_TeleportPoint_Page;
}
FText __UIGetter_TeleportTitle(const FVMS_TeleportPoint_Page &inout Model)
{
    return Model.GetTeleportTitle();
}
TArray<FEUIModelRef> __UIGetter_ItemRefs(const FVMS_TeleportPoint_Page &inout Model)
{
    return Model.GetItemRefs();
}
TEUIModelRef<FVMS_TeleportPoint_Page> __UIGetter_Self(const FVMS_TeleportPoint_Page &inout Model)
{
    return TEUIModelRef<FVMS_TeleportPoint_Page>(Model);
}
int __IndexOf_TeleportTitle()
{
    return 0;
}
int __IndexOf_ItemRefs()
{
    return 1;
}
}
namespace __GeneratedProperties_FVMS_TeleportPoint_Page
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
