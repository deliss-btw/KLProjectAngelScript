
namespace FVM_SwordSkillResourceItem
{
    const int ModelId = 0;
}
namespace FVM_SwordSkillResourcePoint
{
    const int ModelId = 0;
}
namespace FVM_SwordSkillResource
{
    const int ModelId = 0;

}
struct FVM_SwordSkillResourceItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_Index;
    UPROPERTY()
    float32 m_Percent;
    UPROPERTY()
    float32 m_LastPercent;

    FVM_SwordSkillResourceItem()
    {
        this.m_Index = 0.0f;
        this.m_Percent = 0.0f;
        this.m_LastPercent = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SwordSkillResourceItem' by default constructor.");
        return;
    }
    FVM_SwordSkillResourceItem(const FVM_SwordSkillResourceItem &inout Other)
    {
        this.m_Index = 0.0f;
        this.m_Percent = 0.0f;
        this.m_LastPercent = 0.0f;
        this.m_Index = Other.m_Index;
        this.m_Percent = Other.m_Percent;
        this.m_LastPercent = Other.m_LastPercent;
        return;
    }
    FVM_SwordSkillResourceItem(const float32 InIndex)
    {
        this.m_Index = 0.0f;
        this.m_Percent = 0.0f;
        this.m_LastPercent = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndex(InIndex);
        return;
    }
    FVM_SwordSkillResourceItem opAssign(const FVM_SwordSkillResourceItem &inout Other)
    {
        FVM_SwordSkillResourceItem __r;
        this.m_Index = Other.m_Index;
        this.m_Percent = Other.m_Percent;
        this.m_LastPercent = Other.m_LastPercent;
        return __r;
    }
    float32 GetItemPercent() const
    {
        return this.GetPercent();
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
    float32 GetPercent() const property
    {
        float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_Percent() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Percent = __Value;
        return;
    }
    const float32 GetLastPercent() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_LastPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetLastPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LastPercent = __Value;
        return;
    }
}

struct FVM_SwordSkillResourcePoint : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bInverseAnimPlay;
    UPROPERTY()
    float32 m_ResourcePointPercent;
    UPROPERTY()
    float32 m_LastResourcePointPercent;
    UPROPERTY()
    bool m_bPointVisible;
    UPROPERTY()
    float32 m_ConsumeAnimChangeThreshold;

    FVM_SwordSkillResourcePoint()
    {
        this.m_ResourcePointPercent = 0.0f;
        this.m_bInverseAnimPlay = false;
        this.m_LastResourcePointPercent = 0.0f;
        this.m_bPointVisible = true;
        this.m_ConsumeAnimChangeThreshold = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SwordSkillResourcePoint(const FVM_SwordSkillResourcePoint &inout Other)
    {
        this.m_ResourcePointPercent = 0.0f;
        this.m_bInverseAnimPlay = false;
        this.m_LastResourcePointPercent = 0.0f;
        this.m_bPointVisible = true;
        this.m_ConsumeAnimChangeThreshold = 0.0f;
        this.m_bInverseAnimPlay = Other.m_bInverseAnimPlay;
        this.m_ResourcePointPercent = Other.m_ResourcePointPercent;
        this.m_LastResourcePointPercent = Other.m_LastResourcePointPercent;
        this.m_bPointVisible = Other.m_bPointVisible;
        this.m_ConsumeAnimChangeThreshold = Other.m_ConsumeAnimChangeThreshold;
        return;
    }
    FVM_SwordSkillResourcePoint opAssign(const FVM_SwordSkillResourcePoint &inout Other)
    {
        FVM_SwordSkillResourcePoint __r;
        this.m_bInverseAnimPlay = Other.m_bInverseAnimPlay;
        this.m_ResourcePointPercent = Other.m_ResourcePointPercent;
        this.m_LastResourcePointPercent = Other.m_LastResourcePointPercent;
        this.m_bPointVisible = Other.m_bPointVisible;
        this.m_ConsumeAnimChangeThreshold = Other.m_ConsumeAnimChangeThreshold;
        return __r;
    }
    float32 GetPointPercent() const
    {
        return this.GetResourcePointPercent();
    }
    bool GetbInverseAnimPlay() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bInverseAnimPlay;
    }
    void SetbInverseAnimPlay(const bool __Value) property
    {
        if (!(this.m_bInverseAnimPlay) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bInverseAnimPlay = __Value;
        return;
    }
    const float32 GetResourcePointPercent() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_ResourcePointPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetResourcePointPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ResourcePointPercent = __Value;
        return;
    }
    const float32 GetLastResourcePointPercent() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_LastResourcePointPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetLastResourcePointPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LastResourcePointPercent = __Value;
        return;
    }
    bool GetbPointVisible() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bPointVisible;
    }
    void SetbPointVisible(const bool __Value) property
    {
        if (!(this.m_bPointVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bPointVisible = __Value;
        return;
    }
    const float32 GetConsumeAnimChangeThreshold() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_ConsumeAnimChangeThreshold() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetConsumeAnimChangeThreshold(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ConsumeAnimChangeThreshold = __Value;
        return;
    }
}

struct FVM_SwordSkillResource : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_SwordSkillResourcePoint> m_ResourcePoint;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_SwordSkillResourceItem>> m_CurrentResourceItems;
    UPROPERTY()
    float32 m_CustomSkillEnergy;
    UPROPERTY()
    float32 m_CustomSkillEnergyMax;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    int m_CurrentMaxItems;
    UPROPERTY()
    int m_SuperSwitch;
    UPROPERTY()
    int m_FoundationIndex;
    UPROPERTY()
    bool m_bSecondSlotFull;
    UPROPERTY()
    bool m_bLastSecondSlotFull;
    UPROPERTY()
    bool m_bFourthSlotFull;
    UPROPERTY()
    bool m_bLastFourthSlotFull;

    FVM_SwordSkillResource()
    {
        this.m_CustomSkillEnergy = 0.0f;
        this.m_CustomSkillEnergyMax = 0.0f;
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_CurrentMaxItems = 5;
        this.m_SuperSwitch = 0;
        this.m_FoundationIndex = 1;
        this.m_bSecondSlotFull = false;
        this.m_bLastSecondSlotFull = false;
        this.m_bFourthSlotFull = false;
        this.m_bLastFourthSlotFull = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SwordSkillResource(const FVM_SwordSkillResource &inout Other)
    {
        this.m_CustomSkillEnergy = 0.0f;
        this.m_CustomSkillEnergyMax = 0.0f;
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_CurrentMaxItems = 5;
        this.m_SuperSwitch = 0;
        this.m_FoundationIndex = 1;
        this.m_bSecondSlotFull = false;
        this.m_bLastSecondSlotFull = false;
        this.m_bFourthSlotFull = false;
        this.m_bLastFourthSlotFull = false;
        this.m_ResourcePoint = Other.m_ResourcePoint;
        this.m_CurrentResourceItems = Other.m_CurrentResourceItems;
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CurrentMaxItems = int(Other.m_CurrentMaxItems);
        this.m_SuperSwitch = int(Other.m_SuperSwitch);
        this.m_FoundationIndex = int(Other.m_FoundationIndex);
        this.m_bSecondSlotFull = Other.m_bSecondSlotFull;
        this.m_bLastSecondSlotFull = Other.m_bLastSecondSlotFull;
        this.m_bFourthSlotFull = Other.m_bFourthSlotFull;
        this.m_bLastFourthSlotFull = Other.m_bLastFourthSlotFull;
        return;
    }
    FVM_SwordSkillResource opAssign(const FVM_SwordSkillResource &inout Other)
    {
        FVM_SwordSkillResource __r;
        this.m_ResourcePoint = Other.m_ResourcePoint;
        this.m_CurrentResourceItems = Other.m_CurrentResourceItems;
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CurrentMaxItems = int(Other.m_CurrentMaxItems);
        this.m_SuperSwitch = int(Other.m_SuperSwitch);
        this.m_FoundationIndex = int(Other.m_FoundationIndex);
        this.m_bSecondSlotFull = Other.m_bSecondSlotFull;
        this.m_bLastSecondSlotFull = Other.m_bLastSecondSlotFull;
        this.m_bFourthSlotFull = Other.m_bFourthSlotFull;
        this.m_bLastFourthSlotFull = Other.m_bLastFourthSlotFull;
        return __r;
    }
    void InitResourceItems()
    {
        this.SetResourcePoint(TEUIModelRef<FVM_SwordSkillResourcePoint>(::FVM_SwordSkillResourcePoint::Create(this.GetContext().Manager)));
        float32 local_3 = 0.05f;
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_2 = this.GetResourcePoint();
        local_3.SetConsumeAnimChangeThreshold();
        this.GetModify_CurrentResourceItems().Empty(0);
        int local_5 = 0;
        for (; local_5 < this.GetCurrentMaxItems(); )
        {
            this.GetModify_CurrentResourceItems().Add(TEUIModelRef<FVM_SwordSkillResourceItem>(::FVM_SwordSkillResourceItem::Create(this.GetContext().Manager, local_5)));
            ++local_5;
        }
        return;
    }
    void RefreshResouceItems()
    {
        float32 local_7;
        FVM_SwordSkillResourceItem& local_10;
        bool local_13;
        bool local_14;
        int local_16 = 0;
        if (this.GetCurrentMaxItems() > 0)
        {
            local_7 = this.GetCustomSkillEnergyMax() / this.GetCurrentMaxItems();
        }
        else
        {
            local_7 = 0.0f;
        }
        int local_8 = 0;
        for (; local_8 < this.GetCurrentResourceItems().Num(); ++local_8)
        {
            local_10.SetLastPercent(local_10.GetPercent());
            if (local_7 <= 0.0f)
            {
                local_10.SetPercent(0.0f);
                continue;
            }
            float32 local_1 = local_8 * local_7;
            local_10.SetPercent(FMath::Clamp(((this.GetCustomSkillEnergy() - local_1) / local_7), 0.0f, 1.0f));
        }
        this.SetbLastSecondSlotFull(this.GetbSecondSlotFull());
        this.SetbLastFourthSlotFull(this.GetbFourthSlotFull());
        if (this.GetCurrentResourceItems().Num() > 1)
        {
            local_14 = (GetPercent() >= 1.0f);
        }
        else
        {
            local_14 = false;
        }
        this.SetbSecondSlotFull(local_14);
        if (this.GetCurrentResourceItems().Num() > 3)
        {
            local_13 = (GetPercent() >= 1.0f);
        }
        else
        {
            local_13 = false;
        }
        this.SetbFourthSlotFull(local_13);
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_18 = this.GetResourcePoint();
        local_16.SetLastResourcePointPercent(local_16.GetResourcePointPercent());
        local_16.SetResourcePointPercent(this.GetCustomSkillEnergyRatio());
        local_16.SetbPointVisible((this.GetCustomSkillEnergyRatio() < 1.0f));
        return;
    }
    void PostConstruct()
    {
        this.InitResourceItems();
        return;
    }
    void Tick()
    {
        float32 local_28;
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            return;
        }
        if (!(ECS::GetECSWorld().IsValid()))
        {
            return;
        }
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        Get local_14;
        bool local_5 = local_14.opCall().HasAttribute(Attribute::CustomSkillEnergy);
        if (local_5)
        {
            this.SetCustomSkillEnergyMax(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue()));
            this.SetCustomSkillEnergy(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue()));
            if (this.GetCustomSkillEnergyMax() != 0.0f)
            {
                local_28 = this.GetCustomSkillEnergy() / this.GetCustomSkillEnergyMax();
            }
            else
            {
                local_28 = 0.0f;
            }
            this.SetCustomSkillEnergyRatio(local_28);
            local_28 = 20.0f;
            float32 local_27 = this.GetCustomSkillEnergyMax() / local_28;
            this.SetCurrentMaxItems(FMath::Max(5, uint(local_27)));
            if (this.GetCurrentMaxItems() != this.GetCurrentResourceItems().Num())
            {
                this.InitResourceItems();
            }
            this.RefreshResouceItems();
        }
        FNameHandle_EntityBBVar local_36;
        local_36;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_36))
        {
            FNameHandle_EntityBBVarInt local_40;
            local_40;
            this.SetSuperSwitch(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_40));
        }
        local_36;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_36))
        {
            FNameHandle_EntityBBVarInt local_40;
            local_40;
            this.SetFoundationIndex(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_40));
        }
        return;
    }
    TEUIModelRef<FVM_SwordSkillResourcePoint> GetResourcePoint() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ResourcePoint;
    }
    void SetResourcePoint(const TEUIModelRef<FVM_SwordSkillResourcePoint> &inout __Value) property
    {
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_2;
        local_2 = this.m_ResourcePoint;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ResourcePoint = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_SwordSkillResourceItem>> GetCurrentResourceItems() const property
    {
        const TArray<TEUIModelRef<FVM_SwordSkillResourceItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_SwordSkillResourceItem>> GetModify_CurrentResourceItems() property
    {
        TArray<TEUIModelRef<FVM_SwordSkillResourceItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCurrentResourceItems(const TArray<TEUIModelRef<FVM_SwordSkillResourceItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentResourceItems = __Value;
        return;
    }
    const float32 GetCustomSkillEnergy() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_CustomSkillEnergy() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCustomSkillEnergy(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CustomSkillEnergy = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyMax() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyMax() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCustomSkillEnergyMax(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CustomSkillEnergyMax = __Value;
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
    int GetCurrentMaxItems() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CurrentMaxItems;
    }
    void SetCurrentMaxItems(const int __Value) property
    {
        if (this.m_CurrentMaxItems == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CurrentMaxItems = __Value;
        return;
    }
    int GetSuperSwitch() const property
    {
        this.TrackPropertyRead(6);
        return this.m_SuperSwitch;
    }
    void SetSuperSwitch(const int __Value) property
    {
        if (this.m_SuperSwitch == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SuperSwitch = __Value;
        return;
    }
    int GetFoundationIndex() const property
    {
        this.TrackPropertyRead(7);
        return this.m_FoundationIndex;
    }
    void SetFoundationIndex(const int __Value) property
    {
        if (this.m_FoundationIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_FoundationIndex = __Value;
        return;
    }
    bool GetbSecondSlotFull() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bSecondSlotFull;
    }
    void SetbSecondSlotFull(const bool __Value) property
    {
        if (!(this.m_bSecondSlotFull) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bSecondSlotFull = __Value;
        return;
    }
    bool GetbLastSecondSlotFull() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bLastSecondSlotFull;
    }
    void SetbLastSecondSlotFull(const bool __Value) property
    {
        if (!(this.m_bLastSecondSlotFull) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bLastSecondSlotFull = __Value;
        return;
    }
    bool GetbFourthSlotFull() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bFourthSlotFull;
    }
    void SetbFourthSlotFull(const bool __Value) property
    {
        if (!(this.m_bFourthSlotFull) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bFourthSlotFull = __Value;
        return;
    }
    bool GetbLastFourthSlotFull() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bLastFourthSlotFull;
    }
    void SetbLastFourthSlotFull(const bool __Value) property
    {
        if (!(this.m_bLastFourthSlotFull) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bLastFourthSlotFull = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SwordSkillResourceItem
{
    UPROPERTY()
    float32 ItemPercent;
    UPROPERTY()
    TEUIModelRef<FVM_SwordSkillResourceItem> Self;


}

struct __GeneratedProperties_FVM_SwordSkillResourcePoint
{
    UPROPERTY()
    float32 PointPercent;
    UPROPERTY()
    TEUIModelRef<FVM_SwordSkillResourcePoint> Self;


}

struct __GeneratedProperties_FVM_SwordSkillResource
{
    UPROPERTY()
    TEUIModelRef<FVM_SwordSkillResource> Self;

    __GeneratedProperties_FVM_SwordSkillResource()
    {
        return;
    }
}

namespace FVM_SwordSkillResourceItem
{
FVM_SwordSkillResourceItem& Create(const UObject ContextObject, const float32 Index)
{
    return FVM_SwordSkillResourceItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Index);
}
FVM_SwordSkillResourceItem CreateByManager(const UEUIManagerSubsystem Manager, const float32 Index)
{
    FVM_SwordSkillResourceItem __r;
    TEUIModelRef<FVM_SwordSkillResourceItem> local_6 = TEUIModelRef<FVM_SwordSkillResourceItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SwordSkillResourceItem::ModelId, 0, Index));
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
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SwordSkillResourceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SwordSkillResourceItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SwordSkillResourceItem;
}
float32 __UIGetter_ItemPercent(const FVM_SwordSkillResourceItem &inout Model)
{
    return Model.GetItemPercent();
}
TEUIModelRef<FVM_SwordSkillResourceItem> __UIGetter_Self(const FVM_SwordSkillResourceItem &inout Model)
{
    return TEUIModelRef<FVM_SwordSkillResourceItem>(Model);
}
int __IndexOf_Index()
{
    return 0;
}
int __IndexOf_Percent()
{
    return 1;
}
int __IndexOf_LastPercent()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_SwordSkillResourceItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_SwordSkillResourcePoint
{
FVM_SwordSkillResourcePoint& Create(const UObject ContextObject)
{
    return FVM_SwordSkillResourcePoint::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SwordSkillResourcePoint CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SwordSkillResourcePoint __r;
    TEUIModelRef<FVM_SwordSkillResourcePoint> local_6 = TEUIModelRef<FVM_SwordSkillResourcePoint>(EUIInternal::MakeModelWithManager(Manager, FVM_SwordSkillResourcePoint::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PointPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SwordSkillResourcePoint>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SwordSkillResourcePoint;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SwordSkillResourcePoint;
}
float32 __UIGetter_PointPercent(const FVM_SwordSkillResourcePoint &inout Model)
{
    return Model.GetPointPercent();
}
TEUIModelRef<FVM_SwordSkillResourcePoint> __UIGetter_Self(const FVM_SwordSkillResourcePoint &inout Model)
{
    return TEUIModelRef<FVM_SwordSkillResourcePoint>(Model);
}
int __IndexOf_bInverseAnimPlay()
{
    return 0;
}
int __IndexOf_ResourcePointPercent()
{
    return 1;
}
int __IndexOf_LastResourcePointPercent()
{
    return 2;
}
int __IndexOf_bPointVisible()
{
    return 3;
}
int __IndexOf_ConsumeAnimChangeThreshold()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_SwordSkillResourcePoint
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_SwordSkillResource
{
FVM_SwordSkillResource& Create(const UObject ContextObject)
{
    return FVM_SwordSkillResource::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SwordSkillResource CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SwordSkillResource __r;
    TEUIModelRef<FVM_SwordSkillResource> local_6 = TEUIModelRef<FVM_SwordSkillResource>(EUIInternal::MakeModelWithManager(Manager, FVM_SwordSkillResource::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ResourcePoint";
    local_14.TypeName = "TEUIModelRef<FVM_SwordSkillResourcePoint>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentResourceItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_SwordSkillResourceItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SwordSkillResource>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SwordSkillResource;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SwordSkillResource;
}
void __Tick(FVM_SwordSkillResource &inout Model)
{
    Model.Tick();
    return;
}
TEUIModelRef<FVM_SwordSkillResourcePoint> __UIGetter_ResourcePoint(const FVM_SwordSkillResource &inout Model)
{
    return Model.GetResourcePoint();
}
TArray<TEUIModelRef<FVM_SwordSkillResourceItem>> __UIGetter_CurrentResourceItems(const FVM_SwordSkillResource &inout Model)
{
    return Model.GetCurrentResourceItems();
}
TEUIModelRef<FVM_SwordSkillResource> __UIGetter_Self(const FVM_SwordSkillResource &inout Model)
{
    return TEUIModelRef<FVM_SwordSkillResource>(Model);
}
int __IndexOf_ResourcePoint()
{
    return 0;
}
int __IndexOf_CurrentResourceItems()
{
    return 1;
}
int __IndexOf_CustomSkillEnergy()
{
    return 2;
}
int __IndexOf_CustomSkillEnergyMax()
{
    return 3;
}
int __IndexOf_CustomSkillEnergyRatio()
{
    return 4;
}
int __IndexOf_CurrentMaxItems()
{
    return 5;
}
int __IndexOf_SuperSwitch()
{
    return 6;
}
int __IndexOf_FoundationIndex()
{
    return 7;
}
int __IndexOf_bSecondSlotFull()
{
    return 8;
}
int __IndexOf_bLastSecondSlotFull()
{
    return 9;
}
int __IndexOf_bFourthSlotFull()
{
    return 10;
}
int __IndexOf_bLastFourthSlotFull()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_SwordSkillResource
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
