
namespace FVM_AvatarButton
{
    const int ModelId = 0;

}
struct FVM_AvatarButton : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_AvatarEntity;
    UPROPERTY()
    UTexture2D m_AvatarIcon;
    UPROPERTY()
    float32 m_CDRemained;
    UPROPERTY()
    float32 m_CDRemainedRadio;
    UPROPERTY()
    bool m_bSwitchAvatarInCD;
    UPROPERTY()
    float32 m_EnergyRatio;
    UPROPERTY()
    int m_EnergyLevel;
    UPROPERTY()
    EDamageType m_AvatarDamageType;

    FVM_AvatarButton()
    {
        this.m_AvatarIcon = nullptr;
        this.m_CDRemained = 0.0f;
        this.m_CDRemainedRadio = 0.0f;
        this.m_bSwitchAvatarInCD = false;
        this.m_EnergyRatio = 0.0f;
        this.m_EnergyLevel = 0;
        this.m_AvatarDamageType = EDamageType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AvatarButton(const FVM_AvatarButton &inout Other)
    {
        this.m_AvatarIcon = nullptr;
        this.m_CDRemained = 0.0f;
        this.m_CDRemainedRadio = 0.0f;
        this.m_bSwitchAvatarInCD = false;
        this.m_EnergyRatio = 0.0f;
        this.m_EnergyLevel = 0;
        this.m_AvatarDamageType = EDamageType(0);
        this.m_AvatarEntity = Other.m_AvatarEntity;
        this.m_AvatarIcon = Other.m_AvatarIcon;
        this.m_CDRemained = Other.m_CDRemained;
        this.m_CDRemainedRadio = Other.m_CDRemainedRadio;
        this.m_bSwitchAvatarInCD = Other.m_bSwitchAvatarInCD;
        this.m_EnergyRatio = Other.m_EnergyRatio;
        this.m_EnergyLevel = int(Other.m_EnergyLevel);
        this.m_AvatarDamageType = Other.m_AvatarDamageType;
        return;
    }
    FVM_AvatarButton opAssign(const FVM_AvatarButton &inout Other)
    {
        FVM_AvatarButton __r;
        this.m_AvatarEntity = Other.m_AvatarEntity;
        this.m_AvatarIcon = Other.m_AvatarIcon;
        this.m_CDRemained = Other.m_CDRemained;
        this.m_CDRemainedRadio = Other.m_CDRemainedRadio;
        this.m_bSwitchAvatarInCD = Other.m_bSwitchAvatarInCD;
        this.m_EnergyRatio = Other.m_EnergyRatio;
        this.m_EnergyLevel = int(Other.m_EnergyLevel);
        this.m_AvatarDamageType = Other.m_AvatarDamageType;
        return __r;
    }
    void Tick()
    {
        if (!(this.GetAvatarEntity().IsValid()))
        {
            return;
        }
        if (!(this.GetAvatarEntity().IsActive()))
        {
            FECSEntity local_6 = this.GetContext().GetLocalPlayer();
            Get local_10;
            const FC_SwitchPlayerInfo& local_12 = local_10.opCall();
            if (local_12)
            {
                if (local_12.GetSwitchPlayerCD().Evaluate(this.GetContext().Time) > 0.0f)
                {
                    this.SetCDRemained(float32(((FFPTime(local_12.GetSwitchPlayerCD().EndTime) - this.GetContext().Time).ToSeconds())));
                    float32 local_23 = 1.0f;
                    float32 local_14 = float32((this.GetCDRemained() / (FFPTime(local_12.GetSwitchPlayerCD().EndTime) - local_12.GetSwitchPlayerCD().StartTime).ToSeconds()));
                    this.SetCDRemainedRadio(local_23 - local_14);
                    this.SetbSwitchAvatarInCD(true);
                }
                else
                {
                    this.SetCDRemained(0.0f);
                    this.SetbSwitchAvatarInCD(false);
                }
                if (::FASCommonUtils::IsAvatarPrefab(this.GetAvatarEntity()))
                {
                    this.SetAvatarDamageType(::FASCommonUtils::GetAvatarDamageType(this.GetAvatarEntity()));
                }
                else
                {
                    this.SetAvatarDamageType(EDamageType(0));
                }
            }
            return;
        }
        this.SetEnergyLevel(0);
        return;
    }
    void OnAvatarEntityChanged()
    {
        TDataObjectPtr<FAvatarPrefabConfig> local_24 = ::GetAvatarConfig(this.GetAvatarEntity());
        if (local_24)
        {
            if (!(local_24.opArrow().Avatar3DIconSoft.IsNull()))
            {
                this.SetAvatarIcon(Cast<UTexture2D>(System::LoadAsset_Blocking(local_24.opArrow().Avatar3DIconSoft)));
                return;
            }
            this.SetAvatarIcon(nullptr);
        }
        return;
    }
    FText CDRemainedAsText() const
    {
        return FText::FromString(FString().Append(FString::ApplyFormat(this.GetCDRemained(), ".1")));
    }
    bool CDRemainedAsBool() const
    {
        return (this.GetCDRemained() > 0.0f);
    }
    ESlateVisibility CDRemainedAsSlateVisibility() const
    {
        int local_2;
        if (this.CDRemainedAsBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    const FECSEntity GetAvatarEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_AvatarEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAvatarEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarEntity = __Value;
        return;
    }
    UTexture2D GetAvatarIcon() const property
    {
        this.TrackPropertyRead(1);
        return this.m_AvatarIcon;
    }
    void SetAvatarIcon(const UTexture2D __Value) property
    {
        if (this.m_AvatarIcon == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const float32 GetCDRemained() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_CDRemained() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCDRemained(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CDRemained = __Value;
        return;
    }
    const float32 GetCDRemainedRadio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_CDRemainedRadio() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCDRemainedRadio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CDRemainedRadio = __Value;
        return;
    }
    bool GetbSwitchAvatarInCD() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bSwitchAvatarInCD;
    }
    void SetbSwitchAvatarInCD(const bool __Value) property
    {
        if (!(this.m_bSwitchAvatarInCD) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bSwitchAvatarInCD = __Value;
        return;
    }
    float32 GetEnergyRatio() const property
    {
        float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_EnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_EnergyRatio = __Value;
        return;
    }
    int GetEnergyLevel() const property
    {
        this.TrackPropertyRead(6);
        return this.m_EnergyLevel;
    }
    void SetEnergyLevel(const int __Value) property
    {
        if (this.m_EnergyLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_EnergyLevel = __Value;
        return;
    }
    EDamageType GetAvatarDamageType() const property
    {
        this.TrackPropertyRead(7);
        return this.m_AvatarDamageType;
    }
    void SetAvatarDamageType(const EDamageType __Value) property
    {
        if (int(this.m_AvatarDamageType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_AvatarDamageType = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarButton
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarButton> Self;

    __GeneratedProperties_FVM_AvatarButton()
    {
        return;
    }
}

namespace FVM_AvatarButton
{
FVM_AvatarButton& Create(const UObject ContextObject)
{
    return FVM_AvatarButton::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarButton CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarButton __r;
    TEUIModelRef<FVM_AvatarButton> local_6 = TEUIModelRef<FVM_AvatarButton>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarButton::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarIcon";
    local_14.TypeName = "UTexture2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CDRemained";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CDRemainedRadio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bSwitchAvatarInCD";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarButton;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnAvatarEntityChanged";
    local_24.DirtyFlags.Set(FVM_AvatarButton::__IndexOf_AvatarEntity());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarButton;
}
void __Tick(FVM_AvatarButton &inout Model)
{
    Model.Tick();
    return;
}
void __OnAvatarEntityChanged(FVM_AvatarButton &inout Model)
{
    Model.OnAvatarEntityChanged();
    return;
}
UTexture2D __UIGetter_AvatarIcon(const FVM_AvatarButton &inout Model)
{
    return Model.GetAvatarIcon();
}
float32 __UIGetter_CDRemained(const FVM_AvatarButton &inout Model)
{
    return Model.GetCDRemained();
}
float32 __UIGetter_CDRemainedRadio(const FVM_AvatarButton &inout Model)
{
    return Model.GetCDRemainedRadio();
}
bool __UIGetter_bSwitchAvatarInCD(const FVM_AvatarButton &inout Model)
{
    return Model.GetbSwitchAvatarInCD();
}
TEUIModelRef<FVM_AvatarButton> __UIGetter_Self(const FVM_AvatarButton &inout Model)
{
    return TEUIModelRef<FVM_AvatarButton>(Model);
}
int __IndexOf_AvatarEntity()
{
    return 0;
}
int __IndexOf_AvatarIcon()
{
    return 1;
}
int __IndexOf_CDRemained()
{
    return 2;
}
int __IndexOf_CDRemainedRadio()
{
    return 3;
}
int __IndexOf_bSwitchAvatarInCD()
{
    return 4;
}
int __IndexOf_EnergyRatio()
{
    return 5;
}
int __IndexOf_EnergyLevel()
{
    return 6;
}
int __IndexOf_AvatarDamageType()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_AvatarButton
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
