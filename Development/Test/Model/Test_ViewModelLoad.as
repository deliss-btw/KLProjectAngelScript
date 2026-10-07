
namespace FVM_TestLoad0
{
    const int ModelId = 0;
}
namespace FVM_TestLoad1
{
    const int ModelId = 0;
}
namespace FVM_TestLoad2
{
    const int ModelId = 0;
}
namespace FVM_TestLoad3
{
    const int ModelId = 0;

}
struct FVM_TestLoad0 : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Value0;

    FVM_TestLoad0()
    {
        this.m_Value0 = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TestLoad0' by default constructor.");
        return;
    }
    FVM_TestLoad0(const FVM_TestLoad0 &inout Other)
    {
        this.m_Value0 = 0;
        this.m_Value0 = int(Other.m_Value0);
        return;
    }
    FVM_TestLoad0(const int InValue0)
    {
        this.m_Value0 = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetValue0(InValue0);
        return;
    }
    FVM_TestLoad0 opAssign(const FVM_TestLoad0 &inout Other)
    {
        FVM_TestLoad0 __r;
        this.m_Value0 = int(Other.m_Value0);
        return __r;
    }
    void PostLoad()
    {
        XLog(ELog(16), "Load0");
        TEUIModelRef<FVM_TestLoad1> local_4 = TEUIModelRef<FVM_TestLoad1>(FEUIWidgetRef::GetViewModel(this.GetOwnerWidget()).opCall(NAME_None));
        int local_13 = local_4.opArrow().GetValue1();
        int local_13_2 = local_4.opArrow().GetValue1Config();
        return;
    }
    int GetValue0() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Value0;
    }
    void SetValue0(const int __Value) property
    {
        if (this.m_Value0 == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Value0 = __Value;
        return;
    }
}

struct FVM_TestLoad1 : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Value1;
    UPROPERTY()
    int m_Value1Config;

    FVM_TestLoad1()
    {
        this.m_Value1 = 0;
        this.m_Value1Config = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TestLoad1' by default constructor.");
        return;
    }
    FVM_TestLoad1(const FVM_TestLoad1 &inout Other)
    {
        this.m_Value1 = 0;
        this.m_Value1Config = 0;
        this.m_Value1 = int(Other.m_Value1);
        this.m_Value1Config = int(Other.m_Value1Config);
        return;
    }
    FVM_TestLoad1(const int InValue1)
    {
        this.m_Value1 = 0;
        this.m_Value1Config = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetValue1(InValue1);
        return;
    }
    FVM_TestLoad1 opAssign(const FVM_TestLoad1 &inout Other)
    {
        FVM_TestLoad1 __r;
        this.m_Value1 = int(Other.m_Value1);
        this.m_Value1Config = int(Other.m_Value1Config);
        return __r;
    }
    void LoadConfig(const FConfigVM_TestLoad1 &inout InConfig)
    {
        this.SetValue1Config(int(InConfig.Value1Config));
        return;
    }
    void PostLoad()
    {
        XLog(ELog(16), "Load1");
        return;
    }
    int GetValue1() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Value1;
    }
    void SetValue1(const int __Value) property
    {
        if (this.m_Value1 == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Value1 = __Value;
        return;
    }
    int GetValue1Config() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Value1Config;
    }
    void SetValue1Config(const int __Value) property
    {
        if (this.m_Value1Config == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Value1Config = __Value;
        return;
    }
}

struct FVM_TestLoad2 : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Value2;

    FVM_TestLoad2()
    {
        this.m_Value2 = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TestLoad2' by default constructor.");
        return;
    }
    FVM_TestLoad2(const FVM_TestLoad2 &inout Other)
    {
        this.m_Value2 = 0;
        this.m_Value2 = int(Other.m_Value2);
        return;
    }
    FVM_TestLoad2(const int InValue2)
    {
        this.m_Value2 = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetValue2(InValue2);
        return;
    }
    FVM_TestLoad2 opAssign(const FVM_TestLoad2 &inout Other)
    {
        FVM_TestLoad2 __r;
        this.m_Value2 = int(Other.m_Value2);
        return __r;
    }
    void PostLoad()
    {
        XLog(ELog(16), "Load2");
        return;
    }
    int GetValue2() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Value2;
    }
    void SetValue2(const int __Value) property
    {
        if (this.m_Value2 == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Value2 = __Value;
        return;
    }
}

struct FVM_TestLoad3 : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;

    FVM_TestLoad3()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_TestLoad3(const FVM_TestLoad3 &inout Other)
    {
        return;
    }
    FVM_TestLoad3 opAssign(const FVM_TestLoad3 &inout Other)
    {
        FVM_TestLoad3 __r;
        return __r;
    }
    void PostLoad()
    {
        XLog(ELog(16), "Load3");
        TEUIModelRef<FVM_TestLoad0> local_12 = TEUIModelRef<FVM_TestLoad0>(FEUIWidgetRef::GetViewModel(this.GetOwnerWidget()).opCall(NAME_None));
        TEUIModelRef<FVM_TestLoad1> local_14 = TEUIModelRef<FVM_TestLoad1>(FEUIWidgetRef::GetViewModel(this.GetOwnerWidget()).opCall(NAME_None));
        TEUIModelRef<FVM_TestLoad2> local_22 = TEUIModelRef<FVM_TestLoad2>(FEUIWidgetRef::GetViewModel(this.GetOwnerWidget()).opCall(NAME_None));
        int local_29 = local_22.opArrow().GetValue2();
        int local_29_2 = local_12.opArrow().GetValue0();
        int local_30 = local_14.opArrow().GetValue1();
        int local_29_3 = local_14.opArrow().GetValue1Config();
        return;
    }
}

struct __GeneratedProperties_FVM_TestLoad0
{
    UPROPERTY()
    TEUIModelRef<FVM_TestLoad0> Self;

    __GeneratedProperties_FVM_TestLoad0()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_TestLoad1
{
    UPROPERTY()
    TEUIModelRef<FVM_TestLoad1> Self;

    __GeneratedProperties_FVM_TestLoad1()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_TestLoad2
{
    UPROPERTY()
    TEUIModelRef<FVM_TestLoad2> Self;

    __GeneratedProperties_FVM_TestLoad2()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_TestLoad3
{
    UPROPERTY()
    TEUIModelRef<FVM_TestLoad3> Self;

    __GeneratedProperties_FVM_TestLoad3()
    {
        return;
    }
}

namespace FVM_TestLoad0
{
FVM_TestLoad0& Create(const UObject ContextObject, const int Value0)
{
    return FVM_TestLoad0::CreateByManager(EUIInternal::GetContextManager(ContextObject), Value0);
}
FVM_TestLoad0 CreateByManager(const UEUIManagerSubsystem Manager, const int Value0)
{
    FVM_TestLoad0 __r;
    TEUIModelRef<FVM_TestLoad0> local_6 = TEUIModelRef<FVM_TestLoad0>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TestLoad0::ModelId, 0, Value0));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TestLoad0>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TestLoad0;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TestLoad0;
}
TEUIModelRef<FVM_TestLoad0> __UIGetter_Self(const FVM_TestLoad0 &inout Model)
{
    return TEUIModelRef<FVM_TestLoad0>(Model);
}
int __IndexOf_Value0()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_TestLoad0
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_TestLoad1
{
FVM_TestLoad1& Create(const UObject ContextObject, const int Value1)
{
    return FVM_TestLoad1::CreateByManager(EUIInternal::GetContextManager(ContextObject), Value1);
}
FVM_TestLoad1 CreateByManager(const UEUIManagerSubsystem Manager, const int Value1)
{
    FVM_TestLoad1 __r;
    TEUIModelRef<FVM_TestLoad1> local_6 = TEUIModelRef<FVM_TestLoad1>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TestLoad1::ModelId, 0, Value1));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TestLoad1>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TestLoad1;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TestLoad1;
}
TEUIModelRef<FVM_TestLoad1> __UIGetter_Self(const FVM_TestLoad1 &inout Model)
{
    return TEUIModelRef<FVM_TestLoad1>(Model);
}
int __IndexOf_Value1()
{
    return 0;
}
int __IndexOf_Value1Config()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TestLoad1
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_TestLoad2
{
FVM_TestLoad2& Create(const UObject ContextObject, const int Value2)
{
    return FVM_TestLoad2::CreateByManager(EUIInternal::GetContextManager(ContextObject), Value2);
}
FVM_TestLoad2 CreateByManager(const UEUIManagerSubsystem Manager, const int Value2)
{
    FVM_TestLoad2 __r;
    TEUIModelRef<FVM_TestLoad2> local_6 = TEUIModelRef<FVM_TestLoad2>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TestLoad2::ModelId, 0, Value2));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TestLoad2>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TestLoad2;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TestLoad2;
}
TEUIModelRef<FVM_TestLoad2> __UIGetter_Self(const FVM_TestLoad2 &inout Model)
{
    return TEUIModelRef<FVM_TestLoad2>(Model);
}
int __IndexOf_Value2()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_TestLoad2
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_TestLoad3
{
FVM_TestLoad3& Create(const UObject ContextObject)
{
    return FVM_TestLoad3::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TestLoad3 CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_TestLoad3 __r;
    TEUIModelRef<FVM_TestLoad3> local_6 = TEUIModelRef<FVM_TestLoad3>(EUIInternal::MakeModelWithManager(Manager, FVM_TestLoad3::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TestLoad3>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TestLoad3;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TestLoad3;
}
TEUIModelRef<FVM_TestLoad3> __UIGetter_Self(const FVM_TestLoad3 &inout Model)
{
    return TEUIModelRef<FVM_TestLoad3>(Model);
}
}
namespace __GeneratedProperties_FVM_TestLoad3
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
