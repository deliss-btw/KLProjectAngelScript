
namespace FVM_HeadsUpDisplayItem_Bubble
{
    const int ModelId = 0;

}
struct FVM_HeadsUpDisplayItem_Bubble : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    FText m_BubbleText;
    UPROPERTY()
    TDataObjectPtr<FEmojiData> m_EmojiData;
    UPROPERTY()
    FEUITimerHandle m_BubbleExpireTimer;
    UPROPERTY()
    FFPTime m_BubbleShowDuration;
    UPROPERTY()
    bool m_bShouldShowBubble;

    FVM_HeadsUpDisplayItem_Bubble()
    {
        this.m_BubbleShowDuration = 6.0;
        this.m_bShouldShowBubble = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_HeadsUpDisplayItem_Bubble' by default constructor.");
        return;
    }
    FVM_HeadsUpDisplayItem_Bubble(const FVM_HeadsUpDisplayItem_Bubble &inout Other)
    {
        this.m_BubbleShowDuration = 6.0;
        this.m_bShouldShowBubble = false;
        this.m_Spot = Other.m_Spot;
        this.m_BubbleText = Other.m_BubbleText;
        this.m_EmojiData = Other.m_EmojiData;
        this.m_BubbleExpireTimer = Other.m_BubbleExpireTimer;
        this.m_BubbleShowDuration = Other.m_BubbleShowDuration;
        this.m_bShouldShowBubble = Other.m_bShouldShowBubble;
        return;
    }
    FVM_HeadsUpDisplayItem_Bubble(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        this.m_BubbleShowDuration = 6.0;
        this.m_bShouldShowBubble = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_HeadsUpDisplayItem_Bubble opAssign(const FVM_HeadsUpDisplayItem_Bubble &inout Other)
    {
        FVM_HeadsUpDisplayItem_Bubble __r;
        this.m_Spot = Other.m_Spot;
        this.m_BubbleText = Other.m_BubbleText;
        this.m_EmojiData = Other.m_EmojiData;
        this.m_BubbleExpireTimer = Other.m_BubbleExpireTimer;
        this.m_BubbleShowDuration = Other.m_BubbleShowDuration;
        this.m_bShouldShowBubble = Other.m_bShouldShowBubble;
        return __r;
    }
    void OnHeadBubbleNotify(const FCE_ShowHeadBubble &inout Event)
    {
        if ((!((Event.Sender.GetId() == ::GetOwnerEntityId(this.GetSpot().opArrow())))))
        {
            return;
        }
        this.ShowBubble();
        this.SetBubbleText(FText::FromString(""));
        this.SetEmojiData(TDataObjectPtr<FEmojiData>(nullptr));
        TDataObjectIterator<FEmojiData> local_50;
        for (; local_50; )
        {
            if ((local_50.GetData().GetDataName() == Event.EmojiData))
            {
                this.SetEmojiData(local_50.GetDataPtr());
                break;
            }
            local_50.opPreInc();
        }
        return;
    }
    void OnShowCustomWheelOptionNotify(const FCE_ShowCustomWheelOption &inout Event)
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        FECSEntity local_10 = ::FASCommonUtils::GetUniquePlayerEntity(Event.Sender);
        if ((!((local_10.GetId() == ::GetOwnerEntityId(this.GetSpot().opArrow())))))
        {
            return;
        }
        if (!(Event.OptionConfig.IsSet()))
        {
            return;
        }
        FCustomWheelOptionConfig local_102;
        if (int(local_102.OptionType) != 0)
        {
            return;
        }
        if (!(local_102.GetDefaultEmojiData().IsSet()))
        {
            return;
        }
        this.ShowBubble();
        this.SetBubbleText(FText::FromString(""));
        this.SetEmojiData(local_102.GetDefaultEmojiData());
        return;
    }
    bool ShouldShowBubble() const
    {
        return this.GetbShouldShowBubble();
    }
    void ShowBubble()
    {
        this.SetbShouldShowBubble(true);
        this.ClearTimer(this.GetModify_BubbleExpireTimer());
        this.ScheduleCall(this.GetModify_BubbleExpireTimer(), n"HideBubble", float32(this.GetBubbleShowDuration().ToSeconds()));
        return;
    }
    void HideBubble()
    {
        this.ClearTimer(this.GetModify_BubbleExpireTimer());
        this.SetbShouldShowBubble(false);
        return;
    }
    FSoftBrush GetEmojiIcon() const
    {
        if (this.GetEmojiData())
        {
            return this.GetEmojiData().opArrow().EmojiIconObject;
        }
        return FSoftBrush();
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Spot = __Value;
        return;
    }
    const FText GetBubbleText() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_BubbleText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetBubbleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_BubbleText = __Value;
        return;
    }
    const TDataObjectPtr<FEmojiData> GetEmojiData() const property
    {
        const TDataObjectPtr<FEmojiData> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FEmojiData> GetModify_EmojiData() property
    {
        TDataObjectPtr<FEmojiData> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetEmojiData(const TDataObjectPtr<FEmojiData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_EmojiData = __Value;
        return;
    }
    const FEUITimerHandle GetBubbleExpireTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUITimerHandle GetModify_BubbleExpireTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetBubbleExpireTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_BubbleExpireTimer = __Value;
        return;
    }
    const FFPTime GetBubbleShowDuration() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FFPTime GetModify_BubbleShowDuration() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetBubbleShowDuration(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_BubbleShowDuration = __Value;
        return;
    }
    bool GetbShouldShowBubble() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bShouldShowBubble;
    }
    void SetbShouldShowBubble(const bool __Value) property
    {
        if (!(this.m_bShouldShowBubble) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bShouldShowBubble = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_HeadsUpDisplayItem_Bubble
{
    UPROPERTY()
    bool ShouldShowBubble;
    UPROPERTY()
    FSoftBrush EmojiIcon;
    UPROPERTY()
    TEUIModelRef<FVM_HeadsUpDisplayItem_Bubble> Self;


}

namespace FVM_HeadsUpDisplayItem_Bubble
{
FVM_HeadsUpDisplayItem_Bubble& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_HeadsUpDisplayItem_Bubble::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_HeadsUpDisplayItem_Bubble CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_HeadsUpDisplayItem_Bubble __r;
    TEUIModelRef<FVM_HeadsUpDisplayItem_Bubble> local_6 = TEUIModelRef<FVM_HeadsUpDisplayItem_Bubble>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_HeadsUpDisplayItem_Bubble::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BubbleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EmojiData";
    local_14.TypeName = "TDataObjectPtr<FEmojiData>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowBubble";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EmojiIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_HeadsUpDisplayItem_Bubble>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_HeadsUpDisplayItem_Bubble;
    FEUIModelEventDefine local_22;
    local_22.FunctionName = "__OnHeadBubbleNotify";
    local_22.EventType = FCE_ShowHeadBubble;
    Result.EventFunctions.Add(local_22);
    local_22.FunctionName = "__OnShowCustomWheelOptionNotify";
    local_22.EventType = FCE_ShowCustomWheelOption;
    Result.EventFunctions.Add(local_22);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_HeadsUpDisplayItem_Bubble;
}
void __OnHeadBubbleNotify(FVM_HeadsUpDisplayItem_Bubble &inout Model, const FCE_ShowHeadBubble &inout Event)
{
    Model.OnHeadBubbleNotify(Event);
    return;
}
void __OnShowCustomWheelOptionNotify(FVM_HeadsUpDisplayItem_Bubble &inout Model, const FCE_ShowCustomWheelOption &inout Event)
{
    Model.OnShowCustomWheelOptionNotify(Event);
    return;
}
FText __UIGetter_BubbleText(const FVM_HeadsUpDisplayItem_Bubble &inout Model)
{
    return Model.GetBubbleText();
}
TDataObjectPtr<FEmojiData> __UIGetter_EmojiData(const FVM_HeadsUpDisplayItem_Bubble &inout Model)
{
    return Model.GetEmojiData();
}
bool __UIGetter_ShouldShowBubble(const FVM_HeadsUpDisplayItem_Bubble &inout Model)
{
    return Model.ShouldShowBubble();
}
FSoftBrush __UIGetter_EmojiIcon(const FVM_HeadsUpDisplayItem_Bubble &inout Model)
{
    return Model.GetEmojiIcon();
}
TEUIModelRef<FVM_HeadsUpDisplayItem_Bubble> __UIGetter_Self(const FVM_HeadsUpDisplayItem_Bubble &inout Model)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_Bubble>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_BubbleText()
{
    return 1;
}
int __IndexOf_EmojiData()
{
    return 2;
}
int __IndexOf_BubbleExpireTimer()
{
    return 3;
}
int __IndexOf_BubbleShowDuration()
{
    return 4;
}
int __IndexOf_bShouldShowBubble()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_HeadsUpDisplayItem_Bubble
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
