
namespace FVM_CustomWheelOptionButton
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnButtonClicked = FEUIModelCallbackSignature();
}
namespace FVMS_CustomWheel
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnConfirmButtonClicked = FEUIModelCallbackSignature();

}
struct FMsg_CloseCustomWheel : FEUIMessage
{
    FMsg_CloseCustomWheel()
    {
        return;
    }
}

struct FMsg_CustomWheelOptionSelected : FEUIMessage
{
    UPROPERTY()
    int SelectedIndex;


}

struct FVM_CustomWheelOptionButton : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FCustomWheelOptionConfig> m_OptionConfig;
    UPROPERTY()
    ESlateVisibility m_SelectedVisibility;

    FVM_CustomWheelOptionButton()
    {
        this.m_SelectedVisibility = ESlateVisibility(2);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CustomWheelOptionButton' by default constructor.");
        return;
    }
    FVM_CustomWheelOptionButton(const FVM_CustomWheelOptionButton &inout Other)
    {
        this.m_SelectedVisibility = ESlateVisibility(2);
        this.m_OptionConfig = Other.m_OptionConfig;
        this.m_SelectedVisibility = Other.m_SelectedVisibility;
        return;
    }
    FVM_CustomWheelOptionButton(const TDataObjectPtr<FCustomWheelOptionConfig> &inout InOptionConfig)
    {
        this.m_SelectedVisibility = ESlateVisibility(2);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetOptionConfig(InOptionConfig);
        return;
    }
    FVM_CustomWheelOptionButton opAssign(const FVM_CustomWheelOptionButton &inout Other)
    {
        FVM_CustomWheelOptionButton __r;
        this.m_OptionConfig = Other.m_OptionConfig;
        this.m_SelectedVisibility = Other.m_SelectedVisibility;
        return __r;
    }
    FSoftBrush GetIconBrush() const
    {
        FCustomWheelOptionConfig local_88;
        FSoftBrush __r;
        if (int(local_88.OptionType) == 1)
        {
        }
        else
        {
            if (int(local_88.OptionType) == 2)
            {
            }
            else
            {
            }
        }
        return __r;
    }
    void OnButtonClicked()
    {
        ::FVMS_CustomWheel::SendCustonWheelOption();
        FMsg_CloseCustomWheel local_8;
        local_8 = FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(FEUIModelRef(this));
        return;
    }
    void ChangeSelectedState(const bool bSelected)
    {
        int local_1;
        if (bSelected)
        {
            int local_2;
            local_2 = 0;
            local_1 = local_2;
        }
        else
        {
            int local_2;
            local_2 = 2;
            local_1 = local_2;
        }
        this.SetSelectedVisibility(ESlateVisibility(local_1));
        return;
    }
    const TDataObjectPtr<FCustomWheelOptionConfig> GetOptionConfig() const property
    {
        const TDataObjectPtr<FCustomWheelOptionConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FCustomWheelOptionConfig> GetModify_OptionConfig() property
    {
        TDataObjectPtr<FCustomWheelOptionConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetOptionConfig(const TDataObjectPtr<FCustomWheelOptionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OptionConfig = __Value;
        return;
    }
    ESlateVisibility GetSelectedVisibility() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SelectedVisibility;
    }
    void SetSelectedVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_SelectedVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectedVisibility = __Value;
        return;
    }
}

struct FVMS_CustomWheel : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TArray<TDataObjectPtr<FCustomWheelOptionConfig>> m_OptionConfigs;
    UPROPERTY()
    TEUIModelRef<FVM_CustomWheelOptionButton> m_Up;
    UPROPERTY()
    TEUIModelRef<FVM_CustomWheelOptionButton> m_RightUp;
    UPROPERTY()
    TEUIModelRef<FVM_CustomWheelOptionButton> m_Right;
    UPROPERTY()
    TEUIModelRef<FVM_CustomWheelOptionButton> m_RightDown;
    UPROPERTY()
    TEUIModelRef<FVM_CustomWheelOptionButton> m_Down;
    UPROPERTY()
    TEUIModelRef<FVM_CustomWheelOptionButton> m_LeftDown;
    UPROPERTY()
    TEUIModelRef<FVM_CustomWheelOptionButton> m_Left;
    UPROPERTY()
    TEUIModelRef<FVM_CustomWheelOptionButton> m_LeftUp;
    UPROPERTY()
    bool m_bShouldClose;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CustomWheelOptionButton>> m_Buttons;
    UPROPERTY()
    int m_SelectedIndex;

    FVMS_CustomWheel()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVMS_CustomWheel(const FVMS_CustomWheel &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVMS_CustomWheel opAssign(const FVMS_CustomWheel &inout Other)
    {
        FVMS_CustomWheel __r;
        this.m_OptionConfigs = Other.m_OptionConfigs;
        this.m_Up = Other.m_Up;
        this.m_RightUp = Other.m_RightUp;
        this.m_Right = Other.m_Right;
        this.m_RightDown = Other.m_RightDown;
        this.m_Down = Other.m_Down;
        this.m_LeftDown = Other.m_LeftDown;
        this.m_Left = Other.m_Left;
        this.m_LeftUp = Other.m_LeftUp;
        this.m_bShouldClose = Other.m_bShouldClose;
        this.m_Buttons = Other.m_Buttons;
        this.m_SelectedIndex = int(Other.m_SelectedIndex);
        return __r;
    }
    void LoadConfigDefault(const FVMS_CustomWheelConfigDefault &inout InConfig)
    {
        this.SetOptionConfigs(InConfig.OptionConfigs);
        return;
    }
    void PostConstruct()
    {
        int local_17;
        this.SetbShouldClose(false);
        this.GetModify_Buttons().Empty(0);
        for (auto& local_16 : this.GetOptionConfigs())
        {
            if ((local_16 == nullptr))
            {
                continue;
            }
            int local_2 = local_16.opArrow().Index;
            local_17 = local_2;
            TEUIModelRef<FVM_CustomWheelOptionButton> local_20 = TEUIModelRef<FVM_CustomWheelOptionButton>(::FVM_CustomWheelOptionButton::Create(this.GetContext().Manager, local_16));
            this.GetModify_Buttons().Add(local_20);
            switch (local_17)
            {
            case 0:
            {
                this.SetUp(local_20);
                break;
            }
            case 1:
            {
                this.SetRightUp(local_20);
                break;
            }
            case 2:
            {
                this.SetRight(local_20);
                break;
            }
            case 3:
            {
                this.SetRightDown(local_20);
                break;
            }
            case 4:
            {
                this.SetDown(local_20);
                break;
            }
            case 5:
            {
                this.SetLeftDown(local_20);
                break;
            }
            case 6:
            {
                this.SetLeft(local_20);
                break;
            }
            case 7:
            {
                this.SetLeftUp(local_20);
            }
            }
        }
        return;
    }
    FText GetSelectedOptionName() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FText __r; return __r;
    }
    FText GetSelectedOptionContextName() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FText __r; return __r;
    }
    ESlateVisibility GetSelectedVisible() const
    {
        if ((int(::UICommonUtil::GetCurrentInputType(nullptr))) == 0)
        {
            return ESlateVisibility(3);
        }
        return ESlateVisibility(2);
    }
    void OnCloseCustomWheel(const FMsg_CloseCustomWheel &inout Msg)
    {
        this.SetbShouldClose(true);
        return;
    }
    void OnConfirmButtonClicked()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void ChangeSelectedState(const bool bSelected, const int ButtonIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    const TArray<TDataObjectPtr<FCustomWheelOptionConfig>> GetOptionConfigs() const property
    {
        const TArray<TDataObjectPtr<FCustomWheelOptionConfig>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TDataObjectPtr<FCustomWheelOptionConfig>> GetModify_OptionConfigs() property
    {
        TArray<TDataObjectPtr<FCustomWheelOptionConfig>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetOptionConfigs(const TArray<TDataObjectPtr<FCustomWheelOptionConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OptionConfigs = __Value;
        return;
    }
    TEUIModelRef<FVM_CustomWheelOptionButton> GetUp() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Up;
    }
    void SetUp(const TEUIModelRef<FVM_CustomWheelOptionButton> &inout __Value) property
    {
        TEUIModelRef<FVM_CustomWheelOptionButton> local_2;
        local_2 = this.m_Up;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Up = __Value;
        return;
    }
    TEUIModelRef<FVM_CustomWheelOptionButton> GetRightUp() const property
    {
        this.TrackPropertyRead(2);
        return this.m_RightUp;
    }
    void SetRightUp(const TEUIModelRef<FVM_CustomWheelOptionButton> &inout __Value) property
    {
        TEUIModelRef<FVM_CustomWheelOptionButton> local_2;
        local_2 = this.m_RightUp;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RightUp = __Value;
        return;
    }
    TEUIModelRef<FVM_CustomWheelOptionButton> GetRight() const property
    {
        this.TrackPropertyRead(3);
        return this.m_Right;
    }
    void SetRight(const TEUIModelRef<FVM_CustomWheelOptionButton> &inout __Value) property
    {
        TEUIModelRef<FVM_CustomWheelOptionButton> local_2;
        local_2 = this.m_Right;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Right = __Value;
        return;
    }
    TEUIModelRef<FVM_CustomWheelOptionButton> GetRightDown() const property
    {
        this.TrackPropertyRead(4);
        return this.m_RightDown;
    }
    void SetRightDown(const TEUIModelRef<FVM_CustomWheelOptionButton> &inout __Value) property
    {
        TEUIModelRef<FVM_CustomWheelOptionButton> local_2;
        local_2 = this.m_RightDown;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_RightDown = __Value;
        return;
    }
    TEUIModelRef<FVM_CustomWheelOptionButton> GetDown() const property
    {
        this.TrackPropertyRead(5);
        return this.m_Down;
    }
    void SetDown(const TEUIModelRef<FVM_CustomWheelOptionButton> &inout __Value) property
    {
        TEUIModelRef<FVM_CustomWheelOptionButton> local_2;
        local_2 = this.m_Down;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Down = __Value;
        return;
    }
    TEUIModelRef<FVM_CustomWheelOptionButton> GetLeftDown() const property
    {
        this.TrackPropertyRead(6);
        return this.m_LeftDown;
    }
    void SetLeftDown(const TEUIModelRef<FVM_CustomWheelOptionButton> &inout __Value) property
    {
        TEUIModelRef<FVM_CustomWheelOptionButton> local_2;
        local_2 = this.m_LeftDown;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_LeftDown = __Value;
        return;
    }
    TEUIModelRef<FVM_CustomWheelOptionButton> GetLeft() const property
    {
        this.TrackPropertyRead(7);
        return this.m_Left;
    }
    void SetLeft(const TEUIModelRef<FVM_CustomWheelOptionButton> &inout __Value) property
    {
        TEUIModelRef<FVM_CustomWheelOptionButton> local_2;
        local_2 = this.m_Left;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_Left = __Value;
        return;
    }
    TEUIModelRef<FVM_CustomWheelOptionButton> GetLeftUp() const property
    {
        this.TrackPropertyRead(8);
        return this.m_LeftUp;
    }
    void SetLeftUp(const TEUIModelRef<FVM_CustomWheelOptionButton> &inout __Value) property
    {
        TEUIModelRef<FVM_CustomWheelOptionButton> local_2;
        local_2 = this.m_LeftUp;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_LeftUp = __Value;
        return;
    }
    bool GetbShouldClose() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bShouldClose;
    }
    void SetbShouldClose(const bool __Value) property
    {
        if (!(this.m_bShouldClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bShouldClose = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CustomWheelOptionButton>> GetButtons() const property
    {
        const TArray<TEUIModelRef<FVM_CustomWheelOptionButton>> __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CustomWheelOptionButton>> GetModify_Buttons() property
    {
        TArray<TEUIModelRef<FVM_CustomWheelOptionButton>> __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetButtons(const TArray<TEUIModelRef<FVM_CustomWheelOptionButton>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_Buttons = __Value;
        return;
    }
    int GetSelectedIndex() const property
    {
        this.TrackPropertyRead(11);
        return this.m_SelectedIndex;
    }
    void SetSelectedIndex(const int __Value) property
    {
        if (this.m_SelectedIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SelectedIndex = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CustomWheelOptionButton
{
    UPROPERTY()
    FSoftBrush IconBrush;
    UPROPERTY()
    TEUIModelRef<FVM_CustomWheelOptionButton> Self;

    __GeneratedProperties_FVM_CustomWheelOptionButton()
    {
        return;
    }
}

struct __GeneratedProperties_FVMS_CustomWheel
{
    UPROPERTY()
    FText SelectedOptionName;
    UPROPERTY()
    FText SelectedOptionContextName;
    UPROPERTY()
    ESlateVisibility SelectedVisible;
    UPROPERTY()
    TEUIModelRef<FVMS_CustomWheel> Self;


}

namespace FVMS_CustomWheel
{
void SendCustonWheelOption(const FCustomWheelOptionConfig &inout OptionConfig)
{
    int local_70 = 0;
    FECSEntity local_4 = FASCommonUtils::GetLocalPlayerPawnEntity();
    if ((local_4 == ENTITY_NULL))
    {
        return;
    }
    if (int(OptionConfig.OptionType) == 2)
    {
        FECSEntity local_8 = FASCommonUtils::GetLocalPlayerProxy();
        TDataObjectPtr<FMotionData> local_40 = OptionConfig.GetDefaultMotionData();
        FSocialUtils::PlaySocialAction(local_4, local_8, local_40);
    }
    FECSWorldPtr local_66 = local_4.GetWorld();
    TDataObjectPtr<FCustomWheelOptionConfig> local_98;
    local_70.OptionConfig = local_98;
    return;
}
}
namespace FVM_CustomWheelOptionButton
{
FVM_CustomWheelOptionButton& Create(const UObject ContextObject, const TDataObjectPtr<FCustomWheelOptionConfig> &inout OptionConfig)
{
    return FVM_CustomWheelOptionButton::CreateByManager(EUIInternal::GetContextManager(ContextObject), OptionConfig);
}
FVM_CustomWheelOptionButton CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FCustomWheelOptionConfig> &inout OptionConfig)
{
    FVM_CustomWheelOptionButton __r;
    TEUIModelRef<FVM_CustomWheelOptionButton> local_6 = TEUIModelRef<FVM_CustomWheelOptionButton>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CustomWheelOptionButton::ModelId, 0, OptionConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SelectedVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconBrush";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CustomWheelOptionButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CustomWheelOptionButton;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CustomWheelOptionButton;
}
ESlateVisibility __UIGetter_SelectedVisibility(const FVM_CustomWheelOptionButton &inout Model)
{
    return Model.GetSelectedVisibility();
}
FSoftBrush __UIGetter_IconBrush(const FVM_CustomWheelOptionButton &inout Model)
{
    return Model.GetIconBrush();
}
TEUIModelRef<FVM_CustomWheelOptionButton> __UIGetter_Self(const FVM_CustomWheelOptionButton &inout Model)
{
    return TEUIModelRef<FVM_CustomWheelOptionButton>(Model);
}
int __IndexOf_OptionConfig()
{
    return 0;
}
int __IndexOf_SelectedVisibility()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CustomWheelOptionButton
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVMS_CustomWheel
{
FVMS_CustomWheel& Get(const UObject ContextObject)
{
    return FVMS_CustomWheel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_CustomWheel GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_CustomWheel __r;
    TEUIModelRef<FVMS_CustomWheel> local_6 = TEUIModelRef<FVMS_CustomWheel>(EUIInternal::MakeModelWithManager(Manager, FVMS_CustomWheel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(true);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Up";
    local_14.TypeName = "TEUIModelRef<FVM_CustomWheelOptionButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightUp";
    local_14.TypeName = "TEUIModelRef<FVM_CustomWheelOptionButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Right";
    local_14.TypeName = "TEUIModelRef<FVM_CustomWheelOptionButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightDown";
    local_14.TypeName = "TEUIModelRef<FVM_CustomWheelOptionButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Down";
    local_14.TypeName = "TEUIModelRef<FVM_CustomWheelOptionButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftDown";
    local_14.TypeName = "TEUIModelRef<FVM_CustomWheelOptionButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Left";
    local_14.TypeName = "TEUIModelRef<FVM_CustomWheelOptionButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftUp";
    local_14.TypeName = "TEUIModelRef<FVM_CustomWheelOptionButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedOptionName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedOptionContextName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedVisible";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_CustomWheel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_CustomWheel;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnCloseCustomWheel";
    local_26.MessageTypeName = "Msg_CloseCustomWheel";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_CustomWheel;
}
void __OnCloseCustomWheel(FVMS_CustomWheel &inout Model, const FMsg_CloseCustomWheel &inout Message)
{
    Model.OnCloseCustomWheel(Message);
    return;
}
TEUIModelRef<FVM_CustomWheelOptionButton> __UIGetter_Up(const FVMS_CustomWheel &inout Model)
{
    return Model.GetUp();
}
TEUIModelRef<FVM_CustomWheelOptionButton> __UIGetter_RightUp(const FVMS_CustomWheel &inout Model)
{
    return Model.GetRightUp();
}
TEUIModelRef<FVM_CustomWheelOptionButton> __UIGetter_Right(const FVMS_CustomWheel &inout Model)
{
    return Model.GetRight();
}
TEUIModelRef<FVM_CustomWheelOptionButton> __UIGetter_RightDown(const FVMS_CustomWheel &inout Model)
{
    return Model.GetRightDown();
}
TEUIModelRef<FVM_CustomWheelOptionButton> __UIGetter_Down(const FVMS_CustomWheel &inout Model)
{
    return Model.GetDown();
}
TEUIModelRef<FVM_CustomWheelOptionButton> __UIGetter_LeftDown(const FVMS_CustomWheel &inout Model)
{
    return Model.GetLeftDown();
}
TEUIModelRef<FVM_CustomWheelOptionButton> __UIGetter_Left(const FVMS_CustomWheel &inout Model)
{
    return Model.GetLeft();
}
TEUIModelRef<FVM_CustomWheelOptionButton> __UIGetter_LeftUp(const FVMS_CustomWheel &inout Model)
{
    return Model.GetLeftUp();
}
FText __UIGetter_SelectedOptionName(const FVMS_CustomWheel &inout Model)
{
    return Model.GetSelectedOptionName();
}
FText __UIGetter_SelectedOptionContextName(const FVMS_CustomWheel &inout Model)
{
    return Model.GetSelectedOptionContextName();
}
ESlateVisibility __UIGetter_SelectedVisible(const FVMS_CustomWheel &inout Model)
{
    return Model.GetSelectedVisible();
}
TEUIModelRef<FVMS_CustomWheel> __UIGetter_Self(const FVMS_CustomWheel &inout Model)
{
    return TEUIModelRef<FVMS_CustomWheel>(Model);
}
int __IndexOf_OptionConfigs()
{
    return 0;
}
int __IndexOf_Up()
{
    return 1;
}
int __IndexOf_RightUp()
{
    return 2;
}
int __IndexOf_Right()
{
    return 3;
}
int __IndexOf_RightDown()
{
    return 4;
}
int __IndexOf_Down()
{
    return 5;
}
int __IndexOf_LeftDown()
{
    return 6;
}
int __IndexOf_Left()
{
    return 7;
}
int __IndexOf_LeftUp()
{
    return 8;
}
int __IndexOf_bShouldClose()
{
    return 9;
}
int __IndexOf_Buttons()
{
    return 10;
}
int __IndexOf_SelectedIndex()
{
    return 11;
}
}
namespace __GeneratedProperties_FVMS_CustomWheel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
