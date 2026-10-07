
namespace FVM_CrossDSMarkGuideDialogHelper
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnDialogCallback = FEUIModelCallbackSignature();
}
namespace FMS_CrossDSMarkGuide
{
    const int ModelId = 0;

}
struct FVM_CrossDSMarkGuideDialogHelper : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_TargetSpot;
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> m_NearestTeleporter;

    FVM_CrossDSMarkGuideDialogHelper()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CrossDSMarkGuideDialogHelper' by default constructor.");
        return;
    }
    FVM_CrossDSMarkGuideDialogHelper(const FVM_CrossDSMarkGuideDialogHelper &inout Other)
    {
        this.m_TargetSpot = Other.m_TargetSpot;
        this.m_NearestTeleporter = Other.m_NearestTeleporter;
        return;
    }
    FVM_CrossDSMarkGuideDialogHelper(const TEUIModelRef<FM_Spot> &inout InTargetSpot, const TDataObjectPtr<FTeleporterConfig> &inout InNearestTeleporter)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTargetSpot(InTargetSpot);
        this.SetNearestTeleporter(InNearestTeleporter);
        return;
    }
    FVM_CrossDSMarkGuideDialogHelper& opAssign(const FVM_CrossDSMarkGuideDialogHelper &inout Other)
    {
        this.m_TargetSpot = Other.m_TargetSpot;
        return Other.m_NearestTeleporter;
    }
    bool OnDialogCallback(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            ::FMS_CrossDSMarkGuide::Get(this.GetManager()).ConfirmCrossDSMarkGuide(this.GetTargetSpot(), this.GetNearestTeleporter());
        }
        return true;
    }
    TEUIModelRef<FM_Spot> GetTargetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TargetSpot;
    }
    void SetTargetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_TargetSpot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TargetSpot = __Value;
        return;
    }
    const TDataObjectPtr<FTeleporterConfig> GetNearestTeleporter() const property
    {
        const TDataObjectPtr<FTeleporterConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FTeleporterConfig> GetModify_NearestTeleporter() property
    {
        TDataObjectPtr<FTeleporterConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetNearestTeleporter(const TDataObjectPtr<FTeleporterConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_NearestTeleporter = __Value;
        return;
    }
}

struct FMS_CrossDSMarkGuide : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_PendingSpot;
    UPROPERTY()
    FVector2D m_PendingTargetPosition2D;
    UPROPERTY()
    FVector m_PendingTargetPosition;
    UPROPERTY()
    bool m_bPendingHas3DPosition;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> m_PendingTargetLevelInfo;
    UPROPERTY()
    TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper> m_DialogHelper;

    FMS_CrossDSMarkGuide()
    {
        this.m_bPendingHas3DPosition = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CrossDSMarkGuide(const FMS_CrossDSMarkGuide &inout Other)
    {
        this.m_bPendingHas3DPosition = false;
        this.m_PendingSpot = Other.m_PendingSpot;
        this.m_PendingTargetPosition2D = Other.m_PendingTargetPosition2D;
        this.m_PendingTargetPosition = Other.m_PendingTargetPosition;
        this.m_bPendingHas3DPosition = Other.m_bPendingHas3DPosition;
        this.m_PendingTargetLevelInfo = Other.m_PendingTargetLevelInfo;
        this.m_DialogHelper = Other.m_DialogHelper;
        return;
    }
    FMS_CrossDSMarkGuide& opAssign(const FMS_CrossDSMarkGuide &inout Other)
    {
        this.m_PendingSpot = Other.m_PendingSpot;
        this.m_PendingTargetPosition2D = Other.m_PendingTargetPosition2D;
        this.m_PendingTargetPosition = Other.m_PendingTargetPosition;
        this.m_bPendingHas3DPosition = Other.m_bPendingHas3DPosition;
        this.m_PendingTargetLevelInfo = Other.m_PendingTargetLevelInfo;
        return Other.m_DialogHelper;
    }
    bool TryRequestCrossDSMarkGuide(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (!(Spot.IsValid()))
        {
            return false;
        }
        FSpotViewAdapter local_10;
        TDataObjectPtr<FLevelInfoConfig> local_34 = ::GetLevelInfo(Spot.opArrow(), local_10);
        if (!(local_34))
        {
            return false;
        }
        TDataObjectPtr<FLevelInfoConfig> local_58 = ::FLevelUtils::GetCurrentLevelInfoConfig(this.GetContext().Manager.GetWorld());
        if (local_58 && (local_58 == local_34.opImplConv()))
        {
            return false;
        }
        TDataObjectPtr<FTeleporterConfig> local_140 = ::FMS_TeleporterData::Get(this.GetManager()).FindNearestActiveTeleporter(local_34, Spot.opArrow().GetTransform().GetPosition2D());
        if (!(local_140))
        {
            FCommonTipsParam local_172;
            ::CommonPopup::Tips(NSLOCTEXT("CrossDSNoActiveTeleporter", "з›®ж ‡з‚№ж‰ЂењЁењ°е›ѕжљ‚ж— е·ІжїЂжґ»зљ„дј йЂЃз‚№"), local_172);
            return true;
        }
        this.SetDialogHelper(TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper>(::FVM_CrossDSMarkGuideDialogHelper::Create(this.GetContext().Manager, Spot, local_140)));
        FDialogModelCallback local_200;
        TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper> local_174 = this.GetDialogHelper();
        local_200.Bind(FVM_CrossDSMarkGuideDialogHelper::OnDialogCallback);
        FText local_242 = FText();
        FText local_246 = FText();
        FDialogCallback local_232 = FDialogCallback(local_200);
        FText local_168 = NSLOCTEXT("CrossDSMarkGuideContent", "з›®ж ‡з‚№дёЌењЁеђЊдёЂењ°е›ѕпјЊжЇеђ¦дј йЂЃи‡іжњЂиї‘зљ„дј йЂЃз‚№е№¶и‡ЄеЉЁеЇји€Є");
        FText local_236 = NSLOCTEXT("CrossDSMarkGuideTitle", "жЏђз¤є");
        FCommonDialogParam local_238;
        ::CommonPopup::Dialog_Decision(local_236, local_168, local_232, local_246, local_242, local_238);
        return true;
    }
    void ConfirmCrossDSMarkGuide(const TEUIModelRef<FM_Spot> &inout Spot, const TDataObjectPtr<FTeleporterConfig> &inout NearestTeleporter)
    {
        if (!(Spot.IsValid()) || !(NearestTeleporter))
        {
            return;
        }
        this.SetPendingSpot(Spot);
        this.SetPendingTargetPosition2D(Spot.opArrow().GetTransform().GetPosition2D());
        this.SetbPendingHas3DPosition(Spot.opArrow().GetTransform().Has3DPosition());
        FVector local_18;
        if (this.GetbPendingHas3DPosition())
        {
            local_18 = Spot.opArrow().GetTransform().GetPosition();
        }
        else
        {
            local_18 = FVector::ZeroVector;
        }
        this.SetPendingTargetPosition(local_18);
        FSpotViewAdapter local_26;
        this.SetPendingTargetLevelInfo(::GetLevelInfo(Spot.opArrow(), local_26));
        ::FVM_TeleporterUtils::Get(this.GetManager()).RequestTeleportDirectly(NearestTeleporter);
        return;
    }
    void OnEntitySpotRegistered(const FMsg_EntitySpotRegistered &inout Msg)
    {
        if (!(this.GetPendingSpot().IsValid()) && !(this.GetPendingTargetLevelInfo()))
        {
            return;
        }
        if (this.GetPendingSpot().IsValid() && (Msg.Spot == this.GetPendingSpot().opImplConv()))
        {
            this.CompletePendingMarkGuideByEntity(Msg.EntityId);
            return;
        }
        bool local_3 = this.GetPendingSpot().IsValid();
        if (local_3)
        {
            FECSEntityId local_9 = ::GetOwnerEntityId(this.GetPendingSpot().opArrow());
            if (!((local_9 == ENTITY_ID_NULL)))
            {
                this.CompletePendingMarkGuideByEntity(local_9);
                return;
            }
        }
        TDataObjectPtr<FLevelInfoConfig> local_36 = ::FLevelUtils::GetCurrentLevelInfoConfig(this.GetContext().Manager.GetWorld());
        if (!(this.GetPendingTargetLevelInfo()))
        {
            local_3 = false;
        }
        else
        {
            local_3 = local_36;
        }
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            FDataObjectPtr local_84;
            local_84;
            local_3 = (local_36 == local_84);
        }
        if (local_3)
        {
            this.CompletePendingMarkGuideByPosition();
        }
        return;
    }
    void OnECSWorldBegin(const FMsg_ECSWorldBegin &inout Msg)
    {
        if (!(this.GetPendingSpot().IsValid()) && !(this.GetPendingTargetLevelInfo()))
        {
            return;
        }
        bool local_3 = this.GetPendingSpot().IsValid();
        if (local_3)
        {
            FECSEntityId local_5 = ::GetOwnerEntityId(this.GetPendingSpot().opArrow());
            if (!((local_5 == ENTITY_ID_NULL)))
            {
                this.CompletePendingMarkGuideByEntity(local_5);
                return;
            }
        }
        TDataObjectPtr<FLevelInfoConfig> local_32 = ::FLevelUtils::GetCurrentLevelInfoConfig(this.GetContext().Manager.GetWorld());
        if (!(this.GetPendingTargetLevelInfo()))
        {
            local_3 = false;
        }
        else
        {
            local_3 = local_32;
        }
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            FDataObjectPtr local_80;
            local_80;
            local_3 = (local_32 == local_80);
        }
        if (local_3 && (this.GetbPendingHas3DPosition() || !(this.GetPendingTargetPosition2D().IsNearlyZero(9.999999747378752e-5))))
        {
            this.CompletePendingMarkGuideByPosition();
        }
        return;
    }
    void CompletePendingMarkGuideByEntity(const FECSEntityId &inout EntityId)
    {
        if ((!((EntityId == ENTITY_ID_NULL))))
        {
            FC_GuidingPathRequestThrottle local_12;
            FECSEntity local_6 = this.GetContext().GetLocalPlayer();
            local_12.PendingKind = 5;
            local_12.PendingTargetEntity = FECSEntity(EntityId);
            local_12.bHasNewRequest = true;
        }
        this.ClearPending();
        return;
    }
    void CompletePendingMarkGuideByPosition()
    {
        bool local_1;
        local_1 = this.GetbPendingHas3DPosition();
        FVector local_8(this.GetPendingTargetPosition());
        FVector2D local_12 = FVector2D(this.GetPendingTargetPosition2D());
        this.ClearPending();
        if (local_1 && !(local_8.IsNearlyZero(9.999999747378752e-5)))
        {
            ::MarkUtil::RequestFastMarkWorldPositionFromMinimap(this.GetContext().GetLocalPlayer(), local_8, true);
            return;
        }
        if (!(local_12.IsNearlyZero(9.999999747378752e-5)))
        {
            ::MarkUtil::RequestFastMarkPositionFromMinimap(this.GetContext().GetLocalPlayer(), local_12, true);
        }
        return;
    }
    void ClearPending()
    {
        this.SetPendingSpot(TEUIModelRef<FM_Spot>());
        this.SetPendingTargetPosition2D(FVector2D::ZeroVector);
        this.SetPendingTargetPosition(FVector::ZeroVector);
        this.SetbPendingHas3DPosition(false);
        TDataObjectPtr<FLevelInfoConfig> local_28;
        this.SetPendingTargetLevelInfo(local_28);
        return;
    }
    TEUIModelRef<FM_Spot> GetPendingSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PendingSpot;
    }
    void SetPendingSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_PendingSpot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PendingSpot = __Value;
        return;
    }
    const FVector2D GetPendingTargetPosition2D() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FVector2D GetModify_PendingTargetPosition2D() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPendingTargetPosition2D(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PendingTargetPosition2D = __Value;
        return;
    }
    const FVector GetPendingTargetPosition() const property
    {
        const FVector __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FVector GetModify_PendingTargetPosition() property
    {
        FVector __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPendingTargetPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PendingTargetPosition = __Value;
        return;
    }
    bool GetbPendingHas3DPosition() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bPendingHas3DPosition;
    }
    void SetbPendingHas3DPosition(const bool __Value) property
    {
        if (!(this.m_bPendingHas3DPosition) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bPendingHas3DPosition = __Value;
        return;
    }
    const TDataObjectPtr<FLevelInfoConfig> GetPendingTargetLevelInfo() const property
    {
        const TDataObjectPtr<FLevelInfoConfig> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TDataObjectPtr<FLevelInfoConfig> GetModify_PendingTargetLevelInfo() property
    {
        TDataObjectPtr<FLevelInfoConfig> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetPendingTargetLevelInfo(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PendingTargetLevelInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper> GetDialogHelper() const property
    {
        this.TrackPropertyRead(5);
        return this.m_DialogHelper;
    }
    void SetDialogHelper(const TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper> &inout __Value) property
    {
        TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper> local_2;
        local_2 = this.m_DialogHelper;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_DialogHelper = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CrossDSMarkGuideDialogHelper
{
    UPROPERTY()
    TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper> Self;

    __GeneratedProperties_FVM_CrossDSMarkGuideDialogHelper()
    {
        return;
    }
}

namespace FVM_CrossDSMarkGuideDialogHelper
{
FVM_CrossDSMarkGuideDialogHelper& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout TargetSpot, const TDataObjectPtr<FTeleporterConfig> &inout NearestTeleporter)
{
    return FVM_CrossDSMarkGuideDialogHelper::CreateByManager(EUIInternal::GetContextManager(ContextObject), TargetSpot, NearestTeleporter);
}
FVM_CrossDSMarkGuideDialogHelper CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout TargetSpot, const TDataObjectPtr<FTeleporterConfig> &inout NearestTeleporter)
{
    FVM_CrossDSMarkGuideDialogHelper __r;
    TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper> local_6 = TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CrossDSMarkGuideDialogHelper::ModelId, 0, TargetSpot, NearestTeleporter));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CrossDSMarkGuideDialogHelper;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CrossDSMarkGuideDialogHelper;
}
TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper> __UIGetter_Self(const FVM_CrossDSMarkGuideDialogHelper &inout Model)
{
    return TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper>(Model);
}
int __IndexOf_TargetSpot()
{
    return 0;
}
int __IndexOf_NearestTeleporter()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CrossDSMarkGuideDialogHelper
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FMS_CrossDSMarkGuide
{
FMS_CrossDSMarkGuide& Get(const UObject ContextObject)
{
    return FMS_CrossDSMarkGuide::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CrossDSMarkGuide GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_CrossDSMarkGuide __r;
    TEUIModelRef<FMS_CrossDSMarkGuide> local_6 = TEUIModelRef<FMS_CrossDSMarkGuide>(EUIInternal::MakeModelWithManager(Manager, FMS_CrossDSMarkGuide::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnEntitySpotRegistered";
    local_14.MessageTypeName = "Msg_EntitySpotRegistered";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnECSWorldBegin";
    local_14.MessageTypeName = "Msg_ECSWorldBegin";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CrossDSMarkGuide;
}
void __OnEntitySpotRegistered(FMS_CrossDSMarkGuide &inout Model, const FMsg_EntitySpotRegistered &inout Message)
{
    Model.OnEntitySpotRegistered(Message);
    return;
}
void __OnECSWorldBegin(FMS_CrossDSMarkGuide &inout Model, const FMsg_ECSWorldBegin &inout Message)
{
    Model.OnECSWorldBegin(Message);
    return;
}
int __IndexOf_PendingSpot()
{
    return 0;
}
int __IndexOf_PendingTargetPosition2D()
{
    return 1;
}
int __IndexOf_PendingTargetPosition()
{
    return 2;
}
int __IndexOf_bPendingHas3DPosition()
{
    return 3;
}
int __IndexOf_PendingTargetLevelInfo()
{
    return 4;
}
int __IndexOf_DialogHelper()
{
    return 5;
}
}
