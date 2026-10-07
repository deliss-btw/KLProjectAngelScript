
namespace FVM_ChatHudPanel
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnHudChatEnterClicked = FEUIModelCallbackSignature();

}
struct FVM_ChatHudPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIWidgetRef m_HudChatWidget;
    UPROPERTY()
    TEUIModelRef<FVMS_ChatMain> m_ChatMain;
    UPROPERTY()
    TEUIModelRef<FMS_ChatDataModel> m_ChatDataModel;
    UPROPERTY()
    ELevelType m_CachedHudLevelType;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ChatHudLineItem>> m_HudLines;
    UPROPERTY()
    bool m_bIsHudChatVisible;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_FriendApplyRedDotVM;

    FVM_ChatHudPanel()
    {
        this.m_CachedHudLevelType = ELevelType(0);
        this.m_bIsHudChatVisible = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ChatHudPanel(const FVM_ChatHudPanel &inout Other)
    {
        this.m_CachedHudLevelType = ELevelType(0);
        this.m_bIsHudChatVisible = false;
        this.m_HudChatWidget = Other.m_HudChatWidget;
        this.m_ChatMain = Other.m_ChatMain;
        this.m_ChatDataModel = Other.m_ChatDataModel;
        this.m_CachedHudLevelType = Other.m_CachedHudLevelType;
        this.m_HudLines = Other.m_HudLines;
        this.m_bIsHudChatVisible = Other.m_bIsHudChatVisible;
        this.m_FriendApplyRedDotVM = Other.m_FriendApplyRedDotVM;
        return;
    }
    FVM_ChatHudPanel& opAssign(const FVM_ChatHudPanel &inout Other)
    {
        this.m_HudChatWidget = Other.m_HudChatWidget;
        this.m_ChatMain = Other.m_ChatMain;
        this.m_ChatDataModel = Other.m_ChatDataModel;
        this.m_CachedHudLevelType = Other.m_CachedHudLevelType;
        this.m_HudLines = Other.m_HudLines;
        this.m_bIsHudChatVisible = Other.m_bIsHudChatVisible;
        return Other.m_FriendApplyRedDotVM;
    }
    void PostConstruct()
    {
        this.SetChatMain(TEUIModelRef<FVMS_ChatMain>(::FVMS_ChatMain::Get(this.GetContext().Manager)));
        this.SetChatDataModel(TEUIModelRef<FMS_ChatDataModel>(::FMS_ChatDataModel::Get(this.GetContext().Manager)));
        this.SetCachedHudLevelType(::FLevelUtils::GetCurrentLevelType());
        this.SetFriendApplyRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Friend_NewFriendInvitationHud, 0))));
        return;
    }
    ESlateVisibility GetHudChatStripVisibility() const
    {
        int local_5;
        if (this.IsChatUnlock() && (this.GetHudLines().Num() > 0))
        {
            local_5 = 0;
        }
        else
        {
            local_5 = 1;
        }
        return ESlateVisibility(local_5);
    }
    ESlateVisibility GetFriendApplyRedDotVisibility() const
    {
        int local_5;
        bool local_3 = this.GetFriendApplyRedDotVM().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_RedDot> local_2 = this.GetFriendApplyRedDotVM();
            local_3 = HasRedDot();
        }
        if (local_3)
        {
            local_5 = 0;
        }
        else
        {
            local_5 = 1;
        }
        return ESlateVisibility(local_5);
    }
    void OnPersistenceBoundPlayerClearHud(const FMsg_ChatPersistenceBoundPlayerChanged &inout Msg)
    {
        this.ClearHudQueue();
        this.SetbIsHudChatVisible(false);
        return;
    }
    void OnReceiveChatMessage(const FMsg_OnReceiveChatMessage &inout Msg)
    {
        if (int(Msg.ChannelType) == 0)
        {
            return;
        }
        if (Msg.MessageRef.IsValid())
        {
            this.OnIncomingChatMessageForHud(Msg.MessageRef);
        }
        return;
    }
    void TickExpireHudLines()
    {
        ELevelType local_2 = ::FLevelUtils::GetCurrentLevelType();
        if (int(local_2) != (int(this.GetCachedHudLevelType())))
        {
            this.SetCachedHudLevelType(ELevelType(local_2));
            this.ClearHudQueue();
            return;
        }
        float local_10 = this.GetContext().Time.ToSeconds();
        int local_12 = this.GetHudLines().Num() - 1;
        for (; local_12 >= 0; --local_12)
        {
            if (local_10 > GetExpireAtWorldSeconds())
            {
                this.GetModify_HudLines().RemoveAt(local_12);
            }
        }
        if ((this.GetHudLines().Num()) > 0)
        {
            this.SetbIsHudChatVisible(this.IsChatUnlock());
            return;
        }
        this.SetbIsHudChatVisible(false);
        return;
    }
    void OnHudChatEnterClicked()
    {
        XLog(ELog(74), FString().Append("OnHudChatEnterClicked"));
        if (!(this.IsChatUnlock()))
        {
            return;
        }
        if (this.GetHudChatWidget())
        {
            FEUIWidget::RemoveWidget(this.GetHudChatWidget());
            return;
        }
        if (this.GetChatMain().IsValid())
        {
            this.SetHudChatWidget(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_ChatMain, this.GetChatMain().opImplConv()));
        }
        return;
    }
    bool IsChatUnlock() const
    {
        return ::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(6), false);
    }
    void ClearHudQueue()
    {
        this.GetModify_HudLines().Empty(0);
        return;
    }
    void RemoveHudLineAt(const int Index)
    {
        this.GetModify_HudLines().RemoveAt(Index);
        return;
    }
    void RemoveOldestHudLine()
    {
        if (this.GetHudLines().Num() == 0)
        {
            return;
        }
        this.RemoveHudLineAt(0);
        return;
    }
    void PushHudLine(const TEUIModelRef<FM_ChatMessage> &inout MessageRef)
    {
        const UChatSettings local_2;
        float32 local_9;
        int local_12;
        GetGameplaySettings<UChatSettings> local_4;
        local_2 = local_4;
        if (local_2 != nullptr)
        {
            local_9 = local_2.ChatHudConfig.ChatHudMessageShowTime;
        }
        else
        {
            local_9 = 10.0f;
        }
        if (local_2 != nullptr)
        {
            local_12 = local_2.ChatHudConfig.ChatHudMessageMaxCount;
        }
        else
        {
            local_12 = 5;
        }
        while (this.GetHudLines().Num() >= local_12)
        {
            this.RemoveOldestHudLine();
        }
        int local_14 = 0;
        if (this.GetContext().GetLocalPlayer().IsValid())
        {
            local_14 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetContext().GetLocalPlayer());
        }
        TEUIModelRef<FVM_ChatHudLineItem> local_24 = TEUIModelRef<FVM_ChatHudLineItem>(::FVM_ChatHudLineItem::Create(this.GetContext().Manager));
        MessageRef.SetupHudLine((this.GetContext().Time.ToSeconds() + local_9), local_14);
        this.GetModify_HudLines().Add(local_24);
        return;
    }
    void OnIncomingChatMessageForHud(const TEUIModelRef<FM_ChatMessage> &inout MessageRef)
    {
        FM_ChatMessage& local_2;
        if (local_2.GetBodyText().IsEmpty())
        {
            return;
        }
        if (!(::ChatSystemUtil::ShouldShowMessageOnChatHud(local_2.GetChannelType())))
        {
            return;
        }
        this.PushHudLine(MessageRef);
        return;
    }
    const FEUIWidgetRef GetHudChatWidget() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIWidgetRef GetModify_HudChatWidget() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetHudChatWidget(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_HudChatWidget = __Value;
        return;
    }
    TEUIModelRef<FVMS_ChatMain> GetChatMain() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ChatMain;
    }
    void SetChatMain(const TEUIModelRef<FVMS_ChatMain> &inout __Value) property
    {
        TEUIModelRef<FVMS_ChatMain> local_2;
        local_2 = this.m_ChatMain;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ChatMain = __Value;
        return;
    }
    TEUIModelRef<FMS_ChatDataModel> GetChatDataModel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ChatDataModel;
    }
    void SetChatDataModel(const TEUIModelRef<FMS_ChatDataModel> &inout __Value) property
    {
        TEUIModelRef<FMS_ChatDataModel> local_2;
        local_2 = this.m_ChatDataModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ChatDataModel = __Value;
        return;
    }
    ELevelType GetCachedHudLevelType() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CachedHudLevelType;
    }
    void SetCachedHudLevelType(const ELevelType __Value) property
    {
        if (int(this.m_CachedHudLevelType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CachedHudLevelType = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ChatHudLineItem>> GetHudLines() const property
    {
        const TArray<TEUIModelRef<FVM_ChatHudLineItem>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ChatHudLineItem>> GetModify_HudLines() property
    {
        TArray<TEUIModelRef<FVM_ChatHudLineItem>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetHudLines(const TArray<TEUIModelRef<FVM_ChatHudLineItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_HudLines = __Value;
        return;
    }
    bool GetbIsHudChatVisible() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bIsHudChatVisible;
    }
    void SetbIsHudChatVisible(const bool __Value) property
    {
        if (!(this.m_bIsHudChatVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bIsHudChatVisible = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetFriendApplyRedDotVM() const property
    {
        this.TrackPropertyRead(6);
        return this.m_FriendApplyRedDotVM;
    }
    void SetFriendApplyRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_FriendApplyRedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_FriendApplyRedDotVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ChatHudPanel
{
    UPROPERTY()
    ESlateVisibility HudChatStripVisibility;
    UPROPERTY()
    ESlateVisibility FriendApplyRedDotVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_ChatHudPanel> Self;


}

namespace FVM_ChatHudPanel
{
FVM_ChatHudPanel& Create(const UObject ContextObject)
{
    return FVM_ChatHudPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ChatHudPanel CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ChatHudPanel __r;
    TEUIModelRef<FVM_ChatHudPanel> local_6 = TEUIModelRef<FVM_ChatHudPanel>(EUIInternal::MakeModelWithManager(Manager, FVM_ChatHudPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "HudLines";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ChatHudLineItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsHudChatVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FriendApplyRedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HudChatStripVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FriendApplyRedDotVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ChatHudPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ChatHudPanel;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnPersistenceBoundPlayerClearHud";
    local_26.MessageTypeName = "Msg_ChatPersistenceBoundPlayerChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnReceiveChatMessage";
    local_26.MessageTypeName = "Msg_OnReceiveChatMessage";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ChatHudPanel;
}
void __OnPersistenceBoundPlayerClearHud(FVM_ChatHudPanel &inout Model, const FMsg_ChatPersistenceBoundPlayerChanged &inout Message)
{
    Model.OnPersistenceBoundPlayerClearHud(Message);
    return;
}
void __OnReceiveChatMessage(FVM_ChatHudPanel &inout Model, const FMsg_OnReceiveChatMessage &inout Message)
{
    Model.OnReceiveChatMessage(Message);
    return;
}
TArray<TEUIModelRef<FVM_ChatHudLineItem>> __UIGetter_HudLines(const FVM_ChatHudPanel &inout Model)
{
    return Model.GetHudLines();
}
bool __UIGetter_bIsHudChatVisible(const FVM_ChatHudPanel &inout Model)
{
    return Model.GetbIsHudChatVisible();
}
TEUIModelRef<FVM_RedDot> __UIGetter_FriendApplyRedDotVM(const FVM_ChatHudPanel &inout Model)
{
    return Model.GetFriendApplyRedDotVM();
}
ESlateVisibility __UIGetter_HudChatStripVisibility(const FVM_ChatHudPanel &inout Model)
{
    return Model.GetHudChatStripVisibility();
}
ESlateVisibility __UIGetter_FriendApplyRedDotVisibility(const FVM_ChatHudPanel &inout Model)
{
    return Model.GetFriendApplyRedDotVisibility();
}
TEUIModelRef<FVM_ChatHudPanel> __UIGetter_Self(const FVM_ChatHudPanel &inout Model)
{
    return TEUIModelRef<FVM_ChatHudPanel>(Model);
}
int __IndexOf_HudChatWidget()
{
    return 0;
}
int __IndexOf_ChatMain()
{
    return 1;
}
int __IndexOf_ChatDataModel()
{
    return 2;
}
int __IndexOf_CachedHudLevelType()
{
    return 3;
}
int __IndexOf_HudLines()
{
    return 4;
}
int __IndexOf_bIsHudChatVisible()
{
    return 5;
}
int __IndexOf_FriendApplyRedDotVM()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_ChatHudPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
