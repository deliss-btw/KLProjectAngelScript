
namespace __INTENRAL_FCE_NotifyUI_OpenTutorial_NS
{
    const TECSEventDerivedPtr<FCE_NotifyUI_OpenTutorial> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyUI_OpenTutorial>();
}
namespace __INTENRAL_FCE_NotifyUI_OpenTutorialGraphic_NS
{
    const TECSEventDerivedPtr<FCE_NotifyUI_OpenTutorialGraphic> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyUI_OpenTutorialGraphic>();
}
namespace __INTENRAL_FCE_CloseTutorialGraphic_NS
{
    const TECSEventDerivedPtr<FCE_CloseTutorialGraphic> DerivedPtr = TECSEventDerivedPtr<FCE_CloseTutorialGraphic>();

}
struct FTutorialStepProgress
{
    UPROPERTY()
    int m_CurrentProgress;
    UPROPERTY()
    int m_MaxProgress;


    int GetCurrentProgress() const property
    {
        return this.m_CurrentProgress;
    }
    void SetCurrentProgress(const int __Value) property
    {
        this.m_CurrentProgress = __Value;
        return;
    }
    int GetMaxProgress() const property
    {
        return this.m_MaxProgress;
    }
    void SetMaxProgress(const int __Value) property
    {
        this.m_MaxProgress = __Value;
        return;
    }
}

struct FTutorialInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FTutorialInfoConfig> m_TutorialInfoId;
    UPROPERTY()
    TArray<FTutorialStepProgress> m_StepProgress;
    UPROPERTY()
    float32 m_Countdown;

    FTutorialInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTutorialInfo(const FTutorialInfo &inout Other)
    {
        this.m_Countdown = 0.0f;
        this.m_TutorialInfoId = Other.m_TutorialInfoId;
        this.m_StepProgress = Other.m_StepProgress;
        this.m_Countdown = Other.m_Countdown;
        return;
    }
    FTutorialInfo opAssign(const FTutorialInfo &inout Other)
    {
        FTutorialInfo __r;
        this.SetTutorialInfoId(Other.GetTutorialInfoId());
        this.SetStepProgress(Other.GetStepProgress());
        this.SetCountdown(Other.GetCountdown());
        return __r;
    }
    const TDataObjectPtr<FTutorialInfoConfig> GetTutorialInfoId() const property
    {
        const TDataObjectPtr<FTutorialInfoConfig> __r;
        return __r;
    }
    TDataObjectPtr<FTutorialInfoConfig> GetModify_TutorialInfoId() property
    {
        TDataObjectPtr<FTutorialInfoConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTutorialInfoId(const TDataObjectPtr<FTutorialInfoConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TutorialInfoId = __Value;
        return;
    }
    const TArray<FTutorialStepProgress> GetStepProgress() const property
    {
        const TArray<FTutorialStepProgress> __r;
        return __r;
    }
    TArray<FTutorialStepProgress> GetModify_StepProgress() property
    {
        TArray<FTutorialStepProgress> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetStepProgress(const TArray<FTutorialStepProgress> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_StepProgress = __Value;
        return;
    }
    float32 GetCountdown() const property
    {
        return this.m_Countdown;
    }
    void SetCountdown(const float32 __Value) property
    {
        if (this.m_Countdown == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Countdown = __Value;
        return;
    }
}

struct FCE_NotifyUI_OpenTutorial : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FTutorialInfo Info;

    FCE_NotifyUI_OpenTutorial()
    {
        return;
    }
}

struct FCE_NotifyUI_OpenTutorialGraphic : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FGuideGroupConfig> GraphicId;

    FCE_NotifyUI_OpenTutorialGraphic()
    {
        return;
    }
}

struct FCE_CloseTutorialGraphic : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FGuideGroupConfig> GraphicId;

    FCE_CloseTutorialGraphic()
    {
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FTutorialInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FTutorialInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FTutorialInfo
{
int __IndexOf_TutorialInfoId()
{
    return 0;
}
int __IndexOf_StepProgress()
{
    return 1;
}
int __IndexOf_Countdown()
{
    return 2;
}
}
