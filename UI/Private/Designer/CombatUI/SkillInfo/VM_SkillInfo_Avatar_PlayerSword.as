
namespace FVMS_SkillInfo_Avatar_PlayerSword
{
    const int ModelId = 0;

}
struct FVMS_SkillInfo_Avatar_PlayerSword : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FEUIModelRef m_VM_SpecialAttackButton;
    UPROPERTY()
    FEUIModelRef m_VM_SimpleSkillButton;
    UPROPERTY()
    FEUIModelRef m_VM_ExtraSkillButton;
    UPROPERTY()
    FEUIModelRef m_VM_UltraSkillButton;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    float32 m_LineMarkProgressRatio;
    UPROPERTY()
    FECSEntity m_PlayerPawnEntity;
    UPROPERTY()
    float32 m_ProgressRatio_1;
    UPROPERTY()
    bool m_bMarkA;
    UPROPERTY()
    float32 m_ProgressRatio_2;
    UPROPERTY()
    bool m_bMarkB;
    UPROPERTY()
    float32 m_ProgressRatio_3;
    UPROPERTY()
    bool m_bMarkC;
    UPROPERTY()
    float32 m_ProgressRatio_4;
    UPROPERTY()
    bool m_bMarkD;
    UPROPERTY()
    float32 m_ProgressRatio_5;
    UPROPERTY()
    bool m_bMarkE;
    UPROPERTY()
    int m_SpuerSwitch;
    UPROPERTY()
    bool m_UltraOn;

    FVMS_SkillInfo_Avatar_PlayerSword()
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_LineMarkProgressRatio = 0.0f;
        this.m_SpuerSwitch = 0;
        this.m_ProgressRatio_1 = 0.0f;
        this.m_bMarkA = false;
        this.m_ProgressRatio_2 = 0.0f;
        this.m_bMarkB = false;
        this.m_ProgressRatio_3 = 0.0f;
        this.m_bMarkC = false;
        this.m_ProgressRatio_4 = 0.0f;
        this.m_bMarkD = false;
        this.m_ProgressRatio_5 = 0.0f;
        this.m_bMarkE = false;
        this.m_UltraOn = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SkillInfo_Avatar_PlayerSword(const FVMS_SkillInfo_Avatar_PlayerSword &inout Other)
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_LineMarkProgressRatio = 0.0f;
        this.m_SpuerSwitch = 0;
        this.m_ProgressRatio_1 = 0.0f;
        this.m_bMarkA = false;
        this.m_ProgressRatio_2 = 0.0f;
        this.m_bMarkB = false;
        this.m_ProgressRatio_3 = 0.0f;
        this.m_bMarkC = false;
        this.m_ProgressRatio_4 = 0.0f;
        this.m_bMarkD = false;
        this.m_ProgressRatio_5 = 0.0f;
        this.m_bMarkE = false;
        this.m_UltraOn = false;
        this.m_VM_SpecialAttackButton = Other.m_VM_SpecialAttackButton;
        this.m_VM_SimpleSkillButton = Other.m_VM_SimpleSkillButton;
        this.m_VM_ExtraSkillButton = Other.m_VM_ExtraSkillButton;
        this.m_VM_UltraSkillButton = Other.m_VM_UltraSkillButton;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_LineMarkProgressRatio = Other.m_LineMarkProgressRatio;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_ProgressRatio_1 = Other.m_ProgressRatio_1;
        this.m_bMarkA = Other.m_bMarkA;
        this.m_ProgressRatio_2 = Other.m_ProgressRatio_2;
        this.m_bMarkB = Other.m_bMarkB;
        this.m_ProgressRatio_3 = Other.m_ProgressRatio_3;
        this.m_bMarkC = Other.m_bMarkC;
        this.m_ProgressRatio_4 = Other.m_ProgressRatio_4;
        this.m_bMarkD = Other.m_bMarkD;
        this.m_ProgressRatio_5 = Other.m_ProgressRatio_5;
        this.m_bMarkE = Other.m_bMarkE;
        this.m_SpuerSwitch = int(Other.m_SpuerSwitch);
        this.m_UltraOn = Other.m_UltraOn;
        return;
    }
    FVMS_SkillInfo_Avatar_PlayerSword opAssign(const FVMS_SkillInfo_Avatar_PlayerSword &inout Other)
    {
        FVMS_SkillInfo_Avatar_PlayerSword __r;
        this.m_VM_SpecialAttackButton = Other.m_VM_SpecialAttackButton;
        this.m_VM_SimpleSkillButton = Other.m_VM_SimpleSkillButton;
        this.m_VM_ExtraSkillButton = Other.m_VM_ExtraSkillButton;
        this.m_VM_UltraSkillButton = Other.m_VM_UltraSkillButton;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_LineMarkProgressRatio = Other.m_LineMarkProgressRatio;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_ProgressRatio_1 = Other.m_ProgressRatio_1;
        this.m_bMarkA = Other.m_bMarkA;
        this.m_ProgressRatio_2 = Other.m_ProgressRatio_2;
        this.m_bMarkB = Other.m_bMarkB;
        this.m_ProgressRatio_3 = Other.m_ProgressRatio_3;
        this.m_bMarkC = Other.m_bMarkC;
        this.m_ProgressRatio_4 = Other.m_ProgressRatio_4;
        this.m_bMarkD = Other.m_bMarkD;
        this.m_ProgressRatio_5 = Other.m_ProgressRatio_5;
        this.m_bMarkE = Other.m_bMarkE;
        this.m_SpuerSwitch = int(Other.m_SpuerSwitch);
        this.m_UltraOn = Other.m_UltraOn;
        return __r;
    }
    void PostConstruct()
    {
        this.SetPlayerPawnEntity(::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn()));
        this.SetVM_SpecialAttackButton(FEUIModelRef());
        Get local_14;
        local_14.opCall().SetSkillButtonType(ESkillButtonType(4));
        local_14.opCall().SetSkillProgressType(ESkillProgressType(4));
        this.SetVM_SimpleSkillButton(FEUIModelRef());
        local_14.opCall().SetSkillProgressType(ESkillProgressType(2));
        this.SetVM_ExtraSkillButton(FEUIModelRef());
        local_14.opCall().SetSkillProgressType(ESkillProgressType(2));
        this.SetVM_UltraSkillButton(FEUIModelRef());
        local_14.opCall().SetSkillProgressType(ESkillProgressType(2));
        local_14.opCall().SetSkillButtonType(ESkillButtonType(2));
        return;
    }
    void Tick()
    {
        int local_12 = 0;
        int local_18 = 0;
        int local_53;
        if (UICommonUtil::CVar_UI_DebugEnableNewSkillBtns.GetBool())
        {
            return;
        }
        if ((FECSEntity(this.GetPlayerPawnEntity()) == ENTITY_NULL))
        {
            this.SetPlayerPawnEntity(this.GetContext().GetLocalPlayerPawn());
        }
        if ((FECSEntity(this.GetPlayerPawnEntity()) == ENTITY_NULL))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        if (local_18 && local_18.HasAttribute(Attribute::CustomSkillEnergy))
        {
            FNameHandle_EntityBBVarBool local_42;
            float32 local_32 = FGameAttributeUtils::GetAttributeValue(this.GetPlayerPawnEntity(), Attribute::CustomSkillEnergyMax, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            float32 local_31 = FGameAttributeUtils::GetAttributeValue(this.GetPlayerPawnEntity(), Attribute::CustomSkillEnergy, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            float32 local_20 = FGameAttributeUtils::GetAttributeValue(this.GetPlayerPawnEntity(), Attribute::CustomSkillEnergyMax_2, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            float32 local_33 = FGameAttributeUtils::GetAttributeValue(this.GetPlayerPawnEntity(), Attribute::CustomSkillEnergy_2, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            float32 local_34 = FGameAttributeUtils::GetAttributeValue(this.GetPlayerPawnEntity(), Attribute::CustomSkillEnergyMax_2, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            float32 local_35 = FGameAttributeUtils::GetAttributeValue(this.GetPlayerPawnEntity(), Attribute::CustomSkillEnergy_2, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            local_42;
            this.SetUltraOn(this.GetPlayerPawnEntity().GetBB_Bool(local_42));
            this.SetLineMarkProgressRatio(local_35 / local_34);
            if (local_32 != 0.0f)
            {
                this.SetCustomSkillEnergyRatio(local_31 / local_32);
                this.SetProgressRatio_1((this.GetCustomSkillEnergyRatio() * 5.0f));
                float32 local_37 = this.GetCustomSkillEnergyRatio() * 5.0f;
                this.SetProgressRatio_2(local_37 - 1.0f);
                local_37 = this.GetCustomSkillEnergyRatio() * 5.0f;
                this.SetProgressRatio_3(local_37 - 2.0f);
                local_37 = this.GetCustomSkillEnergyRatio() * 5.0f;
                this.SetProgressRatio_4(local_37 - 3.0f);
                local_37 = this.GetCustomSkillEnergyRatio() * 5.0f;
                this.SetProgressRatio_5(local_37 - 4.0f);
                if (this.GetProgressRatio_1() >= 1.0f)
                {
                    this.SetbMarkA(true);
                }
                else
                {
                    this.SetbMarkA(false);
                }
                if (this.GetProgressRatio_2() >= 1.0f)
                {
                    this.SetbMarkB(true);
                }
                else
                {
                    this.SetbMarkB(false);
                }
                if (this.GetProgressRatio_3() >= 1.0f)
                {
                    this.SetbMarkC(true);
                }
                else
                {
                    this.SetbMarkC(false);
                }
                if (this.GetProgressRatio_4() >= 1.0f)
                {
                    this.SetbMarkD(true);
                }
                else
                {
                    this.SetbMarkD(false);
                }
                if (this.GetProgressRatio_5() >= 1.0f)
                {
                    this.SetbMarkE(true);
                }
                else
                {
                    this.SetbMarkE(false);
                }
            }
        }
        FNameHandle_EntityBBVar local_48;
        local_48;
        if (this.GetPlayerPawnEntity().HasEntityBB(local_48))
        {
            FNameHandle_EntityBBVarInt local_52;
            local_52;
            local_53 = this.GetPlayerPawnEntity().GetBB_Int(local_52);
        }
        else
        {
            local_53 = 0;
        }
        this.SetSpuerSwitch(local_53);
        return;
    }
    void OnPlayerPawnEntityChanged()
    {
        int local_14 = 0;
        const USkillConfig local_26;
        if (UICommonUtil::CVar_UI_DebugEnableNewSkillBtns.GetBool())
        {
            return;
        }
        int local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(3));
        bool local_5 = false;
        const FC_SkillInstance& local_8 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5);
        if (local_5)
        {
            TSoftObjectPtr<USkillConfig> local_24 = local_8.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
            local_14.SetSkillProgressAttribute(Attribute::SimpleSkillEnergy);
            local_14.SetSkillProgressAttributeMax(Attribute::SimpleSkillEnergyMax);
        }
        local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(5));
        const FC_SkillInstance& local_28 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5);
        if (local_5)
        {
            TSoftObjectPtr<USkillConfig> local_24_2 = local_28.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
            local_14.SetSkillProgressAttribute(Attribute::ExtraSkillEnergy);
            local_14.SetSkillProgressAttributeMax(Attribute::ExtraSkillEnergyMax);
        }
        local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(4));
        const FC_SkillInstance& local_30 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5);
        if (local_5)
        {
            TSoftObjectPtr<USkillConfig> local_24_3 = local_30.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
            local_14.SetSkillProgressAttribute(Attribute::UltraSkillEnergy);
            local_14.SetSkillProgressAttributeMax(Attribute::UltraSkillEnergyMax);
        }
        local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(2));
        const FC_SkillInstance& local_32 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5);
        if (local_5)
        {
            TSoftObjectPtr<USkillConfig> local_24_4 = local_32.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
        }
        return;
    }
    const FEUIModelRef GetVM_SpecialAttackButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_VM_SpecialAttackButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetVM_SpecialAttackButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_VM_SpecialAttackButton = __Value;
        return;
    }
    const FEUIModelRef GetVM_SimpleSkillButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelRef GetModify_VM_SimpleSkillButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetVM_SimpleSkillButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_VM_SimpleSkillButton = __Value;
        return;
    }
    const FEUIModelRef GetVM_ExtraSkillButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIModelRef GetModify_VM_ExtraSkillButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetVM_ExtraSkillButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_VM_ExtraSkillButton = __Value;
        return;
    }
    const FEUIModelRef GetVM_UltraSkillButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIModelRef GetModify_VM_UltraSkillButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetVM_UltraSkillButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_VM_UltraSkillButton = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCustomSkillEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CustomSkillEnergyRatio = __Value;
        return;
    }
    const float32 GetLineMarkProgressRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_LineMarkProgressRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetLineMarkProgressRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_LineMarkProgressRatio = __Value;
        return;
    }
    FECSEntity GetPlayerPawnEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FECSEntity GetModify_PlayerPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetPlayerPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_PlayerPawnEntity = __Value;
        return;
    }
    const float32 GetProgressRatio_1() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_ProgressRatio_1() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetProgressRatio_1(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ProgressRatio_1 = __Value;
        return;
    }
    bool GetbMarkA() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bMarkA;
    }
    void SetbMarkA(const bool __Value) property
    {
        if (!(this.m_bMarkA) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bMarkA = __Value;
        return;
    }
    const float32 GetProgressRatio_2() const property
    {
        const float32 __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    float32 GetModify_ProgressRatio_2() property
    {
        float32 __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetProgressRatio_2(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ProgressRatio_2 = __Value;
        return;
    }
    bool GetbMarkB() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bMarkB;
    }
    void SetbMarkB(const bool __Value) property
    {
        if (!(this.m_bMarkB) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bMarkB = __Value;
        return;
    }
    const float32 GetProgressRatio_3() const property
    {
        const float32 __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    float32 GetModify_ProgressRatio_3() property
    {
        float32 __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetProgressRatio_3(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_ProgressRatio_3 = __Value;
        return;
    }
    bool GetbMarkC() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bMarkC;
    }
    void SetbMarkC(const bool __Value) property
    {
        if (!(this.m_bMarkC) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bMarkC = __Value;
        return;
    }
    const float32 GetProgressRatio_4() const property
    {
        const float32 __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    float32 GetModify_ProgressRatio_4() property
    {
        float32 __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetProgressRatio_4(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_ProgressRatio_4 = __Value;
        return;
    }
    bool GetbMarkD() const property
    {
        this.TrackPropertyRead(14);
        return this.m_bMarkD;
    }
    void SetbMarkD(const bool __Value) property
    {
        if (!(this.m_bMarkD) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_bMarkD = __Value;
        return;
    }
    const float32 GetProgressRatio_5() const property
    {
        const float32 __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    float32 GetModify_ProgressRatio_5() property
    {
        float32 __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetProgressRatio_5(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_ProgressRatio_5 = __Value;
        return;
    }
    bool GetbMarkE() const property
    {
        this.TrackPropertyRead(16);
        return this.m_bMarkE;
    }
    void SetbMarkE(const bool __Value) property
    {
        if (!(this.m_bMarkE) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_bMarkE = __Value;
        return;
    }
    int GetSpuerSwitch() const property
    {
        this.TrackPropertyRead(17);
        return this.m_SpuerSwitch;
    }
    void SetSpuerSwitch(const int __Value) property
    {
        if (this.m_SpuerSwitch == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_SpuerSwitch = __Value;
        return;
    }
    bool GetUltraOn() const property
    {
        this.TrackPropertyRead(18);
        return this.m_UltraOn;
    }
    void SetUltraOn(const bool __Value) property
    {
        if (!(this.m_UltraOn) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_UltraOn = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_SkillInfo_Avatar_PlayerSword
{
    UPROPERTY()
    TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerSword> Self;

    __GeneratedProperties_FVMS_SkillInfo_Avatar_PlayerSword()
    {
        return;
    }
}

namespace FVMS_SkillInfo_Avatar_PlayerSword
{
FVMS_SkillInfo_Avatar_PlayerSword& Get(const UObject ContextObject)
{
    return FVMS_SkillInfo_Avatar_PlayerSword::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SkillInfo_Avatar_PlayerSword GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SkillInfo_Avatar_PlayerSword __r;
    TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerSword> local_6 = TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerSword>(EUIInternal::MakeModelWithManager(Manager, FVMS_SkillInfo_Avatar_PlayerSword::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "VM_SpecialAttackButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_SimpleSkillButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_ExtraSkillButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_UltraSkillButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CustomSkillEnergyRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LineMarkProgressRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bMarkA";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bMarkB";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bMarkC";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bMarkD";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bMarkE";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SpuerSwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UltraOn";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerSword>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SkillInfo_Avatar_PlayerSword;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnPlayerPawnEntityChanged";
    local_24.DirtyFlags.Set(FVMS_SkillInfo_Avatar_PlayerSword::__IndexOf_PlayerPawnEntity());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SkillInfo_Avatar_PlayerSword;
}
void __Tick(FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    Model.Tick();
    return;
}
void __OnPlayerPawnEntityChanged(FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    Model.OnPlayerPawnEntityChanged();
    return;
}
FEUIModelRef __UIGetter_VM_SpecialAttackButton(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetVM_SpecialAttackButton();
}
FEUIModelRef __UIGetter_VM_SimpleSkillButton(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetVM_SimpleSkillButton();
}
FEUIModelRef __UIGetter_VM_ExtraSkillButton(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetVM_ExtraSkillButton();
}
FEUIModelRef __UIGetter_VM_UltraSkillButton(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetVM_UltraSkillButton();
}
float32 __UIGetter_CustomSkillEnergyRatio(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetCustomSkillEnergyRatio();
}
float32 __UIGetter_LineMarkProgressRatio(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetLineMarkProgressRatio();
}
bool __UIGetter_bMarkA(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetbMarkA();
}
bool __UIGetter_bMarkB(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetbMarkB();
}
bool __UIGetter_bMarkC(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetbMarkC();
}
bool __UIGetter_bMarkD(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetbMarkD();
}
bool __UIGetter_bMarkE(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetbMarkE();
}
int __UIGetter_SpuerSwitch(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetSpuerSwitch();
}
bool __UIGetter_UltraOn(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return Model.GetUltraOn();
}
TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerSword> __UIGetter_Self(const FVMS_SkillInfo_Avatar_PlayerSword &inout Model)
{
    return TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerSword>(Model);
}
int __IndexOf_VM_SpecialAttackButton()
{
    return 0;
}
int __IndexOf_VM_SimpleSkillButton()
{
    return 1;
}
int __IndexOf_VM_ExtraSkillButton()
{
    return 2;
}
int __IndexOf_VM_UltraSkillButton()
{
    return 3;
}
int __IndexOf_CustomSkillEnergyRatio()
{
    return 4;
}
int __IndexOf_LineMarkProgressRatio()
{
    return 5;
}
int __IndexOf_PlayerPawnEntity()
{
    return 6;
}
int __IndexOf_ProgressRatio_1()
{
    return 7;
}
int __IndexOf_bMarkA()
{
    return 8;
}
int __IndexOf_ProgressRatio_2()
{
    return 9;
}
int __IndexOf_bMarkB()
{
    return 10;
}
int __IndexOf_ProgressRatio_3()
{
    return 11;
}
int __IndexOf_bMarkC()
{
    return 12;
}
int __IndexOf_ProgressRatio_4()
{
    return 13;
}
int __IndexOf_bMarkD()
{
    return 14;
}
int __IndexOf_ProgressRatio_5()
{
    return 15;
}
int __IndexOf_bMarkE()
{
    return 16;
}
int __IndexOf_SpuerSwitch()
{
    return 17;
}
int __IndexOf_UltraOn()
{
    return 18;
}
}
namespace __GeneratedProperties_FVMS_SkillInfo_Avatar_PlayerSword
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
