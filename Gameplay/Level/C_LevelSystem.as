
enum ESideHintType
{
    Default,
    Collect,
    GetItem,
}

enum EDialogSenderType
{
    System,
    SelfPlayer,
    Teammate,
    OtherPlayer,
    NPC,
    Enemy,
}

enum EPlayerSignalType
{
    Default,
    Attack,
    FallBack,
    Vengeance,
}

namespace __INTENRAL_FCE_DebugShowHintText_NS
{
    const TECSEventDerivedPtr<FCE_DebugShowHintText> DerivedPtr = TECSEventDerivedPtr<FCE_DebugShowHintText>();
}
namespace __INTENRAL_FCE_ShowTargetClueHint_NS
{
    const TECSEventDerivedPtr<FCE_ShowTargetClueHint> DerivedPtr = TECSEventDerivedPtr<FCE_ShowTargetClueHint>();
}
namespace __INTENRAL_FCE_ShowSideHint_NS
{
    const TECSEventDerivedPtr<FCE_ShowSideHint> DerivedPtr = TECSEventDerivedPtr<FCE_ShowSideHint>();
}
namespace __INTENRAL_FCE_ShowLevelHintPanel_NS
{
    const TECSEventDerivedPtr<FCE_ShowLevelHintPanel> DerivedPtr = TECSEventDerivedPtr<FCE_ShowLevelHintPanel>();
}
namespace __INTENRAL_FCE_ShowCustomWheelOptionRequest_NS
{
    const TECSEventDerivedPtr<FCE_ShowCustomWheelOptionRequest> DerivedPtr = TECSEventDerivedPtr<FCE_ShowCustomWheelOptionRequest>();
}
namespace __INTENRAL_FCE_ShowCustomWheelOption_NS
{
    const TECSEventDerivedPtr<FCE_ShowCustomWheelOption> DerivedPtr = TECSEventDerivedPtr<FCE_ShowCustomWheelOption>();
}
namespace __INTENRAL_FCE_ShowHeadBubbleRequest_NS
{
    const TECSEventDerivedPtr<FCE_ShowHeadBubbleRequest> DerivedPtr = TECSEventDerivedPtr<FCE_ShowHeadBubbleRequest>();
}
namespace __INTENRAL_FCE_ShowHeadBubble_NS
{
    const TECSEventDerivedPtr<FCE_ShowHeadBubble> DerivedPtr = TECSEventDerivedPtr<FCE_ShowHeadBubble>();
}
namespace __INTENRAL_FCE_ShowSignalHint_NS
{
    const TECSEventDerivedPtr<FCE_ShowSignalHint> DerivedPtr = TECSEventDerivedPtr<FCE_ShowSignalHint>();
}
namespace __INTENRAL_FCE_CustomLevelEventRequest_NS
{
    const TECSEventDerivedPtr<FCE_CustomLevelEventRequest> DerivedPtr = TECSEventDerivedPtr<FCE_CustomLevelEventRequest>();
}
namespace __INTENRAL_FCE_CustomLevelEvent_NS
{
    const TECSEventDerivedPtr<FCE_CustomLevelEvent> DerivedPtr = TECSEventDerivedPtr<FCE_CustomLevelEvent>();
}
namespace __INTENRAL_FCE_CustomLevelValueEvent_NS
{
    const TECSEventDerivedPtr<FCE_CustomLevelValueEvent> DerivedPtr = TECSEventDerivedPtr<FCE_CustomLevelValueEvent>();
}
namespace __INTENRAL_FCE_Event_ReviveTeleport_NS
{
    const TECSEventDerivedPtr<FCE_Event_ReviveTeleport> DerivedPtr = TECSEventDerivedPtr<FCE_Event_ReviveTeleport>();
}
namespace __INTENRAL_FCE_ChangeTargetMaterial_NS
{
    const TECSEventDerivedPtr<FCE_ChangeTargetMaterial> DerivedPtr = TECSEventDerivedPtr<FCE_ChangeTargetMaterial>();

}
struct FCE_DebugShowHintText : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FString ShowContent;
    UPROPERTY()
    float32 ShowLastTime;
    UPROPERTY()
    FECSEntity SpecifiedShowEntity;


}

struct FCE_ShowTargetClueHint : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    float32 ClueRatio;
    UPROPERTY()
    FName DisplayName;


}

struct FCE_ShowSideHint : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FString ShowContent;
    UPROPERTY()
    ESideHintType SideHintType = ESideHintType(0);
    UPROPERTY()
    FECSEntity HintTarget;
    UPROPERTY()
    int ShowCount = 0;
    UPROPERTY()
    FECSEntity SpecifiedShowEntity;


}

struct FCE_ShowLevelHintPanel : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName HintName;

    FCE_ShowLevelHintPanel()
    {
        return;
    }
}

struct FCE_ShowCustomWheelOptionRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FCustomWheelOptionConfig> OptionConfig;

    FCE_ShowCustomWheelOptionRequest()
    {
        return;
    }
    bool Validate() const
    {
        return true;
    }
}

struct FCE_ShowCustomWheelOption : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FCustomWheelOptionConfig> OptionConfig;

    FCE_ShowCustomWheelOption()
    {
        return;
    }
}

struct FCE_ShowHeadBubbleRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName EmojiData;

    FCE_ShowHeadBubbleRequest()
    {
        return;
    }
    bool Validate() const
    {
        return true;
    }
}

struct FCE_ShowHeadBubble : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName EmojiData;

    FCE_ShowHeadBubble()
    {
        return;
    }
}

struct FCE_ShowSignalHint : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVector SignalPosition;
    UPROPERTY()
    EPlayerSignalType SignalType;
    UPROPERTY()
    FECSEntity TargetEntity;


}

struct FCE_CustomLevelEventRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName CustomName;

    FCE_CustomLevelEventRequest()
    {
        return;
    }
}

struct FCE_CustomLevelEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName CustomName;
    UPROPERTY()
    bool bIsTutorialEvent = false;


}

struct FCE_CustomLevelValueEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName CustomName;
    UPROPERTY()
    int Count;


}

struct FCE_Event_ReviveTeleport : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName CustomName;
    UPROPERTY()
    EReviveType ReviveType;
    UPROPERTY()
    TArray<TSubclassOf<AECSPrefab>> SpecificPrefabClass;
    UPROPERTY()
    int SkipNearestCount = 0;


}

struct FCE_ChangeTargetMaterial : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Target;
    UPROPERTY()
    int MaterialIndex;
    UPROPERTY()
    TSoftObjectPtr<UMaterial> TargetMaterial;
    UPROPERTY()
    TSoftObjectPtr<UMaterialInstance> TargetMaterialInstance;


}

