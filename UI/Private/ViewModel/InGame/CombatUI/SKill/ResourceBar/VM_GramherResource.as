
namespace FVM_GramherSkillResourceItem
{
    const int ModelId = 0;
}
namespace FVM_GramherSkillResource
{
    const int ModelId = 0;

}
struct FVM_GramherSkillResourceItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    bool m_bReachLimit;
    UPROPERTY()
    bool m_bLastReachLimit;

    FVM_GramherSkillResourceItem()
    {
        this.m_Index = 0;
        this.m_bReachLimit = false;
        this.m_bLastReachLimit = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_GramherSkillResourceItem' by default constructor.");
        return;
    }
    FVM_GramherSkillResourceItem(const FVM_GramherSkillResourceItem &inout Other)
    {
        this.m_Index = 0;
        this.m_bReachLimit = false;
        this.m_bLastReachLimit = false;
        this.m_Index = int(Other.m_Index);
        this.m_bReachLimit = Other.m_bReachLimit;
        this.m_bLastReachLimit = Other.m_bLastReachLimit;
        return;
    }
    FVM_GramherSkillResourceItem(const int InIndex)
    {
        this.m_Index = 0;
        this.m_bReachLimit = false;
        this.m_bLastReachLimit = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndex(InIndex);
        return;
    }
    FVM_GramherSkillResourceItem opAssign(const FVM_GramherSkillResourceItem &inout Other)
    {
        FVM_GramherSkillResourceItem __r;
        this.m_Index = int(Other.m_Index);
        this.m_bReachLimit = Other.m_bReachLimit;
        this.m_bLastReachLimit = Other.m_bLastReachLimit;
        return __r;
    }
    int GetItemSwitcher() const
    {
        return this.GetbReachLimit() ? 0 : 1;
    }
    int GetIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Index;
    }
    void SetIndex(const int __Value) property
    {
        if (this.m_Index == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Index = __Value;
        return;
    }
    bool GetbReachLimit() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bReachLimit;
    }
    void SetbReachLimit(const bool __Value) property
    {
        if (!(this.m_bReachLimit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bReachLimit = __Value;
        return;
    }
    bool GetbLastReachLimit() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bLastReachLimit;
    }
    void SetbLastReachLimit(const bool __Value) property
    {
        if (!(this.m_bLastReachLimit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bLastReachLimit = __Value;
        return;
    }
}

struct FVM_GramherSkillResource : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_FoundationIndex;
    UPROPERTY()
    TEUIModelRef<FVM_SwordSkillResourcePoint> m_ResourcePointer;
    UPROPERTY()
    TEUIModelRef<FVM_SwordSkillResourcePoint> m_ResourcePointerFoundationIndex_2;
    UPROPERTY()
    TEUIModelRef<FVM_GramherSkillResourceItem> m_Item0;
    UPROPERTY()
    TEUIModelRef<FVM_GramherSkillResourceItem> m_Item1;
    UPROPERTY()
    TEUIModelRef<FVM_GramherSkillResourceItem> m_Item2;
    UPROPERTY()
    float32 m_CustomSkillEnergy;
    UPROPERTY()
    float32 m_CustomSkillEnergyMax;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    float32 m_CurCustomSkillEnergy2;
    UPROPERTY()
    float32 m_MaxCustomSkillEnergy2;
    UPROPERTY()
    bool m_bClawAttack;
    UPROPERTY()
    int m_ChargeState;
    UPROPERTY()
    int m_LastChargeState;
    UPROPERTY()
    bool m_bAnyReachLimit;
    UPROPERTY()
    bool m_bAllReachLimit;
    UPROPERTY()
    int m_ItemFillEventCount;
    UPROPERTY()
    int m_CurrentMaxItemCount;

    FVM_GramherSkillResource()
    {
        this.m_CustomSkillEnergy = 0.0f;
        this.m_CustomSkillEnergyMax = 0.0f;
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_ChargeState = 0;
        this.m_FoundationIndex = 1;
        this.m_CurCustomSkillEnergy2 = 0.0f;
        this.m_MaxCustomSkillEnergy2 = 0.0f;
        this.m_bClawAttack = false;
        this.m_LastChargeState = 0;
        this.m_bAnyReachLimit = false;
        this.m_bAllReachLimit = false;
        this.m_ItemFillEventCount = 0;
        this.m_CurrentMaxItemCount = 3;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_GramherSkillResource(const FVM_GramherSkillResource &inout Other)
    {
        this.m_CustomSkillEnergy = 0.0f;
        this.m_CustomSkillEnergyMax = 0.0f;
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_ChargeState = 0;
        this.m_FoundationIndex = 1;
        this.m_CurCustomSkillEnergy2 = 0.0f;
        this.m_MaxCustomSkillEnergy2 = 0.0f;
        this.m_bClawAttack = false;
        this.m_LastChargeState = 0;
        this.m_bAnyReachLimit = false;
        this.m_bAllReachLimit = false;
        this.m_ItemFillEventCount = 0;
        this.m_CurrentMaxItemCount = 3;
        this.m_FoundationIndex = int(Other.m_FoundationIndex);
        this.m_ResourcePointer = Other.m_ResourcePointer;
        this.m_ResourcePointerFoundationIndex_2 = Other.m_ResourcePointerFoundationIndex_2;
        this.m_Item0 = Other.m_Item0;
        this.m_Item1 = Other.m_Item1;
        this.m_Item2 = Other.m_Item2;
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CurCustomSkillEnergy2 = Other.m_CurCustomSkillEnergy2;
        this.m_MaxCustomSkillEnergy2 = Other.m_MaxCustomSkillEnergy2;
        this.m_bClawAttack = Other.m_bClawAttack;
        this.m_ChargeState = int(Other.m_ChargeState);
        this.m_LastChargeState = int(Other.m_LastChargeState);
        this.m_bAnyReachLimit = Other.m_bAnyReachLimit;
        this.m_bAllReachLimit = Other.m_bAllReachLimit;
        this.m_ItemFillEventCount = int(Other.m_ItemFillEventCount);
        this.m_CurrentMaxItemCount = int(Other.m_CurrentMaxItemCount);
        return;
    }
    FVM_GramherSkillResource opAssign(const FVM_GramherSkillResource &inout Other)
    {
        FVM_GramherSkillResource __r;
        this.m_FoundationIndex = int(Other.m_FoundationIndex);
        this.m_ResourcePointer = Other.m_ResourcePointer;
        this.m_ResourcePointerFoundationIndex_2 = Other.m_ResourcePointerFoundationIndex_2;
        this.m_Item0 = Other.m_Item0;
        this.m_Item1 = Other.m_Item1;
        this.m_Item2 = Other.m_Item2;
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CurCustomSkillEnergy2 = Other.m_CurCustomSkillEnergy2;
        this.m_MaxCustomSkillEnergy2 = Other.m_MaxCustomSkillEnergy2;
        this.m_bClawAttack = Other.m_bClawAttack;
        this.m_ChargeState = int(Other.m_ChargeState);
        this.m_LastChargeState = int(Other.m_LastChargeState);
        this.m_bAnyReachLimit = Other.m_bAnyReachLimit;
        this.m_bAllReachLimit = Other.m_bAllReachLimit;
        this.m_ItemFillEventCount = int(Other.m_ItemFillEventCount);
        this.m_CurrentMaxItemCount = int(Other.m_CurrentMaxItemCount);
        return __r;
    }
    float32 GetMainPercent() const
    {
        return this.GetCustomSkillEnergyRatio();
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
    ESlateVisibility GetClawAttackIncreaseVisibility() const
    {
        int local_2;
        if (!(this.GetbClawAttack()))
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 2;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetClawAttackDecreaseVisibility() const
    {
        int local_2;
        if (this.GetbClawAttack())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 2;
        }
        return ESlateVisibility(local_2);
    }
    void InitItems()
    {
        this.SetItem0(TEUIModelRef<FVM_GramherSkillResourceItem>(::FVM_GramherSkillResourceItem::Create(this.GetContext().Manager, 0)));
        this.SetItem1(TEUIModelRef<FVM_GramherSkillResourceItem>(::FVM_GramherSkillResourceItem::Create(this.GetContext().Manager, 1)));
        this.SetItem2(TEUIModelRef<FVM_GramherSkillResourceItem>(::FVM_GramherSkillResourceItem::Create(this.GetContext().Manager, 2)));
        return;
    }
    void PostConstruct()
    {
        this.SetResourcePointer(TEUIModelRef<FVM_SwordSkillResourcePoint>(::FVM_SwordSkillResourcePoint::Create(this.GetContext().Manager)));
        float32 local_3 = 1000.0f;
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_2 = this.GetResourcePointer();
        local_3.SetConsumeAnimChangeThreshold();
        this.SetResourcePointerFoundationIndex_2(TEUIModelRef<FVM_SwordSkillResourcePoint>(::FVM_SwordSkillResourcePoint::Create(this.GetContext().Manager)));
        float32 local_3_2 = 1000.0f;
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_2_2 = this.GetResourcePointerFoundationIndex_2();
        local_3_2.SetConsumeAnimChangeThreshold();
        this.InitItems();
        return;
    }
    void Tick()
    {
        int local_30 = 0;
        int local_34 = 0;
        int local_36 = 0;
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
            FGameAttributeModificationValue local_20;
            this.SetCustomSkillEnergyMax(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax, this.GetContext().Time, false, 0.0f, false, local_20));
            float32 local_21 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy, this.GetContext().Time, false, 0.0f, false, local_20);
            this.SetCustomSkillEnergy(local_21);
            if (this.GetCustomSkillEnergyMax() != 0.0f)
            {
                local_21 = this.GetCustomSkillEnergy();
                local_21 = local_21 / this.GetCustomSkillEnergyMax();
                this.SetCustomSkillEnergyRatio(local_21);
            }
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_26 = this.GetResourcePointer();
            this.GetCustomSkillEnergyRatio().SetResourcePointPercent();
            bool local_5_2 = (this.GetCustomSkillEnergyRatio() < 1.0f);
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_26_2 = this.GetResourcePointer();
            local_5_2.SetbPointVisible();
            local_21 = this.GetCustomSkillEnergyMax();
            local_21 = local_21 / this.GetCurrentMaxItemCount();
            int local_28 = uint(local_21);
            TEUIModelRef<FVM_GramherSkillResourceItem> local_32 = this.GetItem0();
            TEUIModelRef<FVM_GramherSkillResourceItem> local_32_2 = this.GetItem1();
            TEUIModelRef<FVM_GramherSkillResourceItem> local_32_3 = this.GetItem2();
            local_30.SetbLastReachLimit(local_30.GetbReachLimit());
            local_34.SetbLastReachLimit(local_34.GetbReachLimit());
            local_36.SetbLastReachLimit(local_36.GetbReachLimit());
            local_21 = this.GetCustomSkillEnergy();
            local_30.SetbReachLimit((local_21 >= local_28));
            float32 local_23 = this.GetCustomSkillEnergy();
            local_21 = (local_28 * 2);
            local_34.SetbReachLimit((local_23 >= local_21));
            local_21 = this.GetCustomSkillEnergy();
            local_36.SetbReachLimit((local_21 >= (local_28 * 3)));
            int local_37 = 0;
            if (!(local_30.GetbLastReachLimit()) && local_30.GetbReachLimit())
            {
                ++local_37;
            }
            if (!(local_34.GetbLastReachLimit()) && local_34.GetbReachLimit())
            {
                ++local_37;
            }
            if (!(local_36.GetbLastReachLimit()) && local_36.GetbReachLimit())
            {
                ++local_37;
            }
            if (local_37 > 0)
            {
                this.SetItemFillEventCount((this.GetItemFillEventCount() + local_37));
            }
            this.SetbAnyReachLimit(local_30.GetbReachLimit() || local_34.GetbReachLimit() || local_36.GetbReachLimit());
            this.SetbAllReachLimit(local_30.GetbReachLimit() && local_34.GetbReachLimit() && local_36.GetbReachLimit());
        }
        this.SetLastChargeState(this.GetChargeState());
        FNameHandle_EntityBBVar local_42;
        local_42;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_42))
        {
            FNameHandle_EntityBBVarInt local_46;
            local_46;
            this.SetChargeState(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_46));
        }
        local_42;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_42))
        {
            FNameHandle_EntityBBVarInt local_46;
            local_46;
            this.SetFoundationIndex(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_46));
        }
        if (this.GetFoundationIndex() == 2)
        {
            FGameAttributeModificationValue local_20;
            float32 local_21_2 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy_2, this.GetContext().Time, false, 0.0f, false, local_20);
            this.SetCurCustomSkillEnergy2(local_21_2);
            this.SetMaxCustomSkillEnergy2(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax_2, this.GetContext().Time, false, 0.0f, false, local_20));
            local_42;
            if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_42))
            {
                FNameHandle_EntityBBVarBool local_52;
                local_52;
                this.SetbClawAttack(this.GetContext().GetLocalPlayerPawn().GetBB_Bool(local_52) || ((this.GetCurCustomSkillEnergy2() >= this.GetMaxCustomSkillEnergy2())));
            }
            float32 local_53 = 0.0f;
            if (this.GetMaxCustomSkillEnergy2() != 0.0f)
            {
                local_21_2 = this.GetCurCustomSkillEnergy2();
                local_53 = local_21_2 / this.GetMaxCustomSkillEnergy2();
            }
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_26_3 = this.GetResourcePointerFoundationIndex_2();
            local_53.SetResourcePointPercent();
            bool local_5_3 = (local_53 < 1.0f);
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_26_4 = this.GetResourcePointerFoundationIndex_2();
            local_5_3.SetbPointVisible();
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
    TEUIModelRef<FVM_SwordSkillResourcePoint> GetResourcePointer() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ResourcePointer;
    }
    void SetResourcePointer(const TEUIModelRef<FVM_SwordSkillResourcePoint> &inout __Value) property
    {
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_2;
        local_2 = this.m_ResourcePointer;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ResourcePointer = __Value;
        return;
    }
    TEUIModelRef<FVM_SwordSkillResourcePoint> GetResourcePointerFoundationIndex_2() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ResourcePointerFoundationIndex_2;
    }
    void SetResourcePointerFoundationIndex_2(const TEUIModelRef<FVM_SwordSkillResourcePoint> &inout __Value) property
    {
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_2;
        local_2 = this.m_ResourcePointerFoundationIndex_2;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ResourcePointerFoundationIndex_2 = __Value;
        return;
    }
    TEUIModelRef<FVM_GramherSkillResourceItem> GetItem0() const property
    {
        this.TrackPropertyRead(3);
        return this.m_Item0;
    }
    void SetItem0(const TEUIModelRef<FVM_GramherSkillResourceItem> &inout __Value) property
    {
        TEUIModelRef<FVM_GramherSkillResourceItem> local_2;
        local_2 = this.m_Item0;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Item0 = __Value;
        return;
    }
    TEUIModelRef<FVM_GramherSkillResourceItem> GetItem1() const property
    {
        this.TrackPropertyRead(4);
        return this.m_Item1;
    }
    void SetItem1(const TEUIModelRef<FVM_GramherSkillResourceItem> &inout __Value) property
    {
        TEUIModelRef<FVM_GramherSkillResourceItem> local_2;
        local_2 = this.m_Item1;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Item1 = __Value;
        return;
    }
    TEUIModelRef<FVM_GramherSkillResourceItem> GetItem2() const property
    {
        this.TrackPropertyRead(5);
        return this.m_Item2;
    }
    void SetItem2(const TEUIModelRef<FVM_GramherSkillResourceItem> &inout __Value) property
    {
        TEUIModelRef<FVM_GramherSkillResourceItem> local_2;
        local_2 = this.m_Item2;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Item2 = __Value;
        return;
    }
    const float32 GetCustomSkillEnergy() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_CustomSkillEnergy() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetCustomSkillEnergy(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_CustomSkillEnergy = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyMax() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyMax() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetCustomSkillEnergyMax(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CustomSkillEnergyMax = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetCustomSkillEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CustomSkillEnergyRatio = __Value;
        return;
    }
    const float32 GetCurCustomSkillEnergy2() const property
    {
        const float32 __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    float32 GetModify_CurCustomSkillEnergy2() property
    {
        float32 __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetCurCustomSkillEnergy2(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_CurCustomSkillEnergy2 = __Value;
        return;
    }
    const float32 GetMaxCustomSkillEnergy2() const property
    {
        const float32 __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    float32 GetModify_MaxCustomSkillEnergy2() property
    {
        float32 __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetMaxCustomSkillEnergy2(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_MaxCustomSkillEnergy2 = __Value;
        return;
    }
    bool GetbClawAttack() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bClawAttack;
    }
    void SetbClawAttack(const bool __Value) property
    {
        if (!(this.m_bClawAttack) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bClawAttack = __Value;
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
    int GetLastChargeState() const property
    {
        this.TrackPropertyRead(13);
        return this.m_LastChargeState;
    }
    void SetLastChargeState(const int __Value) property
    {
        if (this.m_LastChargeState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_LastChargeState = __Value;
        return;
    }
    bool GetbAnyReachLimit() const property
    {
        this.TrackPropertyRead(14);
        return this.m_bAnyReachLimit;
    }
    void SetbAnyReachLimit(const bool __Value) property
    {
        if (!(this.m_bAnyReachLimit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_bAnyReachLimit = __Value;
        return;
    }
    bool GetbAllReachLimit() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bAllReachLimit;
    }
    void SetbAllReachLimit(const bool __Value) property
    {
        if (!(this.m_bAllReachLimit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bAllReachLimit = __Value;
        return;
    }
    int GetItemFillEventCount() const property
    {
        this.TrackPropertyRead(16);
        return this.m_ItemFillEventCount;
    }
    void SetItemFillEventCount(const int __Value) property
    {
        if (this.m_ItemFillEventCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_ItemFillEventCount = __Value;
        return;
    }
    int GetCurrentMaxItemCount() const property
    {
        this.TrackPropertyRead(17);
        return this.m_CurrentMaxItemCount;
    }
    void SetCurrentMaxItemCount(const int __Value) property
    {
        if (this.m_CurrentMaxItemCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_CurrentMaxItemCount = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_GramherSkillResourceItem
{
    UPROPERTY()
    int ItemSwitcher;
    UPROPERTY()
    TEUIModelRef<FVM_GramherSkillResourceItem> Self;


}

struct __GeneratedProperties_FVM_GramherSkillResource
{
    UPROPERTY()
    float32 MainPercent;
    UPROPERTY()
    ESlateVisibility ShowF2Progress;
    UPROPERTY()
    float32 F2ProgressPercent;
    UPROPERTY()
    FLinearColor F2ProgressColor;
    UPROPERTY()
    ESlateVisibility ClawAttackIncreaseVisibility;
    UPROPERTY()
    ESlateVisibility ClawAttackDecreaseVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_GramherSkillResource> Self;


}

namespace FVM_GramherSkillResourceItem
{
FVM_GramherSkillResourceItem& Create(const UObject ContextObject, const int Index)
{
    return FVM_GramherSkillResourceItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Index);
}
FVM_GramherSkillResourceItem CreateByManager(const UEUIManagerSubsystem Manager, const int Index)
{
    FVM_GramherSkillResourceItem __r;
    TEUIModelRef<FVM_GramherSkillResourceItem> local_6 = TEUIModelRef<FVM_GramherSkillResourceItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_GramherSkillResourceItem::ModelId, 0, Index));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemSwitcher";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_GramherSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_GramherSkillResourceItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_GramherSkillResourceItem;
}
int __UIGetter_ItemSwitcher(const FVM_GramherSkillResourceItem &inout Model)
{
    return Model.GetItemSwitcher();
}
TEUIModelRef<FVM_GramherSkillResourceItem> __UIGetter_Self(const FVM_GramherSkillResourceItem &inout Model)
{
    return TEUIModelRef<FVM_GramherSkillResourceItem>(Model);
}
int __IndexOf_Index()
{
    return 0;
}
int __IndexOf_bReachLimit()
{
    return 1;
}
int __IndexOf_bLastReachLimit()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_GramherSkillResourceItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_GramherSkillResource
{
FVM_GramherSkillResource& Create(const UObject ContextObject)
{
    return FVM_GramherSkillResource::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_GramherSkillResource CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_GramherSkillResource __r;
    TEUIModelRef<FVM_GramherSkillResource> local_6 = TEUIModelRef<FVM_GramherSkillResource>(EUIInternal::MakeModelWithManager(Manager, FVM_GramherSkillResource::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ResourcePointer";
    local_14.TypeName = "TEUIModelRef<FVM_SwordSkillResourcePoint>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ResourcePointerFoundationIndex_2";
    local_14.TypeName = "TEUIModelRef<FVM_SwordSkillResourcePoint>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Item0";
    local_14.TypeName = "TEUIModelRef<FVM_GramherSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Item1";
    local_14.TypeName = "TEUIModelRef<FVM_GramherSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Item2";
    local_14.TypeName = "TEUIModelRef<FVM_GramherSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
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
    local_14.PropertyName = "ClawAttackIncreaseVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ClawAttackDecreaseVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_GramherSkillResource>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_GramherSkillResource;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_GramherSkillResource;
}
void __Tick(FVM_GramherSkillResource &inout Model)
{
    Model.Tick();
    return;
}
TEUIModelRef<FVM_SwordSkillResourcePoint> __UIGetter_ResourcePointer(const FVM_GramherSkillResource &inout Model)
{
    return Model.GetResourcePointer();
}
TEUIModelRef<FVM_SwordSkillResourcePoint> __UIGetter_ResourcePointerFoundationIndex_2(const FVM_GramherSkillResource &inout Model)
{
    return Model.GetResourcePointerFoundationIndex_2();
}
TEUIModelRef<FVM_GramherSkillResourceItem> __UIGetter_Item0(const FVM_GramherSkillResource &inout Model)
{
    return Model.GetItem0();
}
TEUIModelRef<FVM_GramherSkillResourceItem> __UIGetter_Item1(const FVM_GramherSkillResource &inout Model)
{
    return Model.GetItem1();
}
TEUIModelRef<FVM_GramherSkillResourceItem> __UIGetter_Item2(const FVM_GramherSkillResource &inout Model)
{
    return Model.GetItem2();
}
float32 __UIGetter_MainPercent(const FVM_GramherSkillResource &inout Model)
{
    return Model.GetMainPercent();
}
ESlateVisibility __UIGetter_ShowF2Progress(const FVM_GramherSkillResource &inout Model)
{
    return Model.GetShowF2Progress();
}
float32 __UIGetter_F2ProgressPercent(const FVM_GramherSkillResource &inout Model)
{
    return Model.GetF2ProgressPercent();
}
FLinearColor __UIGetter_F2ProgressColor(const FVM_GramherSkillResource &inout Model)
{
    return Model.GetF2ProgressColor();
}
ESlateVisibility __UIGetter_ClawAttackIncreaseVisibility(const FVM_GramherSkillResource &inout Model)
{
    return Model.GetClawAttackIncreaseVisibility();
}
ESlateVisibility __UIGetter_ClawAttackDecreaseVisibility(const FVM_GramherSkillResource &inout Model)
{
    return Model.GetClawAttackDecreaseVisibility();
}
TEUIModelRef<FVM_GramherSkillResource> __UIGetter_Self(const FVM_GramherSkillResource &inout Model)
{
    return TEUIModelRef<FVM_GramherSkillResource>(Model);
}
int __IndexOf_FoundationIndex()
{
    return 0;
}
int __IndexOf_ResourcePointer()
{
    return 1;
}
int __IndexOf_ResourcePointerFoundationIndex_2()
{
    return 2;
}
int __IndexOf_Item0()
{
    return 3;
}
int __IndexOf_Item1()
{
    return 4;
}
int __IndexOf_Item2()
{
    return 5;
}
int __IndexOf_CustomSkillEnergy()
{
    return 6;
}
int __IndexOf_CustomSkillEnergyMax()
{
    return 7;
}
int __IndexOf_CustomSkillEnergyRatio()
{
    return 8;
}
int __IndexOf_CurCustomSkillEnergy2()
{
    return 9;
}
int __IndexOf_MaxCustomSkillEnergy2()
{
    return 10;
}
int __IndexOf_bClawAttack()
{
    return 11;
}
int __IndexOf_ChargeState()
{
    return 12;
}
int __IndexOf_LastChargeState()
{
    return 13;
}
int __IndexOf_bAnyReachLimit()
{
    return 14;
}
int __IndexOf_bAllReachLimit()
{
    return 15;
}
int __IndexOf_ItemFillEventCount()
{
    return 16;
}
int __IndexOf_CurrentMaxItemCount()
{
    return 17;
}
}
namespace __GeneratedProperties_FVM_GramherSkillResource
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
