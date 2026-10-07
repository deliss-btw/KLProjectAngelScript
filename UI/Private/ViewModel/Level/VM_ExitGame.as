
namespace FVMS_ExitGame
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ExitGame = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnComfirmExit = FEUIModelCallbackSignature();

}
struct FVMS_ExitGame : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    int m_Nop;
    UPROPERTY()
    TEUIModelRef<FVMS_ExitGame> m_Instance;
    UPROPERTY()
    APlayerController m_PlayerController;

    FVMS_ExitGame()
    {
        this.m_Nop = 0;
        this.m_PlayerController = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_ExitGame(const FVMS_ExitGame &inout Other)
    {
        this.m_Nop = 0;
        this.m_PlayerController = nullptr;
        this.m_Nop = int(Other.m_Nop);
        this.m_Instance = Other.m_Instance;
        this.m_PlayerController = Other.m_PlayerController;
        return;
    }
    FVMS_ExitGame opAssign(const FVMS_ExitGame &inout Other)
    {
        FVMS_ExitGame __r;
        this.m_Nop = int(Other.m_Nop);
        this.m_Instance = Other.m_Instance;
        this.m_PlayerController = Other.m_PlayerController;
        return __r;
    }
    void PostConstruct()
    {
        this.SetInstance(TEUIModelRef<FVMS_ExitGame>(this));
        return;
    }
    void ExitGame()
    {
        FDialogModelCallback local_26;
        local_26.Bind(this, FVMS_ExitGame::OnComfirmExit);
        FText local_72 = FText();
        FText local_76 = FText();
        FDialogCallback local_58 = FDialogCallback(local_26);
        FText local_62 = NSLOCTEXT("DialogMessage", "зЎ®е®љи¦Ѓз»“жќџжёёж€Џеђ—пјџ");
        FText local_66 = NSLOCTEXT("DialogTitle", "з»“жќџжёёж€Џ");
        FCommonDialogParam local_68;
        ::CommonPopup::Dialog_Decision(local_66, local_62, local_58, local_76, local_72, local_68);
        return;
    }
    void ExitGameByLocalPlayer(const ULocalPlayer InLocalPlayer, const APlayerController InPlayerController)
    {
        this.SetPlayerController(InPlayerController);
        FDialogModelCallback local_26;
        local_26.Bind(this, FVMS_ExitGame::OnComfirmExit);
        FText local_72 = FText();
        FText local_76 = FText();
        FDialogCallback local_58 = FDialogCallback(local_26);
        FText local_62 = NSLOCTEXT("DialogMessage", "зЎ®е®љи¦Ѓз»“жќџжёёж€Џеђ—пјџ");
        FText local_66 = NSLOCTEXT("DialogTitle", "з»“жќџжёёж€Џ");
        FCommonDialogParam local_68;
        ::CommonPopup::Dialog_Decision(InLocalPlayer, local_66, local_62, local_58, local_76, local_72, local_68);
        return;
    }
    bool OnComfirmExit(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            if (this.GetPlayerController() == nullptr)
            {
                FECSEntity local_10 = this.GetContext().GetLocalPlayer();
                Get local_14;
                TWeakObjectPtr<AECSPlayerController> local_16 = local_14.opCall().GetUEPlayerController();
                AECSPlayerController local_18;
                this.SetPlayerController(local_18);
            }
            ::FGameConnectionUtils::UICallQuitGame(this.GetPlayerController());
            this.SetPlayerController(nullptr);
        }
        return true;
    }
    int GetNop() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Nop;
    }
    void SetNop(const int __Value) property
    {
        if (this.m_Nop == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Nop = __Value;
        return;
    }
    TEUIModelRef<FVMS_ExitGame> GetInstance() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Instance;
    }
    void SetInstance(const TEUIModelRef<FVMS_ExitGame> &inout __Value) property
    {
        TEUIModelRef<FVMS_ExitGame> local_2;
        local_2 = this.m_Instance;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Instance = __Value;
        return;
    }
    APlayerController GetPlayerController() const property
    {
        this.TrackPropertyRead(2);
        return this.m_PlayerController;
    }
    void SetPlayerController(const APlayerController __Value) property
    {
        if (this.m_PlayerController == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
}

struct __GeneratedProperties_FVMS_ExitGame
{
    UPROPERTY()
    TEUIModelRef<FVMS_ExitGame> Self;

    __GeneratedProperties_FVMS_ExitGame()
    {
        return;
    }
}

namespace FVMS_ExitGame
{
FVMS_ExitGame& Get(const UObject ContextObject)
{
    return FVMS_ExitGame::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_ExitGame GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_ExitGame __r;
    TEUIModelRef<FVMS_ExitGame> local_6 = TEUIModelRef<FVMS_ExitGame>(EUIInternal::MakeModelWithManager(Manager, FVMS_ExitGame::ModelId));
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
    local_14.TypeName = "TEUIModelRef<FVMS_ExitGame>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_ExitGame;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_ExitGame;
}
TEUIModelRef<FVMS_ExitGame> __UIGetter_Self(const FVMS_ExitGame &inout Model)
{
    return TEUIModelRef<FVMS_ExitGame>(Model);
}
int __IndexOf_Nop()
{
    return 0;
}
int __IndexOf_Instance()
{
    return 1;
}
int __IndexOf_PlayerController()
{
    return 2;
}
}
namespace __GeneratedProperties_FVMS_ExitGame
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
