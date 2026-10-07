
namespace FVM_PlayerReborn
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature RebornInSitu = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature RebornInNearRevive = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature RebornInNearTeleport = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature RebornInOtherRevive = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnNeedHelp = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnBackToCity = FEUIModelCallbackSignature();

}
struct FVM_PlayerReborn : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FFPTime m_EndWaitTime;
    UPROPERTY()
    TArray<EReviveType> m_AvailableReviveTypes;
    UPROPERTY()
    FECSEntityId m_KilledByEntity;
    UPROPERTY()
    EDeathReason m_DeathReason;
    UPROPERTY()
    FText m_KilledInfo;
    UPROPERTY()
    FFPTime m_TotalWaitTime;
    UPROPERTY()
    TEUIModelRef<FVM_RevivalTimeProgressBar> m_RescuedProgressModel;
    UPROPERTY()
    bool m_bWaitEnd;
    UPROPERTY()
    bool m_bShowAction;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_InputAction>> m_InputModelRefs;
    UPROPERTY()
    bool bIsPVXMode;

    FVM_PlayerReborn()
    {
        this.m_DeathReason = EDeathReason(0);
        this.m_bWaitEnd = false;
        this.m_bShowAction = false;
        this.bIsPVXMode = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PlayerReborn' by default constructor.");
        return;
    }
    FVM_PlayerReborn(const FVM_PlayerReborn &inout Other)
    {
        this.m_DeathReason = EDeathReason(0);
        this.m_bWaitEnd = false;
        this.m_bShowAction = false;
        this.bIsPVXMode = false;
        this.m_EndWaitTime = Other.m_EndWaitTime;
        this.m_AvailableReviveTypes = Other.m_AvailableReviveTypes;
        this.m_KilledByEntity = Other.m_KilledByEntity;
        this.m_DeathReason = Other.m_DeathReason;
        this.m_KilledInfo = Other.m_KilledInfo;
        this.m_TotalWaitTime = Other.m_TotalWaitTime;
        this.m_RescuedProgressModel = Other.m_RescuedProgressModel;
        this.m_bWaitEnd = Other.m_bWaitEnd;
        this.m_bShowAction = Other.m_bShowAction;
        this.m_InputModelRefs = Other.m_InputModelRefs;
        return;
    }
    FVM_PlayerReborn(const FFPTime &inout InEndWaitTime, const TArray<EReviveType> &inout InAvailableReviveTypes, const FECSEntityId &inout InKilledByEntity, const EDeathReason InDeathReason)
    {
        this.m_DeathReason = EDeathReason(0);
        this.m_bWaitEnd = false;
        this.m_bShowAction = false;
        this.bIsPVXMode = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEndWaitTime(InEndWaitTime);
        this.SetAvailableReviveTypes(InAvailableReviveTypes);
        this.SetKilledByEntity(InKilledByEntity);
        this.SetDeathReason(EDeathReason(InDeathReason));
        return;
    }
    FVM_PlayerReborn& opAssign(const FVM_PlayerReborn &inout Other)
    {
        this.m_EndWaitTime = Other.m_EndWaitTime;
        this.m_AvailableReviveTypes = Other.m_AvailableReviveTypes;
        this.m_KilledByEntity = Other.m_KilledByEntity;
        this.m_DeathReason = Other.m_DeathReason;
        this.m_KilledInfo = Other.m_KilledInfo;
        this.m_TotalWaitTime = Other.m_TotalWaitTime;
        this.m_RescuedProgressModel = Other.m_RescuedProgressModel;
        this.m_bWaitEnd = Other.m_bWaitEnd;
        this.m_bShowAction = Other.m_bShowAction;
        return Other.m_InputModelRefs;
    }
    void PostConstruct()
    {
        this.SetbShowAction(true);
        FECSEntity local_10 = FECSEntity(this.GetKilledByEntity());
        if (local_10.IsValid())
        {
            FText local_18;
            NSLOCTEXT(local_18, "PlayerReborn", "PlayerRebornKilledByName_Unknown");
            Has local_22;
            bool local_1 = local_22.opCall();
            if (local_1)
            {
                FString local_34;
                Get local_26;
                ::FMS_PlayerData::Get(this.GetContext().Manager).GetOrCreatePlayerByEntity(local_26.opCall().GetPlayerEntity());
                local_34.GetNickName();
                local_18 = FText::FromString(local_34);
            }
            else
            {
                Has local_38;
                local_1 = local_38.opCall();
                if (local_1)
                {
                    bool local_39;
                    local_39 = false;
                    TEUIModelRef<FM_Spot> local_44 = ::PresentationSpotUtils::GetEntitySpot(this.GetManager(), local_10.GetId());
                    if (local_44)
                    {
                        FSpotViewAdapter local_54;
                        FText local_14 = ::GetSpotName(local_44.opArrow(), local_54);
                        if (!(local_14.IsEmpty()))
                        {
                            local_18 = local_14;
                            local_39 = true;
                        }
                    }
                    if (!(local_39))
                    {
                        if (!((::GetMonsterConfig(local_10) == nullptr)))
                        {
                        }
                    }
                }
            }
            this.SetKilledInfo(FText::Format(NSLOCTEXT("PlayerReborn", "PlayerRebornKilledBy", "дЅ иў«<Red26F>{0}</>е‡»иґҐдє†"), local_18));
        }
        else
        {
            this.SetKilledInfo(NSLOCTEXT("PlayerReborn", "PlayerRebornKilledBy_Unknown", "дЅ иў«жњЄзџҐж•Њдєєе‡»иґҐдє†"));
        }
        this.SetTotalWaitTime(this.GetEndWaitTime());
        this.SetRescuedProgressModel(TEUIModelRef<FVM_RevivalTimeProgressBar>(::FVM_RevivalTimeProgressBar::Create(this.GetContext().Manager)));
        GetDefaulted local_116;
        this.bIsPVXMode = (int(local_116.opCall().GetGameModeType()) == 1);
        return;
    }
    void Tick()
    {
        this.SetEndWaitTime((this.GetEndWaitTime() - this.GetContext().DeltaTime));
        this.SetbWaitEnd((this.GetEndWaitTime().ToSeconds() <= 0.0));
        if (this.GetRescuedProgressModel())
        {
            float32 local_11 = this.GetCountdownProgress();
            TEUIModelRef<FVM_RevivalTimeProgressBar> local_10 = this.GetRescuedProgressModel();
            local_11.SetProgress();
        }
        return;
    }
    void BeginDestroy()
    {
        this.SetbShowAction(false);
        for (auto& local_16 : this.GetInputModelRefs())
        {
            ::FVMS_CommonBottomActionList::Get(this.GetContext().Manager).RemoveAction(local_16);
        }
        return;
    }
    float32 GetCountdownProgress() const
    {
        if (this.GetTotalWaitTime().ToSeconds() > 0.0)
        {
            return (float32(this.GetEndWaitTime().ToSeconds()) / float32(this.GetTotalWaitTime().ToSeconds()));
        }
        return 0.0f;
    }
    FFPTime GetCountdown() const
    {
        return this.GetEndWaitTime();
    }
    FText GetCountdownText() const
    {
        FFPTime local_2 = this.GetCountdown();
        if (local_2.opCmp(0.0) <= 0)
        {
            return FText();
        }
        return FText::Format(NSLOCTEXT("PlayerReborn", "PlayerRebornWait", "{0}"), FText::AsTimespan(FTimespan::FromSeconds(local_2.ToSeconds())));
    }
    bool bRebornInSituEnabled() const
    {
        return this.GetAvailableReviveTypes().Contains(EReviveType(0));
    }
    bool bRebornInNearReviveEnabled() const
    {
        return this.GetAvailableReviveTypes().Contains(EReviveType(1));
    }
    bool bRebornInNearNearTeleportEnabled() const
    {
        return this.GetAvailableReviveTypes().Contains(EReviveType(2));
    }
    bool bRebornInOtherReviveEnabled() const
    {
        return this.GetAvailableReviveTypes().Contains(EReviveType(3));
    }
    bool bRebornEnabled() const
    {
        return (FFPTime(this.GetEndWaitTime()).opCmp(0.0) <= 0);
    }
    bool bNeedHelpEnabled() const
    {
        return (int(this.GetDeathReason())) != 1 && !(this.bRebornBackToCityEnabled());
    }
    bool bRebornBackToCityEnabled() const
    {
        return this.bIsPVXMode && (this.GetAvailableReviveTypes().Num() == 0);
    }
    void RebornInSitu()
    {
        if (this.GetPlayerEntity().IsValid())
        {
            if (this.GetbWaitEnd())
            {
                FCE_PlayerRebornEvent local_12;
                local_12.ReviveType = EReviveType(0);
            }
            else
            {
                FCommonTipsParam local_26;
                ::CommonPopup::Tips(NSLOCTEXT("PlayerReborn", "Reborn_NeedWait", "е¤„дєЋеЂ’и®Ўж—¶дё­ж— жі•е¤Ќжґ»"), local_26);
            }
        }
        return;
    }
    void RebornInNearRevive()
    {
        if (this.GetPlayerEntity().IsValid())
        {
            if (this.GetbWaitEnd())
            {
                FCE_PlayerRebornEvent local_12;
                local_12.ReviveType = EReviveType(1);
            }
            else
            {
                FCommonTipsParam local_26;
                ::CommonPopup::Tips(NSLOCTEXT("PlayerReborn", "Reborn_NeedWait", "е¤„дєЋеЂ’и®Ўж—¶дё­ж— жі•е¤Ќжґ»"), local_26);
            }
        }
        return;
    }
    void RebornInNearTeleport()
    {
        if (this.GetbWaitEnd())
        {
            FECSEntity local_10 = this.GetPlayerEntity();
            if (local_10.IsValid())
            {
                FCE_PlayerRebornEvent local_12;
                local_12.ReviveType = EReviveType(2);
            }
            return;
        }
        FCommonTipsParam local_26;
        ::CommonPopup::Tips(NSLOCTEXT("PlayerReborn", "Reborn_NeedWait", "е¤„дєЋеЂ’и®Ўж—¶дё­ж— жі•е¤Ќжґ»"), local_26);
        return;
    }
    void RebornInOtherRevive()
    {
        if (this.GetPlayerEntity().IsValid())
        {
            if (this.GetbWaitEnd())
            {
                FCE_PlayerRebornEvent local_12;
                local_12.ReviveType = EReviveType(3);
            }
            else
            {
                FCommonTipsParam local_26;
                ::CommonPopup::Tips(NSLOCTEXT("PlayerReborn", "Reborn_NeedWait", "е¤„дєЋеЂ’и®Ўж—¶дё­ж— жі•е¤Ќжґ»"), local_26);
            }
        }
        return;
    }
    void OnNeedHelp()
    {
        int local_16 = 0;
        if (this.GetPlayerEntity().IsValid())
        {
            local_16.EmojiData = FName("Help");
        }
        return;
    }
    void OnBackToCity()
    {
        if (this.GetContext().GetLocalPlayer())
        {
            ::FGameConnectionUtils::UICallLeaveCurrentLevel(this.GetContext().GetLocalPlayer());
        }
        return;
    }
    FECSEntity GetPlayerEntity() const
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Has local_8;
        bool local_9 = local_8.opCall();
        if (local_9)
        {
            FECSEntity local_4_2 = this.GetContext().GetLocalPlayer();
            Get local_14;
            return local_14.opCall().GetPlayerPawnEntity();
        }
        return ENTITY_NULL;
    }
    const FFPTime GetEndWaitTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FFPTime GetModify_EndWaitTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEndWaitTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EndWaitTime = __Value;
        return;
    }
    const TArray<EReviveType> GetAvailableReviveTypes() const property
    {
        const TArray<EReviveType> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<EReviveType> GetModify_AvailableReviveTypes() property
    {
        TArray<EReviveType> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAvailableReviveTypes(const TArray<EReviveType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AvailableReviveTypes = __Value;
        return;
    }
    const FECSEntityId GetKilledByEntity() const property
    {
        const FECSEntityId __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FECSEntityId GetModify_KilledByEntity() property
    {
        FECSEntityId __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetKilledByEntity(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_KilledByEntity = __Value;
        return;
    }
    EDeathReason GetDeathReason() const property
    {
        this.TrackPropertyRead(3);
        return this.m_DeathReason;
    }
    void SetDeathReason(const EDeathReason __Value) property
    {
        if (int(this.m_DeathReason) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DeathReason = __Value;
        return;
    }
    const FText GetKilledInfo() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_KilledInfo() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetKilledInfo(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_KilledInfo = __Value;
        return;
    }
    const FFPTime GetTotalWaitTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FFPTime GetModify_TotalWaitTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetTotalWaitTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TotalWaitTime = __Value;
        return;
    }
    TEUIModelRef<FVM_RevivalTimeProgressBar> GetRescuedProgressModel() const property
    {
        this.TrackPropertyRead(6);
        return this.m_RescuedProgressModel;
    }
    void SetRescuedProgressModel(const TEUIModelRef<FVM_RevivalTimeProgressBar> &inout __Value) property
    {
        TEUIModelRef<FVM_RevivalTimeProgressBar> local_2;
        local_2 = this.m_RescuedProgressModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_RescuedProgressModel = __Value;
        return;
    }
    bool GetbWaitEnd() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bWaitEnd;
    }
    void SetbWaitEnd(const bool __Value) property
    {
        if (!(this.m_bWaitEnd) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bWaitEnd = __Value;
        return;
    }
    bool GetbShowAction() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bShowAction;
    }
    void SetbShowAction(const bool __Value) property
    {
        if (!(this.m_bShowAction) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bShowAction = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_InputAction>> GetInputModelRefs() const property
    {
        const TArray<TEUIModelRef<FVM_InputAction>> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TArray<TEUIModelRef<FVM_InputAction>> GetModify_InputModelRefs() property
    {
        TArray<TEUIModelRef<FVM_InputAction>> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetInputModelRefs(const TArray<TEUIModelRef<FVM_InputAction>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_InputModelRefs = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PlayerReborn
{
    UPROPERTY()
    float32 CountdownProgress;
    UPROPERTY()
    FFPTime Countdown;
    UPROPERTY()
    FText CountdownText;
    UPROPERTY()
    bool bRebornInSituEnabled;
    UPROPERTY()
    bool bRebornInNearReviveEnabled;
    UPROPERTY()
    bool bRebornInNearNearTeleportEnabled;
    UPROPERTY()
    bool bRebornInOtherReviveEnabled;
    UPROPERTY()
    bool bRebornEnabled;
    UPROPERTY()
    bool bNeedHelpEnabled;
    UPROPERTY()
    bool bRebornBackToCityEnabled;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerReborn> Self;


}

namespace FVM_PlayerReborn
{
FVM_PlayerReborn& Create(const UObject ContextObject, const FFPTime &inout EndWaitTime, const TArray<EReviveType> &inout AvailableReviveTypes, const FECSEntityId &inout KilledByEntity, const EDeathReason DeathReason)
{
    return FVM_PlayerReborn::CreateByManager(EUIInternal::GetContextManager(ContextObject), EndWaitTime, AvailableReviveTypes, KilledByEntity);
}
FVM_PlayerReborn CreateByManager(const UEUIManagerSubsystem Manager, const FFPTime &inout EndWaitTime, const TArray<EReviveType> &inout AvailableReviveTypes, const FECSEntityId &inout KilledByEntity, const EDeathReason DeathReason)
{
    FVM_PlayerReborn __r;
    TEUIModelRef<FVM_PlayerReborn> local_6 = TEUIModelRef<FVM_PlayerReborn>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PlayerReborn::ModelId, 0, EndWaitTime, AvailableReviveTypes, KilledByEntity, DeathReason));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "KilledInfo";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RescuedProgressModel";
    local_14.TypeName = "TEUIModelRef<FVM_RevivalTimeProgressBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bWaitEnd";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CountdownProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Countdown";
    local_14.TypeName = "FFPTime";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CountdownText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bRebornInSituEnabled";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bRebornInNearReviveEnabled";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bRebornInNearNearTeleportEnabled";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bRebornInOtherReviveEnabled";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bRebornEnabled";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bNeedHelpEnabled";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bRebornBackToCityEnabled";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerReborn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayerReborn;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayerReborn;
}
void __Tick(FVM_PlayerReborn &inout Model)
{
    Model.Tick();
    return;
}
FText __UIGetter_KilledInfo(const FVM_PlayerReborn &inout Model)
{
    return Model.GetKilledInfo();
}
TEUIModelRef<FVM_RevivalTimeProgressBar> __UIGetter_RescuedProgressModel(const FVM_PlayerReborn &inout Model)
{
    return Model.GetRescuedProgressModel();
}
bool __UIGetter_bWaitEnd(const FVM_PlayerReborn &inout Model)
{
    return Model.GetbWaitEnd();
}
float32 __UIGetter_CountdownProgress(const FVM_PlayerReborn &inout Model)
{
    return Model.GetCountdownProgress();
}
FFPTime __UIGetter_Countdown(const FVM_PlayerReborn &inout Model)
{
    return Model.GetCountdown();
}
FText __UIGetter_CountdownText(const FVM_PlayerReborn &inout Model)
{
    return Model.GetCountdownText();
}
bool __UIGetter_bRebornInSituEnabled(const FVM_PlayerReborn &inout Model)
{
    return Model.bRebornInSituEnabled();
}
bool __UIGetter_bRebornInNearReviveEnabled(const FVM_PlayerReborn &inout Model)
{
    return Model.bRebornInNearReviveEnabled();
}
bool __UIGetter_bRebornInNearNearTeleportEnabled(const FVM_PlayerReborn &inout Model)
{
    return Model.bRebornInNearNearTeleportEnabled();
}
bool __UIGetter_bRebornInOtherReviveEnabled(const FVM_PlayerReborn &inout Model)
{
    return Model.bRebornInOtherReviveEnabled();
}
bool __UIGetter_bRebornEnabled(const FVM_PlayerReborn &inout Model)
{
    return Model.bRebornEnabled();
}
bool __UIGetter_bNeedHelpEnabled(const FVM_PlayerReborn &inout Model)
{
    return Model.bNeedHelpEnabled();
}
bool __UIGetter_bRebornBackToCityEnabled(const FVM_PlayerReborn &inout Model)
{
    return Model.bRebornBackToCityEnabled();
}
TEUIModelRef<FVM_PlayerReborn> __UIGetter_Self(const FVM_PlayerReborn &inout Model)
{
    return TEUIModelRef<FVM_PlayerReborn>(Model);
}
int __IndexOf_EndWaitTime()
{
    return 0;
}
int __IndexOf_AvailableReviveTypes()
{
    return 1;
}
int __IndexOf_KilledByEntity()
{
    return 2;
}
int __IndexOf_DeathReason()
{
    return 3;
}
int __IndexOf_KilledInfo()
{
    return 4;
}
int __IndexOf_TotalWaitTime()
{
    return 5;
}
int __IndexOf_RescuedProgressModel()
{
    return 6;
}
int __IndexOf_bWaitEnd()
{
    return 7;
}
int __IndexOf_bShowAction()
{
    return 8;
}
int __IndexOf_InputModelRefs()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_PlayerReborn
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
