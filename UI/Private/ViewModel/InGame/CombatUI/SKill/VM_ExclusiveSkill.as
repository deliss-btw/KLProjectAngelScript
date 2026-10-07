
namespace FVM_GramherExclusiveSkill
{
    const int ModelId = 0;
}
namespace FVM_SwordExclusiveSkill
{
    const int ModelId = 0;
}
namespace FVM_WizardExclusiveSkill
{
    const int ModelId = 0;
}
namespace FVM_ShuijingExclusiveSkill
{
    const int ModelId = 0;
}
namespace FVM_QiongExclusiveSkill
{
    const int ModelId = 0;
}
namespace FVM_FakeCharacterProgress
{
    const int ModelId = 0;

}
struct FVM_GramherExclusiveSkill : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_FoundationIndex;
    UPROPERTY()
    float32 m_CurCustomSkillEnergy2;
    UPROPERTY()
    float32 m_MaxCustomSkillEnergy2;

    FVM_GramherExclusiveSkill()
    {
        this.m_FoundationIndex = 1;
        this.m_CurCustomSkillEnergy2 = 0.0f;
        this.m_MaxCustomSkillEnergy2 = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_GramherExclusiveSkill(const FVM_GramherExclusiveSkill &inout Other)
    {
        this.m_FoundationIndex = 1;
        this.m_CurCustomSkillEnergy2 = 0.0f;
        this.m_MaxCustomSkillEnergy2 = 0.0f;
        this.m_FoundationIndex = int(Other.m_FoundationIndex);
        this.m_CurCustomSkillEnergy2 = Other.m_CurCustomSkillEnergy2;
        this.m_MaxCustomSkillEnergy2 = Other.m_MaxCustomSkillEnergy2;
        return;
    }
    FVM_GramherExclusiveSkill opAssign(const FVM_GramherExclusiveSkill &inout Other)
    {
        FVM_GramherExclusiveSkill __r;
        this.m_FoundationIndex = int(Other.m_FoundationIndex);
        this.m_CurCustomSkillEnergy2 = Other.m_CurCustomSkillEnergy2;
        this.m_MaxCustomSkillEnergy2 = Other.m_MaxCustomSkillEnergy2;
        return __r;
    }
    ESlateVisibility GetShowF2Progress() const
    {
        int local_4;
        if (this.GetFoundationIndex() == 2)
        {
            local_4 = 0;
        }
        else
        {
            local_4 = 1;
        }
        return ESlateVisibility(local_4);
    }
    float32 GetF2ProgressPercent() const
    {
        float32 local_1 = this.GetMaxCustomSkillEnergy2();
        if (local_1 == 0.0f)
        {
            return 0.0f;
        }
        return (this.GetCurCustomSkillEnergy2() / this.GetMaxCustomSkillEnergy2());
    }
    FLinearColor GetF2ProgressColor() const
    {
        if (this.GetCurCustomSkillEnergy2() == this.GetMaxCustomSkillEnergy2())
        {
            return FLinearColor(0.83f, 0.0f, 1.0f, 1.0f);
        }
        return FLinearColor(0.0f, 0.52f, 1.0f, 1.0f);
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
        FNameHandle_EntityBBVar local_12;
        local_12;
        bool local_5 = this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_12);
        FNameHandle_EntityBBVarInt local_16;
        local_16;
        this.SetFoundationIndex(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_16));
        if (this.GetFoundationIndex() == 2)
        {
            this.SetCurCustomSkillEnergy2(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy_2, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue()));
            this.SetMaxCustomSkillEnergy2(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax_2, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue()));
        }
        return;
    }
    int GetFoundationIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_FoundationIndex;
    }
    void SetFoundationIndex(const int __Value) property
    {
        if (this.m_FoundationIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_FoundationIndex = __Value;
        return;
    }
    const float32 GetCurCustomSkillEnergy2() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_CurCustomSkillEnergy2() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCurCustomSkillEnergy2(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurCustomSkillEnergy2 = __Value;
        return;
    }
    const float32 GetMaxCustomSkillEnergy2() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_MaxCustomSkillEnergy2() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetMaxCustomSkillEnergy2(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MaxCustomSkillEnergy2 = __Value;
        return;
    }
}

struct FVM_SwordExclusiveSkill : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_iFoundationIndex;
    UPROPERTY()
    int m_FullGridCount;
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
    UPROPERTY()
    float32 m_LineMarkProgressRatio;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    bool m_bSwitchAvatar;
    UPROPERTY()
    int m_SwitchAvatarTimer;

    FVM_SwordExclusiveSkill()
    {
        this.m_SpuerSwitch = 0;
        this.m_LineMarkProgressRatio = 0.0f;
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_iFoundationIndex = 1;
        this.m_FullGridCount = 0;
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
        this.m_bSwitchAvatar = false;
        this.m_SwitchAvatarTimer = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SwordExclusiveSkill(const FVM_SwordExclusiveSkill &inout Other)
    {
        this.m_SpuerSwitch = 0;
        this.m_LineMarkProgressRatio = 0.0f;
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_iFoundationIndex = 1;
        this.m_FullGridCount = 0;
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
        this.m_bSwitchAvatar = false;
        this.m_SwitchAvatarTimer = 0;
        this.m_iFoundationIndex = int(Other.m_iFoundationIndex);
        this.m_FullGridCount = int(Other.m_FullGridCount);
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
        this.m_LineMarkProgressRatio = Other.m_LineMarkProgressRatio;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_bSwitchAvatar = Other.m_bSwitchAvatar;
        this.m_SwitchAvatarTimer = int(Other.m_SwitchAvatarTimer);
        return;
    }
    FVM_SwordExclusiveSkill opAssign(const FVM_SwordExclusiveSkill &inout Other)
    {
        FVM_SwordExclusiveSkill __r;
        this.m_iFoundationIndex = int(Other.m_iFoundationIndex);
        this.m_FullGridCount = int(Other.m_FullGridCount);
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
        this.m_LineMarkProgressRatio = Other.m_LineMarkProgressRatio;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_bSwitchAvatar = Other.m_bSwitchAvatar;
        this.m_SwitchAvatarTimer = int(Other.m_SwitchAvatarTimer);
        return __r;
    }
    float32 GetProgressRatio1() const
    {
        return this.GetProgressRatio_1();
    }
    float32 GetProgressRatio2() const
    {
        return this.GetProgressRatio_2();
    }
    float32 GetProgressRatio3() const
    {
        return this.GetProgressRatio_3();
    }
    float32 GetProgressRatio4() const
    {
        return this.GetProgressRatio_4();
    }
    float32 GetProgressRatio5() const
    {
        return this.GetProgressRatio_5();
    }
    void PostConstruct()
    {
        this.SetbSwitchAvatar(true);
        return;
    }
    void Tick()
    {
        int local_6;
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            return;
        }
        if (!(::UICommonUtil::IsValidPawnContext(this.GetContext().GetLocalPlayerPawn())))
        {
            return;
        }
        FNameHandle_EntityBBVar local_10;
        local_10;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_10))
        {
            FNameHandle_EntityBBVarInt local_14;
            local_14;
            this.SetiFoundationIndex(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_14));
        }
        else
        {
            this.SetiFoundationIndex(1);
        }
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        Get local_18;
        bool local_5 = local_18.opCall().HasAttribute(Attribute::CustomSkillEnergy);
        if (local_5)
        {
            float32 local_33 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            float32 local_31 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            float32 local_19 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax_2, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            float32 local_34 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy_2, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            local_10;
            if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_10))
            {
                FNameHandle_EntityBBVarBool local_40;
                local_40;
                this.SetUltraOn(this.GetContext().GetLocalPlayerPawn().GetBB_Bool(local_40));
            }
            else
            {
                this.SetUltraOn(false);
            }
            if (local_19 == 0.0f)
            {
                this.SetLineMarkProgressRatio(0.0f);
            }
            else
            {
                this.SetLineMarkProgressRatio(local_34 / local_19);
            }
            if (local_33 != 0.0f)
            {
                this.SetCustomSkillEnergyRatio(local_31 / local_33);
                this.SetProgressRatio_1((this.GetCustomSkillEnergyRatio() * 5.0f));
                float32 local_36 = this.GetCustomSkillEnergyRatio() * 5.0f;
                this.SetProgressRatio_2(local_36 - 1.0f);
                local_36 = this.GetCustomSkillEnergyRatio() * 5.0f;
                this.SetProgressRatio_3(local_36 - 2.0f);
                local_36 = this.GetCustomSkillEnergyRatio() * 5.0f;
                this.SetProgressRatio_4(local_36 - 3.0f);
                local_36 = this.GetCustomSkillEnergyRatio() * 5.0f;
                this.SetProgressRatio_5(local_36 - 4.0f);
                if (this.GetiFoundationIndex() == 1)
                {
                    this.SetbMarkA((this.GetProgressRatio_1() >= 1.0f));
                    this.SetbMarkB((this.GetProgressRatio_2() >= 1.0f));
                    this.SetbMarkC((this.GetProgressRatio_3() >= 1.0f));
                    this.SetbMarkD((this.GetProgressRatio_4() >= 1.0f));
                    this.SetbMarkE((this.GetProgressRatio_5() >= 1.0f));
                }
                else
                {
                    if (this.GetiFoundationIndex() == 2)
                    {
                        this.SetFullGridCount(0);
                        if (this.GetProgressRatio_1() >= 1.0f)
                        {
                            local_6 = this.GetFullGridCount();
                            local_6 = local_6 + 1;
                            this.SetFullGridCount(local_6);
                        }
                        if (this.GetProgressRatio_2() >= 1.0f)
                        {
                            local_6 = this.GetFullGridCount();
                            local_6 = local_6 + 1;
                            this.SetFullGridCount(local_6);
                        }
                        if (this.GetProgressRatio_3() >= 1.0f)
                        {
                            local_6 = this.GetFullGridCount();
                            local_6 = local_6 + 1;
                            this.SetFullGridCount(local_6);
                        }
                        if (this.GetProgressRatio_4() >= 1.0f)
                        {
                            local_6 = this.GetFullGridCount();
                            local_6 = local_6 + 1;
                            this.SetFullGridCount(local_6);
                        }
                        if (this.GetProgressRatio_5() >= 1.0f)
                        {
                            local_6 = this.GetFullGridCount();
                            local_6 = local_6 + 1;
                            this.SetFullGridCount(local_6);
                        }
                    }
                }
            }
        }
        local_10;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_10))
        {
            FNameHandle_EntityBBVarInt local_14;
            local_14;
            local_6 = this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_14);
        }
        else
        {
            local_6 = 0;
        }
        this.SetSpuerSwitch(local_6);
        this.SetSwitchAvatarTimer((this.GetSwitchAvatarTimer() + 1));
        if (this.GetSwitchAvatarTimer() >= 2)
        {
            this.SetbSwitchAvatar(false);
        }
        return;
    }
    int GetiFoundationIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_iFoundationIndex;
    }
    void SetiFoundationIndex(const int __Value) property
    {
        if (this.m_iFoundationIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_iFoundationIndex = __Value;
        return;
    }
    int GetFullGridCount() const property
    {
        this.TrackPropertyRead(1);
        return this.m_FullGridCount;
    }
    void SetFullGridCount(const int __Value) property
    {
        if (this.m_FullGridCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_FullGridCount = __Value;
        return;
    }
    const float32 GetProgressRatio_1() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_ProgressRatio_1() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetProgressRatio_1(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ProgressRatio_1 = __Value;
        return;
    }
    bool GetbMarkA() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bMarkA;
    }
    void SetbMarkA(const bool __Value) property
    {
        if (!(this.m_bMarkA) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bMarkA = __Value;
        return;
    }
    const float32 GetProgressRatio_2() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_ProgressRatio_2() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetProgressRatio_2(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ProgressRatio_2 = __Value;
        return;
    }
    bool GetbMarkB() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bMarkB;
    }
    void SetbMarkB(const bool __Value) property
    {
        if (!(this.m_bMarkB) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bMarkB = __Value;
        return;
    }
    const float32 GetProgressRatio_3() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_ProgressRatio_3() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetProgressRatio_3(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ProgressRatio_3 = __Value;
        return;
    }
    bool GetbMarkC() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bMarkC;
    }
    void SetbMarkC(const bool __Value) property
    {
        if (!(this.m_bMarkC) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bMarkC = __Value;
        return;
    }
    const float32 GetProgressRatio_4() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_ProgressRatio_4() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetProgressRatio_4(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_ProgressRatio_4 = __Value;
        return;
    }
    bool GetbMarkD() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bMarkD;
    }
    void SetbMarkD(const bool __Value) property
    {
        if (!(this.m_bMarkD) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bMarkD = __Value;
        return;
    }
    const float32 GetProgressRatio_5() const property
    {
        const float32 __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    float32 GetModify_ProgressRatio_5() property
    {
        float32 __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetProgressRatio_5(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_ProgressRatio_5 = __Value;
        return;
    }
    bool GetbMarkE() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bMarkE;
    }
    void SetbMarkE(const bool __Value) property
    {
        if (!(this.m_bMarkE) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bMarkE = __Value;
        return;
    }
    int GetSpuerSwitch() const property
    {
        this.TrackPropertyRead(12);
        return this.m_SpuerSwitch;
    }
    void SetSpuerSwitch(const int __Value) property
    {
        if (this.m_SpuerSwitch == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_SpuerSwitch = __Value;
        return;
    }
    bool GetUltraOn() const property
    {
        this.TrackPropertyRead(13);
        return this.m_UltraOn;
    }
    void SetUltraOn(const bool __Value) property
    {
        if (!(this.m_UltraOn) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_UltraOn = __Value;
        return;
    }
    const float32 GetLineMarkProgressRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    float32 GetModify_LineMarkProgressRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetLineMarkProgressRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_LineMarkProgressRatio = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetCustomSkillEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_CustomSkillEnergyRatio = __Value;
        return;
    }
    bool GetbSwitchAvatar() const property
    {
        this.TrackPropertyRead(16);
        return this.m_bSwitchAvatar;
    }
    void SetbSwitchAvatar(const bool __Value) property
    {
        if (!(this.m_bSwitchAvatar) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_bSwitchAvatar = __Value;
        return;
    }
    int GetSwitchAvatarTimer() const property
    {
        this.TrackPropertyRead(17);
        return this.m_SwitchAvatarTimer;
    }
    void SetSwitchAvatarTimer(const int __Value) property
    {
        if (this.m_SwitchAvatarTimer == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_SwitchAvatarTimer = __Value;
        return;
    }
}

struct FVM_WizardExclusiveSkill : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    float32 m_CastProgress;
    UPROPERTY()
    int m_ChargeLevel;
    UPROPERTY()
    int m_SuperSwitch;
    UPROPERTY()
    float32 m_CustomSkillEnergy;
    UPROPERTY()
    float32 m_CustomSkillEnergyMax;
    UPROPERTY()
    int m_MagicUseCount;
    UPROPERTY()
    FString m_MPInfo;
    UPROPERTY()
    float32 m_HealBank;
    UPROPERTY()
    int m_FoundationIndex;
    UPROPERTY()
    bool m_bHasFastChargeBuff;

    FVM_WizardExclusiveSkill()
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_CastProgress = 0.0f;
        this.m_ChargeLevel = 0;
        this.m_SuperSwitch = 0;
        this.m_CustomSkillEnergy = 0.0f;
        this.m_CustomSkillEnergyMax = 0.0f;
        this.m_MagicUseCount = 0;
        this.m_HealBank = 0.0f;
        this.m_FoundationIndex = 1;
        this.m_bHasFastChargeBuff = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_WizardExclusiveSkill(const FVM_WizardExclusiveSkill &inout Other)
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_CastProgress = 0.0f;
        this.m_ChargeLevel = 0;
        this.m_SuperSwitch = 0;
        this.m_CustomSkillEnergy = 0.0f;
        this.m_CustomSkillEnergyMax = 0.0f;
        this.m_MagicUseCount = 0;
        this.m_HealBank = 0.0f;
        this.m_FoundationIndex = 1;
        this.m_bHasFastChargeBuff = false;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CastProgress = Other.m_CastProgress;
        this.m_ChargeLevel = int(Other.m_ChargeLevel);
        this.m_SuperSwitch = int(Other.m_SuperSwitch);
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_MagicUseCount = int(Other.m_MagicUseCount);
        this.m_MPInfo = Other.m_MPInfo;
        this.m_HealBank = Other.m_HealBank;
        this.m_FoundationIndex = int(Other.m_FoundationIndex);
        this.m_bHasFastChargeBuff = Other.m_bHasFastChargeBuff;
        return;
    }
    FVM_WizardExclusiveSkill opAssign(const FVM_WizardExclusiveSkill &inout Other)
    {
        FVM_WizardExclusiveSkill __r;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CastProgress = Other.m_CastProgress;
        this.m_ChargeLevel = int(Other.m_ChargeLevel);
        this.m_SuperSwitch = int(Other.m_SuperSwitch);
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_MagicUseCount = int(Other.m_MagicUseCount);
        this.m_MPInfo = Other.m_MPInfo;
        this.m_HealBank = Other.m_HealBank;
        this.m_FoundationIndex = int(Other.m_FoundationIndex);
        this.m_bHasFastChargeBuff = Other.m_bHasFastChargeBuff;
        return __r;
    }
    float32 GetVMCustomSkillEnergyRatio() const
    {
        return this.GetCustomSkillEnergyRatio();
    }
    float32 GetVMCastProgress() const
    {
        return this.GetCastProgress();
    }
    FString GetVMMPInfo() const
    {
        return this.GetMPInfo();
    }
    float32 GetVMHealBankProgress() const
    {
        return this.GetHealBank();
    }
    ESlateVisibility GetVMHealBankProgressVisibility() const
    {
        int local_4;
        if (this.GetFoundationIndex() == 2)
        {
            local_4 = 0;
        }
        else
        {
            local_4 = 1;
        }
        return ESlateVisibility(local_4);
    }
    FLinearColor GetVMHealBankProgressColor() const
    {
        if (this.GetHealBank() >= 1.0f)
        {
            return FLinearColor(0.0f, 1.0f, 0.0f, 1.0f);
        }
        return FLinearColor(0.0f, 1.0f, 1.0f, 1.0f);
    }
    ESlateVisibility GetVMImageFastChargeVisibility() const
    {
        int local_2;
        if (this.GetbHasFastChargeBuff())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
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
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        Get local_10;
        bool local_5 = local_10.opCall().HasAttribute(Attribute::CustomSkillEnergy);
        if (local_5)
        {
            FGameAttributeModificationValue local_24;
            float32 local_13;
            float32 local_11;
            local_11 = this.GetCustomSkillEnergy();
            local_13 = this.GetCustomSkillEnergyMax();
            this.SetCustomSkillEnergyMax(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax, this.GetContext().Time, false, 0.0f, false, local_24));
            this.SetCustomSkillEnergy(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy, this.GetContext().Time, false, 0.0f, false, local_24));
            if (this.GetCustomSkillEnergyMax() != 0.0f)
            {
                this.SetCustomSkillEnergyRatio((this.GetCustomSkillEnergy() / this.GetCustomSkillEnergyMax()));
            }
            if (local_11 != this.GetCustomSkillEnergy() || (local_13 != this.GetCustomSkillEnergyMax()))
            {
                FString local_32 = "";
                float32 local_12_2 = this.GetCustomSkillEnergy();
                int local_27 = uint(local_12_2);
                FString local_32_2 = ((local_32 + local_27) + " / ");
                this.SetMPInfo((local_32_2 + uint(this.GetCustomSkillEnergyMax())));
            }
        }
        this.SetMagicUseCount(0);
        FNameHandle_EntityBBVar local_40;
        local_40;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_40))
        {
            FNameHandle_EntityBBVarInt local_44;
            local_44;
            this.SetMagicUseCount(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_44));
        }
        local_40;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_40))
        {
            FNameHandle_EntityBBVarInt local_44;
            local_44;
            this.SetFoundationIndex(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_44));
        }
        else
        {
            this.SetFoundationIndex(1);
        }
        this.SetHealBank(0.0f);
        local_40;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_40))
        {
            float32 local_13;
            float32 local_11;
            FNameHandle_EntityBBVarFloat local_48;
            bool local_25;
            local_48;
            float32 local_26 = this.GetContext().GetLocalPlayerPawn().GetBB_Float(local_48);
            FECSEntity local_4_2 = this.GetContext().GetLocalPlayerPawn();
            local_25 = local_10.opCall().HasAttribute(Attribute::HPMax);
            if (local_25)
            {
                local_13 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::HPMax, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
                if (local_13 > 0.0f)
                {
                    local_11 = local_13 * 2.0f;
                    float32 local_12_3 = local_26 / local_11;
                    this.SetHealBank(local_12_3);
                }
            }
        }
        this.SetbHasFastChargeBuff(false);
        FECSEntity local_4_3 = this.GetContext().GetLocalPlayerPawn();
        Get local_52;
        const FC_Buff& local_54 = local_52.opCall();
        if (local_54)
        {
            for (auto& local_68 : local_54.GetBuffData())
            {
                if ((local_68.ConfigRef.GetDataName() == n"PlayerWizard_FastCharge") || (local_68.ConfigRef.GetDataName() == n"PlayerWizard_FastCharge_lv1"))
                {
                    this.SetbHasFastChargeBuff(true);
                    break;
                }
            }
        }
        FECSEntity local_4_4 = this.GetContext().GetLocalPlayerPawn();
        Get local_74;
        const FC_GameAttribute& local_76 = local_74.opCall();
        if (local_76)
        {
            FGameAttributeModificationValue local_24;
            if (local_76.HasAttribute(Attribute::ChargeEnergyMax))
            {
                this.SetCastProgress(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::ChargeEnergy, this.GetContext().Time, false, 0.0f, false, local_24) / FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::ChargeEnergyMax, this.GetContext().Time, false, 0.0f, false, local_24));
            }
        }
        local_40;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_40))
        {
            FNameHandle_EntityBBVarInt local_44;
            local_44;
            this.SetChargeLevel(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_44));
        }
        else
        {
            this.SetChargeLevel(0);
        }
        local_40;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_40))
        {
            FNameHandle_EntityBBVarInt local_44;
            local_44;
            this.SetSuperSwitch(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_44));
            return;
        }
        this.SetSuperSwitch(0);
        return;
    }
    const float32 GetCustomSkillEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCustomSkillEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CustomSkillEnergyRatio = __Value;
        return;
    }
    const float32 GetCastProgress() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_CastProgress() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCastProgress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CastProgress = __Value;
        return;
    }
    int GetChargeLevel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ChargeLevel;
    }
    void SetChargeLevel(const int __Value) property
    {
        if (this.m_ChargeLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ChargeLevel = __Value;
        return;
    }
    int GetSuperSwitch() const property
    {
        this.TrackPropertyRead(3);
        return this.m_SuperSwitch;
    }
    void SetSuperSwitch(const int __Value) property
    {
        if (this.m_SuperSwitch == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SuperSwitch = __Value;
        return;
    }
    const float32 GetCustomSkillEnergy() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_CustomSkillEnergy() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCustomSkillEnergy(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CustomSkillEnergy = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyMax() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyMax() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCustomSkillEnergyMax(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CustomSkillEnergyMax = __Value;
        return;
    }
    int GetMagicUseCount() const property
    {
        this.TrackPropertyRead(6);
        return this.m_MagicUseCount;
    }
    void SetMagicUseCount(const int __Value) property
    {
        if (this.m_MagicUseCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_MagicUseCount = __Value;
        return;
    }
    const FString GetMPInfo() const property
    {
        const FString __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FString GetModify_MPInfo() property
    {
        FString __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetMPInfo(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_MPInfo = __Value;
        return;
    }
    const float32 GetHealBank() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_HealBank() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetHealBank(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_HealBank = __Value;
        return;
    }
    int GetFoundationIndex() const property
    {
        this.TrackPropertyRead(9);
        return this.m_FoundationIndex;
    }
    void SetFoundationIndex(const int __Value) property
    {
        if (this.m_FoundationIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_FoundationIndex = __Value;
        return;
    }
    bool GetbHasFastChargeBuff() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bHasFastChargeBuff;
    }
    void SetbHasFastChargeBuff(const bool __Value) property
    {
        if (!(this.m_bHasFastChargeBuff) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bHasFastChargeBuff = __Value;
        return;
    }
}

struct FVM_ShuijingExclusiveSkill : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    int m_ChargeState;
    UPROPERTY()
    FName m_IdentifyName_ShuiJing_PowerArrow;
    UPROPERTY()
    int m_Num_PowerArrow;
    UPROPERTY()
    bool m_ShowArrow;

    FVM_ShuijingExclusiveSkill()
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_ChargeState = 0;
        this.m_Num_PowerArrow = 0;
        this.m_ShowArrow = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ShuijingExclusiveSkill(const FVM_ShuijingExclusiveSkill &inout Other)
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_ChargeState = 0;
        this.m_Num_PowerArrow = 0;
        this.m_ShowArrow = false;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_ChargeState = int(Other.m_ChargeState);
        this.m_IdentifyName_ShuiJing_PowerArrow = Other.m_IdentifyName_ShuiJing_PowerArrow;
        this.m_Num_PowerArrow = int(Other.m_Num_PowerArrow);
        this.m_ShowArrow = Other.m_ShowArrow;
        return;
    }
    FVM_ShuijingExclusiveSkill opAssign(const FVM_ShuijingExclusiveSkill &inout Other)
    {
        FVM_ShuijingExclusiveSkill __r;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_ChargeState = int(Other.m_ChargeState);
        this.m_IdentifyName_ShuiJing_PowerArrow = Other.m_IdentifyName_ShuiJing_PowerArrow;
        this.m_Num_PowerArrow = int(Other.m_Num_PowerArrow);
        this.m_ShowArrow = Other.m_ShowArrow;
        return __r;
    }
    float32 GetVMCustomSkillEnergyRatio() const
    {
        return this.GetCustomSkillEnergyRatio();
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
    void PostConstruct()
    {
        UCombatGlobalSettings local_2 = ::UCombatGlobalSettings::Get();
        UClass local_4;
        this.SetIdentifyName_ShuiJing_PowerArrow(FName(local_4.GetPathName(nullptr)));
        return;
    }
    void Tick()
    {
        bool local_24;
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            return;
        }
        if (!(::UICommonUtil::IsValidPawnContext(this.GetContext().GetLocalPlayerPawn())))
        {
            return;
        }
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        Get local_10;
        bool local_5 = local_10.opCall().HasAttribute(Attribute::CustomSkillEnergy);
        if (local_5)
        {
            float32 local_25 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            float32 local_23 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            if (local_25 != 0.0f)
            {
                this.SetCustomSkillEnergyRatio(local_23 / local_25);
            }
        }
        FNameHandle_EntityBBVar local_32;
        local_32;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_32))
        {
            FNameHandle_EntityBBVarInt local_36;
            local_36;
            if (this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_36) > 0)
            {
                local_24 = true;
            }
            else
            {
                local_36;
                local_24 = (this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_36) > 2);
            }
            if (local_24)
            {
                this.SetChargeState(2);
            }
            else
            {
                local_36;
                if (this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_36) > 1)
                {
                    this.SetChargeState(1);
                }
                else
                {
                    this.SetChargeState(0);
                }
            }
        }
        FECSEntity local_4_2 = this.GetContext().GetLocalPlayerPawn();
        Get local_42;
        const FC_NumLimitManager& local_44 = local_42.opCall();
        if (local_44)
        {
            this.SetNum_PowerArrow(0);
            for (auto& local_58 : local_44.GetManagerItems())
            {
                if ((local_58.GetIdentifier() == this.GetIdentifyName_ShuiJing_PowerArrow()))
                {
                    this.SetNum_PowerArrow((this.GetNum_PowerArrow() + 1));
                }
            }
        }
        return;
    }
    void OnNumPowerArrowChanged()
    {
        if (this.GetNum_PowerArrow() > 0)
        {
            this.SetShowArrow(true);
            return;
        }
        this.SetShowArrow(false);
        return;
    }
    const float32 GetCustomSkillEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCustomSkillEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CustomSkillEnergyRatio = __Value;
        return;
    }
    int GetChargeState() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ChargeState;
    }
    void SetChargeState(const int __Value) property
    {
        if (this.m_ChargeState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ChargeState = __Value;
        return;
    }
    const FName GetIdentifyName_ShuiJing_PowerArrow() const property
    {
        const FName __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FName GetModify_IdentifyName_ShuiJing_PowerArrow() property
    {
        FName __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetIdentifyName_ShuiJing_PowerArrow(const FName &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_IdentifyName_ShuiJing_PowerArrow = __Value;
        return;
    }
    int GetNum_PowerArrow() const property
    {
        this.TrackPropertyRead(3);
        return this.m_Num_PowerArrow;
    }
    void SetNum_PowerArrow(const int __Value) property
    {
        if (this.m_Num_PowerArrow == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Num_PowerArrow = __Value;
        return;
    }
    bool GetShowArrow() const property
    {
        this.TrackPropertyRead(4);
        return this.m_ShowArrow;
    }
    void SetShowArrow(const bool __Value) property
    {
        if (!(this.m_ShowArrow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ShowArrow = __Value;
        return;
    }
}

struct FVM_QiongExclusiveSkill : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bBanProgress;
    UPROPERTY()
    int m_ChargeEnhanceCount;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    float32 m_CustomSkillEnergy_2;
    UPROPERTY()
    float32 m_CustomSkillEnergyMax_2;
    UPROPERTY()
    float32 m_ENERGY_2_INTERVAL;
    UPROPERTY()
    bool m_bOpenPanel1;
    UPROPERTY()
    FLinearColor m_BanColor;
    UPROPERTY()
    FLinearColor m_RightFullColor;
    UPROPERTY()
    FLinearColor m_RightEmptyColor;
    UPROPERTY()
    FLinearColor m_LeftFullColor;
    UPROPERTY()
    FLinearColor m_LeftEmptyColor;

    FVM_QiongExclusiveSkill()
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_CustomSkillEnergy_2 = 0.0f;
        this.m_CustomSkillEnergyMax_2 = 0.0f;
        this.m_bBanProgress = false;
        this.m_ChargeEnhanceCount = 0;
        this.m_ENERGY_2_INTERVAL = 50.0f;
        this.m_bOpenPanel1 = false;
        this.m_BanColor = FLinearColor(0.57f, 0.57f, 0.57f, 1.0f);
        this.m_RightFullColor = FLinearColor(1.0f, 0.0f, 0.0f, 1.0f);
        this.m_RightEmptyColor = FLinearColor(1.0f, 0.63f, 0.63f, 1.0f);
        this.m_LeftFullColor = FLinearColor(0.5f, 0.0f, 0.0f, 1.0f);
        this.m_LeftEmptyColor = FLinearColor(0.25f, 0.15f, 0.15f, 1.0f);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_QiongExclusiveSkill(const FVM_QiongExclusiveSkill &inout Other)
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_CustomSkillEnergy_2 = 0.0f;
        this.m_CustomSkillEnergyMax_2 = 0.0f;
        this.m_bBanProgress = false;
        this.m_ChargeEnhanceCount = 0;
        this.m_ENERGY_2_INTERVAL = 50.0f;
        this.m_bOpenPanel1 = false;
        this.m_BanColor = FLinearColor(0.57f, 0.57f, 0.57f, 1.0f);
        this.m_RightFullColor = FLinearColor(1.0f, 0.0f, 0.0f, 1.0f);
        this.m_RightEmptyColor = FLinearColor(1.0f, 0.63f, 0.63f, 1.0f);
        this.m_LeftFullColor = FLinearColor(0.5f, 0.0f, 0.0f, 1.0f);
        this.m_LeftEmptyColor = FLinearColor(0.25f, 0.15f, 0.15f, 1.0f);
        this.m_bBanProgress = Other.m_bBanProgress;
        this.m_ChargeEnhanceCount = int(Other.m_ChargeEnhanceCount);
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CustomSkillEnergy_2 = Other.m_CustomSkillEnergy_2;
        this.m_CustomSkillEnergyMax_2 = Other.m_CustomSkillEnergyMax_2;
        this.m_ENERGY_2_INTERVAL = Other.m_ENERGY_2_INTERVAL;
        this.m_bOpenPanel1 = Other.m_bOpenPanel1;
        this.m_BanColor = Other.m_BanColor;
        this.m_RightFullColor = Other.m_RightFullColor;
        this.m_RightEmptyColor = Other.m_RightEmptyColor;
        this.m_LeftFullColor = Other.m_LeftFullColor;
        this.m_LeftEmptyColor = Other.m_LeftEmptyColor;
        return;
    }
    FVM_QiongExclusiveSkill& opAssign(const FVM_QiongExclusiveSkill &inout Other)
    {
        this.m_bBanProgress = Other.m_bBanProgress;
        this.m_ChargeEnhanceCount = int(Other.m_ChargeEnhanceCount);
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CustomSkillEnergy_2 = Other.m_CustomSkillEnergy_2;
        this.m_CustomSkillEnergyMax_2 = Other.m_CustomSkillEnergyMax_2;
        this.m_ENERGY_2_INTERVAL = Other.m_ENERGY_2_INTERVAL;
        this.m_bOpenPanel1 = Other.m_bOpenPanel1;
        this.m_BanColor = Other.m_BanColor;
        this.m_RightFullColor = Other.m_RightFullColor;
        this.m_RightEmptyColor = Other.m_RightEmptyColor;
        this.m_LeftFullColor = Other.m_LeftFullColor;
        return Other.m_LeftEmptyColor;
    }
    ESlateVisibility GetCustomSkillEnergyVisibility() const
    {
        int local_12;
        FNameHandle_EntityBBVar local_10;
        local_10;
        if (!(this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_10)))
        {
            local_12 = 0;
        }
        else
        {
            local_12 = 1;
        }
        return ESlateVisibility(local_12);
    }
    ESlateVisibility GetPanel1Visibilty() const
    {
        int local_2;
        if (this.GetbOpenPanel1())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetPanel2Visibilty() const
    {
        int local_2;
        if (this.GetbOpenPanel1())
        {
            local_2 = 1;
        }
        else
        {
            local_2 = 0;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetPanel2FifthProgressVisibilty() const
    {
        int local_4;
        if (this.GetCustomSkillEnergyMax_2() > 200.0f)
        {
            local_4 = 0;
        }
        else
        {
            local_4 = 1;
        }
        return ESlateVisibility(local_4);
    }
    float32 GetVMCustomSkillEnergyRatio() const
    {
        if (this.GetbBanProgress())
        {
            return 1.0f;
        }
        return this.GetCustomSkillEnergyRatio();
    }
    float32 GetRight1Ratio() const
    {
        float32 local_4;
        if (this.GetbBanProgress())
        {
            return 1.0f;
        }
        if (this.GetCustomSkillEnergy_2() <= 0.0f)
        {
            return 0.0f;
        }
        if (this.GetCustomSkillEnergy_2() >= this.GetENERGY_2_INTERVAL())
        {
            local_4 = 1.0f;
        }
        else
        {
            local_4 = this.GetCustomSkillEnergy_2() / this.GetENERGY_2_INTERVAL();
        }
        return local_4;
    }
    float32 GetRight2Ratio() const
    {
        if (this.GetbBanProgress())
        {
            return 1.0f;
        }
        if (this.GetCustomSkillEnergy_2() <= 0.0f)
        {
            return 0.0f;
        }
        if (this.GetCustomSkillEnergy_2() >= (this.GetENERGY_2_INTERVAL() * 2.0f))
        {
            return 1.0f;
        }
        if (this.GetCustomSkillEnergy_2() <= this.GetENERGY_2_INTERVAL())
        {
            return 0.0f;
        }
        return (this.GetCustomSkillEnergy_2() - this.GetENERGY_2_INTERVAL()) / this.GetENERGY_2_INTERVAL();
    }
    float32 GetRight3Ratio() const
    {
        if (this.GetbBanProgress())
        {
            return 1.0f;
        }
        if (this.GetCustomSkillEnergy_2() <= 0.0f)
        {
            return 0.0f;
        }
        if (this.GetCustomSkillEnergy_2() >= (this.GetENERGY_2_INTERVAL() * 3.0f))
        {
            return 1.0f;
        }
        if (this.GetCustomSkillEnergy_2() <= (this.GetENERGY_2_INTERVAL() * 2.0f))
        {
            return 0.0f;
        }
        return (this.GetCustomSkillEnergy_2() - (this.GetENERGY_2_INTERVAL() * 2.0f)) / this.GetENERGY_2_INTERVAL();
    }
    float32 GetRight4Ratio() const
    {
        if (this.GetbBanProgress())
        {
            return 1.0f;
        }
        if (this.GetCustomSkillEnergy_2() <= 0.0f)
        {
            return 0.0f;
        }
        if (this.GetCustomSkillEnergy_2() >= (this.GetENERGY_2_INTERVAL() * 4.0f))
        {
            return 1.0f;
        }
        if (this.GetCustomSkillEnergy_2() <= (this.GetENERGY_2_INTERVAL() * 3.0f))
        {
            return 0.0f;
        }
        return (this.GetCustomSkillEnergy_2() - (this.GetENERGY_2_INTERVAL() * 3.0f)) / this.GetENERGY_2_INTERVAL();
    }
    float32 GetRight5Ratio() const
    {
        if (this.GetbBanProgress())
        {
            return 1.0f;
        }
        if (this.GetCustomSkillEnergy_2() <= 0.0f)
        {
            return 0.0f;
        }
        if (this.GetCustomSkillEnergy_2() >= (this.GetENERGY_2_INTERVAL() * 5.0f))
        {
            return 1.0f;
        }
        if (this.GetCustomSkillEnergy_2() <= (this.GetENERGY_2_INTERVAL() * 4.0f))
        {
            return 0.0f;
        }
        return (this.GetCustomSkillEnergy_2() - (this.GetENERGY_2_INTERVAL() * 4.0f)) / this.GetENERGY_2_INTERVAL();
    }
    float32 GetLeft1Ratio() const
    {
        float32 local_5;
        if (this.GetbBanProgress())
        {
            return 1.0f;
        }
        if (this.GetCustomSkillEnergy_2() >= 0.0f)
        {
            return 0.0f;
        }
        float32 local_3 = FMath::Abs(this.GetCustomSkillEnergy_2());
        if (local_3 >= this.GetENERGY_2_INTERVAL())
        {
            local_5 = 1.0f;
        }
        else
        {
            local_5 = local_3 / this.GetENERGY_2_INTERVAL();
        }
        return local_5;
    }
    float32 GetLeft2Ratio() const
    {
        if (this.GetbBanProgress())
        {
            return 1.0f;
        }
        if (this.GetCustomSkillEnergy_2() >= 0.0f)
        {
            return 0.0f;
        }
        float32 local_3 = FMath::Abs(this.GetCustomSkillEnergy_2());
        if (local_3 >= (this.GetENERGY_2_INTERVAL() * 2.0f))
        {
            return 1.0f;
        }
        if (local_3 <= this.GetENERGY_2_INTERVAL())
        {
            return 0.0f;
        }
        return (local_3 - this.GetENERGY_2_INTERVAL()) / this.GetENERGY_2_INTERVAL();
    }
    FLinearColor GetCenterProgressColor() const
    {
        if (this.GetbBanProgress())
        {
            return this.GetBanColor();
        }
        if (this.GetCustomSkillEnergyRatio() == 1.0f)
        {
            return FLinearColor(1.0f, 0.0f, 0.0f, 1.0f);
        }
        return FLinearColor(1.0f, 0.56f, 0.56f, 1.0f);
    }
    FLinearColor GetProgressBgColor() const
    {
        if (this.GetChargeEnhanceCount() <= 0)
        {
            return FLinearColor(1.0f, 1.0f, 1.0f, 0.0f);
        }
        else
        {
            if (this.GetChargeEnhanceCount() == 1)
            {
                return FLinearColor(0.98f, 1.0f, 0.0f, 1.0f);
            }
            else
            {
                return FLinearColor(1.0f, 0.0f, 0.0f, 1.0f);
            }
        }
    }
    FLinearColor GetLeft1ProgressColor() const
    {
        if (this.GetbBanProgress())
        {
            return this.GetBanColor();
        }
        if (this.GetLeft1Ratio() == 1.0f)
        {
            return this.GetLeftFullColor();
        }
        return this.GetLeftEmptyColor();
    }
    FLinearColor GetLeft2ProgressColor() const
    {
        if (this.GetbBanProgress())
        {
            return this.GetBanColor();
        }
        if (this.GetLeft2Ratio() == 1.0f)
        {
            return this.GetLeftFullColor();
        }
        return this.GetLeftEmptyColor();
    }
    FLinearColor GetRight1ProgressColor() const
    {
        if (this.GetbBanProgress())
        {
            return this.GetBanColor();
        }
        if (this.GetRight1Ratio() == 1.0f)
        {
            return this.GetRightFullColor();
        }
        return this.GetRightEmptyColor();
    }
    FLinearColor GetRight2ProgressColor() const
    {
        if (this.GetbBanProgress())
        {
            return this.GetBanColor();
        }
        if (this.GetRight2Ratio() == 1.0f)
        {
            return this.GetRightFullColor();
        }
        return this.GetRightEmptyColor();
    }
    FLinearColor GetRight3ProgressColor() const
    {
        if (this.GetbBanProgress())
        {
            return this.GetBanColor();
        }
        if (this.GetRight3Ratio() == 1.0f)
        {
            return this.GetRightFullColor();
        }
        return this.GetRightEmptyColor();
    }
    FLinearColor GetRight4ProgressColor() const
    {
        if (this.GetbBanProgress())
        {
            return this.GetBanColor();
        }
        if (this.GetRight4Ratio() == 1.0f)
        {
            return this.GetRightFullColor();
        }
        return this.GetRightEmptyColor();
    }
    FLinearColor GetRight5ProgressColor() const
    {
        if (this.GetbBanProgress())
        {
            return this.GetBanColor();
        }
        if (this.GetRight5Ratio() == 1.0f)
        {
            return this.GetRightFullColor();
        }
        return this.GetRightEmptyColor();
    }
    void Tick()
    {
        FGameAttributeModificationValue local_30;
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            return;
        }
        if (!(::UICommonUtil::IsValidPawnContext(this.GetContext().GetLocalPlayerPawn())))
        {
            return;
        }
        this.SetbOpenPanel1(::BlueprintFunctions_Common::HasCapabilityByName(FECSEntityAdapter(this.GetContext().GetLocalPlayerPawn()), n"F1T4C2_CoreEnergyType"));
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        Get local_16;
        const FC_GameAttributeView& local_18 = local_16.opCall();
        if (local_18)
        {
            FNameHandle_EntityBBVar local_42;
            if (local_18.HasAttribute(Attribute::CustomSkillEnergy))
            {
                float32 local_37 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax, this.GetContext().Time, false, 0.0f, false, local_30);
                float32 local_31 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy, this.GetContext().Time, false, 0.0f, false, local_30);
                if (local_37 != 0.0f)
                {
                    this.SetCustomSkillEnergyRatio(local_31 / local_37);
                }
            }
            if (local_18.HasAttribute(Attribute::CustomSkillEnergy_2))
            {
                this.SetCustomSkillEnergy_2(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy_2, this.GetContext().Time, false, 0.0f, false, local_30));
                this.SetCustomSkillEnergyMax_2(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax_2, this.GetContext().Time, false, 0.0f, false, local_30));
            }
            local_42;
            if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_42))
            {
                FNameHandle_EntityBBVarBool local_46;
                local_46;
                this.SetbBanProgress(this.GetContext().GetLocalPlayerPawn().GetBB_Bool(local_46));
            }
            local_42;
            if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_42))
            {
                FNameHandle_EntityBBVarInt local_50;
                local_50;
                this.SetChargeEnhanceCount(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_50));
            }
        }
        return;
    }
    bool GetbBanProgress() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bBanProgress;
    }
    void SetbBanProgress(const bool __Value) property
    {
        if (!(this.m_bBanProgress) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bBanProgress = __Value;
        return;
    }
    int GetChargeEnhanceCount() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ChargeEnhanceCount;
    }
    void SetChargeEnhanceCount(const int __Value) property
    {
        if (this.m_ChargeEnhanceCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ChargeEnhanceCount = __Value;
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
    const float32 GetCustomSkillEnergy_2() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_CustomSkillEnergy_2() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCustomSkillEnergy_2(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CustomSkillEnergy_2 = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyMax_2() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyMax_2() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCustomSkillEnergyMax_2(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CustomSkillEnergyMax_2 = __Value;
        return;
    }
    const float32 GetENERGY_2_INTERVAL() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_ENERGY_2_INTERVAL() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetENERGY_2_INTERVAL(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ENERGY_2_INTERVAL = __Value;
        return;
    }
    bool GetbOpenPanel1() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bOpenPanel1;
    }
    void SetbOpenPanel1(const bool __Value) property
    {
        if (!(this.m_bOpenPanel1) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bOpenPanel1 = __Value;
        return;
    }
    const FLinearColor GetBanColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FLinearColor GetModify_BanColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetBanColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_BanColor = __Value;
        return;
    }
    const FLinearColor GetRightFullColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FLinearColor GetModify_RightFullColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetRightFullColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_RightFullColor = __Value;
        return;
    }
    const FLinearColor GetRightEmptyColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FLinearColor GetModify_RightEmptyColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetRightEmptyColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_RightEmptyColor = __Value;
        return;
    }
    const FLinearColor GetLeftFullColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FLinearColor GetModify_LeftFullColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetLeftFullColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_LeftFullColor = __Value;
        return;
    }
    const FLinearColor GetLeftEmptyColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FLinearColor GetModify_LeftEmptyColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetLeftEmptyColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_LeftEmptyColor = __Value;
        return;
    }
}

struct FVM_FakeCharacterProgress : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_FakeCharacterEnergyRatio;

    FVM_FakeCharacterProgress()
    {
        this.m_FakeCharacterEnergyRatio = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_FakeCharacterProgress(const FVM_FakeCharacterProgress &inout Other)
    {
        this.m_FakeCharacterEnergyRatio = 0.0f;
        this.m_FakeCharacterEnergyRatio = Other.m_FakeCharacterEnergyRatio;
        return;
    }
    FVM_FakeCharacterProgress opAssign(const FVM_FakeCharacterProgress &inout Other)
    {
        FVM_FakeCharacterProgress __r;
        this.m_FakeCharacterEnergyRatio = Other.m_FakeCharacterEnergyRatio;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    float32 GetFakeCharacterEnergyProgress() const
    {
        return this.GetFakeCharacterEnergyRatio();
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
        FNameHandle_EntityBBVar local_10;
        local_10;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_10))
        {
            FNameHandle_EntityBBVarFloat local_16;
            local_16;
            float32 local_17 = this.GetContext().GetLocalPlayerPawn().GetBB_Float(local_16);
            local_16;
            float32 local_11 = this.GetContext().GetLocalPlayerPawn().GetBB_Float(local_16);
            if (local_17 != 0.0f)
            {
                this.SetFakeCharacterEnergyRatio(local_11 / local_17);
            }
        }
        return;
    }
    const float32 GetFakeCharacterEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_FakeCharacterEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetFakeCharacterEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_FakeCharacterEnergyRatio = __Value;
        return;
    }
}

class USwordExclusiveSkillModelAdapter : UExclusiveSkillModelAdapterBase
{
    USwordExclusiveSkillModelAdapter()
    {
        super();
        return;
    }
    FEUIModelRef MakeViewModels(const FEUIModelContext &inout Context) const
    {
        return FEUIModelRef();
    }
}

class UWizardExclusiveSkillModelAdapter : UExclusiveSkillModelAdapterBase
{
    UWizardExclusiveSkillModelAdapter()
    {
        super();
        return;
    }
    FEUIModelRef MakeViewModels(const FEUIModelContext &inout Context) const
    {
        return FEUIModelRef();
    }
}

class UGramherExclusiveSkillModelAdapter : UExclusiveSkillModelAdapterBase
{
    UGramherExclusiveSkillModelAdapter()
    {
        super();
        return;
    }
    FEUIModelRef MakeViewModels(const FEUIModelContext &inout Context) const
    {
        return FEUIModelRef();
    }
}

class UShuijingExclusiveSkillModelAdapter : UExclusiveSkillModelAdapterBase
{
    UShuijingExclusiveSkillModelAdapter()
    {
        super();
        return;
    }
    FEUIModelRef MakeViewModels(const FEUIModelContext &inout Context) const
    {
        return FEUIModelRef();
    }
}

class UQiongExclusiveSkillModelAdapter : UExclusiveSkillModelAdapterBase
{
    UQiongExclusiveSkillModelAdapter()
    {
        super();
        return;
    }
    FEUIModelRef MakeViewModels(const FEUIModelContext &inout Context) const
    {
        return FEUIModelRef();
    }
}

struct __GeneratedProperties_FVM_GramherExclusiveSkill
{
    UPROPERTY()
    ESlateVisibility ShowF2Progress;
    UPROPERTY()
    float32 F2ProgressPercent;
    UPROPERTY()
    FLinearColor F2ProgressColor;
    UPROPERTY()
    TEUIModelRef<FVM_GramherExclusiveSkill> Self;


}

struct __GeneratedProperties_FVM_SwordExclusiveSkill
{
    UPROPERTY()
    float32 ProgressRatio1;
    UPROPERTY()
    float32 ProgressRatio2;
    UPROPERTY()
    float32 ProgressRatio3;
    UPROPERTY()
    float32 ProgressRatio4;
    UPROPERTY()
    float32 ProgressRatio5;
    UPROPERTY()
    TEUIModelRef<FVM_SwordExclusiveSkill> Self;


}

struct __GeneratedProperties_FVM_WizardExclusiveSkill
{
    UPROPERTY()
    float32 VMCustomSkillEnergyRatio;
    UPROPERTY()
    float32 VMCastProgress;
    UPROPERTY()
    FString VMMPInfo;
    UPROPERTY()
    float32 VMHealBankProgress;
    UPROPERTY()
    ESlateVisibility VMHealBankProgressVisibility;
    UPROPERTY()
    FLinearColor VMHealBankProgressColor;
    UPROPERTY()
    ESlateVisibility VMImageFastChargeVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_WizardExclusiveSkill> Self;


}

struct __GeneratedProperties_FVM_ShuijingExclusiveSkill
{
    UPROPERTY()
    float32 VMCustomSkillEnergyRatio;
    UPROPERTY()
    ESlateVisibility VMShowArrow;
    UPROPERTY()
    TEUIModelRef<FVM_ShuijingExclusiveSkill> Self;


}

struct __GeneratedProperties_FVM_QiongExclusiveSkill
{
    UPROPERTY()
    ESlateVisibility CustomSkillEnergyVisibility;
    UPROPERTY()
    ESlateVisibility Panel1Visibilty;
    UPROPERTY()
    ESlateVisibility Panel2Visibilty;
    UPROPERTY()
    ESlateVisibility Panel2FifthProgressVisibilty;
    UPROPERTY()
    float32 VMCustomSkillEnergyRatio;
    UPROPERTY()
    float32 Right1Ratio;
    UPROPERTY()
    float32 Right2Ratio;
    UPROPERTY()
    float32 Right3Ratio;
    UPROPERTY()
    float32 Right4Ratio;
    UPROPERTY()
    float32 Right5Ratio;
    UPROPERTY()
    float32 Left1Ratio;
    UPROPERTY()
    float32 Left2Ratio;
    UPROPERTY()
    FLinearColor CenterProgressColor;
    UPROPERTY()
    FLinearColor ProgressBgColor;
    UPROPERTY()
    FLinearColor Left1ProgressColor;
    UPROPERTY()
    FLinearColor Left2ProgressColor;
    UPROPERTY()
    FLinearColor Right1ProgressColor;
    UPROPERTY()
    FLinearColor Right2ProgressColor;
    UPROPERTY()
    FLinearColor Right3ProgressColor;
    UPROPERTY()
    FLinearColor Right4ProgressColor;
    UPROPERTY()
    FLinearColor Right5ProgressColor;
    UPROPERTY()
    TEUIModelRef<FVM_QiongExclusiveSkill> Self;


}

struct __GeneratedProperties_FVM_FakeCharacterProgress
{
    UPROPERTY()
    float32 FakeCharacterEnergyProgress;
    UPROPERTY()
    TEUIModelRef<FVM_FakeCharacterProgress> Self;


}

namespace FVM_GramherExclusiveSkill
{
FVM_GramherExclusiveSkill& Create(const UObject ContextObject)
{
    return FVM_GramherExclusiveSkill::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_GramherExclusiveSkill CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_GramherExclusiveSkill __r;
    TEUIModelRef<FVM_GramherExclusiveSkill> local_6 = TEUIModelRef<FVM_GramherExclusiveSkill>(EUIInternal::MakeModelWithManager(Manager, FVM_GramherExclusiveSkill::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ShowF2Progress";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "F2ProgressPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "F2ProgressColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_GramherExclusiveSkill>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_GramherExclusiveSkill;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_GramherExclusiveSkill;
}
void __Tick(FVM_GramherExclusiveSkill &inout Model)
{
    Model.Tick();
    return;
}
ESlateVisibility __UIGetter_ShowF2Progress(const FVM_GramherExclusiveSkill &inout Model)
{
    return Model.GetShowF2Progress();
}
float32 __UIGetter_F2ProgressPercent(const FVM_GramherExclusiveSkill &inout Model)
{
    return Model.GetF2ProgressPercent();
}
FLinearColor __UIGetter_F2ProgressColor(const FVM_GramherExclusiveSkill &inout Model)
{
    return Model.GetF2ProgressColor();
}
TEUIModelRef<FVM_GramherExclusiveSkill> __UIGetter_Self(const FVM_GramherExclusiveSkill &inout Model)
{
    return TEUIModelRef<FVM_GramherExclusiveSkill>(Model);
}
int __IndexOf_FoundationIndex()
{
    return 0;
}
int __IndexOf_CurCustomSkillEnergy2()
{
    return 1;
}
int __IndexOf_MaxCustomSkillEnergy2()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_GramherExclusiveSkill
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_SwordExclusiveSkill
{
FVM_SwordExclusiveSkill& Create(const UObject ContextObject)
{
    return FVM_SwordExclusiveSkill::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SwordExclusiveSkill CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SwordExclusiveSkill __r;
    TEUIModelRef<FVM_SwordExclusiveSkill> local_6 = TEUIModelRef<FVM_SwordExclusiveSkill>(EUIInternal::MakeModelWithManager(Manager, FVM_SwordExclusiveSkill::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ProgressRatio1";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ProgressRatio2";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ProgressRatio3";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ProgressRatio4";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ProgressRatio5";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SwordExclusiveSkill>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SwordExclusiveSkill;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SwordExclusiveSkill;
}
void __Tick(FVM_SwordExclusiveSkill &inout Model)
{
    Model.Tick();
    return;
}
float32 __UIGetter_ProgressRatio1(const FVM_SwordExclusiveSkill &inout Model)
{
    return Model.GetProgressRatio1();
}
float32 __UIGetter_ProgressRatio2(const FVM_SwordExclusiveSkill &inout Model)
{
    return Model.GetProgressRatio2();
}
float32 __UIGetter_ProgressRatio3(const FVM_SwordExclusiveSkill &inout Model)
{
    return Model.GetProgressRatio3();
}
float32 __UIGetter_ProgressRatio4(const FVM_SwordExclusiveSkill &inout Model)
{
    return Model.GetProgressRatio4();
}
float32 __UIGetter_ProgressRatio5(const FVM_SwordExclusiveSkill &inout Model)
{
    return Model.GetProgressRatio5();
}
TEUIModelRef<FVM_SwordExclusiveSkill> __UIGetter_Self(const FVM_SwordExclusiveSkill &inout Model)
{
    return TEUIModelRef<FVM_SwordExclusiveSkill>(Model);
}
int __IndexOf_iFoundationIndex()
{
    return 0;
}
int __IndexOf_FullGridCount()
{
    return 1;
}
int __IndexOf_ProgressRatio_1()
{
    return 2;
}
int __IndexOf_bMarkA()
{
    return 3;
}
int __IndexOf_ProgressRatio_2()
{
    return 4;
}
int __IndexOf_bMarkB()
{
    return 5;
}
int __IndexOf_ProgressRatio_3()
{
    return 6;
}
int __IndexOf_bMarkC()
{
    return 7;
}
int __IndexOf_ProgressRatio_4()
{
    return 8;
}
int __IndexOf_bMarkD()
{
    return 9;
}
int __IndexOf_ProgressRatio_5()
{
    return 10;
}
int __IndexOf_bMarkE()
{
    return 11;
}
int __IndexOf_SpuerSwitch()
{
    return 12;
}
int __IndexOf_UltraOn()
{
    return 13;
}
int __IndexOf_LineMarkProgressRatio()
{
    return 14;
}
int __IndexOf_CustomSkillEnergyRatio()
{
    return 15;
}
int __IndexOf_bSwitchAvatar()
{
    return 16;
}
int __IndexOf_SwitchAvatarTimer()
{
    return 17;
}
}
namespace __GeneratedProperties_FVM_SwordExclusiveSkill
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_WizardExclusiveSkill
{
FVM_WizardExclusiveSkill& Create(const UObject ContextObject)
{
    return FVM_WizardExclusiveSkill::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_WizardExclusiveSkill CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_WizardExclusiveSkill __r;
    TEUIModelRef<FVM_WizardExclusiveSkill> local_6 = TEUIModelRef<FVM_WizardExclusiveSkill>(EUIInternal::MakeModelWithManager(Manager, FVM_WizardExclusiveSkill::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "VMCustomSkillEnergyRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VMCastProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VMMPInfo";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VMHealBankProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VMHealBankProgressVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VMHealBankProgressColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VMImageFastChargeVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_WizardExclusiveSkill>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_WizardExclusiveSkill;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_WizardExclusiveSkill;
}
void __Tick(FVM_WizardExclusiveSkill &inout Model)
{
    Model.Tick();
    return;
}
float32 __UIGetter_VMCustomSkillEnergyRatio(const FVM_WizardExclusiveSkill &inout Model)
{
    return Model.GetVMCustomSkillEnergyRatio();
}
float32 __UIGetter_VMCastProgress(const FVM_WizardExclusiveSkill &inout Model)
{
    return Model.GetVMCastProgress();
}
FString __UIGetter_VMMPInfo(const FVM_WizardExclusiveSkill &inout Model)
{
    return Model.GetVMMPInfo();
}
float32 __UIGetter_VMHealBankProgress(const FVM_WizardExclusiveSkill &inout Model)
{
    return Model.GetVMHealBankProgress();
}
ESlateVisibility __UIGetter_VMHealBankProgressVisibility(const FVM_WizardExclusiveSkill &inout Model)
{
    return Model.GetVMHealBankProgressVisibility();
}
FLinearColor __UIGetter_VMHealBankProgressColor(const FVM_WizardExclusiveSkill &inout Model)
{
    return Model.GetVMHealBankProgressColor();
}
ESlateVisibility __UIGetter_VMImageFastChargeVisibility(const FVM_WizardExclusiveSkill &inout Model)
{
    return Model.GetVMImageFastChargeVisibility();
}
TEUIModelRef<FVM_WizardExclusiveSkill> __UIGetter_Self(const FVM_WizardExclusiveSkill &inout Model)
{
    return TEUIModelRef<FVM_WizardExclusiveSkill>(Model);
}
int __IndexOf_CustomSkillEnergyRatio()
{
    return 0;
}
int __IndexOf_CastProgress()
{
    return 1;
}
int __IndexOf_ChargeLevel()
{
    return 2;
}
int __IndexOf_SuperSwitch()
{
    return 3;
}
int __IndexOf_CustomSkillEnergy()
{
    return 4;
}
int __IndexOf_CustomSkillEnergyMax()
{
    return 5;
}
int __IndexOf_MagicUseCount()
{
    return 6;
}
int __IndexOf_MPInfo()
{
    return 7;
}
int __IndexOf_HealBank()
{
    return 8;
}
int __IndexOf_FoundationIndex()
{
    return 9;
}
int __IndexOf_bHasFastChargeBuff()
{
    return 10;
}
}
namespace __GeneratedProperties_FVM_WizardExclusiveSkill
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_ShuijingExclusiveSkill
{
FVM_ShuijingExclusiveSkill& Create(const UObject ContextObject)
{
    return FVM_ShuijingExclusiveSkill::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ShuijingExclusiveSkill CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ShuijingExclusiveSkill __r;
    TEUIModelRef<FVM_ShuijingExclusiveSkill> local_6 = TEUIModelRef<FVM_ShuijingExclusiveSkill>(EUIInternal::MakeModelWithManager(Manager, FVM_ShuijingExclusiveSkill::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "VMCustomSkillEnergyRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VMShowArrow";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ShuijingExclusiveSkill>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ShuijingExclusiveSkill;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnNumPowerArrowChanged";
    local_24.DirtyFlags.Set(FVM_ShuijingExclusiveSkill::__IndexOf_Num_PowerArrow());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ShuijingExclusiveSkill;
}
void __Tick(FVM_ShuijingExclusiveSkill &inout Model)
{
    Model.Tick();
    return;
}
void __OnNumPowerArrowChanged(FVM_ShuijingExclusiveSkill &inout Model)
{
    Model.OnNumPowerArrowChanged();
    return;
}
float32 __UIGetter_VMCustomSkillEnergyRatio(const FVM_ShuijingExclusiveSkill &inout Model)
{
    return Model.GetVMCustomSkillEnergyRatio();
}
ESlateVisibility __UIGetter_VMShowArrow(const FVM_ShuijingExclusiveSkill &inout Model)
{
    return Model.GetVMShowArrow();
}
TEUIModelRef<FVM_ShuijingExclusiveSkill> __UIGetter_Self(const FVM_ShuijingExclusiveSkill &inout Model)
{
    return TEUIModelRef<FVM_ShuijingExclusiveSkill>(Model);
}
int __IndexOf_CustomSkillEnergyRatio()
{
    return 0;
}
int __IndexOf_ChargeState()
{
    return 1;
}
int __IndexOf_IdentifyName_ShuiJing_PowerArrow()
{
    return 2;
}
int __IndexOf_Num_PowerArrow()
{
    return 3;
}
int __IndexOf_ShowArrow()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_ShuijingExclusiveSkill
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_QiongExclusiveSkill
{
FVM_QiongExclusiveSkill& Create(const UObject ContextObject)
{
    return FVM_QiongExclusiveSkill::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_QiongExclusiveSkill CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_QiongExclusiveSkill __r;
    TEUIModelRef<FVM_QiongExclusiveSkill> local_6 = TEUIModelRef<FVM_QiongExclusiveSkill>(EUIInternal::MakeModelWithManager(Manager, FVM_QiongExclusiveSkill::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CustomSkillEnergyVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Panel1Visibilty";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Panel2Visibilty";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Panel2FifthProgressVisibilty";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VMCustomSkillEnergyRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right1Ratio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right2Ratio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right3Ratio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right4Ratio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right5Ratio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Left1Ratio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Left2Ratio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CenterProgressColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ProgressBgColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Left1ProgressColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Left2ProgressColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right1ProgressColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right2ProgressColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right3ProgressColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right4ProgressColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right5ProgressColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_QiongExclusiveSkill>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_QiongExclusiveSkill;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_QiongExclusiveSkill;
}
void __Tick(FVM_QiongExclusiveSkill &inout Model)
{
    Model.Tick();
    return;
}
ESlateVisibility __UIGetter_CustomSkillEnergyVisibility(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetCustomSkillEnergyVisibility();
}
ESlateVisibility __UIGetter_Panel1Visibilty(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetPanel1Visibilty();
}
ESlateVisibility __UIGetter_Panel2Visibilty(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetPanel2Visibilty();
}
ESlateVisibility __UIGetter_Panel2FifthProgressVisibilty(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetPanel2FifthProgressVisibilty();
}
float32 __UIGetter_VMCustomSkillEnergyRatio(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetVMCustomSkillEnergyRatio();
}
float32 __UIGetter_Right1Ratio(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetRight1Ratio();
}
float32 __UIGetter_Right2Ratio(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetRight2Ratio();
}
float32 __UIGetter_Right3Ratio(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetRight3Ratio();
}
float32 __UIGetter_Right4Ratio(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetRight4Ratio();
}
float32 __UIGetter_Right5Ratio(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetRight5Ratio();
}
float32 __UIGetter_Left1Ratio(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetLeft1Ratio();
}
float32 __UIGetter_Left2Ratio(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetLeft2Ratio();
}
FLinearColor __UIGetter_CenterProgressColor(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetCenterProgressColor();
}
FLinearColor __UIGetter_ProgressBgColor(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetProgressBgColor();
}
FLinearColor __UIGetter_Left1ProgressColor(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetLeft1ProgressColor();
}
FLinearColor __UIGetter_Left2ProgressColor(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetLeft2ProgressColor();
}
FLinearColor __UIGetter_Right1ProgressColor(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetRight1ProgressColor();
}
FLinearColor __UIGetter_Right2ProgressColor(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetRight2ProgressColor();
}
FLinearColor __UIGetter_Right3ProgressColor(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetRight3ProgressColor();
}
FLinearColor __UIGetter_Right4ProgressColor(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetRight4ProgressColor();
}
FLinearColor __UIGetter_Right5ProgressColor(const FVM_QiongExclusiveSkill &inout Model)
{
    return Model.GetRight5ProgressColor();
}
TEUIModelRef<FVM_QiongExclusiveSkill> __UIGetter_Self(const FVM_QiongExclusiveSkill &inout Model)
{
    return TEUIModelRef<FVM_QiongExclusiveSkill>(Model);
}
int __IndexOf_bBanProgress()
{
    return 0;
}
int __IndexOf_ChargeEnhanceCount()
{
    return 1;
}
int __IndexOf_CustomSkillEnergyRatio()
{
    return 2;
}
int __IndexOf_CustomSkillEnergy_2()
{
    return 3;
}
int __IndexOf_CustomSkillEnergyMax_2()
{
    return 4;
}
int __IndexOf_ENERGY_2_INTERVAL()
{
    return 5;
}
int __IndexOf_bOpenPanel1()
{
    return 6;
}
int __IndexOf_BanColor()
{
    return 7;
}
int __IndexOf_RightFullColor()
{
    return 8;
}
int __IndexOf_RightEmptyColor()
{
    return 9;
}
int __IndexOf_LeftFullColor()
{
    return 10;
}
int __IndexOf_LeftEmptyColor()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_QiongExclusiveSkill
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_FakeCharacterProgress
{
FVM_FakeCharacterProgress& Create(const UObject ContextObject)
{
    return FVM_FakeCharacterProgress::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_FakeCharacterProgress CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_FakeCharacterProgress __r;
    TEUIModelRef<FVM_FakeCharacterProgress> local_6 = TEUIModelRef<FVM_FakeCharacterProgress>(EUIInternal::MakeModelWithManager(Manager, FVM_FakeCharacterProgress::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "FakeCharacterEnergyProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_FakeCharacterProgress>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_FakeCharacterProgress;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_FakeCharacterProgress;
}
void __Tick(FVM_FakeCharacterProgress &inout Model)
{
    Model.Tick();
    return;
}
float32 __UIGetter_FakeCharacterEnergyProgress(const FVM_FakeCharacterProgress &inout Model)
{
    return Model.GetFakeCharacterEnergyProgress();
}
TEUIModelRef<FVM_FakeCharacterProgress> __UIGetter_Self(const FVM_FakeCharacterProgress &inout Model)
{
    return TEUIModelRef<FVM_FakeCharacterProgress>(Model);
}
int __IndexOf_FakeCharacterEnergyRatio()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_FakeCharacterProgress
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
