
namespace FVM_SuiXiSkillResource
{
    const int ModelId = 0;

}
struct FVM_SuiXiSkillResource : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_CustomSkillEnergy;
    UPROPERTY()
    float32 m_CustomSkillEnergyMax;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    float32 m_LastCustomSkillEnergyRatio;
    UPROPERTY()
    bool m_bIsDecreasing;
    UPROPERTY()
    float32 m_LeftBarPercent;
    UPROPERTY()
    float32 m_LastLeftBarPercent;
    UPROPERTY()
    float32 m_RightBarPercent;
    UPROPERTY()
    float32 m_LastRightBarPercent;
    UPROPERTY()
    FName m_IdentifyName_ShuiJing_PowerArrow;
    UPROPERTY()
    int m_Num_PowerArrow;
    UPROPERTY()
    bool m_ShowArrow;
    UPROPERTY()
    int m_ChargeState;
    UPROPERTY()
    int m_ChargeNum;
    UPROPERTY()
    float32 m_ChargeEnergySpeed_Charge;
    UPROPERTY()
    float32 m_LastChargeEnergySpeed_Charge;
    UPROPERTY()
    FMW_AttributeRatio m_CustomSkillEnergySource;
    UPROPERTY()
    FMW_EBBInt m_ChargeNumSource;
    UPROPERTY()
    FMW_EBBInt m_SuperSwitchModeSource;
    UPROPERTY()
    FMW_EBBFloat m_ChargeEnergySpeedChargeSource;

    FVM_SuiXiSkillResource()
    {
        this.m_CustomSkillEnergy = 0.0f;
        this.m_CustomSkillEnergyMax = 0.0f;
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_Num_PowerArrow = 0;
        this.m_ChargeState = 0;
        this.m_LastCustomSkillEnergyRatio = 0.0f;
        this.m_bIsDecreasing = false;
        this.m_LeftBarPercent = 0.0f;
        this.m_LastLeftBarPercent = 0.0f;
        this.m_RightBarPercent = 0.0f;
        this.m_LastRightBarPercent = 0.0f;
        this.m_ShowArrow = false;
        this.m_ChargeNum = 0;
        this.m_ChargeEnergySpeed_Charge = 0.0f;
        this.m_LastChargeEnergySpeed_Charge = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SuiXiSkillResource(const FVM_SuiXiSkillResource &inout Other)
    {
        this.m_CustomSkillEnergy = 0.0f;
        this.m_CustomSkillEnergyMax = 0.0f;
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_Num_PowerArrow = 0;
        this.m_ChargeState = 0;
        this.m_LastCustomSkillEnergyRatio = 0.0f;
        this.m_bIsDecreasing = false;
        this.m_LeftBarPercent = 0.0f;
        this.m_LastLeftBarPercent = 0.0f;
        this.m_RightBarPercent = 0.0f;
        this.m_LastRightBarPercent = 0.0f;
        this.m_ShowArrow = false;
        this.m_ChargeNum = 0;
        this.m_ChargeEnergySpeed_Charge = 0.0f;
        this.m_LastChargeEnergySpeed_Charge = 0.0f;
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_LastCustomSkillEnergyRatio = Other.m_LastCustomSkillEnergyRatio;
        this.m_bIsDecreasing = Other.m_bIsDecreasing;
        this.m_LeftBarPercent = Other.m_LeftBarPercent;
        this.m_LastLeftBarPercent = Other.m_LastLeftBarPercent;
        this.m_RightBarPercent = Other.m_RightBarPercent;
        this.m_LastRightBarPercent = Other.m_LastRightBarPercent;
        this.m_IdentifyName_ShuiJing_PowerArrow = Other.m_IdentifyName_ShuiJing_PowerArrow;
        this.m_Num_PowerArrow = int(Other.m_Num_PowerArrow);
        this.m_ShowArrow = Other.m_ShowArrow;
        this.m_ChargeState = int(Other.m_ChargeState);
        this.m_ChargeNum = int(Other.m_ChargeNum);
        this.m_ChargeEnergySpeed_Charge = Other.m_ChargeEnergySpeed_Charge;
        this.m_LastChargeEnergySpeed_Charge = Other.m_LastChargeEnergySpeed_Charge;
        this.m_CustomSkillEnergySource = Other.m_CustomSkillEnergySource;
        this.m_ChargeNumSource = Other.m_ChargeNumSource;
        this.m_SuperSwitchModeSource = Other.m_SuperSwitchModeSource;
        this.m_ChargeEnergySpeedChargeSource = Other.m_ChargeEnergySpeedChargeSource;
        return;
    }
    FVM_SuiXiSkillResource& opAssign(const FVM_SuiXiSkillResource &inout Other)
    {
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_LastCustomSkillEnergyRatio = Other.m_LastCustomSkillEnergyRatio;
        this.m_bIsDecreasing = Other.m_bIsDecreasing;
        this.m_LeftBarPercent = Other.m_LeftBarPercent;
        this.m_LastLeftBarPercent = Other.m_LastLeftBarPercent;
        this.m_RightBarPercent = Other.m_RightBarPercent;
        this.m_LastRightBarPercent = Other.m_LastRightBarPercent;
        this.m_IdentifyName_ShuiJing_PowerArrow = Other.m_IdentifyName_ShuiJing_PowerArrow;
        this.m_Num_PowerArrow = int(Other.m_Num_PowerArrow);
        this.m_ShowArrow = Other.m_ShowArrow;
        this.m_ChargeState = int(Other.m_ChargeState);
        this.m_ChargeNum = int(Other.m_ChargeNum);
        this.m_ChargeEnergySpeed_Charge = Other.m_ChargeEnergySpeed_Charge;
        this.m_LastChargeEnergySpeed_Charge = Other.m_LastChargeEnergySpeed_Charge;
        this.m_CustomSkillEnergySource = Other.m_CustomSkillEnergySource;
        this.m_ChargeNumSource = Other.m_ChargeNumSource;
        this.m_SuperSwitchModeSource = Other.m_SuperSwitchModeSource;
        return Other.m_ChargeEnergySpeedChargeSource;
    }
    ESlateVisibility GetLeftBarVisibility() const
    {
        int local_5;
        float32 local_1 = this.GetLeftBarPercent();
        if (local_1 == 0.0f || (this.GetLeftBarPercent() == 1.0f))
        {
            local_5 = 1;
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    ESlateVisibility GetRightBarVisibility() const
    {
        int local_5;
        float32 local_1 = this.GetRightBarPercent();
        if (local_1 == 0.0f || (this.GetRightBarPercent() == 1.0f))
        {
            local_5 = 1;
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    float32 GetLeftBarMatPercent() const
    {
        return (this.GetLeftBarPercent() * 0.6f) + 0.18f;
    }
    float32 GetRightBarMatPercent() const
    {
        return (this.GetRightBarPercent() * 0.6f) + 0.22f;
    }
    float32 GetLeftBarPercentVM() const
    {
        return this.GetLeftBarPercent();
    }
    float32 GetRightBarPercentVM() const
    {
        return this.GetRightBarPercent();
    }
    ESlateVisibility GetVMShowArrow() const
    {
        int local_2;
        if (this.GetShowArrow())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 2;
        }
        return ESlateVisibility(local_2);
    }
    float32 GetMainPercent() const
    {
        return this.GetCustomSkillEnergyRatio();
    }
    void PostConstruct()
    {
        UCombatGlobalSettings local_2 = ::UCombatGlobalSettings::Get();
        UClass local_4;
        this.SetIdentifyName_ShuiJing_PowerArrow(FName(local_4.GetPathName(nullptr)));
        return;
    }
    void SyncSuiXiResourceSources()
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(::UICommonUtil::IsValidPawnContext(local_4)))
        {
            this.GetModify_CustomSkillEnergySource().Reset();
            this.GetModify_ChargeNumSource().Reset();
            this.GetModify_SuperSwitchModeSource().Reset();
            this.GetModify_ChargeEnergySpeedChargeSource().Reset();
            return;
        }
        this.GetModify_CustomSkillEnergySource().SetAttribute(local_4, Attribute::CustomSkillEnergy, Attribute::CustomSkillEnergyMax);
        this.GetModify_ChargeNumSource().SetEBB(local_4, n"iChargeShoot_ChargeNum");
        this.GetModify_SuperSwitchModeSource().SetEBB(local_4, n"iSuperSwitchMode");
        this.GetModify_ChargeEnergySpeedChargeSource().SetEBB(local_4, n"fChargeEnergySpeed_Charge");
        return;
    }
    void RefreshCustomSkillEnergy()
    {
        float32 local_1 = this.GetCustomSkillEnergySource().GetMaxValue();
        this.SetCustomSkillEnergyMax(local_1);
        this.SetCustomSkillEnergy(local_1);
        this.SetLastCustomSkillEnergyRatio(this.GetCustomSkillEnergyRatio());
        this.SetCustomSkillEnergyRatio(this.GetCustomSkillEnergySource().GetRatioValue());
        this.SetbIsDecreasing((this.GetCustomSkillEnergyRatio() < this.GetLastCustomSkillEnergyRatio()));
        this.SetLastLeftBarPercent(this.GetLeftBarPercent());
        this.SetLeftBarPercent(FMath::Clamp((this.GetCustomSkillEnergyRatio() * 2.0f), 0.0f, 1.0f));
        this.SetLastRightBarPercent(this.GetRightBarPercent());
        this.SetRightBarPercent(FMath::Clamp((this.GetCustomSkillEnergyRatio() - 0.5f) * 2.0f, 0.0f, 1.0f));
        return;
    }
    void RefreshChargeState()
    {
        int local_1 = 0;
        this.SetChargeNum(local_1);
        if (local_1 > 0 || (this.GetChargeNum() > 2))
        {
            this.SetChargeState(2);
            return;
        }
        if (this.GetChargeNum() > 1)
        {
            this.SetChargeState(1);
            return;
        }
        this.SetChargeState(0);
        return;
    }
    void RefreshChargeEnergySpeed()
    {
        float32 local_1 = 0.0f;
        this.SetLastChargeEnergySpeed_Charge(this.GetChargeEnergySpeed_Charge());
        this.SetChargeEnergySpeed_Charge(local_1);
        return;
    }
    void RefreshPowerArrowCount()
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(::UICommonUtil::IsValidPawnContext(local_4)))
        {
            return;
        }
        Get local_14;
        const FC_NumLimitManager& local_16 = local_14.opCall();
        if (local_16)
        {
            this.SetNum_PowerArrow(0);
            for (auto& local_32 : local_16.GetManagerItems())
            {
                if ((local_32.GetIdentifier() == this.GetIdentifyName_ShuiJing_PowerArrow()))
                {
                    this.SetNum_PowerArrow((this.GetNum_PowerArrow() + 1));
                }
            }
            this.SetShowArrow((this.GetNum_PowerArrow() > 0));
        }
        return;
    }
    const float32 GetCustomSkillEnergy() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_CustomSkillEnergy() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCustomSkillEnergy(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CustomSkillEnergy = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyMax() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyMax() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCustomSkillEnergyMax(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CustomSkillEnergyMax = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCustomSkillEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CustomSkillEnergyRatio = __Value;
        return;
    }
    const float32 GetLastCustomSkillEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_LastCustomSkillEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetLastCustomSkillEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_LastCustomSkillEnergyRatio = __Value;
        return;
    }
    bool GetbIsDecreasing() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bIsDecreasing;
    }
    void SetbIsDecreasing(const bool __Value) property
    {
        if (!(this.m_bIsDecreasing) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bIsDecreasing = __Value;
        return;
    }
    const float32 GetLeftBarPercent() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_LeftBarPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetLeftBarPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_LeftBarPercent = __Value;
        return;
    }
    const float32 GetLastLeftBarPercent() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_LastLeftBarPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetLastLeftBarPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_LastLeftBarPercent = __Value;
        return;
    }
    const float32 GetRightBarPercent() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_RightBarPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetRightBarPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_RightBarPercent = __Value;
        return;
    }
    const float32 GetLastRightBarPercent() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_LastRightBarPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetLastRightBarPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_LastRightBarPercent = __Value;
        return;
    }
    const FName GetIdentifyName_ShuiJing_PowerArrow() const property
    {
        const FName __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FName GetModify_IdentifyName_ShuiJing_PowerArrow() property
    {
        FName __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetIdentifyName_ShuiJing_PowerArrow(const FName &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_IdentifyName_ShuiJing_PowerArrow = __Value;
        return;
    }
    int GetNum_PowerArrow() const property
    {
        this.TrackPropertyRead(10);
        return this.m_Num_PowerArrow;
    }
    void SetNum_PowerArrow(const int __Value) property
    {
        if (this.m_Num_PowerArrow == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_Num_PowerArrow = __Value;
        return;
    }
    bool GetShowArrow() const property
    {
        this.TrackPropertyRead(11);
        return this.m_ShowArrow;
    }
    void SetShowArrow(const bool __Value) property
    {
        if (!(this.m_ShowArrow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_ShowArrow = __Value;
        return;
    }
    int GetChargeState() const property
    {
        this.TrackPropertyRead(12);
        return this.m_ChargeState;
    }
    void SetChargeState(const int __Value) property
    {
        if (this.m_ChargeState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_ChargeState = __Value;
        return;
    }
    int GetChargeNum() const property
    {
        this.TrackPropertyRead(13);
        return this.m_ChargeNum;
    }
    void SetChargeNum(const int __Value) property
    {
        if (this.m_ChargeNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_ChargeNum = __Value;
        return;
    }
    const float32 GetChargeEnergySpeed_Charge() const property
    {
        const float32 __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    float32 GetModify_ChargeEnergySpeed_Charge() property
    {
        float32 __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetChargeEnergySpeed_Charge(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_ChargeEnergySpeed_Charge = __Value;
        return;
    }
    const float32 GetLastChargeEnergySpeed_Charge() const property
    {
        const float32 __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    float32 GetModify_LastChargeEnergySpeed_Charge() property
    {
        float32 __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetLastChargeEnergySpeed_Charge(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_LastChargeEnergySpeed_Charge = __Value;
        return;
    }
    const FMW_AttributeRatio GetCustomSkillEnergySource() const property
    {
        const FMW_AttributeRatio __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    FMW_AttributeRatio GetModify_CustomSkillEnergySource() property
    {
        FMW_AttributeRatio __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetCustomSkillEnergySource(const FMW_AttributeRatio &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_CustomSkillEnergySource = __Value;
        return;
    }
    const FMW_EBBInt GetChargeNumSource() const property
    {
        const FMW_EBBInt __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FMW_EBBInt GetModify_ChargeNumSource() property
    {
        FMW_EBBInt __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetChargeNumSource(const FMW_EBBInt &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_ChargeNumSource = __Value;
        return;
    }
    const FMW_EBBInt GetSuperSwitchModeSource() const property
    {
        const FMW_EBBInt __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    FMW_EBBInt GetModify_SuperSwitchModeSource() property
    {
        FMW_EBBInt __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetSuperSwitchModeSource(const FMW_EBBInt &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_SuperSwitchModeSource = __Value;
        return;
    }
    const FMW_EBBFloat GetChargeEnergySpeedChargeSource() const property
    {
        const FMW_EBBFloat __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    FMW_EBBFloat GetModify_ChargeEnergySpeedChargeSource() property
    {
        FMW_EBBFloat __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetChargeEnergySpeedChargeSource(const FMW_EBBFloat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_ChargeEnergySpeedChargeSource = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SuiXiSkillResource
{
    UPROPERTY()
    ESlateVisibility LeftBarVisibility;
    UPROPERTY()
    ESlateVisibility RightBarVisibility;
    UPROPERTY()
    float32 LeftBarMatPercent;
    UPROPERTY()
    float32 RightBarMatPercent;
    UPROPERTY()
    float32 LeftBarPercentVM;
    UPROPERTY()
    float32 RightBarPercentVM;
    UPROPERTY()
    ESlateVisibility VMShowArrow;
    UPROPERTY()
    float32 MainPercent;
    UPROPERTY()
    TEUIModelRef<FVM_SuiXiSkillResource> Self;


}

namespace FVM_SuiXiSkillResource
{
FVM_SuiXiSkillResource& Create(const UObject ContextObject)
{
    return FVM_SuiXiSkillResource::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SuiXiSkillResource CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SuiXiSkillResource __r;
    TEUIModelRef<FVM_SuiXiSkillResource> local_6 = TEUIModelRef<FVM_SuiXiSkillResource>(EUIInternal::MakeModelWithManager(Manager, FVM_SuiXiSkillResource::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "LeftBarVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightBarVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftBarMatPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightBarMatPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftBarPercentVM";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightBarPercentVM";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VMShowArrow";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SuiXiSkillResource>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SuiXiSkillResource;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("CustomSkillEnergySource");
    int local_2_2 = FVM_SuiXiSkillResource::__IndexOf_CustomSkillEnergySource();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("ChargeNumSource");
    int local_2_3 = FVM_SuiXiSkillResource::__IndexOf_ChargeNumSource();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("SuperSwitchModeSource");
    int local_2_4 = FVM_SuiXiSkillResource::__IndexOf_SuperSwitchModeSource();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("ChargeEnergySpeedChargeSource");
    int local_2_5 = FVM_SuiXiSkillResource::__IndexOf_ChargeEnergySpeedChargeSource();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "SyncSuiXiResourceSources";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshCustomSkillEnergy";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshChargeState";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshChargeEnergySpeed";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshPowerArrowCount";
    Result.EffectFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SuiXiSkillResource;
}
ESlateVisibility __UIGetter_LeftBarVisibility(const FVM_SuiXiSkillResource &inout Model)
{
    return Model.GetLeftBarVisibility();
}
ESlateVisibility __UIGetter_RightBarVisibility(const FVM_SuiXiSkillResource &inout Model)
{
    return Model.GetRightBarVisibility();
}
float32 __UIGetter_LeftBarMatPercent(const FVM_SuiXiSkillResource &inout Model)
{
    return Model.GetLeftBarMatPercent();
}
float32 __UIGetter_RightBarMatPercent(const FVM_SuiXiSkillResource &inout Model)
{
    return Model.GetRightBarMatPercent();
}
float32 __UIGetter_LeftBarPercentVM(const FVM_SuiXiSkillResource &inout Model)
{
    return Model.GetLeftBarPercentVM();
}
float32 __UIGetter_RightBarPercentVM(const FVM_SuiXiSkillResource &inout Model)
{
    return Model.GetRightBarPercentVM();
}
ESlateVisibility __UIGetter_VMShowArrow(const FVM_SuiXiSkillResource &inout Model)
{
    return Model.GetVMShowArrow();
}
float32 __UIGetter_MainPercent(const FVM_SuiXiSkillResource &inout Model)
{
    return Model.GetMainPercent();
}
TEUIModelRef<FVM_SuiXiSkillResource> __UIGetter_Self(const FVM_SuiXiSkillResource &inout Model)
{
    return TEUIModelRef<FVM_SuiXiSkillResource>(Model);
}
int __IndexOf_CustomSkillEnergy()
{
    return 0;
}
int __IndexOf_CustomSkillEnergyMax()
{
    return 1;
}
int __IndexOf_CustomSkillEnergyRatio()
{
    return 2;
}
int __IndexOf_LastCustomSkillEnergyRatio()
{
    return 3;
}
int __IndexOf_bIsDecreasing()
{
    return 4;
}
int __IndexOf_LeftBarPercent()
{
    return 5;
}
int __IndexOf_LastLeftBarPercent()
{
    return 6;
}
int __IndexOf_RightBarPercent()
{
    return 7;
}
int __IndexOf_LastRightBarPercent()
{
    return 8;
}
int __IndexOf_IdentifyName_ShuiJing_PowerArrow()
{
    return 9;
}
int __IndexOf_Num_PowerArrow()
{
    return 10;
}
int __IndexOf_ShowArrow()
{
    return 11;
}
int __IndexOf_ChargeState()
{
    return 12;
}
int __IndexOf_ChargeNum()
{
    return 13;
}
int __IndexOf_ChargeEnergySpeed_Charge()
{
    return 14;
}
int __IndexOf_LastChargeEnergySpeed_Charge()
{
    return 15;
}
int __IndexOf_CustomSkillEnergySource()
{
    return 16;
}
int __IndexOf_ChargeNumSource()
{
    return 17;
}
int __IndexOf_SuperSwitchModeSource()
{
    return 18;
}
int __IndexOf_ChargeEnergySpeedChargeSource()
{
    return 19;
}
}
namespace __GeneratedProperties_FVM_SuiXiSkillResource
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
