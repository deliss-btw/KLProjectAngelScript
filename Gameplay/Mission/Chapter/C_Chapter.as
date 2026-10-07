
namespace __INTENRAL_FCE_ChapterNotifyStart_NS
{
    const TECSEventDerivedPtr<FCE_ChapterNotifyStart> DerivedPtr = TECSEventDerivedPtr<FCE_ChapterNotifyStart>();
}
namespace __INTENRAL_FCE_ChapterNotifyEnd_NS
{
    const TECSEventDerivedPtr<FCE_ChapterNotifyEnd> DerivedPtr = TECSEventDerivedPtr<FCE_ChapterNotifyEnd>();
}
namespace __INTENRAL_FCE_ChapterStarted_NS
{
    const TECSEventDerivedPtr<FCE_ChapterStarted> DerivedPtr = TECSEventDerivedPtr<FCE_ChapterStarted>();
}
namespace __INTENRAL_FCE_ChapterFinished_NS
{
    const TECSEventDerivedPtr<FCE_ChapterFinished> DerivedPtr = TECSEventDerivedPtr<FCE_ChapterFinished>();

}
struct FCE_ChapterNotifyStart : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FChapterConfig> ChapterConfig;

    FCE_ChapterNotifyStart()
    {
        return;
    }
}

struct FCE_ChapterNotifyEnd : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FChapterConfig> ChapterConfig;

    FCE_ChapterNotifyEnd()
    {
        return;
    }
}

struct FCE_ChapterStarted : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FChapterConfig> ChapterConfig;

    FCE_ChapterStarted()
    {
        return;
    }
}

struct FCE_ChapterFinished : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FChapterConfig> ChapterConfig;

    FCE_ChapterFinished()
    {
        return;
    }
}

