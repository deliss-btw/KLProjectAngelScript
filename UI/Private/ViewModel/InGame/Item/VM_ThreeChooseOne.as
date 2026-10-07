
namespace FVM_ThreeChooseOne
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnBackgroundClicked = FEUIModelCallbackSignature();

}
struct FVM_ThreeChooseOne : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ThreeChooseOneEntry>> m_ChooseEntries;
    UPROPERTY()
    bool m_bShouldClose;
    UPROPERTY()
    float32 m_AutoClosePageDistance;
    UPROPERTY()
    FEUITimerHandle m_AutoClosePageCheckTimer;
    UPROPERTY()
    FECSEntity m_CheckDistanceEntity;

    FVM_ThreeChooseOne()
    {
        this.m_bShouldClose = false;
        this.m_AutoClosePageDistance = 700.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ThreeChooseOne(const FVM_ThreeChooseOne &inout Other)
    {
        this.m_bShouldClose = false;
        this.m_AutoClosePageDistance = 700.0f;
        this.m_ChooseEntries = Other.m_ChooseEntries;
        this.m_bShouldClose = Other.m_bShouldClose;
        this.m_AutoClosePageDistance = Other.m_AutoClosePageDistance;
        this.m_AutoClosePageCheckTimer = Other.m_AutoClosePageCheckTimer;
        this.m_CheckDistanceEntity = Other.m_CheckDistanceEntity;
        return;
    }
    FVM_ThreeChooseOne& opAssign(const FVM_ThreeChooseOne &inout Other)
    {
        this.m_ChooseEntries = Other.m_ChooseEntries;
        this.m_bShouldClose = Other.m_bShouldClose;
        this.m_AutoClosePageDistance = Other.m_AutoClosePageDistance;
        this.m_AutoClosePageCheckTimer = Other.m_AutoClosePageCheckTimer;
        return Other.m_CheckDistanceEntity;
    }
    void LoadConfig(const FConfigVM_ThreeChooseOne &inout InConfig)
    {
        this.SetAutoClosePageDistance(InConfig.AutoClosePageDistance);
        return;
    }
    void PostConstruct()
    {
        this.ScheduleTick(this.GetModify_AutoClosePageCheckTimer(), n"AutoClosePageCheck", 0.1f, -1.0f);
        return;
    }
    void BeginDestroy()
    {
        this.ClearTimer(this.GetModify_AutoClosePageCheckTimer());
        return;
    }
    void AutoClosePageCheck()
    {
        int local_14 = 0;
        int local_16 = 0;
        if (this.GetbShouldClose())
        {
            return;
        }
        bool local_1 = this.GetContext().GetLocalPlayerPawn().IsValid() && this.GetCheckDistanceEntity().IsValid();
        if (local_1)
        {
            FECSEntity local_6 = this.GetContext().GetLocalPlayerPawn();
            if (!(local_14))
            {
                local_1 = false;
            }
            else
            {
                local_1 = local_16;
            }
            if (local_1)
            {
                if (local_14.GetPosition().DistSquared(local_16.GetPosition()) > (this.GetAutoClosePageDistance() * this.GetAutoClosePageDistance()))
                {
                    this.SetbShouldClose(true);
                }
            }
        }
        return;
    }
    void SetupThreeChooseOneInfo(const FECSEntity &inout ChooseItemEntity)
    {
        const FTraitConfig& local_16;
        FTraitModifiers local_28;
        this.SetCheckDistanceEntity(ChooseItemEntity);
        this.GetModify_ChooseEntries().Reset(0);
        Get local_6;
        const FC_ThreeChooseOneInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            int local_10 = 0;
            for (; local_10 < local_8.GetInfos().Num(); )
            {
                const FTraitParam& local_14 = local_8.GetInfos()[local_10];
                FText local_20;
                if (local_16.ModifiersByLevel.Find(local_14.GetLevel(), local_28))
                {
                    local_20 = local_28.Description;
                }
                TEUIModelRef<FVM_ThreeChooseOneEntry> local_32 = TEUIModelRef<FVM_ThreeChooseOneEntry>(::FVM_ThreeChooseOneEntry::Create(this.GetContext().Manager, local_10));
                ChooseItemEntity.SetChooseItemEntity();
                TEUIModelRef<FVM_ThreeChooseOne>(this).SetVM_Page();
                local_16.TraitName.SetEntryName();
                local_20.SetEntryDesc();
                FSlateBrush local_80 = local_16.TraitIcon.LoadBrush();
                local_80.SetEntryIcon();
                TDataObjectPtr<FItemRarityConfig> local_108 = ::UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(local_16.Rarity));
                local_80.SetEntryTipRarityImage();
                this.GetModify_ChooseEntries().Add(local_32);
                ++local_10;
            }
        }
        return;
    }
    void OnBackgroundClicked()
    {
        this.SetbShouldClose(true);
        return;
    }
    const TArray<TEUIModelRef<FVM_ThreeChooseOneEntry>> GetChooseEntries() const property
    {
        const TArray<TEUIModelRef<FVM_ThreeChooseOneEntry>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ThreeChooseOneEntry>> GetModify_ChooseEntries() property
    {
        TArray<TEUIModelRef<FVM_ThreeChooseOneEntry>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetChooseEntries(const TArray<TEUIModelRef<FVM_ThreeChooseOneEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ChooseEntries = __Value;
        return;
    }
    bool GetbShouldClose() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bShouldClose;
    }
    void SetbShouldClose(const bool __Value) property
    {
        if (!(this.m_bShouldClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bShouldClose = __Value;
        return;
    }
    const float32 GetAutoClosePageDistance() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_AutoClosePageDistance() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAutoClosePageDistance(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AutoClosePageDistance = __Value;
        return;
    }
    const FEUITimerHandle GetAutoClosePageCheckTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUITimerHandle GetModify_AutoClosePageCheckTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAutoClosePageCheckTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AutoClosePageCheckTimer = __Value;
        return;
    }
    const FECSEntity GetCheckDistanceEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FECSEntity GetModify_CheckDistanceEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCheckDistanceEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CheckDistanceEntity = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ThreeChooseOne
{
    UPROPERTY()
    TEUIModelRef<FVM_ThreeChooseOne> Self;

    __GeneratedProperties_FVM_ThreeChooseOne()
    {
        return;
    }
}

namespace FVM_ThreeChooseOne
{
FVM_ThreeChooseOne& Create(const UObject ContextObject)
{
    return FVM_ThreeChooseOne::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ThreeChooseOne CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ThreeChooseOne __r;
    TEUIModelRef<FVM_ThreeChooseOne> local_6 = TEUIModelRef<FVM_ThreeChooseOne>(EUIInternal::MakeModelWithManager(Manager, FVM_ThreeChooseOne::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ChooseEntries";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ThreeChooseOneEntry>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShouldClose";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ThreeChooseOne>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ThreeChooseOne;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ThreeChooseOne;
}
TArray<TEUIModelRef<FVM_ThreeChooseOneEntry>> __UIGetter_ChooseEntries(const FVM_ThreeChooseOne &inout Model)
{
    return Model.GetChooseEntries();
}
bool __UIGetter_bShouldClose(const FVM_ThreeChooseOne &inout Model)
{
    return Model.GetbShouldClose();
}
TEUIModelRef<FVM_ThreeChooseOne> __UIGetter_Self(const FVM_ThreeChooseOne &inout Model)
{
    return TEUIModelRef<FVM_ThreeChooseOne>(Model);
}
int __IndexOf_ChooseEntries()
{
    return 0;
}
int __IndexOf_bShouldClose()
{
    return 1;
}
int __IndexOf_AutoClosePageDistance()
{
    return 2;
}
int __IndexOf_AutoClosePageCheckTimer()
{
    return 3;
}
int __IndexOf_CheckDistanceEntity()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_ThreeChooseOne
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
