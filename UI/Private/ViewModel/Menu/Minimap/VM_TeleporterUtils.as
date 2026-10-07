
namespace FVM_TeleporterUtilsDelegateHelper
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnDialogCallback = FEUIModelCallbackSignature();
}
namespace FVM_TeleporterUtils
{
    const int ModelId = 0;

}
struct FVM_TeleporterUtilsDelegateHelper : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> m_TeleporterConfig;

    FVM_TeleporterUtilsDelegateHelper()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TeleporterUtilsDelegateHelper' by default constructor.");
        return;
    }
    FVM_TeleporterUtilsDelegateHelper(const FVM_TeleporterUtilsDelegateHelper &inout Other)
    {
        this.m_TeleporterConfig = Other.m_TeleporterConfig;
        return;
    }
    FVM_TeleporterUtilsDelegateHelper(const TDataObjectPtr<FTeleporterConfig> &inout InTeleporterConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTeleporterConfig(InTeleporterConfig);
        return;
    }
    FVM_TeleporterUtilsDelegateHelper& opAssign(const FVM_TeleporterUtilsDelegateHelper &inout Other)
    {
        return Other.m_TeleporterConfig;
    }
    bool OnDialogCallback(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            ::FVM_TeleporterUtils::Get(this.GetManager()).RequestTeleportDirectly(this.GetTeleporterConfig());
        }
        return true;
    }
    const TDataObjectPtr<FTeleporterConfig> GetTeleporterConfig() const property
    {
        const TDataObjectPtr<FTeleporterConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FTeleporterConfig> GetModify_TeleporterConfig() property
    {
        TDataObjectPtr<FTeleporterConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTeleporterConfig(const TDataObjectPtr<FTeleporterConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeleporterConfig = __Value;
        return;
    }
}

struct FVM_TeleporterUtils : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TEUIModelRef<FVM_TeleporterUtilsDelegateHelper> m_DelegateHelper;
    UPROPERTY()
    TEUIModelRef<FVM_TeleporterUtils> m_Hack_NeverRelease;

    FVM_TeleporterUtils()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_TeleporterUtils(const FVM_TeleporterUtils &inout Other)
    {
        this.m_DelegateHelper = Other.m_DelegateHelper;
        this.m_Hack_NeverRelease = Other.m_Hack_NeverRelease;
        return;
    }
    FVM_TeleporterUtils& opAssign(const FVM_TeleporterUtils &inout Other)
    {
        this.m_DelegateHelper = Other.m_DelegateHelper;
        return Other.m_Hack_NeverRelease;
    }
    void PostConstruct()
    {
        this.SetHack_NeverRelease(TEUIModelRef<FVM_TeleporterUtils>(this));
        return;
    }
    void RequestTeleportWithConfirm(const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig)
    {
        if (!(::FGameConnectionUtils::UICheckTeleportAllowed(this.GetContext().GetLocalPlayerPawn(), true)))
        {
            return;
        }
        if (this.IsTeleporterInSameDS(TeleporterConfig))
        {
            this.RequestTeleportWithSpecialCaseComfirm(TeleporterConfig);
            return;
        }
        this.TeleportWithConfirm(TeleporterConfig, FText::Format(NSLOCTEXT("TeleportToOtherLevelConfirm", "жЇеђ¦зЎ®и®¤е‰ЌеѕЂењ°еЊє[{0}]пјџ"), TeleporterConfig.opArrow().DisplayName));
        return;
    }
    void RequestTeleportWithSpecialCaseComfirm(const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig)
    {
        if (!(::FGameConnectionUtils::UICheckTeleportAllowed(this.GetContext().GetLocalPlayerPawn(), true)))
        {
            return;
        }
        if (this.IsTeleporterInSameDS(TeleporterConfig))
        {
            this.TeleportWithConfirm(TeleporterConfig, NSLOCTEXT("TeleportWithSpecialCaseComfirm", "жЇеђ¦дј йЂЃи‡іиЇҐдј йЂЃз‚№пјџ"));
            return;
        }
        this.TeleportWithConfirm(TeleporterConfig, FText::Format(NSLOCTEXT("TeleportToOtherLevelConfirm", "жЇеђ¦зЎ®и®¤е‰ЌеѕЂењ°еЊє[{0}]пјџ"), TeleporterConfig.opArrow().DisplayName));
        return;
    }
    void RequestTeleportDirectly(const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig)
    {
        if (!(::FGameConnectionUtils::UICheckTeleportAllowed(this.GetContext().GetLocalPlayerPawn(), true)))
        {
            return;
        }
        ::FGameConnectionUtils::UICallMoveToTeleporter(this.GetContext().GetLocalPlayer(), TeleporterConfig, ELoadingScreenAction(1));
        return;
    }
    bool IsTeleporterInSameDS(const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig)
    {
        TDataObjectPtr<FLevelInfoConfig> local_24 = TeleporterConfig.opArrow().GetLevelInfoConfig();
        if (!(!(!(local_24))))
        {
            return false;
        }
        GetDefaulted local_54;
        if ((!((local_54.opCall().GetTeleporter(TeleporterConfig) == ENTITY_NULL))))
        {
            return true;
        }
        return false;
    }
    void TeleportWithConfirm(const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig, const FText &inout Content)
    {
        this.SetDelegateHelper(TEUIModelRef<FVM_TeleporterUtilsDelegateHelper>(::FVM_TeleporterUtilsDelegateHelper::Create(this.GetContext().Manager, TeleporterConfig)));
        FDialogModelCallback local_28;
        TEUIModelRef<FVM_TeleporterUtilsDelegateHelper> local_2 = this.GetDelegateHelper();
        local_28.Bind(FVM_TeleporterUtilsDelegateHelper::OnDialogCallback);
        FText local_70 = FText();
        FText local_74 = FText();
        FDialogCallback local_60 = FDialogCallback(local_28);
        FText local_64 = NSLOCTEXT("TeleportToOtherLevelConfirmTitle", "жЏђз¤є");
        FCommonDialogParam local_66;
        ::CommonPopup::Dialog_Decision(local_64, Content, local_60, local_74, local_70, local_66);
        return;
    }
    TEUIModelRef<FVM_TeleporterUtilsDelegateHelper> GetDelegateHelper() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DelegateHelper;
    }
    void SetDelegateHelper(const TEUIModelRef<FVM_TeleporterUtilsDelegateHelper> &inout __Value) property
    {
        TEUIModelRef<FVM_TeleporterUtilsDelegateHelper> local_2;
        local_2 = this.m_DelegateHelper;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DelegateHelper = __Value;
        return;
    }
    TEUIModelRef<FVM_TeleporterUtils> GetHack_NeverRelease() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Hack_NeverRelease;
    }
    void SetHack_NeverRelease(const TEUIModelRef<FVM_TeleporterUtils> &inout __Value) property
    {
        TEUIModelRef<FVM_TeleporterUtils> local_2;
        local_2 = this.m_Hack_NeverRelease;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Hack_NeverRelease = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TeleporterUtilsDelegateHelper
{
    UPROPERTY()
    TEUIModelRef<FVM_TeleporterUtilsDelegateHelper> Self;

    __GeneratedProperties_FVM_TeleporterUtilsDelegateHelper()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_TeleporterUtils
{
    UPROPERTY()
    TEUIModelRef<FVM_TeleporterUtils> Self;

    __GeneratedProperties_FVM_TeleporterUtils()
    {
        return;
    }
}

namespace FVM_TeleporterUtilsDelegateHelper
{
FVM_TeleporterUtilsDelegateHelper& Create(const UObject ContextObject, const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig)
{
    return FVM_TeleporterUtilsDelegateHelper::CreateByManager(EUIInternal::GetContextManager(ContextObject), TeleporterConfig);
}
FVM_TeleporterUtilsDelegateHelper CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig)
{
    FVM_TeleporterUtilsDelegateHelper __r;
    TEUIModelRef<FVM_TeleporterUtilsDelegateHelper> local_6 = TEUIModelRef<FVM_TeleporterUtilsDelegateHelper>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TeleporterUtilsDelegateHelper::ModelId, 0, TeleporterConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeleporterUtilsDelegateHelper>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeleporterUtilsDelegateHelper;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeleporterUtilsDelegateHelper;
}
TEUIModelRef<FVM_TeleporterUtilsDelegateHelper> __UIGetter_Self(const FVM_TeleporterUtilsDelegateHelper &inout Model)
{
    return TEUIModelRef<FVM_TeleporterUtilsDelegateHelper>(Model);
}
int __IndexOf_TeleporterConfig()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_TeleporterUtilsDelegateHelper
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_TeleporterUtils
{
FVM_TeleporterUtils& Get(const UObject ContextObject)
{
    return FVM_TeleporterUtils::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TeleporterUtils GetByManager(const UEUIManagerSubsystem Manager)
{
    FVM_TeleporterUtils __r;
    TEUIModelRef<FVM_TeleporterUtils> local_6 = TEUIModelRef<FVM_TeleporterUtils>(EUIInternal::MakeModelWithManager(Manager, FVM_TeleporterUtils::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeleporterUtils>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeleporterUtils;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeleporterUtils;
}
TEUIModelRef<FVM_TeleporterUtils> __UIGetter_Self(const FVM_TeleporterUtils &inout Model)
{
    return TEUIModelRef<FVM_TeleporterUtils>(Model);
}
int __IndexOf_DelegateHelper()
{
    return 0;
}
int __IndexOf_Hack_NeverRelease()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TeleporterUtils
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
