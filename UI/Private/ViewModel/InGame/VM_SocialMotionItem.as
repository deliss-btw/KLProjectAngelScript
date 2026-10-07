
namespace FVM_SocialMotionItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnButtonClicked = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ShowHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HideHover = FEUIModelCallbackSignature();

}
struct FVM_SocialMotionItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EMotionType m_Type;
    UPROPERTY()
    TDataObjectPtr<FMotionData> m_Data;
    UPROPERTY()
    bool m_IsLock;
    UPROPERTY()
    ESlateVisibility m_LockVisibility;
    UPROPERTY()
    ESlateVisibility m_EdgeVisibility;
    UPROPERTY()
    FCommonHoverHandle m_HoverHandle;
    UPROPERTY()
    FEUIModelRef m_TooltipModel;

    FVM_SocialMotionItem()
    {
        this.m_Type = EMotionType(0);
        this.m_IsLock = false;
        this.m_LockVisibility = ESlateVisibility(2);
        this.m_EdgeVisibility = ESlateVisibility(2);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SocialMotionItem' by default constructor.");
        return;
    }
    FVM_SocialMotionItem(const FVM_SocialMotionItem &inout Other)
    {
        this.m_Type = EMotionType(0);
        this.m_IsLock = false;
        this.m_LockVisibility = ESlateVisibility(2);
        this.m_EdgeVisibility = ESlateVisibility(2);
        this.m_Type = Other.m_Type;
        this.m_Data = Other.m_Data;
        this.m_IsLock = Other.m_IsLock;
        this.m_LockVisibility = Other.m_LockVisibility;
        this.m_EdgeVisibility = Other.m_EdgeVisibility;
        this.m_TooltipModel = Other.m_TooltipModel;
        return;
    }
    FVM_SocialMotionItem(const EMotionType InType, const TDataObjectPtr<FMotionData> &inout InData, const bool InIsLock)
    {
        this.m_Type = EMotionType(0);
        this.m_IsLock = false;
        this.m_LockVisibility = ESlateVisibility(2);
        this.m_EdgeVisibility = ESlateVisibility(2);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetType(EMotionType(InType));
        this.SetData(InData);
        this.SetIsLock(InIsLock);
        return;
    }
    FVM_SocialMotionItem& opAssign(const FVM_SocialMotionItem &inout Other)
    {
        this.m_Type = Other.m_Type;
        this.m_Data = Other.m_Data;
        this.m_IsLock = Other.m_IsLock;
        this.m_LockVisibility = Other.m_LockVisibility;
        this.m_EdgeVisibility = Other.m_EdgeVisibility;
        return Other.m_TooltipModel;
    }
    void PostConstruct()
    {
        this.SetTooltipModel(FEUIModelRef());
        if (int(this.GetData().opArrow().ShowType) == 0)
        {
            if (this.GetIsLock())
            {
                this.SetLockVisibility(ESlateVisibility(0));
            }
        }
        return;
    }
    void OnButtonClicked()
    {
        if (this.GetIsLock())
        {
            return;
        }
        ::FSocialUtils::PlaySocialAction(FECSEntity(this.GetContext().GetLocalPlayerPawn()), FECSEntity(this.GetContext().GetLocalPlayer()), this.GetData());
        return;
    }
    void ShowNoTargetHint()
    {
        ::MessageHintUtils::ShowMessageHint(FECSEntity(this.GetContext().GetLocalPlayer()), ::UCombatGlobalSettings::Get().NoSocialTargetHint, TArray<FTextArgument>());
        return;
    }
    void ShowHover(const UWidget Widget)
    {
        if (!(this.GetIsLock()))
        {
            return;
        }
        this.SetHoverHandle(::CommonPopup::HoverCustom(Widget, ::UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Dev/UI/UMG/Social/UI_LockHover.UI_LockHover"), FEUIModelContainer(this.GetTooltipModel()), false, true, ECommonHoverLayout(0), EEUILayoutLayer(0), false));
        return;
    }
    void HideHover()
    {
        ::CommonPopup::CloseHover(this.GetHoverHandle(), this.GetManager(), true);
        return;
    }
    FText GetName() const
    {
        // body not fully recovered вЂ” stub [no-return]
        FText __r; return __r;
    }
    UTexture2D GetActionIcon() const
    {
        FSlateBrush local_44;
        UObject local_46 = local_44.ResourceObject;
        return Cast<UTexture2D>(local_46);
    }
    EMotionType GetType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Type;
    }
    void SetType(const EMotionType __Value) property
    {
        if (int(this.m_Type) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Type = __Value;
        return;
    }
    const TDataObjectPtr<FMotionData> GetData() const property
    {
        const TDataObjectPtr<FMotionData> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FMotionData> GetModify_Data() property
    {
        TDataObjectPtr<FMotionData> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetData(const TDataObjectPtr<FMotionData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Data = __Value;
        return;
    }
    bool GetIsLock() const property
    {
        this.TrackPropertyRead(2);
        return this.m_IsLock;
    }
    void SetIsLock(const bool __Value) property
    {
        if (!(this.m_IsLock) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_IsLock = __Value;
        return;
    }
    ESlateVisibility GetLockVisibility() const property
    {
        this.TrackPropertyRead(3);
        return this.m_LockVisibility;
    }
    void SetLockVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_LockVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_LockVisibility = __Value;
        return;
    }
    ESlateVisibility GetEdgeVisibility() const property
    {
        this.TrackPropertyRead(4);
        return this.m_EdgeVisibility;
    }
    void SetEdgeVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_EdgeVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_EdgeVisibility = __Value;
        return;
    }
    const FCommonHoverHandle GetHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FCommonHoverHandle GetModify_HoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        return;
    }
    const FEUIModelRef GetTooltipModel() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FEUIModelRef GetModify_TooltipModel() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetTooltipModel(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_TooltipModel = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SocialMotionItem
{
    UPROPERTY()
    FText Name;
    UPROPERTY()
    UTexture2D ActionIcon = nullptr;
    UPROPERTY()
    TEUIModelRef<FVM_SocialMotionItem> Self;

    __GeneratedProperties_FVM_SocialMotionItem()
    {
        return;
    }
}

namespace FVM_SocialMotionItem
{
FVM_SocialMotionItem Create(const UObject ContextObject, const EMotionType Type, const TDataObjectPtr<FMotionData> &inout Data, const bool IsLock)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FVM_SocialMotionItem __r; return __r;
}
FVM_SocialMotionItem CreateByManager(const UEUIManagerSubsystem Manager, const EMotionType Type, const TDataObjectPtr<FMotionData> &inout Data, const bool IsLock)
{
    FVM_SocialMotionItem __r;
    TEUIModelRef<FVM_SocialMotionItem> local_6 = TEUIModelRef<FVM_SocialMotionItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SocialMotionItem::ModelId, 0, Type, Data, IsLock));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "IsLock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LockVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EdgeVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Name";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActionIcon";
    local_14.TypeName = "UTexture2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SocialMotionItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SocialMotionItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SocialMotionItem;
}
bool __UIGetter_IsLock(const FVM_SocialMotionItem &inout Model)
{
    return Model.GetIsLock();
}
ESlateVisibility __UIGetter_LockVisibility(const FVM_SocialMotionItem &inout Model)
{
    return Model.GetLockVisibility();
}
ESlateVisibility __UIGetter_EdgeVisibility(const FVM_SocialMotionItem &inout Model)
{
    return Model.GetEdgeVisibility();
}
FText __UIGetter_Name(const FVM_SocialMotionItem &inout Model)
{
    return Model.GetName();
}
UTexture2D __UIGetter_ActionIcon(const FVM_SocialMotionItem &inout Model)
{
    return Model.GetActionIcon();
}
TEUIModelRef<FVM_SocialMotionItem> __UIGetter_Self(const FVM_SocialMotionItem &inout Model)
{
    return TEUIModelRef<FVM_SocialMotionItem>(Model);
}
int __IndexOf_Type()
{
    return 0;
}
int __IndexOf_Data()
{
    return 1;
}
int __IndexOf_IsLock()
{
    return 2;
}
int __IndexOf_LockVisibility()
{
    return 3;
}
int __IndexOf_EdgeVisibility()
{
    return 4;
}
int __IndexOf_HoverHandle()
{
    return 5;
}
int __IndexOf_TooltipModel()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_SocialMotionItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
