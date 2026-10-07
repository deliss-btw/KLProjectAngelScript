
namespace FVMS_FriendAssemble
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnConfirmFriendSwitchLine = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnConfirmTeamSwitchLine = FEUIModelCallbackSignature();

}
struct FVMS_FriendAssemble : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TEUIModelRef<FVMS_FriendAssemble> m_Instance;

    FVMS_FriendAssemble()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_FriendAssemble(const FVMS_FriendAssemble &inout Other)
    {
        this.m_Instance = Other.m_Instance;
        return;
    }
    FVMS_FriendAssemble& opAssign(const FVMS_FriendAssemble &inout Other)
    {
        return Other.m_Instance;
    }
    void PostConstruct()
    {
        this.SetInstance(TEUIModelRef<FVMS_FriendAssemble>(this));
        return;
    }
    void ShowFriendSwitchLineDialog()
    {
        FDialogModelCallback local_26;
        local_26.Bind(this, FVMS_FriendAssemble::OnConfirmFriendSwitchLine);
        FText local_30 = NSLOCTEXT("FriendSwitchLineCancel", "еЏ–ж¶€");
        FText local_34 = NSLOCTEXT("FriendSwitchLineConfirm", "зЎ®и®¤жЌўзєї");
        FDialogCallback local_66 = FDialogCallback(local_26);
        FText local_70 = NSLOCTEXT("FriendSwitchLineContent", "еЅ“е‰Ќе€†зєїе·Іж»Ўе‘пјЊжЇеђ¦з¦»ејЂе‰ЌеѕЂж–°е€†зєї\nпј€е‰ЌеѕЂеЅ“е‰ЌдЅЌзЅ®жњЂиї‘зљ„дј йЂЃењ°и„‰пј‰");
        FText local_74 = NSLOCTEXT("FriendSwitchLineTitle", "жЏђз¤є");
        FCommonDialogParam local_76;
        ::CommonPopup::Dialog_Decision(local_74, local_70, local_66, local_34, local_30, local_76);
        return;
    }
    bool OnConfirmFriendSwitchLine(const FCommonDialogAnswer &inout Answer)
    {
        int local_9;
        bool local_5 = (int(Answer.AnswerType) == 1);
        FMS_FriendDataModel& local_8 = ::FMS_FriendDataModel::Get(this.GetContext().UELocalPlayer);
        local_9 = local_8.GetPendingAssembleTargetUid();
        if (local_9 > 0)
        {
            local_8.GS_FriendAssembleConfirmReq(local_9, local_5);
        }
        local_8.SetPendingAssembleTargetUid(0);
        return true;
    }
    void ShowTeamSwitchLineDialog()
    {
        FDialogModelCallback local_26;
        local_26.Bind(this, FVMS_FriendAssemble::OnConfirmTeamSwitchLine);
        FText local_30 = NSLOCTEXT("TeamSwitchLineCancel", "еЏ–ж¶€");
        FText local_34 = NSLOCTEXT("TeamSwitchLineConfirm", "зЎ®и®¤жЌўзєї");
        FDialogCallback local_66 = FDialogCallback(local_26);
        FText local_70 = NSLOCTEXT("TeamSwitchLineContent", "еЅ“е‰Ќзєїи·Їе®№й‡ЏдёЌи¶іпјЊйњЂи¦Ѓж‚ЁжЌўзєїж‰ЌиѓЅеЏ¬й›†йџдјЌпјЊжЇеђ¦зЎ®и®¤пјџ");
        FText local_74 = NSLOCTEXT("TeamSwitchLineTitle", "жЏђз¤є");
        FCommonDialogParam local_76;
        ::CommonPopup::Dialog_Decision(local_74, local_70, local_66, local_34, local_30, local_76);
        return;
    }
    bool OnConfirmTeamSwitchLine(const FCommonDialogAnswer &inout Answer)
    {
        ::FMS_FriendDataModel::Get(this.GetContext().UELocalPlayer).GS_TeamAssembleConfirmReq((int(Answer.AnswerType) == 1));
        return true;
    }
    TEUIModelRef<FVMS_FriendAssemble> GetInstance() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Instance;
    }
    void SetInstance(const TEUIModelRef<FVMS_FriendAssemble> &inout __Value) property
    {
        TEUIModelRef<FVMS_FriendAssemble> local_2;
        local_2 = this.m_Instance;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Instance = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_FriendAssemble
{
    UPROPERTY()
    TEUIModelRef<FVMS_FriendAssemble> Self;

    __GeneratedProperties_FVMS_FriendAssemble()
    {
        return;
    }
}

namespace FVMS_FriendAssemble
{
FVMS_FriendAssemble& Get(const UObject ContextObject)
{
    return FVMS_FriendAssemble::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_FriendAssemble GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_FriendAssemble __r;
    TEUIModelRef<FVMS_FriendAssemble> local_6 = TEUIModelRef<FVMS_FriendAssemble>(EUIInternal::MakeModelWithManager(Manager, FVMS_FriendAssemble::ModelId));
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
    local_14.TypeName = "TEUIModelRef<FVMS_FriendAssemble>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_FriendAssemble;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_FriendAssemble;
}
TEUIModelRef<FVMS_FriendAssemble> __UIGetter_Self(const FVMS_FriendAssemble &inout Model)
{
    return TEUIModelRef<FVMS_FriendAssemble>(Model);
}
int __IndexOf_Instance()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_FriendAssemble
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
