
namespace FVM_CommonBanner
{
    const int ModelId = 0;

}
struct FVM_CommonBanner : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    FText m_Tips;
    UPROPERTY()
    FSoftBrush m_Icon;
    UPROPERTY()
    bool m_bEnd;
    UPROPERTY()
    EBannerBGType m_BackGroundType;
    UPROPERTY()
    float32 m_TimeForAnimOut;

    FVM_CommonBanner()
    {
        this.m_bEnd = false;
        this.m_BackGroundType = EBannerBGType(0);
        this.m_TimeForAnimOut = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonBanner' by default constructor.");
        return;
    }
    FVM_CommonBanner(const FVM_CommonBanner &inout Other)
    {
        this.m_bEnd = false;
        this.m_BackGroundType = EBannerBGType(0);
        this.m_TimeForAnimOut = 0.0f;
        this.m_Title = Other.m_Title;
        this.m_Tips = Other.m_Tips;
        this.m_Icon = Other.m_Icon;
        this.m_bEnd = Other.m_bEnd;
        this.m_BackGroundType = Other.m_BackGroundType;
        this.m_TimeForAnimOut = Other.m_TimeForAnimOut;
        return;
    }
    FVM_CommonBanner(const FText &inout InTitle, const FText &inout InTips, const FSoftBrush &inout InIcon, const bool InbEnd, const EBannerBGType InBackGroundType)
    {
        this.m_bEnd = false;
        this.m_BackGroundType = EBannerBGType(0);
        this.m_TimeForAnimOut = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTitle(InTitle);
        this.SetTips(InTips);
        this.SetIcon(InIcon);
        this.SetbEnd(InbEnd);
        this.SetBackGroundType(EBannerBGType(InBackGroundType));
        return;
    }
    FVM_CommonBanner opAssign(const FVM_CommonBanner &inout Other)
    {
        FVM_CommonBanner __r;
        this.m_Title = Other.m_Title;
        this.m_Tips = Other.m_Tips;
        this.m_Icon = Other.m_Icon;
        this.m_bEnd = Other.m_bEnd;
        this.m_BackGroundType = Other.m_BackGroundType;
        this.m_TimeForAnimOut = Other.m_TimeForAnimOut;
        return __r;
    }
    ESlateVisibility GetTipsVisibility() const
    {
        int local_2;
        if (this.GetTips().IsEmpty())
        {
            local_2 = 1;
        }
        else
        {
            local_2 = 4;
        }
        return ESlateVisibility(local_2);
    }
    int GetBackGroundIndex() const
    {
        return int(this.GetBackGroundType());
    }
    FText GetTitle() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Title() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Title = __Value;
        return;
    }
    const FText GetTips() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_Tips() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTips(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Tips = __Value;
        return;
    }
    FSoftBrush GetIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSoftBrush GetModify_Icon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Icon = __Value;
        return;
    }
    bool GetbEnd() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bEnd;
    }
    void SetbEnd(const bool __Value) property
    {
        if (!(this.m_bEnd) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bEnd = __Value;
        return;
    }
    EBannerBGType GetBackGroundType() const property
    {
        this.TrackPropertyRead(4);
        return this.m_BackGroundType;
    }
    void SetBackGroundType(const EBannerBGType __Value) property
    {
        if (int(this.m_BackGroundType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_BackGroundType = __Value;
        return;
    }
    const float32 GetTimeForAnimOut() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_TimeForAnimOut() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetTimeForAnimOut(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TimeForAnimOut = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonBanner
{
    UPROPERTY()
    ESlateVisibility TipsVisibility;
    UPROPERTY()
    int BackGroundIndex;
    UPROPERTY()
    TEUIModelRef<FVM_CommonBanner> Self;


}

namespace FVM_CommonBanner
{
FVM_CommonBanner& Create(const UObject ContextObject, const FText &inout Title, const FText &inout Tips, const FSoftBrush &inout Icon, const bool bEnd, const EBannerBGType BackGroundType)
{
    return FVM_CommonBanner::CreateByManager(EUIInternal::GetContextManager(ContextObject), Title, Tips, Icon, bEnd);
}
FVM_CommonBanner CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Title, const FText &inout Tips, const FSoftBrush &inout Icon, const bool bEnd, const EBannerBGType BackGroundType)
{
    FVM_CommonBanner __r;
    TEUIModelRef<FVM_CommonBanner> local_6 = TEUIModelRef<FVM_CommonBanner>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonBanner::ModelId, 0, Title, Tips, Icon, bEnd, BackGroundType));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Tips";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bEnd";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipsVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BackGroundIndex";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonBanner>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonBanner;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonBanner;
}
FText __UIGetter_Title(const FVM_CommonBanner &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Tips(const FVM_CommonBanner &inout Model)
{
    return Model.GetTips();
}
FSoftBrush __UIGetter_Icon(const FVM_CommonBanner &inout Model)
{
    return Model.GetIcon();
}
bool __UIGetter_bEnd(const FVM_CommonBanner &inout Model)
{
    return Model.GetbEnd();
}
ESlateVisibility __UIGetter_TipsVisibility(const FVM_CommonBanner &inout Model)
{
    return Model.GetTipsVisibility();
}
int __UIGetter_BackGroundIndex(const FVM_CommonBanner &inout Model)
{
    return Model.GetBackGroundIndex();
}
TEUIModelRef<FVM_CommonBanner> __UIGetter_Self(const FVM_CommonBanner &inout Model)
{
    return TEUIModelRef<FVM_CommonBanner>(Model);
}
int __IndexOf_Title()
{
    return 0;
}
int __IndexOf_Tips()
{
    return 1;
}
int __IndexOf_Icon()
{
    return 2;
}
int __IndexOf_bEnd()
{
    return 3;
}
int __IndexOf_BackGroundType()
{
    return 4;
}
int __IndexOf_TimeForAnimOut()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_CommonBanner
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
