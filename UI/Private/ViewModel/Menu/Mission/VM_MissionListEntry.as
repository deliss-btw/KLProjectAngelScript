
namespace FVM_MissionListEntry
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnEntryItemClicked = FEUIModelCallbackSignature();

}
struct FVM_MissionListEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FVM_MissionList> m_OwnerList;
    UPROPERTY()
    TDataObjectPtr<FChapterConfig> m_ChapterConfig;
    UPROPERTY()
    TDataObjectPtr<FMissionConfig> m_MissionConfig;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_EntryWidgetClass;
    UPROPERTY()
    FSoftBrush m_HeaderBrush;
    UPROPERTY()
    FSoftBrush m_TrackingIcon;
    UPROPERTY()
    FText m_Category;
    UPROPERTY()
    FText m_SubTitle;
    UPROPERTY()
    bool m_bIsTracking;
    UPROPERTY()
    bool m_bShowCategory;
    UPROPERTY()
    bool m_bShowChapterMission;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;
    UPROPERTY()
    int m_DistanceToTarget;
    UPROPERTY()
    EMissionType m_MissionType;

    FVM_MissionListEntry()
    {
        this.m_bIsTracking = false;
        this.m_bShowCategory = false;
        this.m_bShowChapterMission = false;
        this.m_DistanceToTarget = 0;
        this.m_MissionType = EMissionType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MissionListEntry' by default constructor.");
        return;
    }
    FVM_MissionListEntry(const FVM_MissionListEntry &inout Other)
    {
        this.m_bIsTracking = false;
        this.m_bShowCategory = false;
        this.m_bShowChapterMission = false;
        this.m_DistanceToTarget = 0;
        this.m_MissionType = EMissionType(0);
        this.m_OwnerList = Other.m_OwnerList;
        this.m_ChapterConfig = Other.m_ChapterConfig;
        this.m_MissionConfig = Other.m_MissionConfig;
        this.m_EntryWidgetClass = Other.m_EntryWidgetClass;
        this.m_HeaderBrush = Other.m_HeaderBrush;
        this.m_TrackingIcon = Other.m_TrackingIcon;
        this.m_Category = Other.m_Category;
        this.m_SubTitle = Other.m_SubTitle;
        this.m_bIsTracking = Other.m_bIsTracking;
        this.m_bShowCategory = Other.m_bShowCategory;
        this.m_bShowChapterMission = Other.m_bShowChapterMission;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_DistanceToTarget = int(Other.m_DistanceToTarget);
        this.m_MissionType = Other.m_MissionType;
        return;
    }
    FVM_MissionListEntry(const TEUIModelWeakRef<FVM_MissionList> &inout InOwnerList, const TDataObjectPtr<FChapterConfig> &inout InChapterConfig, const TDataObjectPtr<FMissionConfig> &inout InMissionConfig, const TSoftClassPtr<UEUIUserWidget> &inout InEntryWidgetClass)
    {
        this.m_bIsTracking = false;
        this.m_bShowCategory = false;
        this.m_bShowChapterMission = false;
        this.m_DistanceToTarget = 0;
        this.m_MissionType = EMissionType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetOwnerList(InOwnerList);
        this.SetChapterConfig(InChapterConfig);
        this.SetMissionConfig(InMissionConfig);
        this.SetEntryWidgetClass(InEntryWidgetClass);
        return;
    }
    FVM_MissionListEntry opAssign(const FVM_MissionListEntry &inout Other)
    {
        FVM_MissionListEntry __r;
        this.m_OwnerList = Other.m_OwnerList;
        this.m_ChapterConfig = Other.m_ChapterConfig;
        this.m_MissionConfig = Other.m_MissionConfig;
        this.m_EntryWidgetClass = Other.m_EntryWidgetClass;
        this.m_HeaderBrush = Other.m_HeaderBrush;
        this.m_TrackingIcon = Other.m_TrackingIcon;
        this.m_Category = Other.m_Category;
        this.m_SubTitle = Other.m_SubTitle;
        this.m_bIsTracking = Other.m_bIsTracking;
        this.m_bShowCategory = Other.m_bShowCategory;
        this.m_bShowChapterMission = Other.m_bShowChapterMission;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_DistanceToTarget = int(Other.m_DistanceToTarget);
        this.m_MissionType = Other.m_MissionType;
        return __r;
    }
    void PostConstruct()
    {
        TDataObjectPtr<FMissionPhaseConfig> local_24;
        if (::MissionUtils::GetGuidePresentationConfig(this.GetMissionConfig(), local_24).IsSet())
        {
            FSoftBrush local_120;
            local_120.GetGuideIcon();
            this.SetTrackingIcon(local_120);
            this.InitMissionRedDotVM();
        }
        if (this.GetChapterConfig().IsSet())
        {
            this.SetSubTitle(this.GetChapterConfig().opArrow().ChapterNumber);
        }
        return;
    }
    bool IsSelected() const
    {
        if (!(this.GetOwnerList().IsValid()))
        {
            return false;
        }
        TEUIModelWeakRef<FVM_MissionList> local_2 = this.GetOwnerList();
        TEUIModelRef<FVM_MissionListEntry> local_6;
        local_6.GetSelectedMissionEntry();
        return (local_6 == FEUIModelRef(this));
    }
    FText GetMainTitle() const
    {
        if (this.GetMissionConfig().IsSet())
        {
            return this.GetMissionConfig().opArrow().MissionTitle;
        }
        if (this.GetChapterConfig().IsSet())
        {
            return this.GetChapterConfig().opArrow().ChapterTitle;
        }
        return FText();
    }
    void OnEntryItemClicked()
    {
        if (!(this.GetOwnerList().IsValid()))
        {
            return;
        }
        FEUIModelContainer local_18 = FEUIModelContainer(this);
        TEUIModelWeakRef<FVM_MissionList> local_2 = this.GetOwnerList();
        local_18.OnEntryItemClicked();
        return;
    }
    void ApplyGuideDistance(const int Meters)
    {
        this.SetDistanceToTarget(Meters);
        this.SetSubTitle(FText::Format(NSLOCTEXT("MissionListEntry", "DistanceInfo", "{0} з±і"), Meters));
        return;
    }
    void ApplyGuideLevelName(const FText &inout LevelName)
    {
        this.SetDistanceToTarget(-1);
        this.SetSubTitle(LevelName);
        return;
    }
    void ApplyGuideDefaultText()
    {
        this.SetDistanceToTarget(-1);
        this.SetSubTitle(NSLOCTEXT("MissionListEntry", "GuideDefaultSubTitle", "еѕ…жЋўзґў"));
        return;
    }
    bool IsChapterEntry() const
    {
        return this.GetChapterConfig().IsSet() && !(this.GetMissionConfig().IsSet());
    }
    bool IsMissionEntry() const
    {
        return this.GetMissionConfig().IsSet();
    }
    void ConsumeMissionRedDot()
    {
        if (!(this.GetRedDotVM().IsValid()))
        {
            return;
        }
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(this.GetRedDotVM().opArrow().GetNodeData());
        return;
    }
    void InitMissionRedDotVM()
    {
        int local_4 = 0;
        int local_17 = 0;
        if (!(this.GetMissionConfig().IsSet()))
        {
            return;
        }
        FGameplayTag local_3;
        int local_5 = local_4;
        if (local_5 <= 1)
        {
            if (local_5 != 0)
            {
                if (local_5 != 1)
                {
                }
            }
            else
            {
                local_3 = GameplayTags::RedDotSystem_Mission_NewSideMission;
            }
        }
        FString local_10 = FString();
        this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(local_3, local_17))));
        return;
    }
    TEUIModelWeakRef<FVM_MissionList> GetOwnerList() const property
    {
        this.TrackPropertyRead(0);
        return this.m_OwnerList;
    }
    void SetOwnerList(const TEUIModelWeakRef<FVM_MissionList> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_MissionList> local_2;
        local_2 = this.m_OwnerList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OwnerList = __Value;
        return;
    }
    const TDataObjectPtr<FChapterConfig> GetChapterConfig() const property
    {
        const TDataObjectPtr<FChapterConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FChapterConfig> GetModify_ChapterConfig() property
    {
        TDataObjectPtr<FChapterConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetChapterConfig(const TDataObjectPtr<FChapterConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ChapterConfig = __Value;
        return;
    }
    const TDataObjectPtr<FMissionConfig> GetMissionConfig() const property
    {
        const TDataObjectPtr<FMissionConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FMissionConfig> GetModify_MissionConfig() property
    {
        TDataObjectPtr<FMissionConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetMissionConfig(const TDataObjectPtr<FMissionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MissionConfig = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetEntryWidgetClass() const property
    {
        this.TrackPropertyRead(3);
        return this.m_EntryWidgetClass;
    }
    void SetEntryWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_EntryWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EntryWidgetClass = __Value;
        return;
    }
    const FSoftBrush GetHeaderBrush() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FSoftBrush GetModify_HeaderBrush() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetHeaderBrush(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_HeaderBrush = __Value;
        return;
    }
    const FSoftBrush GetTrackingIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FSoftBrush GetModify_TrackingIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetTrackingIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TrackingIcon = __Value;
        return;
    }
    FText GetCategory() const property
    {
        FText __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FText GetModify_Category() property
    {
        FText __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetCategory(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_Category = __Value;
        return;
    }
    const FText GetSubTitle() const property
    {
        const FText __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FText GetModify_SubTitle() property
    {
        FText __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetSubTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_SubTitle = __Value;
        return;
    }
    bool GetbIsTracking() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bIsTracking;
    }
    void SetbIsTracking(const bool __Value) property
    {
        if (!(this.m_bIsTracking) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bIsTracking = __Value;
        return;
    }
    bool GetbShowCategory() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bShowCategory;
    }
    void SetbShowCategory(const bool __Value) property
    {
        if (!(this.m_bShowCategory) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bShowCategory = __Value;
        return;
    }
    bool GetbShowChapterMission() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bShowChapterMission;
    }
    void SetbShowChapterMission(const bool __Value) property
    {
        if (!(this.m_bShowChapterMission) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bShowChapterMission = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(11);
        return this.m_RedDotVM;
    }
    void SetRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_RedDotVM = __Value;
        return;
    }
    int GetDistanceToTarget() const property
    {
        this.TrackPropertyRead(12);
        return this.m_DistanceToTarget;
    }
    void SetDistanceToTarget(const int __Value) property
    {
        if (this.m_DistanceToTarget == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_DistanceToTarget = __Value;
        return;
    }
    EMissionType GetMissionType() const property
    {
        this.TrackPropertyRead(13);
        return this.m_MissionType;
    }
    void SetMissionType(const EMissionType __Value) property
    {
        if (int(this.m_MissionType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_MissionType = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MissionListEntry
{
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    FText MainTitle;
    UPROPERTY()
    TEUIModelRef<FVM_MissionListEntry> Self;


}

namespace FVM_MissionListEntry
{
FVM_MissionListEntry& Create(const UObject ContextObject, const TEUIModelWeakRef<FVM_MissionList> &inout OwnerList, const TDataObjectPtr<FChapterConfig> &inout ChapterConfig, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const TSoftClassPtr<UEUIUserWidget> &inout EntryWidgetClass)
{
    return FVM_MissionListEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject), OwnerList, ChapterConfig, MissionConfig, EntryWidgetClass);
}
FVM_MissionListEntry CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FVM_MissionList> &inout OwnerList, const TDataObjectPtr<FChapterConfig> &inout ChapterConfig, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const TSoftClassPtr<UEUIUserWidget> &inout EntryWidgetClass)
{
    FVM_MissionListEntry __r;
    TEUIModelRef<FVM_MissionListEntry> local_6 = TEUIModelRef<FVM_MissionListEntry>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MissionListEntry::ModelId, 0, OwnerList, ChapterConfig, MissionConfig, EntryWidgetClass));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EntryWidgetClass";
    local_14.TypeName = "TSoftClassPtr<UEUIUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HeaderBrush";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TrackingIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Category";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsTracking";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowCategory";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowChapterMission";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MissionListEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MissionListEntry;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MissionListEntry;
}
TSoftClassPtr<UEUIUserWidget> __UIGetter_EntryWidgetClass(const FVM_MissionListEntry &inout Model)
{
    return Model.GetEntryWidgetClass();
}
FSoftBrush __UIGetter_HeaderBrush(const FVM_MissionListEntry &inout Model)
{
    return Model.GetHeaderBrush();
}
FSoftBrush __UIGetter_TrackingIcon(const FVM_MissionListEntry &inout Model)
{
    return Model.GetTrackingIcon();
}
FText __UIGetter_Category(const FVM_MissionListEntry &inout Model)
{
    return Model.GetCategory();
}
FText __UIGetter_SubTitle(const FVM_MissionListEntry &inout Model)
{
    return Model.GetSubTitle();
}
bool __UIGetter_bIsTracking(const FVM_MissionListEntry &inout Model)
{
    return Model.GetbIsTracking();
}
bool __UIGetter_bShowCategory(const FVM_MissionListEntry &inout Model)
{
    return Model.GetbShowCategory();
}
bool __UIGetter_bShowChapterMission(const FVM_MissionListEntry &inout Model)
{
    return Model.GetbShowChapterMission();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_MissionListEntry &inout Model)
{
    return Model.GetRedDotVM();
}
bool __UIGetter_IsSelected(const FVM_MissionListEntry &inout Model)
{
    return Model.IsSelected();
}
FText __UIGetter_MainTitle(const FVM_MissionListEntry &inout Model)
{
    return Model.GetMainTitle();
}
TEUIModelRef<FVM_MissionListEntry> __UIGetter_Self(const FVM_MissionListEntry &inout Model)
{
    return TEUIModelRef<FVM_MissionListEntry>(Model);
}
int __IndexOf_OwnerList()
{
    return 0;
}
int __IndexOf_ChapterConfig()
{
    return 1;
}
int __IndexOf_MissionConfig()
{
    return 2;
}
int __IndexOf_EntryWidgetClass()
{
    return 3;
}
int __IndexOf_HeaderBrush()
{
    return 4;
}
int __IndexOf_TrackingIcon()
{
    return 5;
}
int __IndexOf_Category()
{
    return 6;
}
int __IndexOf_SubTitle()
{
    return 7;
}
int __IndexOf_bIsTracking()
{
    return 8;
}
int __IndexOf_bShowCategory()
{
    return 9;
}
int __IndexOf_bShowChapterMission()
{
    return 10;
}
int __IndexOf_RedDotVM()
{
    return 11;
}
int __IndexOf_DistanceToTarget()
{
    return 12;
}
int __IndexOf_MissionType()
{
    return 13;
}
}
namespace __GeneratedProperties_FVM_MissionListEntry
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
