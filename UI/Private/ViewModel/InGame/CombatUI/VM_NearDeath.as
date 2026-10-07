
namespace FVM_NearDeath
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnGiveUp = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnNeedHelp = FEUIModelCallbackSignature();

}
struct FVM_NearDeath : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bShowAction;
    UPROPERTY()
    TEUIModelRef<FVM_RevivalTimeProgressBar> m_RescuedProgressModel;
    UPROPERTY()
    TEUIModelRef<FVM_RevivalTimeProgressBar> m_NearDeathProgressModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_InputAction>> m_InputModelRefs;

    FVM_NearDeath()
    {
        this.m_bShowAction = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_NearDeath(const FVM_NearDeath &inout Other)
    {
        this.m_bShowAction = false;
        this.m_bShowAction = Other.m_bShowAction;
        this.m_RescuedProgressModel = Other.m_RescuedProgressModel;
        this.m_NearDeathProgressModel = Other.m_NearDeathProgressModel;
        this.m_InputModelRefs = Other.m_InputModelRefs;
        return;
    }
    FVM_NearDeath& opAssign(const FVM_NearDeath &inout Other)
    {
        this.m_bShowAction = Other.m_bShowAction;
        this.m_RescuedProgressModel = Other.m_RescuedProgressModel;
        this.m_NearDeathProgressModel = Other.m_NearDeathProgressModel;
        return Other.m_InputModelRefs;
    }
    void PostConstruct()
    {
        this.SetbShowAction(true);
        this.SetNearDeathProgressModel(TEUIModelRef<FVM_RevivalTimeProgressBar>(::FVM_RevivalTimeProgressBar::Create(this.GetContext().Manager)));
        this.SetRescuedProgressModel(TEUIModelRef<FVM_RevivalTimeProgressBar>(::FVM_RevivalTimeProgressBar::Create(this.GetContext().Manager)));
        return;
    }
    void Tick()
    {
        float32 local_1 = this.GetKonkHpBarHpProgress();
        TEUIModelRef<FVM_RevivalTimeProgressBar> local_4 = this.GetNearDeathProgressModel();
        local_1.SetProgress();
        float32 local_1_2 = this.GetRescuedProgress();
        TEUIModelRef<FVM_RevivalTimeProgressBar> local_4_2 = this.GetRescuedProgressModel();
        local_1_2.SetProgress();
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
    float32 GetKonkHpBarHpProgress() const
    {
        int local_30 = 0;
        bool local_15 = this.GetContext().GetLocalPlayer();
        if (!(local_15))
        {
            local_15 = false;
        }
        else
        {
            FECSEntity local_14 = this.GetContext().GetLocalPlayer();
            Has local_8;
            local_15 = local_8.opCall();
        }
        if (local_15)
        {
            FECSEntity local_14_2 = this.GetContext().GetLocalPlayer();
            Get local_24;
            if (FECSEntity(local_24.opCall().GetPlayerPawnEntity()))
            {
                if (local_30)
                {
                    return (local_30.GetNearDeathHP() / local_30.GetMaxNearDeathHP());
                }
            }
        }
        return 1.0f;
    }
    float32 GetRescuedProgress() const
    {
        int local_30 = 0;
        if (this.IsBeingRescued())
        {
            bool local_15 = this.GetContext().GetLocalPlayer();
            if (!(local_15))
            {
                local_15 = false;
            }
            else
            {
                FECSEntity local_14 = this.GetContext().GetLocalPlayer();
                Has local_10;
                local_15 = local_10.opCall();
            }
            if (local_15)
            {
                FECSEntity local_14_2 = this.GetContext().GetLocalPlayer();
                Get local_24;
                if (FECSEntity(local_24.opCall().GetPlayerPawnEntity()))
                {
                    if (local_30)
                    {
                        FECSEntity local_14_3 = ::FASCommonUtils::GetRiderEntity(FECSEntity(local_30.GetRescuedByEntity()));
                        Get local_42;
                        const FC_LocalInteractProgress& local_44 = local_42.opCall();
                        if (local_44)
                        {
                            return (local_44.ProgressValue / local_44.MaxProgressValue);
                        }
                    }
                }
            }
        }
        return 1.0f;
    }
    FText GetRescuedReaminingTimeSecond() const
    {
        int local_30 = 0;
        if (this.IsBeingRescued())
        {
            bool local_15 = this.GetContext().GetLocalPlayer();
            if (!(local_15))
            {
                local_15 = false;
            }
            else
            {
                FECSEntity local_14 = this.GetContext().GetLocalPlayer();
                Has local_10;
                local_15 = local_10.opCall();
            }
            if (local_15)
            {
                FECSEntity local_14_2 = this.GetContext().GetLocalPlayer();
                Get local_24;
                if (FECSEntity(local_24.opCall().GetPlayerPawnEntity()))
                {
                    if (local_30)
                    {
                        FECSEntity local_14_3 = ::FASCommonUtils::GetRiderEntity(FECSEntity(local_30.GetRescuedByEntity()));
                        Get local_42;
                        const FC_LocalInteractProgress& local_44 = local_42.opCall();
                        if (local_44)
                        {
                            float32 local_46 = local_44.MaxProgressValue - local_44.ProgressValue;
                            FNumberFormattingOptions local_53;
                            local_53.SetMaximumFractionalDigits(1);
                            local_53.SetMinimumFractionalDigits(1);
                            return FText::AsNumber(local_46 / local_44.CurProgressSpeed, local_53);
                        }
                    }
                }
            }
        }
        return FText::FromString("0");
    }
    bool IsBeingRescued() const
    {
        bool local_15 = this.GetContext().GetLocalPlayer();
        if (!(local_15))
        {
            local_15 = false;
        }
        else
        {
            FECSEntity local_14 = this.GetContext().GetLocalPlayer();
            Has local_8;
            local_15 = local_8.opCall();
        }
        if (local_15)
        {
            FECSEntity local_14_2 = this.GetContext().GetLocalPlayer();
            Get local_24;
            if (FECSEntity(local_24.opCall().GetPlayerPawnEntity()))
            {
                Has local_28;
                bool local_9 = local_28.opCall();
                if (local_9)
                {
                    Get local_36;
                    FECSEntity local_14_3 = ::FASCommonUtils::GetRiderEntity(FECSEntity(local_36.opCall().GetRescuedByEntity()));
                    Has local_44;
                    return local_44.opCall();
                }
            }
        }
        return false;
    }
    FText GetRescueName() const
    {
        bool local_15 = this.GetContext().GetLocalPlayer();
        if (!(local_15))
        {
            local_15 = false;
        }
        else
        {
            FECSEntity local_14 = this.GetContext().GetLocalPlayer();
            Has local_8;
            local_15 = local_8.opCall();
        }
        if (local_15)
        {
            FECSEntity local_14_2 = this.GetContext().GetLocalPlayer();
            Get local_24;
            if (FECSEntity(local_24.opCall().GetPlayerPawnEntity()))
            {
                Get local_28;
                const FC_BeingRescuedInfo& local_30 = local_28.opCall();
                if (local_30)
                {
                    FECSEntity local_4 = FECSEntity(local_30.GetRescuedByEntity());
                    Has local_38;
                    bool local_9 = local_38.opCall();
                    if (local_9)
                    {
                        Get local_44;
                        if (::FMS_PlayerData::Get(this.GetContext().Manager).GetOrCreatePlayerByEntity(local_44.opCall().GetPlayerEntity()).IsValid())
                        {
                            FString local_50;
                            local_50.GetNickName();
                            return FText::FromString(local_50);
                        }
                    }
                }
            }
        }
        return NSLOCTEXT("PlayerNearDeath", "PlayerRescuedBy_Unknown", "жњЄзџҐ");
    }
    void OnGiveUp()
    {
        if ((!((this.GetPlayerEntity() == ENTITY_NULL))))
        {
            SendEvent local_14;
            local_14.opCall(ECS::GetContextTime());
        }
        return;
    }
    void OnNeedHelp()
    {
        int local_18 = 0;
        if ((!((this.GetPlayerEntity() == ENTITY_NULL))))
        {
            ECS::GetContextTime();
            local_18.EmojiData = FName("Help");
        }
        return;
    }
    FECSEntity GetPlayerEntity() const
    {
        bool local_15 = this.GetContext().GetLocalPlayer();
        if (!(local_15))
        {
            local_15 = false;
        }
        else
        {
            FECSEntity local_14 = this.GetContext().GetLocalPlayer();
            Has local_8;
            local_15 = local_8.opCall();
        }
        if (local_15)
        {
            FECSEntity local_14_2 = this.GetContext().GetLocalPlayer();
            Get local_20;
            return local_20.opCall().GetPlayerPawnEntity();
        }
        return ENTITY_NULL;
    }
    bool GetbShowAction() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bShowAction;
    }
    void SetbShowAction(const bool __Value) property
    {
        if (!(this.m_bShowAction) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bShowAction = __Value;
        return;
    }
    TEUIModelRef<FVM_RevivalTimeProgressBar> GetRescuedProgressModel() const property
    {
        this.TrackPropertyRead(1);
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
        this.MarkPropertyDirty(1);
        this.m_RescuedProgressModel = __Value;
        return;
    }
    TEUIModelRef<FVM_RevivalTimeProgressBar> GetNearDeathProgressModel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_NearDeathProgressModel;
    }
    void SetNearDeathProgressModel(const TEUIModelRef<FVM_RevivalTimeProgressBar> &inout __Value) property
    {
        TEUIModelRef<FVM_RevivalTimeProgressBar> local_2;
        local_2 = this.m_NearDeathProgressModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_NearDeathProgressModel = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_InputAction>> GetInputModelRefs() const property
    {
        const TArray<TEUIModelRef<FVM_InputAction>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_InputAction>> GetModify_InputModelRefs() property
    {
        TArray<TEUIModelRef<FVM_InputAction>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetInputModelRefs(const TArray<TEUIModelRef<FVM_InputAction>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_InputModelRefs = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_NearDeath
{
    UPROPERTY()
    float32 KonkHpBarHpProgress;
    UPROPERTY()
    float32 RescuedProgress;
    UPROPERTY()
    FText RescuedReaminingTimeSecond;
    UPROPERTY()
    bool IsBeingRescued;
    UPROPERTY()
    FText RescueName;
    UPROPERTY()
    TEUIModelRef<FVM_NearDeath> Self;


}

namespace FVM_NearDeath
{
FVM_NearDeath& Create(const UObject ContextObject)
{
    return FVM_NearDeath::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_NearDeath CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_NearDeath __r;
    TEUIModelRef<FVM_NearDeath> local_6 = TEUIModelRef<FVM_NearDeath>(EUIInternal::MakeModelWithManager(Manager, FVM_NearDeath::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RescuedProgressModel";
    local_14.TypeName = "TEUIModelRef<FVM_RevivalTimeProgressBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NearDeathProgressModel";
    local_14.TypeName = "TEUIModelRef<FVM_RevivalTimeProgressBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "KonkHpBarHpProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RescuedProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RescuedReaminingTimeSecond";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsBeingRescued";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RescueName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_NearDeath>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_NearDeath;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_NearDeath;
}
void __Tick(FVM_NearDeath &inout Model)
{
    Model.Tick();
    return;
}
TEUIModelRef<FVM_RevivalTimeProgressBar> __UIGetter_RescuedProgressModel(const FVM_NearDeath &inout Model)
{
    return Model.GetRescuedProgressModel();
}
TEUIModelRef<FVM_RevivalTimeProgressBar> __UIGetter_NearDeathProgressModel(const FVM_NearDeath &inout Model)
{
    return Model.GetNearDeathProgressModel();
}
float32 __UIGetter_KonkHpBarHpProgress(const FVM_NearDeath &inout Model)
{
    return Model.GetKonkHpBarHpProgress();
}
float32 __UIGetter_RescuedProgress(const FVM_NearDeath &inout Model)
{
    return Model.GetRescuedProgress();
}
FText __UIGetter_RescuedReaminingTimeSecond(const FVM_NearDeath &inout Model)
{
    return Model.GetRescuedReaminingTimeSecond();
}
bool __UIGetter_IsBeingRescued(const FVM_NearDeath &inout Model)
{
    return Model.IsBeingRescued();
}
FText __UIGetter_RescueName(const FVM_NearDeath &inout Model)
{
    return Model.GetRescueName();
}
TEUIModelRef<FVM_NearDeath> __UIGetter_Self(const FVM_NearDeath &inout Model)
{
    return TEUIModelRef<FVM_NearDeath>(Model);
}
int __IndexOf_bShowAction()
{
    return 0;
}
int __IndexOf_RescuedProgressModel()
{
    return 1;
}
int __IndexOf_NearDeathProgressModel()
{
    return 2;
}
int __IndexOf_InputModelRefs()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_NearDeath
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
