
namespace FVM_DmageText
{
    const int ModelId = 0;
}
namespace FVM_DmageTextPanel
{
    const int ModelId = 0;

}
struct FDmageTextData
{
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    float32 Damage = 0.0f;
    UPROPERTY()
    FVector HitPosition;
    UPROPERTY()
    EAttackType AttackType = EAttackType(0);
    UPROPERTY()
    EDamageType DamageType = EDamageType(0);
    UPROPERTY()
    TDataObjectPtr<FSpecialDamageTextConfig> SpecialDamageTextConfig;
    UPROPERTY()
    bool bHitWeakness = false;
    UPROPERTY()
    bool bAttenuated = false;
    UPROPERTY()
    bool bCritical = false;
    UPROPERTY()
    float32 DamageNumberRandomRatio = 1.0f;
    UPROPERTY()
    FFPTime EndTime;


}

struct FVM_DmageText : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FDmageTextData m_DamageTextData;
    UPROPERTY()
    FVector2D m_RandomOffset;
    UPROPERTY()
    bool m_bPlayAnim;
    UPROPERTY()
    bool m_bSpecialText;

    FVM_DmageText()
    {
        this.m_RandomOffset = FVector2D::ZeroVector;
        this.m_bPlayAnim = false;
        this.m_bSpecialText = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_DmageText' by default constructor.");
        return;
    }
    FVM_DmageText(const FVM_DmageText &inout Other)
    {
        this.m_RandomOffset = FVector2D::ZeroVector;
        this.m_bPlayAnim = false;
        this.m_bSpecialText = false;
        this.m_RandomOffset = Other.m_RandomOffset;
        this.m_bPlayAnim = Other.m_bPlayAnim;
        this.m_bSpecialText = Other.m_bSpecialText;
        return;
    }
    FVM_DmageText(const FDmageTextData &inout InDamageTextData)
    {
        this.m_RandomOffset = FVector2D::ZeroVector;
        this.m_bPlayAnim = false;
        this.m_bSpecialText = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDamageTextData(InDamageTextData);
        return;
    }
    FVM_DmageText opAssign(const FVM_DmageText &inout Other)
    {
        FVM_DmageText __r;
        this.m_RandomOffset = Other.m_RandomOffset;
        this.m_bPlayAnim = Other.m_bPlayAnim;
        this.m_bSpecialText = Other.m_bSpecialText;
        return __r;
    }
    int GetDamageValue() const
    {
        return uint(int(this.GetDamageTextData().Damage));
    }
    ESlateVisibility GetDmageBgVisiblity() const
    {
        bool local_1 = this.GetDamageTextData().bHitWeakness;
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            local_1 = this.GetDamageTextData().bCritical;
        }
        if (local_1)
        {
            return ESlateVisibility(0);
        }
        return ESlateVisibility(1);
    }
    int GetDamageCritWeakSwitcher() const
    {
        bool local_1 = this.GetDamageTextData().bHitWeakness;
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            local_1 = this.GetDamageTextData().bCritical;
        }
        if (local_1)
        {
            return 2;
        }
        bool local_2 = this.GetDamageTextData().bHitWeakness;
        if (local_2)
        {
            return 1;
        }
        if (this.GetDamageTextData().bCritical)
        {
            return 0;
        }
        return 0;
    }
    float32 GetDamageTextFontScale() const
    {
        float32 local_2 = 0.0f;
        if (this.GetbSpecialText())
        {
            return local_2;
        }
        float32 local_3 = 1.0f;
        bool local_1 = this.GetDamageTextData().bHitWeakness;
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            local_1 = this.GetDamageTextData().bCritical;
        }
        if (local_1)
        {
            local_3 = 1.3333334f;
        }
        else
        {
            if (this.GetDamageTextData().bHitWeakness)
            {
                local_3 = 1.0f;
            }
            else
            {
                if (this.GetDamageTextData().bCritical)
                {
                    local_3 = 1.1666666f;
                }
            }
        }
        return local_3 * 1.333f;
    }
    float32 GetDamageTextAnimDuration() const
    {
        float32 local_2 = 0.0f;
        if (this.GetbSpecialText())
        {
            return local_2;
        }
        if (!(::DamageSettings::Get().DamageTextDurationConfigs.Contains(this.GetDamageTextData().DamageType)))
        {
            return 1.08f;
        }
        FDamageTextDurationConfig local_8;
        local_8 = ::DamageSettings::Get().DamageTextDurationConfigs[this.GetDamageTextData().DamageType];
        bool local_1 = this.GetDamageTextData().bHitWeakness;
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            local_1 = this.GetDamageTextData().bCritical;
        }
        if (local_1)
        {
            return local_8.WeaknessCriticalDuration;
        }
        if (this.GetDamageTextData().bHitWeakness)
        {
            return local_8.WeaknessDuration;
        }
        if (this.GetDamageTextData().bCritical)
        {
            return local_8.CriticalDuration;
        }
        return local_8.NormalDuration;
    }
    const FDmageTextData GetDamageTextData() const property
    {
        const FDmageTextData __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FDmageTextData GetModify_DamageTextData() property
    {
        FDmageTextData __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDamageTextData(const FDmageTextData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FVector2D GetRandomOffset() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FVector2D GetModify_RandomOffset() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetRandomOffset(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RandomOffset = __Value;
        return;
    }
    bool GetbPlayAnim() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bPlayAnim;
    }
    void SetbPlayAnim(const bool __Value) property
    {
        if (!(this.m_bPlayAnim) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bPlayAnim = __Value;
        return;
    }
    bool GetbSpecialText() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bSpecialText;
    }
    void SetbSpecialText(const bool __Value) property
    {
        if (!(this.m_bSpecialText) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bSpecialText = __Value;
        return;
    }
}

struct FVM_DmageTextPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_DmageText>> m_DamageTextList;

    FVM_DmageTextPanel()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_DmageTextPanel(const FVM_DmageTextPanel &inout Other)
    {
        this.m_DamageTextList = Other.m_DamageTextList;
        return;
    }
    FVM_DmageTextPanel& opAssign(const FVM_DmageTextPanel &inout Other)
    {
        return Other.m_DamageTextList;
    }
    void PostConstruct()
    {
        return;
    }
    void Tick()
    {
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            return;
        }
        if (!(::UICommonUtil::IsValidPawnContext(this.GetContext().GetLocalPlayerPawn())))
        {
            return;
        }
        if (!(UICommonUtil::CVar_UI_DebugEnableNewDamageText.GetBool()))
        {
            return;
        }
        int local_9 = this.GetDamageTextList().Num() - 1;
        for (; local_9 >= 0; --local_9)
        {
            if (FFPTime(GetDamageTextData().EndTime).opCmp(this.GetContext().Time) <= 0)
            {
                this.GetModify_DamageTextList().RemoveAt(local_9);
            }
        }
        return;
    }
    void OnShowDamageText(const FCE_ShowDamageNumber &inout Event)
    {
        int local_2 = uint(int(Event.Damage));
        if (local_2 == 0)
        {
            return;
        }
        if (!(UICommonUtil::CVar_UI_DebugEnableNewDamageText.GetBool()))
        {
            return;
        }
        FDmageTextData local_46;
        local_46.Entity = Event.Receiver;
        local_46.Damage = Event.Damage;
        local_46.HitPosition = Event.HitPosition;
        if (Event.bAdjustPresentationHitPos)
        {
            local_46.HitPosition = this.GetAdjustPresentationHitPos(Event);
        }
        local_46.SpecialDamageTextConfig = Event.SpecialDamageTextConfig;
        local_46.AttackType = Event.AttackType;
        local_46.DamageType = Event.DamageType;
        local_46.bHitWeakness = Event.bHitWeakness;
        local_46.bAttenuated = Event.bAttenuated;
        local_46.bCritical = Event.bCritical;
        int local_1_2 = Event.DamageNumberRandomRatio;
        local_46.DamageNumberRandomRatio = local_1_2;
        local_46.EndTime = (FFPTime(this.GetContext().Time) + FFPTime(3.0));
        if ((!((Event.SpecialDamageTextConfig == nullptr))))
        {
            local_46.EndTime += FFPTime(local_1_2);
        }
        FVM_DmageText& local_112 = ::FVM_DmageText::Create(this.GetContext().Manager, local_46);
        local_112.SetRandomOffset(FVector2D(FMath::RandRange(-50.0f, 50.0f), FMath::RandRange(-30.0f, 30.0f)));
        local_112.SetbPlayAnim(true);
        local_112.SetbSpecialText(!((local_46.SpecialDamageTextConfig == nullptr)));
        this.GetModify_DamageTextList().Add(TEUIModelRef<FVM_DmageText>(local_112));
        return;
    }
    FVector GetAdjustPresentationHitPos(const FCE_ShowDamageNumber &inout Event)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        FVector __r; return __r;
    }
    const TArray<TEUIModelRef<FVM_DmageText>> GetDamageTextList() const property
    {
        const TArray<TEUIModelRef<FVM_DmageText>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_DmageText>> GetModify_DamageTextList() property
    {
        TArray<TEUIModelRef<FVM_DmageText>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDamageTextList(const TArray<TEUIModelRef<FVM_DmageText>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DamageTextList = __Value;
        return;
    }
}

class UDamageTextSubsystem : UScriptWorldSubsystem
{
    UPROPERTY()
    TMap<EDamageType, UMaterialInstanceDynamic> MaterialInstanceDynamicMap;
    UPROPERTY()
    UMaterialInstanceDynamic WeaknessMaterialInstanceDynamic;
    UPROPERTY()
    UMaterialInstanceDynamic AttenuatedMaterialInstanceDynamic;
    UPROPERTY()
    TMap<EDamageTextPhysicalType, UMaterialInstanceDynamic> PhysicalMatInstanceDynamicMap;

    UDamageTextSubsystem()
    {
        return;
    }
    UFUNCTION()
    void Initialize_Implementation()
    {
        return;
    }
    UFUNCTION()
    void DeInitialize_Implementation()
    {
        this.MaterialInstanceDynamicMap.Empty(0);
        this.WeaknessMaterialInstanceDynamic = nullptr;
        this.AttenuatedMaterialInstanceDynamic = nullptr;
        this.PhysicalMatInstanceDynamicMap.Empty(0);
        return;
    }
}

struct __GeneratedProperties_FVM_DmageText
{
    UPROPERTY()
    int DamageValue;
    UPROPERTY()
    ESlateVisibility DmageBgVisiblity;
    UPROPERTY()
    int DamageCritWeakSwitcher;
    UPROPERTY()
    float32 DamageTextFontScale;
    UPROPERTY()
    float32 DamageTextAnimDuration;
    UPROPERTY()
    TEUIModelRef<FVM_DmageText> Self;


}

struct __GeneratedProperties_FVM_DmageTextPanel
{
    UPROPERTY()
    TEUIModelRef<FVM_DmageTextPanel> Self;

    __GeneratedProperties_FVM_DmageTextPanel()
    {
        return;
    }
}

namespace FVM_DmageText
{
FVM_DmageText& Create(const UObject ContextObject, const FDmageTextData &inout DamageTextData)
{
    return FVM_DmageText::CreateByManager(EUIInternal::GetContextManager(ContextObject), DamageTextData);
}
FVM_DmageText CreateByManager(const UEUIManagerSubsystem Manager, const FDmageTextData &inout DamageTextData)
{
    FVM_DmageText __r;
    TEUIModelRef<FVM_DmageText> local_6 = TEUIModelRef<FVM_DmageText>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_DmageText::ModelId, 0, DamageTextData));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DamageValue";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DmageBgVisiblity";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DamageCritWeakSwitcher";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DamageTextFontScale";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DamageTextAnimDuration";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_DmageText>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_DmageText;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_DmageText;
}
int __UIGetter_DamageValue(const FVM_DmageText &inout Model)
{
    return Model.GetDamageValue();
}
ESlateVisibility __UIGetter_DmageBgVisiblity(const FVM_DmageText &inout Model)
{
    return Model.GetDmageBgVisiblity();
}
int __UIGetter_DamageCritWeakSwitcher(const FVM_DmageText &inout Model)
{
    return Model.GetDamageCritWeakSwitcher();
}
float32 __UIGetter_DamageTextFontScale(const FVM_DmageText &inout Model)
{
    return Model.GetDamageTextFontScale();
}
float32 __UIGetter_DamageTextAnimDuration(const FVM_DmageText &inout Model)
{
    return Model.GetDamageTextAnimDuration();
}
TEUIModelRef<FVM_DmageText> __UIGetter_Self(const FVM_DmageText &inout Model)
{
    return TEUIModelRef<FVM_DmageText>(Model);
}
int __IndexOf_DamageTextData()
{
    return 0;
}
int __IndexOf_RandomOffset()
{
    return 1;
}
int __IndexOf_bPlayAnim()
{
    return 2;
}
int __IndexOf_bSpecialText()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_DmageText
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_DmageTextPanel
{
FVM_DmageTextPanel& Create(const UObject ContextObject)
{
    return FVM_DmageTextPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_DmageTextPanel CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_DmageTextPanel __r;
    TEUIModelRef<FVM_DmageTextPanel> local_6 = TEUIModelRef<FVM_DmageTextPanel>(EUIInternal::MakeModelWithManager(Manager, FVM_DmageTextPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DamageTextList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_DmageText>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_DmageTextPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_DmageTextPanel;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelEventDefine local_22;
    local_22.FunctionName = "__OnShowDamageText";
    local_22.EventType = FCE_ShowDamageNumber;
    Result.EventFunctions.Add(local_22);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_DmageTextPanel;
}
void __Tick(FVM_DmageTextPanel &inout Model)
{
    Model.Tick();
    return;
}
void __OnShowDamageText(FVM_DmageTextPanel &inout Model, const FCE_ShowDamageNumber &inout Event)
{
    Model.OnShowDamageText(Event);
    return;
}
TArray<TEUIModelRef<FVM_DmageText>> __UIGetter_DamageTextList(const FVM_DmageTextPanel &inout Model)
{
    return Model.GetDamageTextList();
}
TEUIModelRef<FVM_DmageTextPanel> __UIGetter_Self(const FVM_DmageTextPanel &inout Model)
{
    return TEUIModelRef<FVM_DmageTextPanel>(Model);
}
int __IndexOf_DamageTextList()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_DmageTextPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
