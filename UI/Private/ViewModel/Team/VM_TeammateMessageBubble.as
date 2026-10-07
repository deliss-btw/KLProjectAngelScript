
namespace FVM_TeammateMessageBubble
{
    const int ModelId = 0;
}
namespace FVM_TeammateMessageBubbleManager
{
    const int ModelId = 0;

}
struct FVM_TeammateMessageBubble : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Message;
    UPROPERTY()
    UTexture2D m_EmojiBrush;

    FVM_TeammateMessageBubble()
    {
        this.m_EmojiBrush = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TeammateMessageBubble' by default constructor.");
        return;
    }
    FVM_TeammateMessageBubble(const FVM_TeammateMessageBubble &inout Other)
    {
        this.m_EmojiBrush = nullptr;
        this.m_Message = Other.m_Message;
        this.m_EmojiBrush = Other.m_EmojiBrush;
        return;
    }
    FVM_TeammateMessageBubble(const FText &inout InMessage, const UTexture2D InEmojiBrush)
    {
        this.m_EmojiBrush = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMessage(InMessage);
        this.SetEmojiBrush(InEmojiBrush);
        return;
    }
    FVM_TeammateMessageBubble opAssign(const FVM_TeammateMessageBubble &inout Other)
    {
        FVM_TeammateMessageBubble __r;
        this.m_Message = Other.m_Message;
        this.m_EmojiBrush = Other.m_EmojiBrush;
        return __r;
    }
    FText GetMessage() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Message() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMessage(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Message = __Value;
        return;
    }
    UTexture2D GetEmojiBrush() const property
    {
        this.TrackPropertyRead(1);
        return this.m_EmojiBrush;
    }
    void SetEmojiBrush(const UTexture2D __Value) property
    {
        if (this.m_EmojiBrush == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
}

struct FVM_TeammateMessageBubbleManager : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_PlayerEntity;
    UPROPERTY()
    TEUIModelRef<FVM_TeammateMessageBubble> m_DisplayingBubble;
    UPROPERTY()
    FEUITimerHandle m_BubbleExpireTimer;
    UPROPERTY()
    FFPTime m_DisplayTime;

    FVM_TeammateMessageBubbleManager()
    {
        this.m_DisplayTime = FFPTime(6.0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TeammateMessageBubbleManager' by default constructor.");
        return;
    }
    FVM_TeammateMessageBubbleManager(const FVM_TeammateMessageBubbleManager &inout Other)
    {
        this.m_DisplayTime = FFPTime(6.0);
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_DisplayingBubble = Other.m_DisplayingBubble;
        this.m_BubbleExpireTimer = Other.m_BubbleExpireTimer;
        this.m_DisplayTime = Other.m_DisplayTime;
        return;
    }
    FVM_TeammateMessageBubbleManager(const FECSEntity &inout InPlayerEntity)
    {
        this.m_DisplayTime = FFPTime(6.0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPlayerEntity(InPlayerEntity);
        return;
    }
    FVM_TeammateMessageBubbleManager& opAssign(const FVM_TeammateMessageBubbleManager &inout Other)
    {
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_DisplayingBubble = Other.m_DisplayingBubble;
        this.m_BubbleExpireTimer = Other.m_BubbleExpireTimer;
        return Other.m_DisplayTime;
    }
    void HandleShowMessage(const FCE_ShowHeadBubble &inout Event)
    {
        if ((!((FECSEntity(Event.Sender) == ::FASCommonUtils::GetControlledPawnEntity(this.GetPlayerEntity())))))
        {
            return;
        }
        FEmojiData local_76;
        ::UCombatGlobalSettings::Get().EmojiDataTable.FindRow(Event.EmojiData, local_76);
        this.SetDisplayingBubble(TEUIModelRef<FVM_TeammateMessageBubble>(::FVM_TeammateMessageBubble::Create(this.GetContext().Manager, FText(), local_76.EmojiIcon)));
        this.ScheduleBubbleExpiration();
        return;
    }
    void HandleShowCustomWheelOption(const FCE_ShowCustomWheelOption &inout Event)
    {
        UTexture2D local_322;
        UObject local_324;
        if ((!((FECSEntity(Event.Sender) == ::FASCommonUtils::GetControlledPawnEntity(this.GetPlayerEntity())))))
        {
            return;
        }
        if (!(Event.OptionConfig.IsSet()))
        {
            return;
        }
        FCustomWheelOptionConfig local_98;
        if (int(local_98.OptionType) == 0)
        {
            if (!(local_98.GetDefaultEmojiData().IsSet()))
            {
                return;
            }
            FEmojiData local_256;
            if (!(local_256.EmojiIconObject.GetResourceObject().IsNull()))
            {
                local_322 = (Cast<UTexture2D>(local_324));
                if (local_322 == nullptr)
                {
                    return;
                }
                this.SetDisplayingBubble(TEUIModelRef<FVM_TeammateMessageBubble>(::FVM_TeammateMessageBubble::Create(this.GetContext().Manager, local_256.Name, local_322)));
                this.ScheduleBubbleExpiration();
            }
        }
        else
        {
            if (int(local_98.OptionType) == 1)
            {
                if (!(local_98.GetDefaultSignalData().IsSet()))
                {
                    return;
                }
                FSignalConfig local_404;
                if (!(local_404.SignalIconObject.GetResourceObject().IsNull()))
                {
                    local_322 = (Cast<UTexture2D>(local_324));
                    if (local_322 == nullptr)
                    {
                        return;
                    }
                    this.SetDisplayingBubble(TEUIModelRef<FVM_TeammateMessageBubble>(::FVM_TeammateMessageBubble::Create(this.GetContext().Manager, local_404.SignalName, local_322)));
                    this.ScheduleBubbleExpiration();
                }
            }
        }
        return;
    }
    void OnTeamTypeChanged(const FMsg_TeamTypeChanged &inout Msg)
    {
        this.ClearDisplayingBubble();
        return;
    }
    void ScheduleBubbleExpiration()
    {
        this.ClearTimer(this.GetModify_BubbleExpireTimer());
        this.ScheduleCall(this.GetModify_BubbleExpireTimer(), n"ClearDisplayingBubble", float32(this.GetDisplayTime().ToSeconds()));
        return;
    }
    void ClearDisplayingBubble()
    {
        this.ClearTimer(this.GetModify_BubbleExpireTimer());
        this.SetDisplayingBubble(TEUIModelRef<FVM_TeammateMessageBubble>(nullptr));
        return;
    }
    FECSEntity GetPlayerEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_PlayerEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPlayerEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerEntity = __Value;
        return;
    }
    TEUIModelRef<FVM_TeammateMessageBubble> GetDisplayingBubble() const property
    {
        this.TrackPropertyRead(1);
        return this.m_DisplayingBubble;
    }
    void SetDisplayingBubble(const TEUIModelRef<FVM_TeammateMessageBubble> &inout __Value) property
    {
        TEUIModelRef<FVM_TeammateMessageBubble> local_2;
        local_2 = this.m_DisplayingBubble;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DisplayingBubble = __Value;
        return;
    }
    const FEUITimerHandle GetBubbleExpireTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUITimerHandle GetModify_BubbleExpireTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetBubbleExpireTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_BubbleExpireTimer = __Value;
        return;
    }
    const FFPTime GetDisplayTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FFPTime GetModify_DisplayTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetDisplayTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DisplayTime = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TeammateMessageBubble
{
    UPROPERTY()
    TEUIModelRef<FVM_TeammateMessageBubble> Self;

    __GeneratedProperties_FVM_TeammateMessageBubble()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_TeammateMessageBubbleManager
{
    UPROPERTY()
    TEUIModelRef<FVM_TeammateMessageBubbleManager> Self;

    __GeneratedProperties_FVM_TeammateMessageBubbleManager()
    {
        return;
    }
}

namespace FVM_TeammateMessageBubble
{
FVM_TeammateMessageBubble& Create(const UObject ContextObject, const FText &inout Message, const UTexture2D EmojiBrush)
{
    return FVM_TeammateMessageBubble::CreateByManager(EUIInternal::GetContextManager(ContextObject), Message, EmojiBrush);
}
FVM_TeammateMessageBubble CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Message, const UTexture2D EmojiBrush)
{
    FVM_TeammateMessageBubble __r;
    TEUIModelRef<FVM_TeammateMessageBubble> local_6 = TEUIModelRef<FVM_TeammateMessageBubble>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TeammateMessageBubble::ModelId, 0, Message, EmojiBrush));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Message";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EmojiBrush";
    local_14.TypeName = "UTexture2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeammateMessageBubble>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeammateMessageBubble;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeammateMessageBubble;
}
FText __UIGetter_Message(const FVM_TeammateMessageBubble &inout Model)
{
    return Model.GetMessage();
}
UTexture2D __UIGetter_EmojiBrush(const FVM_TeammateMessageBubble &inout Model)
{
    return Model.GetEmojiBrush();
}
TEUIModelRef<FVM_TeammateMessageBubble> __UIGetter_Self(const FVM_TeammateMessageBubble &inout Model)
{
    return TEUIModelRef<FVM_TeammateMessageBubble>(Model);
}
int __IndexOf_Message()
{
    return 0;
}
int __IndexOf_EmojiBrush()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TeammateMessageBubble
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_TeammateMessageBubbleManager
{
FVM_TeammateMessageBubbleManager& Create(const UObject ContextObject, const FECSEntity &inout PlayerEntity)
{
    return FVM_TeammateMessageBubbleManager::CreateByManager(EUIInternal::GetContextManager(ContextObject), PlayerEntity);
}
FVM_TeammateMessageBubbleManager CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout PlayerEntity)
{
    FVM_TeammateMessageBubbleManager __r;
    TEUIModelRef<FVM_TeammateMessageBubbleManager> local_6 = TEUIModelRef<FVM_TeammateMessageBubbleManager>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TeammateMessageBubbleManager::ModelId, 0, PlayerEntity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayingBubble";
    local_14.TypeName = "TEUIModelRef<FVM_TeammateMessageBubble>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeammateMessageBubbleManager>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeammateMessageBubbleManager;
    FEUIModelEventDefine local_22;
    local_22.FunctionName = "__HandleShowMessage";
    local_22.EventType = FCE_ShowHeadBubble;
    Result.EventFunctions.Add(local_22);
    local_22.FunctionName = "__HandleShowCustomWheelOption";
    local_22.EventType = FCE_ShowCustomWheelOption;
    Result.EventFunctions.Add(local_22);
    FEUIModelMsgHandleDefine local_32;
    local_32.FunctionName = "__OnTeamTypeChanged";
    local_32.MessageTypeName = "Msg_TeamTypeChanged";
    local_32.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_32);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeammateMessageBubbleManager;
}
void __HandleShowMessage(FVM_TeammateMessageBubbleManager &inout Model, const FCE_ShowHeadBubble &inout Event)
{
    Model.HandleShowMessage(Event);
    return;
}
void __HandleShowCustomWheelOption(FVM_TeammateMessageBubbleManager &inout Model, const FCE_ShowCustomWheelOption &inout Event)
{
    Model.HandleShowCustomWheelOption(Event);
    return;
}
void __OnTeamTypeChanged(FVM_TeammateMessageBubbleManager &inout Model, const FMsg_TeamTypeChanged &inout Message)
{
    Model.OnTeamTypeChanged(Message);
    return;
}
TEUIModelRef<FVM_TeammateMessageBubble> __UIGetter_DisplayingBubble(const FVM_TeammateMessageBubbleManager &inout Model)
{
    return Model.GetDisplayingBubble();
}
TEUIModelRef<FVM_TeammateMessageBubbleManager> __UIGetter_Self(const FVM_TeammateMessageBubbleManager &inout Model)
{
    return TEUIModelRef<FVM_TeammateMessageBubbleManager>(Model);
}
int __IndexOf_PlayerEntity()
{
    return 0;
}
int __IndexOf_DisplayingBubble()
{
    return 1;
}
int __IndexOf_BubbleExpireTimer()
{
    return 2;
}
int __IndexOf_DisplayTime()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_TeammateMessageBubbleManager
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
