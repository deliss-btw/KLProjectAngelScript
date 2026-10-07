
namespace FVM_WizardSkillResourceStarItem
{
    const int ModelId = 0;
}
namespace FVM_WizardSkillResource
{
    const int ModelId = 0;

}
struct FVM_WizardSkillResourceStarItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    int m_MagicUseCount;
    UPROPERTY()
    int m_LastFrameMagicUseCount;
    UPROPERTY()
    int m_MaxMagicUseCount;

    FVM_WizardSkillResourceStarItem()
    {
        this.m_Index = 0;
        this.m_MagicUseCount = 0;
        this.m_LastFrameMagicUseCount = 0;
        this.m_MaxMagicUseCount = 3;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_WizardSkillResourceStarItem' by default constructor.");
        return;
    }
    FVM_WizardSkillResourceStarItem(const FVM_WizardSkillResourceStarItem &inout Other)
    {
        this.m_Index = 0;
        this.m_MagicUseCount = 0;
        this.m_LastFrameMagicUseCount = 0;
        this.m_MaxMagicUseCount = 3;
        this.m_Index = int(Other.m_Index);
        this.m_MagicUseCount = int(Other.m_MagicUseCount);
        this.m_LastFrameMagicUseCount = int(Other.m_LastFrameMagicUseCount);
        this.m_MaxMagicUseCount = int(Other.m_MaxMagicUseCount);
        return;
    }
    FVM_WizardSkillResourceStarItem(const int InIndex)
    {
        this.m_Index = 0;
        this.m_MagicUseCount = 0;
        this.m_LastFrameMagicUseCount = 0;
        this.m_MaxMagicUseCount = 3;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndex(InIndex);
        return;
    }
    FVM_WizardSkillResourceStarItem opAssign(const FVM_WizardSkillResourceStarItem &inout Other)
    {
        FVM_WizardSkillResourceStarItem __r;
        this.m_Index = int(Other.m_Index);
        this.m_MagicUseCount = int(Other.m_MagicUseCount);
        this.m_LastFrameMagicUseCount = int(Other.m_LastFrameMagicUseCount);
        this.m_MaxMagicUseCount = int(Other.m_MaxMagicUseCount);
        return __r;
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
    int GetMagicUseCount() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MagicUseCount;
    }
    void SetMagicUseCount(const int __Value) property
    {
        if (this.m_MagicUseCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MagicUseCount = __Value;
        return;
    }
    int GetLastFrameMagicUseCount() const property
    {
        this.TrackPropertyRead(2);
        return this.m_LastFrameMagicUseCount;
    }
    void SetLastFrameMagicUseCount(const int __Value) property
    {
        if (this.m_LastFrameMagicUseCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LastFrameMagicUseCount = __Value;
        return;
    }
    int GetMaxMagicUseCount() const property
    {
        this.TrackPropertyRead(3);
        return this.m_MaxMagicUseCount;
    }
    void SetMaxMagicUseCount(const int __Value) property
    {
        if (this.m_MaxMagicUseCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MaxMagicUseCount = __Value;
        return;
    }
}

struct FVM_WizardSkillResource : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_SwordSkillResourcePoint> m_ResourcePointer;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_WizardSkillResourceStarItem>> m_Stars;
    UPROPERTY()
    TEUIModelRef<FVM_WizardSkillResourceStarItem> m_Star0;
    UPROPERTY()
    TEUIModelRef<FVM_WizardSkillResourceStarItem> m_Star1;
    UPROPERTY()
    TEUIModelRef<FVM_WizardSkillResourceStarItem> m_Star2;
    UPROPERTY()
    TEUIModelRef<FVM_WizardSkillResourceStarItem> m_Star3;
    UPROPERTY()
    TEUIModelRef<FVM_WizardSkillResourceStarItem> m_Star4;
    UPROPERTY()
    float32 m_CustomSkillEnergy;
    UPROPERTY()
    float32 m_CustomSkillEnergyMax;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    int m_CurrentMaxStarsCount;
    UPROPERTY()
    int m_MagicUseCount;
    UPROPERTY()
    int m_LastFrameMagicUseCount;

    FVM_WizardSkillResource()
    {
        this.m_CustomSkillEnergy = 0.0f;
        this.m_CustomSkillEnergyMax = 0.0f;
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_CurrentMaxStarsCount = 3;
        this.m_MagicUseCount = 0;
        this.m_LastFrameMagicUseCount = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_WizardSkillResource(const FVM_WizardSkillResource &inout Other)
    {
        this.m_CustomSkillEnergy = 0.0f;
        this.m_CustomSkillEnergyMax = 0.0f;
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_CurrentMaxStarsCount = 3;
        this.m_MagicUseCount = 0;
        this.m_LastFrameMagicUseCount = 0;
        this.m_ResourcePointer = Other.m_ResourcePointer;
        this.m_Stars = Other.m_Stars;
        this.m_Star0 = Other.m_Star0;
        this.m_Star1 = Other.m_Star1;
        this.m_Star2 = Other.m_Star2;
        this.m_Star3 = Other.m_Star3;
        this.m_Star4 = Other.m_Star4;
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CurrentMaxStarsCount = int(Other.m_CurrentMaxStarsCount);
        this.m_MagicUseCount = int(Other.m_MagicUseCount);
        this.m_LastFrameMagicUseCount = int(Other.m_LastFrameMagicUseCount);
        return;
    }
    FVM_WizardSkillResource opAssign(const FVM_WizardSkillResource &inout Other)
    {
        FVM_WizardSkillResource __r;
        this.m_ResourcePointer = Other.m_ResourcePointer;
        this.m_Stars = Other.m_Stars;
        this.m_Star0 = Other.m_Star0;
        this.m_Star1 = Other.m_Star1;
        this.m_Star2 = Other.m_Star2;
        this.m_Star3 = Other.m_Star3;
        this.m_Star4 = Other.m_Star4;
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CurrentMaxStarsCount = int(Other.m_CurrentMaxStarsCount);
        this.m_MagicUseCount = int(Other.m_MagicUseCount);
        this.m_LastFrameMagicUseCount = int(Other.m_LastFrameMagicUseCount);
        return __r;
    }
    float32 GetMainPercent() const
    {
        return this.GetCustomSkillEnergyRatio();
    }
    ESlateVisibility GetPoint1Visibility() const
    {
        int local_4;
        if (this.GetCurrentMaxStarsCount() >= 1)
        {
            local_4 = 3;
        }
        else
        {
            local_4 = 1;
        }
        return ESlateVisibility(local_4);
    }
    ESlateVisibility GetPoint2Visibility() const
    {
        int local_4;
        if (this.GetCurrentMaxStarsCount() >= 2)
        {
            local_4 = 3;
        }
        else
        {
            local_4 = 1;
        }
        return ESlateVisibility(local_4);
    }
    ESlateVisibility GetPoint3Visibility() const
    {
        int local_4;
        if (this.GetCurrentMaxStarsCount() >= 3)
        {
            local_4 = 3;
        }
        else
        {
            local_4 = 1;
        }
        return ESlateVisibility(local_4);
    }
    ESlateVisibility GetPoint4Visibility() const
    {
        int local_4;
        if (this.GetCurrentMaxStarsCount() >= 4)
        {
            local_4 = 3;
        }
        else
        {
            local_4 = 1;
        }
        return ESlateVisibility(local_4);
    }
    ESlateVisibility GetPoint5Visibility() const
    {
        int local_4;
        if (this.GetCurrentMaxStarsCount() >= 5)
        {
            local_4 = 3;
        }
        else
        {
            local_4 = 1;
        }
        return ESlateVisibility(local_4);
    }
    void InitStars()
    {
        int local_1 = 5;
        int local_3 = 0;
        for (; local_3 < 5; )
        {
            this.GetModify_Stars().Add(TEUIModelRef<FVM_WizardSkillResourceStarItem>(::FVM_WizardSkillResourceStarItem::Create(this.GetContext().Manager, local_3)));
            ++local_3;
        }
        this.SetStar0(this.GetStars()[0]);
        this.SetStar1(this.GetStars()[1]);
        this.SetStar2(this.GetStars()[2]);
        this.SetStar3(this.GetStars()[3]);
        this.SetStar4(this.GetStars()[4]);
        return;
    }
    void PostConstruct()
    {
        this.SetResourcePointer(TEUIModelRef<FVM_SwordSkillResourcePoint>(::FVM_SwordSkillResourcePoint::Create(this.GetContext().Manager)));
        float32 local_3 = 0.0f;
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_2 = this.GetResourcePointer();
        local_3.SetConsumeAnimChangeThreshold();
        this.InitStars();
        return;
    }
    void Tick()
    {
        float32 local_24;
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
            this.SetCustomSkillEnergyMax(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue()));
            this.SetCustomSkillEnergy(FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue()));
            if (this.GetCustomSkillEnergyMax() != 0.0f)
            {
                local_24 = this.GetCustomSkillEnergy() / this.GetCustomSkillEnergyMax();
            }
            else
            {
                local_24 = 0.0f;
            }
            this.SetCustomSkillEnergyRatio(local_24);
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_26 = this.GetResourcePointer();
            this.GetCustomSkillEnergyRatio().SetResourcePointPercent();
            bool local_22 = (this.GetCustomSkillEnergyRatio() < 1.0f);
            TEUIModelRef<FVM_SwordSkillResourcePoint> local_26_2 = this.GetResourcePointer();
            local_22.SetbPointVisible();
        }
        this.SetLastFrameMagicUseCount(this.GetMagicUseCount());
        FNameHandle_EntityBBVar local_32;
        local_32;
        if (this.GetContext().GetLocalPlayerPawn().HasEntityBB(local_32))
        {
            FNameHandle_EntityBBVarInt local_36;
            local_36;
            this.SetMagicUseCount(this.GetContext().GetLocalPlayerPawn().GetBB_Int(local_36));
        }
        int local_37 = 0;
        for (; local_37 < this.GetCurrentMaxStarsCount(); )
        {
            this.GetLastFrameMagicUseCount().SetLastFrameMagicUseCount();
            this.GetMagicUseCount().SetMagicUseCount();
            this.GetCurrentMaxStarsCount().SetMaxMagicUseCount();
            ++local_37;
        }
        return;
    }
    TEUIModelRef<FVM_SwordSkillResourcePoint> GetResourcePointer() const property
    {
        this.TrackPropertyRead(0);
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
        this.MarkPropertyDirty(0);
        this.m_ResourcePointer = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_WizardSkillResourceStarItem>> GetStars() const property
    {
        const TArray<TEUIModelRef<FVM_WizardSkillResourceStarItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_WizardSkillResourceStarItem>> GetModify_Stars() property
    {
        TArray<TEUIModelRef<FVM_WizardSkillResourceStarItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetStars(const TArray<TEUIModelRef<FVM_WizardSkillResourceStarItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Stars = __Value;
        return;
    }
    TEUIModelRef<FVM_WizardSkillResourceStarItem> GetStar0() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Star0;
    }
    void SetStar0(const TEUIModelRef<FVM_WizardSkillResourceStarItem> &inout __Value) property
    {
        TEUIModelRef<FVM_WizardSkillResourceStarItem> local_2;
        local_2 = this.m_Star0;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Star0 = __Value;
        return;
    }
    TEUIModelRef<FVM_WizardSkillResourceStarItem> GetStar1() const property
    {
        this.TrackPropertyRead(3);
        return this.m_Star1;
    }
    void SetStar1(const TEUIModelRef<FVM_WizardSkillResourceStarItem> &inout __Value) property
    {
        TEUIModelRef<FVM_WizardSkillResourceStarItem> local_2;
        local_2 = this.m_Star1;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Star1 = __Value;
        return;
    }
    TEUIModelRef<FVM_WizardSkillResourceStarItem> GetStar2() const property
    {
        this.TrackPropertyRead(4);
        return this.m_Star2;
    }
    void SetStar2(const TEUIModelRef<FVM_WizardSkillResourceStarItem> &inout __Value) property
    {
        TEUIModelRef<FVM_WizardSkillResourceStarItem> local_2;
        local_2 = this.m_Star2;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Star2 = __Value;
        return;
    }
    TEUIModelRef<FVM_WizardSkillResourceStarItem> GetStar3() const property
    {
        this.TrackPropertyRead(5);
        return this.m_Star3;
    }
    void SetStar3(const TEUIModelRef<FVM_WizardSkillResourceStarItem> &inout __Value) property
    {
        TEUIModelRef<FVM_WizardSkillResourceStarItem> local_2;
        local_2 = this.m_Star3;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Star3 = __Value;
        return;
    }
    TEUIModelRef<FVM_WizardSkillResourceStarItem> GetStar4() const property
    {
        this.TrackPropertyRead(6);
        return this.m_Star4;
    }
    void SetStar4(const TEUIModelRef<FVM_WizardSkillResourceStarItem> &inout __Value) property
    {
        TEUIModelRef<FVM_WizardSkillResourceStarItem> local_2;
        local_2 = this.m_Star4;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_Star4 = __Value;
        return;
    }
    const float32 GetCustomSkillEnergy() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_CustomSkillEnergy() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetCustomSkillEnergy(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CustomSkillEnergy = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyMax() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyMax() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetCustomSkillEnergyMax(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CustomSkillEnergyMax = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetCustomSkillEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_CustomSkillEnergyRatio = __Value;
        return;
    }
    int GetCurrentMaxStarsCount() const property
    {
        this.TrackPropertyRead(10);
        return this.m_CurrentMaxStarsCount;
    }
    void SetCurrentMaxStarsCount(const int __Value) property
    {
        if (this.m_CurrentMaxStarsCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_CurrentMaxStarsCount = __Value;
        return;
    }
    int GetMagicUseCount() const property
    {
        this.TrackPropertyRead(11);
        return this.m_MagicUseCount;
    }
    void SetMagicUseCount(const int __Value) property
    {
        if (this.m_MagicUseCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_MagicUseCount = __Value;
        return;
    }
    int GetLastFrameMagicUseCount() const property
    {
        this.TrackPropertyRead(12);
        return this.m_LastFrameMagicUseCount;
    }
    void SetLastFrameMagicUseCount(const int __Value) property
    {
        if (this.m_LastFrameMagicUseCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_LastFrameMagicUseCount = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_WizardSkillResourceStarItem
{
    UPROPERTY()
    TEUIModelRef<FVM_WizardSkillResourceStarItem> Self;

    __GeneratedProperties_FVM_WizardSkillResourceStarItem()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_WizardSkillResource
{
    UPROPERTY()
    float32 MainPercent;
    UPROPERTY()
    ESlateVisibility Point1Visibility;
    UPROPERTY()
    ESlateVisibility Point2Visibility;
    UPROPERTY()
    ESlateVisibility Point3Visibility;
    UPROPERTY()
    ESlateVisibility Point4Visibility;
    UPROPERTY()
    ESlateVisibility Point5Visibility;
    UPROPERTY()
    TEUIModelRef<FVM_WizardSkillResource> Self;


}

namespace FVM_WizardSkillResourceStarItem
{
FVM_WizardSkillResourceStarItem& Create(const UObject ContextObject, const int Index)
{
    return FVM_WizardSkillResourceStarItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Index);
}
FVM_WizardSkillResourceStarItem CreateByManager(const UEUIManagerSubsystem Manager, const int Index)
{
    FVM_WizardSkillResourceStarItem __r;
    TEUIModelRef<FVM_WizardSkillResourceStarItem> local_6 = TEUIModelRef<FVM_WizardSkillResourceStarItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_WizardSkillResourceStarItem::ModelId, 0, Index));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_WizardSkillResourceStarItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_WizardSkillResourceStarItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_WizardSkillResourceStarItem;
}
TEUIModelRef<FVM_WizardSkillResourceStarItem> __UIGetter_Self(const FVM_WizardSkillResourceStarItem &inout Model)
{
    return TEUIModelRef<FVM_WizardSkillResourceStarItem>(Model);
}
int __IndexOf_Index()
{
    return 0;
}
int __IndexOf_MagicUseCount()
{
    return 1;
}
int __IndexOf_LastFrameMagicUseCount()
{
    return 2;
}
int __IndexOf_MaxMagicUseCount()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_WizardSkillResourceStarItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_WizardSkillResource
{
FVM_WizardSkillResource& Create(const UObject ContextObject)
{
    return FVM_WizardSkillResource::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_WizardSkillResource CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_WizardSkillResource __r;
    TEUIModelRef<FVM_WizardSkillResource> local_6 = TEUIModelRef<FVM_WizardSkillResource>(EUIInternal::MakeModelWithManager(Manager, FVM_WizardSkillResource::ModelId));
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
    local_14.PropertyName = "Star0";
    local_14.TypeName = "TEUIModelRef<FVM_WizardSkillResourceStarItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Star1";
    local_14.TypeName = "TEUIModelRef<FVM_WizardSkillResourceStarItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Star2";
    local_14.TypeName = "TEUIModelRef<FVM_WizardSkillResourceStarItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Star3";
    local_14.TypeName = "TEUIModelRef<FVM_WizardSkillResourceStarItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Star4";
    local_14.TypeName = "TEUIModelRef<FVM_WizardSkillResourceStarItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Point1Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Point2Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Point3Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Point4Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Point5Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_WizardSkillResource>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_WizardSkillResource;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_WizardSkillResource;
}
void __Tick(FVM_WizardSkillResource &inout Model)
{
    Model.Tick();
    return;
}
TEUIModelRef<FVM_SwordSkillResourcePoint> __UIGetter_ResourcePointer(const FVM_WizardSkillResource &inout Model)
{
    return Model.GetResourcePointer();
}
TEUIModelRef<FVM_WizardSkillResourceStarItem> __UIGetter_Star0(const FVM_WizardSkillResource &inout Model)
{
    return Model.GetStar0();
}
TEUIModelRef<FVM_WizardSkillResourceStarItem> __UIGetter_Star1(const FVM_WizardSkillResource &inout Model)
{
    return Model.GetStar1();
}
TEUIModelRef<FVM_WizardSkillResourceStarItem> __UIGetter_Star2(const FVM_WizardSkillResource &inout Model)
{
    return Model.GetStar2();
}
TEUIModelRef<FVM_WizardSkillResourceStarItem> __UIGetter_Star3(const FVM_WizardSkillResource &inout Model)
{
    return Model.GetStar3();
}
TEUIModelRef<FVM_WizardSkillResourceStarItem> __UIGetter_Star4(const FVM_WizardSkillResource &inout Model)
{
    return Model.GetStar4();
}
float32 __UIGetter_MainPercent(const FVM_WizardSkillResource &inout Model)
{
    return Model.GetMainPercent();
}
ESlateVisibility __UIGetter_Point1Visibility(const FVM_WizardSkillResource &inout Model)
{
    return Model.GetPoint1Visibility();
}
ESlateVisibility __UIGetter_Point2Visibility(const FVM_WizardSkillResource &inout Model)
{
    return Model.GetPoint2Visibility();
}
ESlateVisibility __UIGetter_Point3Visibility(const FVM_WizardSkillResource &inout Model)
{
    return Model.GetPoint3Visibility();
}
ESlateVisibility __UIGetter_Point4Visibility(const FVM_WizardSkillResource &inout Model)
{
    return Model.GetPoint4Visibility();
}
ESlateVisibility __UIGetter_Point5Visibility(const FVM_WizardSkillResource &inout Model)
{
    return Model.GetPoint5Visibility();
}
TEUIModelRef<FVM_WizardSkillResource> __UIGetter_Self(const FVM_WizardSkillResource &inout Model)
{
    return TEUIModelRef<FVM_WizardSkillResource>(Model);
}
int __IndexOf_ResourcePointer()
{
    return 0;
}
int __IndexOf_Stars()
{
    return 1;
}
int __IndexOf_Star0()
{
    return 2;
}
int __IndexOf_Star1()
{
    return 3;
}
int __IndexOf_Star2()
{
    return 4;
}
int __IndexOf_Star3()
{
    return 5;
}
int __IndexOf_Star4()
{
    return 6;
}
int __IndexOf_CustomSkillEnergy()
{
    return 7;
}
int __IndexOf_CustomSkillEnergyMax()
{
    return 8;
}
int __IndexOf_CustomSkillEnergyRatio()
{
    return 9;
}
int __IndexOf_CurrentMaxStarsCount()
{
    return 10;
}
int __IndexOf_MagicUseCount()
{
    return 11;
}
int __IndexOf_LastFrameMagicUseCount()
{
    return 12;
}
}
namespace __GeneratedProperties_FVM_WizardSkillResource
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
