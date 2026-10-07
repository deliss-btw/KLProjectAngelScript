
namespace FVMS_BonfirePage
{
    const int ModelId = 0;

}
struct FVMS_BonfirePage : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FECSEntity m_Bonfire;
    UPROPERTY()
    FUIInteractAbilityGroup m_AbilityGroup;
    UPROPERTY()
    TArray<FEUIModelRef> m_ItemRefs;
    UPROPERTY()
    int m_State;

    FVMS_BonfirePage()
    {
        this.m_State = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_BonfirePage(const FVMS_BonfirePage &inout Other)
    {
        this.m_State = 0;
        this.m_Bonfire = Other.m_Bonfire;
        this.m_ItemRefs = Other.m_ItemRefs;
        this.m_State = int(Other.m_State);
        return;
    }
    FVMS_BonfirePage opAssign(const FVMS_BonfirePage &inout Other)
    {
        FVMS_BonfirePage __r;
        this.m_Bonfire = Other.m_Bonfire;
        this.m_ItemRefs = Other.m_ItemRefs;
        this.m_State = int(Other.m_State);
        return __r;
    }
    const FECSEntity GetBonfire() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_Bonfire() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetBonfire(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Bonfire = __Value;
        return;
    }
    const FUIInteractAbilityGroup GetAbilityGroup() const property
    {
        const FUIInteractAbilityGroup __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FUIInteractAbilityGroup GetModify_AbilityGroup() property
    {
        FUIInteractAbilityGroup __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAbilityGroup(const FUIInteractAbilityGroup &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const TArray<FEUIModelRef> GetItemRefs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_ItemRefs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetItemRefs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ItemRefs = __Value;
        return;
    }
    int GetState() const property
    {
        this.TrackPropertyRead(3);
        return this.m_State;
    }
    void SetState(const int __Value) property
    {
        if (this.m_State == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_State = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_BonfirePage
{
    UPROPERTY()
    TEUIModelRef<FVMS_BonfirePage> Self;

    __GeneratedProperties_FVMS_BonfirePage()
    {
        return;
    }
}

namespace FVMS_BonfirePage
{
FVMS_BonfirePage& Get(const UObject ContextObject)
{
    return FVMS_BonfirePage::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_BonfirePage GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_BonfirePage __r;
    TEUIModelRef<FVMS_BonfirePage> local_6 = TEUIModelRef<FVMS_BonfirePage>(EUIInternal::MakeModelWithManager(Manager, FVMS_BonfirePage::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemRefs";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_BonfirePage>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_BonfirePage;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_BonfirePage;
}
TArray<FEUIModelRef> __UIGetter_ItemRefs(const FVMS_BonfirePage &inout Model)
{
    return Model.GetItemRefs();
}
TEUIModelRef<FVMS_BonfirePage> __UIGetter_Self(const FVMS_BonfirePage &inout Model)
{
    return TEUIModelRef<FVMS_BonfirePage>(Model);
}
int __IndexOf_Bonfire()
{
    return 0;
}
int __IndexOf_AbilityGroup()
{
    return 1;
}
int __IndexOf_ItemRefs()
{
    return 2;
}
int __IndexOf_State()
{
    return 3;
}
}
namespace __GeneratedProperties_FVMS_BonfirePage
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
