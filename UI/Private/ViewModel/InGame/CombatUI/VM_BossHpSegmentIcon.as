
namespace FVM_BossHpSegmentIcon
{
    const int ModelId = 0;

}
struct FVM_BossHpSegmentIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bInitIconActive;
    UPROPERTY()
    bool m_bIconActive;

    FVM_BossHpSegmentIcon()
    {
        this.m_bInitIconActive = false;
        this.m_bIconActive = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BossHpSegmentIcon' by default constructor.");
        return;
    }
    FVM_BossHpSegmentIcon(const FVM_BossHpSegmentIcon &inout Other)
    {
        this.m_bInitIconActive = false;
        this.m_bIconActive = false;
        this.m_bInitIconActive = Other.m_bInitIconActive;
        this.m_bIconActive = Other.m_bIconActive;
        return;
    }
    FVM_BossHpSegmentIcon(const bool InbInitIconActive)
    {
        this.m_bInitIconActive = false;
        this.m_bIconActive = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetbInitIconActive(InbInitIconActive);
        return;
    }
    FVM_BossHpSegmentIcon opAssign(const FVM_BossHpSegmentIcon &inout Other)
    {
        FVM_BossHpSegmentIcon __r;
        this.m_bInitIconActive = Other.m_bInitIconActive;
        this.m_bIconActive = Other.m_bIconActive;
        return __r;
    }
    void PostConstruct()
    {
        this.SetbIconActive(this.GetbInitIconActive());
        return;
    }
    bool GetbInitIconActive() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bInitIconActive;
    }
    void SetbInitIconActive(const bool __Value) property
    {
        if (!(this.m_bInitIconActive) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bInitIconActive = __Value;
        return;
    }
    bool GetbIconActive() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIconActive;
    }
    void SetbIconActive(const bool __Value) property
    {
        if (!(this.m_bIconActive) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIconActive = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BossHpSegmentIcon
{
    UPROPERTY()
    TEUIModelRef<FVM_BossHpSegmentIcon> Self;

    __GeneratedProperties_FVM_BossHpSegmentIcon()
    {
        return;
    }
}

namespace FVM_BossHpSegmentIcon
{
FVM_BossHpSegmentIcon& Create(const UObject ContextObject, const bool bInitIconActive)
{
    return FVM_BossHpSegmentIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), bInitIconActive);
}
FVM_BossHpSegmentIcon CreateByManager(const UEUIManagerSubsystem Manager, const bool bInitIconActive)
{
    FVM_BossHpSegmentIcon __r;
    TEUIModelRef<FVM_BossHpSegmentIcon> local_6 = TEUIModelRef<FVM_BossHpSegmentIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BossHpSegmentIcon::ModelId, 0, bInitIconActive));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bIconActive";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BossHpSegmentIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BossHpSegmentIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BossHpSegmentIcon;
}
bool __UIGetter_bIconActive(const FVM_BossHpSegmentIcon &inout Model)
{
    return Model.GetbIconActive();
}
TEUIModelRef<FVM_BossHpSegmentIcon> __UIGetter_Self(const FVM_BossHpSegmentIcon &inout Model)
{
    return TEUIModelRef<FVM_BossHpSegmentIcon>(Model);
}
int __IndexOf_bInitIconActive()
{
    return 0;
}
int __IndexOf_bIconActive()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_BossHpSegmentIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
