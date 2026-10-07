
namespace FVM_MissionInfoTitle
{
    const int ModelId = 0;

}
struct FVM_MissionInfoTitle : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    bool m_bHasTimer;
    UPROPERTY()
    FSoftBrush m_CustomIconBrush;
    UPROPERTY()
    bool m_bShowTimer;
    UPROPERTY()
    FFPTime m_EndTime;
    UPROPERTY()
    FMW_CounterDown m_RemainCounterDown;
    UPROPERTY()
    bool m_bPlayIn;
    UPROPERTY()
    bool m_bHide;
    UPROPERTY()
    bool m_bCheckHide;
    UPROPERTY()
    bool m_Visiable;

    FVM_MissionInfoTitle()
    {
        this.m_bHasTimer = false;
        this.m_bShowTimer = false;
        this.m_bPlayIn = false;
        this.m_bHide = false;
        this.m_bCheckHide = false;
        this.m_Visiable = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MissionInfoTitle' by default constructor.");
        return;
    }
    FVM_MissionInfoTitle(const FVM_MissionInfoTitle &inout Other)
    {
        this.m_bHasTimer = false;
        this.m_bShowTimer = false;
        this.m_bPlayIn = false;
        this.m_bHide = false;
        this.m_bCheckHide = false;
        this.m_Visiable = false;
        this.m_Title = Other.m_Title;
        this.m_bHasTimer = Other.m_bHasTimer;
        this.m_CustomIconBrush = Other.m_CustomIconBrush;
        this.m_bShowTimer = Other.m_bShowTimer;
        this.m_EndTime = Other.m_EndTime;
        this.m_RemainCounterDown = Other.m_RemainCounterDown;
        this.m_bPlayIn = Other.m_bPlayIn;
        this.m_bHide = Other.m_bHide;
        this.m_bCheckHide = Other.m_bCheckHide;
        this.m_Visiable = Other.m_Visiable;
        return;
    }
    FVM_MissionInfoTitle(const FText &inout InTitle, const bool InbHasTimer, const FSoftBrush &inout InCustomIconBrush, const bool InbShowTimer)
    {
        this.m_bHasTimer = false;
        this.m_bShowTimer = false;
        this.m_bPlayIn = false;
        this.m_bHide = false;
        this.m_bCheckHide = false;
        this.m_Visiable = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTitle(InTitle);
        this.SetbHasTimer(InbHasTimer);
        this.SetCustomIconBrush(InCustomIconBrush);
        this.SetbShowTimer(InbShowTimer);
        return;
    }
    FVM_MissionInfoTitle opAssign(const FVM_MissionInfoTitle &inout Other)
    {
        FVM_MissionInfoTitle __r;
        this.m_Title = Other.m_Title;
        this.m_bHasTimer = Other.m_bHasTimer;
        this.m_CustomIconBrush = Other.m_CustomIconBrush;
        this.m_bShowTimer = Other.m_bShowTimer;
        this.m_EndTime = Other.m_EndTime;
        this.m_RemainCounterDown = Other.m_RemainCounterDown;
        this.m_bPlayIn = Other.m_bPlayIn;
        this.m_bHide = Other.m_bHide;
        this.m_bCheckHide = Other.m_bCheckHide;
        this.m_Visiable = Other.m_Visiable;
        return __r;
    }
    void RefreshRemainCounterDown()
    {
        if (!(this.GetbHasTimer()))
        {
            return;
        }
        this.GetModify_RemainCounterDown().SetRemainedTimeWithPrecision(FFPTime(FMath::Max((FFPTime(this.GetEndTime()) - this.GetContext().Time).ToSeconds(), 0.0)), EMWCounterDownPrecision(0));
        return;
    }
    FTimespan GetRemainTimer() const
    {
        return FTimespan::FromSeconds(this.GetRemainCounterDown().GetRemainedTime().ToSeconds());
    }
    bool bShowTimerTileText() const
    {
        return this.GetbHasTimer() && this.GetbShowTimer();
    }
    int bTimeShot() const
    {
        if (this.GetbHasTimer())
        {
            if (this.GetRemainCounterDown().GetRemainedTime().ToSeconds() < 60.0)
            {
                return 1;
            }
            return 0;
        }
        return 0;
    }
    void PostConstruct()
    {
        this.SetbPlayIn(true);
        this.SetbHide(false);
        this.SetVisiable(true);
        this.SetbCheckHide(true);
        this.ContentChange();
        return;
    }
    void ContentChange()
    {
        if (this.GetTitle().IsEmpty())
        {
            this.SetbCheckHide(false);
            this.SetbHide(true);
            return;
        }
        this.SetbHide(false);
        this.SetVisiable(true);
        return;
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
    bool GetbHasTimer() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bHasTimer;
    }
    void SetbHasTimer(const bool __Value) property
    {
        if (!(this.m_bHasTimer) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bHasTimer = __Value;
        return;
    }
    const FSoftBrush GetCustomIconBrush() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSoftBrush GetModify_CustomIconBrush() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCustomIconBrush(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CustomIconBrush = __Value;
        return;
    }
    bool GetbShowTimer() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bShowTimer;
    }
    void SetbShowTimer(const bool __Value) property
    {
        if (!(this.m_bShowTimer) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bShowTimer = __Value;
        return;
    }
    FFPTime GetEndTime() const property
    {
        FFPTime __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FFPTime GetModify_EndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_EndTime = __Value;
        return;
    }
    const FMW_CounterDown GetRemainCounterDown() const property
    {
        const FMW_CounterDown __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FMW_CounterDown GetModify_RemainCounterDown() property
    {
        FMW_CounterDown __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetRemainCounterDown(const FMW_CounterDown &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_RemainCounterDown = __Value;
        return;
    }
    bool GetbPlayIn() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bPlayIn;
    }
    void SetbPlayIn(const bool __Value) property
    {
        if (!(this.m_bPlayIn) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bPlayIn = __Value;
        return;
    }
    bool GetbHide() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bHide;
    }
    void SetbHide(const bool __Value) property
    {
        if (!(this.m_bHide) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bHide = __Value;
        return;
    }
    bool GetbCheckHide() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bCheckHide;
    }
    void SetbCheckHide(const bool __Value) property
    {
        if (!(this.m_bCheckHide) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bCheckHide = __Value;
        return;
    }
    bool GetVisiable() const property
    {
        this.TrackPropertyRead(9);
        return this.m_Visiable;
    }
    void SetVisiable(const bool __Value) property
    {
        if (!(this.m_Visiable) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_Visiable = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MissionInfoTitle
{
    UPROPERTY()
    FTimespan RemainTimer;
    UPROPERTY()
    bool bShowTimerTileText;
    UPROPERTY()
    int bTimeShot;
    UPROPERTY()
    TEUIModelRef<FVM_MissionInfoTitle> Self;


}

namespace FVM_MissionInfoTitle
{
FVM_MissionInfoTitle& Create(const UObject ContextObject, const FText &inout Title, const bool bHasTimer, const FSoftBrush &inout CustomIconBrush, const bool bShowTimer)
{
    return FVM_MissionInfoTitle::CreateByManager(EUIInternal::GetContextManager(ContextObject), Title, bHasTimer, CustomIconBrush, bShowTimer);
}
FVM_MissionInfoTitle CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Title, const bool bHasTimer, const FSoftBrush &inout CustomIconBrush, const bool bShowTimer)
{
    FVM_MissionInfoTitle __r;
    TEUIModelRef<FVM_MissionInfoTitle> local_6 = TEUIModelRef<FVM_MissionInfoTitle>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MissionInfoTitle::ModelId, 0, Title, bHasTimer, CustomIconBrush, bShowTimer));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasTimer";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CustomIconBrush";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowTimer";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Visiable";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RemainTimer";
    local_14.TypeName = "FTimespan";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowTimerTileText";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bTimeShot";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MissionInfoTitle>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MissionInfoTitle;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("RemainCounterDown");
    int local_2_2 = FVM_MissionInfoTitle::__IndexOf_RemainCounterDown();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "RefreshRemainCounterDown";
    Result.EffectFunctions.Add(local_26);
    FEUIModelDirtyDefine local_34;
    local_34.FunctionName = "__ContentChange";
    local_34.DirtyFlags.Set(FVM_MissionInfoTitle::__IndexOf_Title());
    Result.DirtyFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MissionInfoTitle;
}
void __ContentChange(FVM_MissionInfoTitle &inout Model)
{
    Model.ContentChange();
    return;
}
FText __UIGetter_Title(const FVM_MissionInfoTitle &inout Model)
{
    return Model.GetTitle();
}
bool __UIGetter_bHasTimer(const FVM_MissionInfoTitle &inout Model)
{
    return Model.GetbHasTimer();
}
FSoftBrush __UIGetter_CustomIconBrush(const FVM_MissionInfoTitle &inout Model)
{
    return Model.GetCustomIconBrush();
}
bool __UIGetter_bShowTimer(const FVM_MissionInfoTitle &inout Model)
{
    return Model.GetbShowTimer();
}
bool __UIGetter_Visiable(const FVM_MissionInfoTitle &inout Model)
{
    return Model.GetVisiable();
}
FTimespan __UIGetter_RemainTimer(const FVM_MissionInfoTitle &inout Model)
{
    return Model.GetRemainTimer();
}
bool __UIGetter_bShowTimerTileText(const FVM_MissionInfoTitle &inout Model)
{
    return Model.bShowTimerTileText();
}
int __UIGetter_bTimeShot(const FVM_MissionInfoTitle &inout Model)
{
    return Model.bTimeShot();
}
TEUIModelRef<FVM_MissionInfoTitle> __UIGetter_Self(const FVM_MissionInfoTitle &inout Model)
{
    return TEUIModelRef<FVM_MissionInfoTitle>(Model);
}
int __IndexOf_Title()
{
    return 0;
}
int __IndexOf_bHasTimer()
{
    return 1;
}
int __IndexOf_CustomIconBrush()
{
    return 2;
}
int __IndexOf_bShowTimer()
{
    return 3;
}
int __IndexOf_EndTime()
{
    return 4;
}
int __IndexOf_RemainCounterDown()
{
    return 5;
}
int __IndexOf_bPlayIn()
{
    return 6;
}
int __IndexOf_bHide()
{
    return 7;
}
int __IndexOf_bCheckHide()
{
    return 8;
}
int __IndexOf_Visiable()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_MissionInfoTitle
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
