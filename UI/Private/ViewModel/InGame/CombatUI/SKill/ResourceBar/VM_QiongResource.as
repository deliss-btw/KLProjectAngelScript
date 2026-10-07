
namespace FVM_QiongSkillResourceItem
{
    const int ModelId = 0;
}
namespace FVM_QiongSkillResource
{
    const int ModelId = 0;

}
struct FVM_QiongSkillResourceItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_Index;
    UPROPERTY()
    bool m_bReverseItem;
    UPROPERTY()
    float32 m_Percent;
    UPROPERTY()
    float32 m_LastPercent;
    UPROPERTY()
    bool m_bStopAllAnim;
    UPROPERTY()
    bool m_bItemVisible;
    UPROPERTY()
    bool m_bOverload;

    FVM_QiongSkillResourceItem()
    {
        this.m_Index = 0.0f;
        this.m_Percent = 0.0f;
        this.m_bReverseItem = false;
        this.m_LastPercent = 0.0f;
        this.m_bStopAllAnim = false;
        this.m_bItemVisible = true;
        this.m_bOverload = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_QiongSkillResourceItem' by default constructor.");
        return;
    }
    FVM_QiongSkillResourceItem(const FVM_QiongSkillResourceItem &inout Other)
    {
        this.m_Index = 0.0f;
        this.m_Percent = 0.0f;
        this.m_bReverseItem = false;
        this.m_LastPercent = 0.0f;
        this.m_bStopAllAnim = false;
        this.m_bItemVisible = true;
        this.m_bOverload = false;
        this.m_Index = Other.m_Index;
        this.m_bReverseItem = Other.m_bReverseItem;
        this.m_Percent = Other.m_Percent;
        this.m_LastPercent = Other.m_LastPercent;
        this.m_bStopAllAnim = Other.m_bStopAllAnim;
        this.m_bItemVisible = Other.m_bItemVisible;
        this.m_bOverload = Other.m_bOverload;
        return;
    }
    FVM_QiongSkillResourceItem(const float32 InIndex, const bool InbReverseItem)
    {
        this.m_Index = 0.0f;
        this.m_Percent = 0.0f;
        this.m_bReverseItem = false;
        this.m_LastPercent = 0.0f;
        this.m_bStopAllAnim = false;
        this.m_bItemVisible = true;
        this.m_bOverload = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndex(InIndex);
        this.SetbReverseItem(InbReverseItem);
        return;
    }
    FVM_QiongSkillResourceItem opAssign(const FVM_QiongSkillResourceItem &inout Other)
    {
        FVM_QiongSkillResourceItem __r;
        this.m_Index = Other.m_Index;
        this.m_bReverseItem = Other.m_bReverseItem;
        this.m_Percent = Other.m_Percent;
        this.m_LastPercent = Other.m_LastPercent;
        this.m_bStopAllAnim = Other.m_bStopAllAnim;
        this.m_bItemVisible = Other.m_bItemVisible;
        this.m_bOverload = Other.m_bOverload;
        return __r;
    }
    float32 GetItemPercent() const
    {
        return this.GetPercent();
    }
    ESlateVisibility GetItemOverloadVisibility() const
    {
        int local_2;
        if (!(this.GetbOverload()))
        {
            local_2 = 2;
        }
        else
        {
            local_2 = 0;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetItemVisibility() const
    {
        int local_2;
        if (this.GetbItemVisible())
        {
            local_2 = 4;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    const float32 GetIndex() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_Index() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetIndex(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Index = __Value;
        return;
    }
    bool GetbReverseItem() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bReverseItem;
    }
    void SetbReverseItem(const bool __Value) property
    {
        if (!(this.m_bReverseItem) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bReverseItem = __Value;
        return;
    }
    float32 GetPercent() const property
    {
        float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_Percent() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Percent = __Value;
        return;
    }
    const float32 GetLastPercent() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_LastPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetLastPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_LastPercent = __Value;
        return;
    }
    bool GetbStopAllAnim() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bStopAllAnim;
    }
    void SetbStopAllAnim(const bool __Value) property
    {
        if (!(this.m_bStopAllAnim) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bStopAllAnim = __Value;
        return;
    }
    bool GetbItemVisible() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bItemVisible;
    }
    void SetbItemVisible(const bool __Value) property
    {
        if (!(this.m_bItemVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bItemVisible = __Value;
        return;
    }
    bool GetbOverload() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bOverload;
    }
    void SetbOverload(const bool __Value) property
    {
        if (!(this.m_bOverload) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bOverload = __Value;
        return;
    }
}

struct FVM_QiongSkillResource : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> m_LeftResourceItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> m_RightResourceItems;
    UPROPERTY()
    TEUIModelRef<FVM_SwordSkillResourcePoint> m_LeftResourcePointer;
    UPROPERTY()
    TEUIModelRef<FVM_SwordSkillResourcePoint> m_RightResourcePointer;
    UPROPERTY()
    float32 m_CustomSkillEnergy;
    UPROPERTY()
    float32 m_CustomSkillEnergyMax;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    float32 m_CustomSkillEnergy_2;
    UPROPERTY()
    float32 m_CustomSkillEnergyMax_2;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio_2;
    UPROPERTY()
    bool m_bHasCoreEnergyType;
    UPROPERTY()
    bool m_bBanProgress;
    UPROPERTY()
    int m_ChargeEnhanceCount;
    UPROPERTY()
    bool m_bFifthItemShow;
    UPROPERTY()
    int m_LastChargeEnhanceCount;
    UPROPERTY()
    float32 ENERGY_INTERVAL;
    UPROPERTY()
    int LEFT_ITEM_COUNT;
    UPROPERTY()
    int RIGHT_ITEM_COUNT;
    UPROPERTY()
    int LEFT_ITEM_INDEX_OFFSET;
    UPROPERTY()
    int RIGHT_ITEM_INDEX_OFFSET;
    UPROPERTY()
    TArray<float32> SRight5;
    UPROPERTY()
    TArray<float32> ERight5;
    UPROPERTY()
    TArray<float32> SRight4WithLeft;
    UPROPERTY()
    TArray<float32> ERight4WithLeft;
    UPROPERTY()
    TArray<float32> SRight4;
    UPROPERTY()
    TArray<float32> ERight4;
    UPROPERTY()
    TArray<float32> SLeft;
    UPROPERTY()
    TArray<float32> ELeft;

    FVM_QiongSkillResource()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_QiongSkillResource(const FVM_QiongSkillResource &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_QiongSkillResource opAssign(const FVM_QiongSkillResource &inout Other)
    {
        FVM_QiongSkillResource __r;
        this.m_LeftResourceItems = Other.m_LeftResourceItems;
        this.m_RightResourceItems = Other.m_RightResourceItems;
        this.m_LeftResourcePointer = Other.m_LeftResourcePointer;
        this.m_RightResourcePointer = Other.m_RightResourcePointer;
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CustomSkillEnergy_2 = Other.m_CustomSkillEnergy_2;
        this.m_CustomSkillEnergyMax_2 = Other.m_CustomSkillEnergyMax_2;
        this.m_CustomSkillEnergyRatio_2 = Other.m_CustomSkillEnergyRatio_2;
        this.m_bHasCoreEnergyType = Other.m_bHasCoreEnergyType;
        this.m_bBanProgress = Other.m_bBanProgress;
        this.m_ChargeEnhanceCount = int(Other.m_ChargeEnhanceCount);
        this.m_bFifthItemShow = Other.m_bFifthItemShow;
        this.m_LastChargeEnhanceCount = int(Other.m_LastChargeEnhanceCount);
        return __r;
    }
    TEUIModelRef<FVM_QiongSkillResourceItem> GetLeft1Item() const
    {
        return this.GetLeftResourceItems()[0];
    }
    TEUIModelRef<FVM_QiongSkillResourceItem> GetLeft2Item() const
    {
        return this.GetLeftResourceItems()[1];
    }
    TEUIModelRef<FVM_QiongSkillResourceItem> GetRight1Item() const
    {
        return this.GetRightResourceItems()[0];
    }
    TEUIModelRef<FVM_QiongSkillResourceItem> GetRight2Item() const
    {
        return this.GetRightResourceItems()[1];
    }
    TEUIModelRef<FVM_QiongSkillResourceItem> GetRight3Item() const
    {
        return this.GetRightResourceItems()[2];
    }
    TEUIModelRef<FVM_QiongSkillResourceItem> GetRight4Item() const
    {
        return this.GetRightResourceItems()[3];
    }
    TEUIModelRef<FVM_QiongSkillResourceItem> GetRight5Item() const
    {
        return this.GetRightResourceItems()[4];
    }
    ESlateVisibility GetFifthItemShowVisibility() const
    {
        int local_2;
        if (this.GetbFifthItemShow())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    int GetRightTypeSwitch() const
    {
        if (this.GetbHasCoreEnergyType())
        {
            return this.GetbFifthItemShow() ? 2 : 1;
        }
        else
        {
            return 0;
        }
    }
    int GetLeftTypeSwitch() const
    {
        return this.GetbHasCoreEnergyType() ? 1 : 0;
    }
    ESlateVisibility GetBanProgress() const
    {
        int local_2;
        if (this.GetbBanProgress())
        {
            local_2 = 2;
        }
        else
        {
            local_2 = 0;
        }
        return ESlateVisibility(local_2);
    }
    float32 GetRightProgress() const
    {
        float32 local_8;
        if (this.GetbBanProgress())
        {
            return 0.0f;
        }
        else
        {
            if (this.GetCustomSkillEnergy_2() <= 0.0f)
            {
                return 0.0f;
            }
            else
            {
                float32 local_4;
                local_4 = this.GetCustomSkillEnergyMax_2();
                if (local_4 > 0.0f)
                {
                    local_8 = FMath::Clamp((this.GetCustomSkillEnergy_2() / local_4), 0.0f, 1.0f);
                }
                else
                {
                    local_8 = 0.0f;
                }
                int local_10 = this.GetRightTypeSwitch();
                if (local_10 == 2)
                {
                    return this.RemapBeanProgress(local_8, this.SRight5, this.ERight5);
                }
                else
                {
                    if (local_10 == 1)
                    {
                        return this.RemapBeanProgress(local_8, this.SRight4WithLeft, this.ERight4WithLeft);
                    }
                    else
                    {
                        return this.RemapBeanProgress(local_8, this.SRight4, this.ERight4);
                    }
                }
            }
        }
    }
    float32 GetLeftProgress() const
    {
        float32 local_9;
        if (this.GetbBanProgress())
        {
            return 0.0f;
        }
        if (this.GetCustomSkillEnergy_2() >= 0.0f)
        {
            return 0.0f;
        }
        float32 local_3 = this.LEFT_ITEM_COUNT * this.ENERGY_INTERVAL;
        if (local_3 > 0.0f)
        {
            local_9 = FMath::Clamp(-this.GetCustomSkillEnergy_2() / local_3, 0.0f, 1.0f);
        }
        else
        {
            local_9 = 0.0f;
        }
        if (this.GetLeftTypeSwitch() == 1)
        {
            return this.RemapBeanProgress(local_9, this.SLeft, this.ELeft);
        }
        return local_9;
    }
    float32 GetRightRawProgress() const
    {
        float32 local_7;
        if (this.GetbBanProgress())
        {
            return 0.0f;
        }
        if (this.GetCustomSkillEnergy_2() <= 0.0f)
        {
            return 0.0f;
        }
        float32 local_4 = this.GetCustomSkillEnergyMax_2();
        if (local_4 > 0.0f)
        {
            local_7 = FMath::Clamp((this.GetCustomSkillEnergy_2() / local_4), 0.0f, 1.0f);
        }
        else
        {
            local_7 = 0.0f;
        }
        return local_7;
    }
    float32 GetLeftRawProgress() const
    {
        float32 local_9;
        if (this.GetbBanProgress())
        {
            return 0.0f;
        }
        if (this.GetCustomSkillEnergy_2() >= 0.0f)
        {
            return 0.0f;
        }
        float32 local_3 = this.LEFT_ITEM_COUNT * this.ENERGY_INTERVAL;
        if (local_3 > 0.0f)
        {
            local_9 = FMath::Clamp(-this.GetCustomSkillEnergy_2() / local_3, 0.0f, 1.0f);
        }
        else
        {
            local_9 = 0.0f;
        }
        return local_9;
    }
    void InitResourceItems()
    {
        this.GetModify_RightResourceItems().Empty(0);
        int local_2 = 0;
        for (; local_2 < this.RIGHT_ITEM_COUNT; )
        {
            this.GetModify_RightResourceItems().Add(TEUIModelRef<FVM_QiongSkillResourceItem>(::FVM_QiongSkillResourceItem::Create(this.GetContext().Manager, (this.RIGHT_ITEM_INDEX_OFFSET + local_2), false)));
            ++local_2;
        }
        this.GetModify_LeftResourceItems().Empty(0);
        int local_2_2 = 0;
        for (; local_2_2 < this.LEFT_ITEM_COUNT; )
        {
            this.GetModify_LeftResourceItems().Add(TEUIModelRef<FVM_QiongSkillResourceItem>(::FVM_QiongSkillResourceItem::Create(this.GetContext().Manager, (this.LEFT_ITEM_INDEX_OFFSET + local_2_2), true)));
            ++local_2_2;
        }
        return;
    }
    float32 RemapBeanProgress(const float32 Raw, const TArray<float32> &in SegStarts, const TArray<float32> &in SegEnds) const
    {
        int local_2 = SegStarts.Num();
        if (local_2 <= 0)
        {
            return Raw;
        }
        float32 local_7 = FMath::Clamp(Raw, 0.0f, 1.0f);
        int local_11 = FMath::Clamp(FMath::FloorToInt(local_7 * local_2), 0, local_2 - 1);
        return FMath::Lerp(SegStarts[local_11], SegEnds[local_11], (local_7 * local_2) - local_11);
    }
    void RefreshResouceItems()
    {
        FVM_QiongSkillResourceItem& local_6;
        int local_1 = 0;
        for (; local_1 < this.GetRightResourceItems().Num(); )
        {
            local_6.SetLastPercent(local_6.GetPercent());
            float32 local_8 = (this.GetCustomSkillEnergy_2() - (local_1 * this.ENERGY_INTERVAL)) / this.ENERGY_INTERVAL;
            local_6.SetPercent(FMath::Clamp(local_8, 0.0f, 1.0f));
            local_6.SetbStopAllAnim(this.GetbBanProgress());
            local_6.SetbOverload(this.GetbBanProgress());
            ++local_1;
        }
        if (this.GetRightResourceItems().Num() > 4)
        {
            (this.GetCustomSkillEnergyMax_2() > 200.0f).SetbItemVisible();
            this.SetbFifthItemShow(GetbItemVisible());
        }
        int local_1_2 = 0;
        for (; local_1_2 < this.GetLeftResourceItems().Num(); )
        {
            local_6.SetLastPercent(local_6.GetPercent());
            float32 local_9_2 = -this.GetCustomSkillEnergy_2() - local_1_2 * this.ENERGY_INTERVAL;
            local_6.SetPercent(FMath::Clamp(local_9_2 / this.ENERGY_INTERVAL, 0.0f, 1.0f));
            local_6.SetbStopAllAnim(this.GetbBanProgress());
            local_6.SetbOverload(this.GetbBanProgress());
            ++local_1_2;
        }
        return;
    }
    void PostConstruct()
    {
        this.SetLeftResourcePointer(TEUIModelRef<FVM_SwordSkillResourcePoint>(::FVM_SwordSkillResourcePoint::Create(this.GetContext().Manager)));
        this.SetRightResourcePointer(TEUIModelRef<FVM_SwordSkillResourcePoint>(::FVM_SwordSkillResourcePoint::Create(this.GetContext().Manager)));
        this.InitResourceItems();
        return;
    }
    void Tick()
    {
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            return;
        }
        if (!(ECS::GetECSWorld().IsValid()))
        {
            return;
        }
        this.SetbHasCoreEnergyType(::BlueprintFunctions_Common::HasCapabilityByName(FECSEntityAdapter(this.GetContext().GetLocalPlayerPawn()), n"F1T4C2_CoreEnergyType"));
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        Get local_22;
        bool local_5 = local_22.opCall().HasAttribute(Attribute::CustomSkillEnergy);
        if (local_5)
        {
            FGameAttributeModificationValue local_32;
            this.SetCustomSkillEnergyMax(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax, this.GetContext().Time, false, 0.0f, false, local_32));
            this.SetCustomSkillEnergy(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy, this.GetContext().Time, false, 0.0f, false, local_32));
            if (this.GetCustomSkillEnergyMax() != 0.0f)
            {
                this.SetCustomSkillEnergyRatio((this.GetCustomSkillEnergy() / this.GetCustomSkillEnergyMax()));
            }
        }
        FNameHandle_EntityBBVar local_40;
        local_40;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_40))
        {
            FNameHandle_EntityBBVarBool local_44;
            local_44;
            this.SetbBanProgress(this.GetContext().GetLocalPlayerPawn().GetBB_Bool(local_44));
        }
        this.SetLastChargeEnhanceCount(this.GetChargeEnhanceCount());
        local_40;
        bool local_34 = this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_40);
        if (local_34)
        {
            FNameHandle_EntityBBVarInt local_48;
            local_48;
            this.SetChargeEnhanceCount(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_48));
        }
        FECSEntity local_4_2 = this.GetContext().GetLocalPlayerPawn();
        bool local_5_2 = local_22.opCall().HasAttribute(Attribute::CustomSkillEnergy_2);
        if (local_5_2)
        {
            FGameAttributeModificationValue local_32;
            this.SetCustomSkillEnergy_2(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy_2, this.GetContext().Time, false, 0.0f, false, local_32));
            this.SetCustomSkillEnergyMax_2(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax_2, this.GetContext().Time, false, 0.0f, false, local_32));
            if (this.GetCustomSkillEnergyMax_2() != 0.0f)
            {
                this.SetCustomSkillEnergyRatio_2((this.GetCustomSkillEnergy_2() / this.GetCustomSkillEnergyMax_2()));
            }
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_50 = this.GetLeftResourcePointer();
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_52 = this.GetLeftResourcePointer();
            GetResourcePointPercent().SetLastResourcePointPercent();
            float32 local_33_2 = this.GetLeftProgress();
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_50_2 = this.GetLeftResourcePointer();
            local_33_2.SetResourcePointPercent();
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_52_2 = this.GetLeftResourcePointer();
            if (GetResourcePointPercent() >= 1.0f)
            {
                local_5_2 = false;
            }
            else
            {
                TEUIModelRef<FVM_SwordSkillResourcePoint> local_52_3 = this.GetLeftResourcePointer();
                local_5_2 = (GetResourcePointPercent() > 0.0f);
            }
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_50_3 = this.GetLeftResourcePointer();
            local_5_2.SetbPointVisible();
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_52_4 = this.GetRightResourcePointer();
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_50_4 = this.GetRightResourcePointer();
            GetResourcePointPercent().SetLastResourcePointPercent();
            float32 local_35_2 = this.GetRightProgress();
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_52_5 = this.GetRightResourcePointer();
            local_35_2.SetResourcePointPercent();
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_50_5 = this.GetRightResourcePointer();
            if (GetResourcePointPercent() >= 1.0f)
            {
                local_34 = false;
            }
            else
            {
                TEUIModelRef<FVM_SwordSkillResourcePoint> local_50_6 = this.GetRightResourcePointer();
                local_34 = (GetResourcePointPercent() > 0.0f);
            }
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_52_6 = this.GetRightResourcePointer();
            local_34.SetbPointVisible();
        }
        this.RefreshResouceItems();
        return;
    }
    const TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> GetLeftResourceItems() const property
    {
        const TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> GetModify_LeftResourceItems() property
    {
        TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLeftResourceItems(const TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LeftResourceItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> GetRightResourceItems() const property
    {
        const TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> GetModify_RightResourceItems() property
    {
        TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetRightResourceItems(const TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RightResourceItems = __Value;
        return;
    }
    TEUIModelRef<FVM_SwordSkillResourcePoint> GetLeftResourcePointer() const property
    {
        this.TrackPropertyRead(2);
        return this.m_LeftResourcePointer;
    }
    void SetLeftResourcePointer(const TEUIModelRef<FVM_SwordSkillResourcePoint> &inout __Value) property
    {
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_2;
        local_2 = this.m_LeftResourcePointer;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LeftResourcePointer = __Value;
        return;
    }
    TEUIModelRef<FVM_SwordSkillResourcePoint> GetRightResourcePointer() const property
    {
        this.TrackPropertyRead(3);
        return this.m_RightResourcePointer;
    }
    void SetRightResourcePointer(const TEUIModelRef<FVM_SwordSkillResourcePoint> &inout __Value) property
    {
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_2;
        local_2 = this.m_RightResourcePointer;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RightResourcePointer = __Value;
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
    const float32 GetCustomSkillEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetCustomSkillEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_CustomSkillEnergyRatio = __Value;
        return;
    }
    const float32 GetCustomSkillEnergy_2() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_CustomSkillEnergy_2() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetCustomSkillEnergy_2(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CustomSkillEnergy_2 = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyMax_2() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyMax_2() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetCustomSkillEnergyMax_2(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CustomSkillEnergyMax_2 = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyRatio_2() const property
    {
        const float32 __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyRatio_2() property
    {
        float32 __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetCustomSkillEnergyRatio_2(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_CustomSkillEnergyRatio_2 = __Value;
        return;
    }
    bool GetbHasCoreEnergyType() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bHasCoreEnergyType;
    }
    void SetbHasCoreEnergyType(const bool __Value) property
    {
        if (!(this.m_bHasCoreEnergyType) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bHasCoreEnergyType = __Value;
        return;
    }
    bool GetbBanProgress() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bBanProgress;
    }
    void SetbBanProgress(const bool __Value) property
    {
        if (!(this.m_bBanProgress) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bBanProgress = __Value;
        return;
    }
    int GetChargeEnhanceCount() const property
    {
        this.TrackPropertyRead(12);
        return this.m_ChargeEnhanceCount;
    }
    void SetChargeEnhanceCount(const int __Value) property
    {
        if (this.m_ChargeEnhanceCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_ChargeEnhanceCount = __Value;
        return;
    }
    bool GetbFifthItemShow() const property
    {
        this.TrackPropertyRead(13);
        return this.m_bFifthItemShow;
    }
    void SetbFifthItemShow(const bool __Value) property
    {
        if (!(this.m_bFifthItemShow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_bFifthItemShow = __Value;
        return;
    }
    int GetLastChargeEnhanceCount() const property
    {
        this.TrackPropertyRead(14);
        return this.m_LastChargeEnhanceCount;
    }
    void SetLastChargeEnhanceCount(const int __Value) property
    {
        if (this.m_LastChargeEnhanceCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_LastChargeEnhanceCount = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_QiongSkillResourceItem
{
    UPROPERTY()
    float32 ItemPercent;
    UPROPERTY()
    ESlateVisibility ItemOverloadVisibility;
    UPROPERTY()
    ESlateVisibility ItemVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_QiongSkillResourceItem> Self;


}

struct __GeneratedProperties_FVM_QiongSkillResource
{
    UPROPERTY()
    TEUIModelRef<FVM_QiongSkillResourceItem> Left1Item;
    UPROPERTY()
    TEUIModelRef<FVM_QiongSkillResourceItem> Left2Item;
    UPROPERTY()
    TEUIModelRef<FVM_QiongSkillResourceItem> Right1Item;
    UPROPERTY()
    TEUIModelRef<FVM_QiongSkillResourceItem> Right2Item;
    UPROPERTY()
    TEUIModelRef<FVM_QiongSkillResourceItem> Right3Item;
    UPROPERTY()
    TEUIModelRef<FVM_QiongSkillResourceItem> Right4Item;
    UPROPERTY()
    TEUIModelRef<FVM_QiongSkillResourceItem> Right5Item;
    UPROPERTY()
    ESlateVisibility FifthItemShowVisibility;
    UPROPERTY()
    int RightTypeSwitch;
    UPROPERTY()
    int LeftTypeSwitch;
    UPROPERTY()
    ESlateVisibility BanProgress;
    UPROPERTY()
    float32 RightProgress;
    UPROPERTY()
    float32 LeftProgress;
    UPROPERTY()
    float32 RightRawProgress;
    UPROPERTY()
    float32 LeftRawProgress;
    UPROPERTY()
    TEUIModelRef<FVM_QiongSkillResource> Self;


}

namespace FVM_QiongSkillResourceItem
{
FVM_QiongSkillResourceItem& Create(const UObject ContextObject, const float32 Index, const bool bReverseItem)
{
    return FVM_QiongSkillResourceItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Index, bReverseItem);
}
FVM_QiongSkillResourceItem CreateByManager(const UEUIManagerSubsystem Manager, const float32 Index, const bool bReverseItem)
{
    FVM_QiongSkillResourceItem __r;
    TEUIModelRef<FVM_QiongSkillResourceItem> local_6 = TEUIModelRef<FVM_QiongSkillResourceItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_QiongSkillResourceItem::ModelId, 0, Index, bReverseItem));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemOverloadVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_QiongSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_QiongSkillResourceItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_QiongSkillResourceItem;
}
float32 __UIGetter_ItemPercent(const FVM_QiongSkillResourceItem &inout Model)
{
    return Model.GetItemPercent();
}
ESlateVisibility __UIGetter_ItemOverloadVisibility(const FVM_QiongSkillResourceItem &inout Model)
{
    return Model.GetItemOverloadVisibility();
}
ESlateVisibility __UIGetter_ItemVisibility(const FVM_QiongSkillResourceItem &inout Model)
{
    return Model.GetItemVisibility();
}
TEUIModelRef<FVM_QiongSkillResourceItem> __UIGetter_Self(const FVM_QiongSkillResourceItem &inout Model)
{
    return TEUIModelRef<FVM_QiongSkillResourceItem>(Model);
}
int __IndexOf_Index()
{
    return 0;
}
int __IndexOf_bReverseItem()
{
    return 1;
}
int __IndexOf_Percent()
{
    return 2;
}
int __IndexOf_LastPercent()
{
    return 3;
}
int __IndexOf_bStopAllAnim()
{
    return 4;
}
int __IndexOf_bItemVisible()
{
    return 5;
}
int __IndexOf_bOverload()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_QiongSkillResourceItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_QiongSkillResource
{
FVM_QiongSkillResource& Create(const UObject ContextObject)
{
    return FVM_QiongSkillResource::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_QiongSkillResource CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_QiongSkillResource __r;
    TEUIModelRef<FVM_QiongSkillResource> local_6 = TEUIModelRef<FVM_QiongSkillResource>(EUIInternal::MakeModelWithManager(Manager, FVM_QiongSkillResource::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "LeftResourceItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_QiongSkillResourceItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightResourceItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_QiongSkillResourceItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Left1Item";
    local_14.TypeName = "TEUIModelRef<FVM_QiongSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Left2Item";
    local_14.TypeName = "TEUIModelRef<FVM_QiongSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right1Item";
    local_14.TypeName = "TEUIModelRef<FVM_QiongSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right2Item";
    local_14.TypeName = "TEUIModelRef<FVM_QiongSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right3Item";
    local_14.TypeName = "TEUIModelRef<FVM_QiongSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right4Item";
    local_14.TypeName = "TEUIModelRef<FVM_QiongSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right5Item";
    local_14.TypeName = "TEUIModelRef<FVM_QiongSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftResourcePointer";
    local_14.TypeName = "TEUIModelRef<FVM_SwordSkillResourcePoint>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightResourcePointer";
    local_14.TypeName = "TEUIModelRef<FVM_SwordSkillResourcePoint>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FifthItemShowVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightTypeSwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftTypeSwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BanProgress";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightRawProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftRawProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_QiongSkillResource>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_QiongSkillResource;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_QiongSkillResource;
}
void __Tick(FVM_QiongSkillResource &inout Model)
{
    Model.Tick();
    return;
}
TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> __UIGetter_LeftResourceItems(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetLeftResourceItems();
}
TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> __UIGetter_RightResourceItems(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetRightResourceItems();
}
TEUIModelRef<FVM_QiongSkillResourceItem> __UIGetter_Left1Item(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetLeft1Item();
}
TEUIModelRef<FVM_QiongSkillResourceItem> __UIGetter_Left2Item(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetLeft2Item();
}
TEUIModelRef<FVM_QiongSkillResourceItem> __UIGetter_Right1Item(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetRight1Item();
}
TEUIModelRef<FVM_QiongSkillResourceItem> __UIGetter_Right2Item(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetRight2Item();
}
TEUIModelRef<FVM_QiongSkillResourceItem> __UIGetter_Right3Item(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetRight3Item();
}
TEUIModelRef<FVM_QiongSkillResourceItem> __UIGetter_Right4Item(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetRight4Item();
}
TEUIModelRef<FVM_QiongSkillResourceItem> __UIGetter_Right5Item(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetRight5Item();
}
TEUIModelRef<FVM_SwordSkillResourcePoint> __UIGetter_LeftResourcePointer(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetLeftResourcePointer();
}
TEUIModelRef<FVM_SwordSkillResourcePoint> __UIGetter_RightResourcePointer(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetRightResourcePointer();
}
ESlateVisibility __UIGetter_FifthItemShowVisibility(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetFifthItemShowVisibility();
}
int __UIGetter_RightTypeSwitch(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetRightTypeSwitch();
}
int __UIGetter_LeftTypeSwitch(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetLeftTypeSwitch();
}
ESlateVisibility __UIGetter_BanProgress(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetBanProgress();
}
float32 __UIGetter_RightProgress(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetRightProgress();
}
float32 __UIGetter_LeftProgress(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetLeftProgress();
}
float32 __UIGetter_RightRawProgress(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetRightRawProgress();
}
float32 __UIGetter_LeftRawProgress(const FVM_QiongSkillResource &inout Model)
{
    return Model.GetLeftRawProgress();
}
TEUIModelRef<FVM_QiongSkillResource> __UIGetter_Self(const FVM_QiongSkillResource &inout Model)
{
    return TEUIModelRef<FVM_QiongSkillResource>(Model);
}
int __IndexOf_LeftResourceItems()
{
    return 0;
}
int __IndexOf_RightResourceItems()
{
    return 1;
}
int __IndexOf_LeftResourcePointer()
{
    return 2;
}
int __IndexOf_RightResourcePointer()
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
int __IndexOf_CustomSkillEnergyRatio()
{
    return 6;
}
int __IndexOf_CustomSkillEnergy_2()
{
    return 7;
}
int __IndexOf_CustomSkillEnergyMax_2()
{
    return 8;
}
int __IndexOf_CustomSkillEnergyRatio_2()
{
    return 9;
}
int __IndexOf_bHasCoreEnergyType()
{
    return 10;
}
int __IndexOf_bBanProgress()
{
    return 11;
}
int __IndexOf_ChargeEnhanceCount()
{
    return 12;
}
int __IndexOf_bFifthItemShow()
{
    return 13;
}
int __IndexOf_LastChargeEnhanceCount()
{
    return 14;
}
}
namespace __GeneratedProperties_FVM_QiongSkillResource
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
