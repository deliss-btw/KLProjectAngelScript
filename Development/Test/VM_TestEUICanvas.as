
namespace FVM_TestEUICanvas
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature Add = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature Remove = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature TestSideHint = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature TestSmallSideHint = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature TestSideHintWithAction = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature TestLargeBuffSideHint = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature TestSmallBuffSideHint = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnAction = FEUIModelCallbackSignature();

}
struct FVM_TestEUICanvas : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FBuffHintDescParamItemListParam m_LargeBuffSideHintData;
    UPROPERTY()
    FSmallSideHintDataWithBuffStack m_SmallBuffSideHintData;
    UPROPERTY()
    TArray<FEUIModelRef> m_ModelRefsA;
    UPROPERTY()
    TEUIModelRef<FVM_TestEUICanvasSlot> m_ModelRefB;
    UPROPERTY()
    TArray<FEUIModelContainer> m_ModelContainersA;

    FVM_TestEUICanvas()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TestEUICanvas' by default constructor.");
        return;
    }
    FVM_TestEUICanvas(const FVM_TestEUICanvas &inout Other)
    {
        this.m_ModelRefsA = Other.m_ModelRefsA;
        this.m_ModelRefB = Other.m_ModelRefB;
        this.m_ModelContainersA = Other.m_ModelContainersA;
        return;
    }
    FVM_TestEUICanvas(const int ConstructProperty)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_TestEUICanvas& opAssign(const FVM_TestEUICanvas &inout Other)
    {
        this.m_ModelRefsA = Other.m_ModelRefsA;
        this.m_ModelRefB = Other.m_ModelRefB;
        return Other.m_ModelContainersA;
    }
    void LoadConfig(const FConfigVM_TestEUICanvas &inout InConfig)
    {
        this.SetSmallBuffSideHintData(InConfig.SmallBuffSideHintData);
        this.SetLargeBuffSideHintData(InConfig.LargeBuffSideHintData);
        return;
    }
    void PostConstruct()
    {
        int local_3 = 0;
        for (; local_3 < 20; )
        {
            FTestModelFactoryDataStruct local_8;
            local_8.Index = local_3;
            Product local_12;
            this.GetModify_ModelRefsA().Add(local_12.opCall(this.GetContext().Manager, local_8).opImplConv());
            ++local_3;
        }
        this.SetModelRefB(FMyTestCodeGenFactory(25).Product_FVM_TestEUICanvasSlot(this.GetContext().Manager));
        int local_3_2 = 0;
        for (; local_3_2 < 5; )
        {
            FEUIModelContainer local_32;
            this.GetModify_ModelContainersA().Add(local_32);
            ++local_3_2;
        }
        return;
    }
    void Add()
    {
        int local_1 = this.GetModelRefsA().Num();
        FEUIModelRef local_4;
        this.GetModify_ModelRefsA().Add(local_4);
        return;
    }
    void Remove()
    {
        this.GetModify_ModelRefsA().RemoveAt((this.GetModelRefsA().Num() - 1));
        return;
    }
    int UIGetSomeProperty() const
    {
        return 1001;
    }
    void UISetSomeProperty(const int Value)
    {
        return;
    }
    void TestSideHint()
    {
        FText::FromString("Test");
        FText::FromString("Test");
        return;
    }
    void TestSmallSideHint()
    {
        FText::FromString("Test");
        return;
    }
    void TestSideHintWithAction()
    {
        FSimpleModelEvent local_22;
        local_22.Add(this, FVM_TestEUICanvas::OnAction);
        FInputActionListConstructParam local_26;
        local_26.InputActionListConstructParamItems.Add(FInputActionListConstructParamItem(FEUIInputAction(::UICommonUtil::GetConfirmAction()), local_22));
        FText::FromString("Test With Action");
        FText::FromString("Test With Action");
        return;
    }
    void TestLargeBuffSideHint()
    {
        const UUtilitySettings local_2;
        GetGameplaySettings<UUtilitySettings> local_4;
        local_2 = local_4;
        Make local_20;
        local_20;
        return;
    }
    void TestSmallBuffSideHint()
    {
        const UUtilitySettings local_2;
        GetGameplaySettings<UUtilitySettings> local_4;
        local_2 = local_4;
        Make local_20;
        local_20;
        return;
    }
    void OnAction()
    {
        XDisplay(ELog(16), "OnAction");
        return;
    }
    const FBuffHintDescParamItemListParam GetLargeBuffSideHintData() const property
    {
        const FBuffHintDescParamItemListParam __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FBuffHintDescParamItemListParam GetModify_LargeBuffSideHintData() property
    {
        FBuffHintDescParamItemListParam __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLargeBuffSideHintData(const FBuffHintDescParamItemListParam &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FSmallSideHintDataWithBuffStack GetSmallBuffSideHintData() const property
    {
        const FSmallSideHintDataWithBuffStack __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSmallSideHintDataWithBuffStack GetModify_SmallBuffSideHintData() property
    {
        FSmallSideHintDataWithBuffStack __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSmallBuffSideHintData(const FSmallSideHintDataWithBuffStack &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const TArray<FEUIModelRef> GetModelRefsA() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_ModelRefsA() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetModelRefsA(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ModelRefsA = __Value;
        return;
    }
    TEUIModelRef<FVM_TestEUICanvasSlot> GetModelRefB() const property
    {
        this.TrackPropertyRead(3);
        return this.m_ModelRefB;
    }
    void SetModelRefB(const TEUIModelRef<FVM_TestEUICanvasSlot> &inout __Value) property
    {
        TEUIModelRef<FVM_TestEUICanvasSlot> local_2;
        local_2 = this.m_ModelRefB;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ModelRefB = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetModelContainersA() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_ModelContainersA() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetModelContainersA(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ModelContainersA = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TestEUICanvas
{
    UPROPERTY()
    int UISetSomeProperty;
    UPROPERTY()
    TEUIModelRef<FVM_TestEUICanvas> Self;


}

namespace FVM_TestEUICanvas
{
FVM_TestEUICanvas& Create(const UObject ContextObject, const int ConstructProperty)
{
    return FVM_TestEUICanvas::CreateByManager(EUIInternal::GetContextManager(ContextObject), ConstructProperty);
}
FVM_TestEUICanvas CreateByManager(const UEUIManagerSubsystem Manager, const int ConstructProperty)
{
    FVM_TestEUICanvas __r;
    TEUIModelRef<FVM_TestEUICanvas> local_6 = TEUIModelRef<FVM_TestEUICanvas>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TestEUICanvas::ModelId, 0, ConstructProperty));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ModelRefsA";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ModelRefB";
    local_14.TypeName = "TEUIModelRef<FVM_TestEUICanvasSlot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ModelContainersA";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UISetSomeProperty";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (1 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TestEUICanvas>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TestEUICanvas;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TestEUICanvas;
}
TArray<FEUIModelRef> __UIGetter_ModelRefsA(const FVM_TestEUICanvas &inout Model)
{
    return Model.GetModelRefsA();
}
TEUIModelRef<FVM_TestEUICanvasSlot> __UIGetter_ModelRefB(const FVM_TestEUICanvas &inout Model)
{
    return Model.GetModelRefB();
}
TArray<FEUIModelContainer> __UIGetter_ModelContainersA(const FVM_TestEUICanvas &inout Model)
{
    return Model.GetModelContainersA();
}
int __UIGetter_UISetSomeProperty(const FVM_TestEUICanvas &inout Model)
{
    return Model.UIGetSomeProperty();
}
void __UISetter_UISetSomeProperty(FVM_TestEUICanvas &inout Model, const int &inout Value)
{
    Model.UISetSomeProperty(Value);
    return;
}
TEUIModelRef<FVM_TestEUICanvas> __UIGetter_Self(const FVM_TestEUICanvas &inout Model)
{
    return TEUIModelRef<FVM_TestEUICanvas>(Model);
}
int __IndexOf_LargeBuffSideHintData()
{
    return 0;
}
int __IndexOf_SmallBuffSideHintData()
{
    return 1;
}
int __IndexOf_ModelRefsA()
{
    return 2;
}
int __IndexOf_ModelRefB()
{
    return 3;
}
int __IndexOf_ModelContainersA()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_TestEUICanvas
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
