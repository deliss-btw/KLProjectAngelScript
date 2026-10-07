
namespace FVM_ThreeChooseOneEntry
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClickEntry = FEUIModelCallbackSignature();

}
struct FVM_ThreeChooseOneEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    FText m_EntryName;
    UPROPERTY()
    FText m_EntryDesc;
    UPROPERTY()
    FSlateBrush m_EntryIcon;
    UPROPERTY()
    FLinearColor m_EntryColor;
    UPROPERTY()
    FSlateBrush m_EntryTipRarityImage;
    UPROPERTY()
    bool m_bIsHovered;
    UPROPERTY()
    FECSEntity m_ChooseItemEntity;
    UPROPERTY()
    TEUIModelRef<FVM_ThreeChooseOne> m_VM_Page;

    FVM_ThreeChooseOneEntry()
    {
        this.m_Index = 0;
        this.m_bIsHovered = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ThreeChooseOneEntry' by default constructor.");
        return;
    }
    FVM_ThreeChooseOneEntry(const FVM_ThreeChooseOneEntry &inout Other)
    {
        this.m_Index = 0;
        this.m_bIsHovered = false;
        this.m_Index = int(Other.m_Index);
        this.m_EntryName = Other.m_EntryName;
        this.m_EntryDesc = Other.m_EntryDesc;
        this.m_EntryIcon = Other.m_EntryIcon;
        this.m_EntryColor = Other.m_EntryColor;
        this.m_EntryTipRarityImage = Other.m_EntryTipRarityImage;
        this.m_bIsHovered = Other.m_bIsHovered;
        this.m_ChooseItemEntity = Other.m_ChooseItemEntity;
        this.m_VM_Page = Other.m_VM_Page;
        return;
    }
    FVM_ThreeChooseOneEntry(const int InIndex)
    {
        this.m_Index = 0;
        this.m_bIsHovered = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndex(InIndex);
        return;
    }
    FVM_ThreeChooseOneEntry& opAssign(const FVM_ThreeChooseOneEntry &inout Other)
    {
        this.m_Index = int(Other.m_Index);
        this.m_EntryName = Other.m_EntryName;
        this.m_EntryDesc = Other.m_EntryDesc;
        this.m_EntryIcon = Other.m_EntryIcon;
        this.m_EntryColor = Other.m_EntryColor;
        this.m_EntryTipRarityImage = Other.m_EntryTipRarityImage;
        this.m_bIsHovered = Other.m_bIsHovered;
        this.m_ChooseItemEntity = Other.m_ChooseItemEntity;
        return Other.m_VM_Page;
    }
    void PostConstruct()
    {
        return;
    }
    void OnClickEntry()
    {
        Get local_4;
        if (local_4.opCall())
        {
            FCE_ThreeChooseOneRequest local_22;
            FFPTime local_18 = FFPTime(-1);
            FECSEntity local_12 = this.GetContext().GetLocalPlayerPawn();
            local_22.ChooseItemEntity = this.GetChooseItemEntity();
            local_22.ChooseIndex = this.GetIndex();
        }
        if (this.GetVM_Page())
        {
            TEUIModelRef<FVM_ThreeChooseOne> local_24 = this.GetVM_Page();
            true.SetbShouldClose();
        }
        return;
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
    const FText GetEntryName() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_EntryName() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEntryName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EntryName = __Value;
        return;
    }
    const FText GetEntryDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_EntryDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetEntryDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_EntryDesc = __Value;
        return;
    }
    const FSlateBrush GetEntryIcon() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FSlateBrush GetModify_EntryIcon() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEntryIcon(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EntryIcon = __Value;
        return;
    }
    const FLinearColor GetEntryColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FLinearColor GetModify_EntryColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetEntryColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_EntryColor = __Value;
        return;
    }
    const FSlateBrush GetEntryTipRarityImage() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FSlateBrush GetModify_EntryTipRarityImage() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetEntryTipRarityImage(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_EntryTipRarityImage = __Value;
        return;
    }
    bool GetbIsHovered() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bIsHovered;
    }
    void SetbIsHovered(const bool __Value) property
    {
        if (!(this.m_bIsHovered) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bIsHovered = __Value;
        return;
    }
    const FECSEntity GetChooseItemEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FECSEntity GetModify_ChooseItemEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetChooseItemEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ChooseItemEntity = __Value;
        return;
    }
    TEUIModelRef<FVM_ThreeChooseOne> GetVM_Page() const property
    {
        this.TrackPropertyRead(8);
        return this.m_VM_Page;
    }
    void SetVM_Page(const TEUIModelRef<FVM_ThreeChooseOne> &inout __Value) property
    {
        TEUIModelRef<FVM_ThreeChooseOne> local_2;
        local_2 = this.m_VM_Page;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_VM_Page = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ThreeChooseOneEntry
{
    UPROPERTY()
    TEUIModelRef<FVM_ThreeChooseOneEntry> Self;

    __GeneratedProperties_FVM_ThreeChooseOneEntry()
    {
        return;
    }
}

namespace FVM_ThreeChooseOneEntry
{
FVM_ThreeChooseOneEntry& Create(const UObject ContextObject, const int Index)
{
    return FVM_ThreeChooseOneEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject), Index);
}
FVM_ThreeChooseOneEntry CreateByManager(const UEUIManagerSubsystem Manager, const int Index)
{
    FVM_ThreeChooseOneEntry __r;
    TEUIModelRef<FVM_ThreeChooseOneEntry> local_6 = TEUIModelRef<FVM_ThreeChooseOneEntry>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ThreeChooseOneEntry::ModelId, 0, Index));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EntryName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EntryDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EntryIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EntryColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EntryTipRarityImage";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsHovered";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ThreeChooseOneEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ThreeChooseOneEntry;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ThreeChooseOneEntry;
}
FText __UIGetter_EntryName(const FVM_ThreeChooseOneEntry &inout Model)
{
    return Model.GetEntryName();
}
FText __UIGetter_EntryDesc(const FVM_ThreeChooseOneEntry &inout Model)
{
    return Model.GetEntryDesc();
}
FSlateBrush __UIGetter_EntryIcon(const FVM_ThreeChooseOneEntry &inout Model)
{
    return Model.GetEntryIcon();
}
FLinearColor __UIGetter_EntryColor(const FVM_ThreeChooseOneEntry &inout Model)
{
    return Model.GetEntryColor();
}
FSlateBrush __UIGetter_EntryTipRarityImage(const FVM_ThreeChooseOneEntry &inout Model)
{
    return Model.GetEntryTipRarityImage();
}
bool __UIGetter_bIsHovered(const FVM_ThreeChooseOneEntry &inout Model)
{
    return Model.GetbIsHovered();
}
TEUIModelRef<FVM_ThreeChooseOneEntry> __UIGetter_Self(const FVM_ThreeChooseOneEntry &inout Model)
{
    return TEUIModelRef<FVM_ThreeChooseOneEntry>(Model);
}
int __IndexOf_Index()
{
    return 0;
}
int __IndexOf_EntryName()
{
    return 1;
}
int __IndexOf_EntryDesc()
{
    return 2;
}
int __IndexOf_EntryIcon()
{
    return 3;
}
int __IndexOf_EntryColor()
{
    return 4;
}
int __IndexOf_EntryTipRarityImage()
{
    return 5;
}
int __IndexOf_bIsHovered()
{
    return 6;
}
int __IndexOf_ChooseItemEntity()
{
    return 7;
}
int __IndexOf_VM_Page()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_ThreeChooseOneEntry
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
