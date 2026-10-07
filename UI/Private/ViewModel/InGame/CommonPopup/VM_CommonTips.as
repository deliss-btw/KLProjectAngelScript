
namespace FVM_CommonTips
{
    const int ModelId = 0;
}
namespace FVM_ImportantTips
{
    const int ModelId = 0;

}
struct FVM_CommonTips : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Content;
    UPROPERTY()
    bool m_bEnableAutoCloseByLifetime;
    UPROPERTY()
    float32 m_AutoCloseLifetimeSeconds;

    FVM_CommonTips()
    {
        this.m_bEnableAutoCloseByLifetime = false;
        this.m_AutoCloseLifetimeSeconds = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonTips' by default constructor.");
        return;
    }
    FVM_CommonTips(const FVM_CommonTips &inout Other)
    {
        this.m_bEnableAutoCloseByLifetime = false;
        this.m_AutoCloseLifetimeSeconds = 0.0f;
        this.m_Content = Other.m_Content;
        this.m_bEnableAutoCloseByLifetime = Other.m_bEnableAutoCloseByLifetime;
        this.m_AutoCloseLifetimeSeconds = Other.m_AutoCloseLifetimeSeconds;
        return;
    }
    FVM_CommonTips(const FText &inout InContent)
    {
        this.m_bEnableAutoCloseByLifetime = false;
        this.m_AutoCloseLifetimeSeconds = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetContent(InContent);
        return;
    }
    FVM_CommonTips opAssign(const FVM_CommonTips &inout Other)
    {
        FVM_CommonTips __r;
        this.m_Content = Other.m_Content;
        this.m_bEnableAutoCloseByLifetime = Other.m_bEnableAutoCloseByLifetime;
        this.m_AutoCloseLifetimeSeconds = Other.m_AutoCloseLifetimeSeconds;
        return __r;
    }
    FText GetContent() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Content() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetContent(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Content = __Value;
        return;
    }
    bool GetbEnableAutoCloseByLifetime() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bEnableAutoCloseByLifetime;
    }
    void SetbEnableAutoCloseByLifetime(const bool __Value) property
    {
        if (!(this.m_bEnableAutoCloseByLifetime) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bEnableAutoCloseByLifetime = __Value;
        return;
    }
    const float32 GetAutoCloseLifetimeSeconds() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_AutoCloseLifetimeSeconds() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAutoCloseLifetimeSeconds(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AutoCloseLifetimeSeconds = __Value;
        return;
    }
}

struct FVM_ImportantTips : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EImportantTipsStyle m_Style;

    FVM_ImportantTips()
    {
        this.m_Style = EImportantTipsStyle(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ImportantTips' by default constructor.");
        return;
    }
    FVM_ImportantTips(const FVM_ImportantTips &inout Other)
    {
        this.m_Style = EImportantTipsStyle(0);
        this.m_Style = Other.m_Style;
        return;
    }
    FVM_ImportantTips(const EImportantTipsStyle InStyle)
    {
        this.m_Style = EImportantTipsStyle(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetStyle(EImportantTipsStyle(InStyle));
        return;
    }
    FVM_ImportantTips opAssign(const FVM_ImportantTips &inout Other)
    {
        FVM_ImportantTips __r;
        this.m_Style = Other.m_Style;
        return __r;
    }
    int GetStyleIndex() const
    {
        return int(this.GetStyle());
    }
    EImportantTipsStyle GetStyle() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Style;
    }
    void SetStyle(const EImportantTipsStyle __Value) property
    {
        if (int(this.m_Style) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Style = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonTips
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonTips> Self;

    __GeneratedProperties_FVM_CommonTips()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_ImportantTips
{
    UPROPERTY()
    int StyleIndex;
    UPROPERTY()
    TEUIModelRef<FVM_ImportantTips> Self;


}

namespace FVM_CommonTips
{
FVM_CommonTips& Create(const UObject ContextObject, const FText &inout Content)
{
    return FVM_CommonTips::CreateByManager(EUIInternal::GetContextManager(ContextObject), Content);
}
FVM_CommonTips CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Content)
{
    FVM_CommonTips __r;
    TEUIModelRef<FVM_CommonTips> local_6 = TEUIModelRef<FVM_CommonTips>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonTips::ModelId, 0, Content));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Content";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonTips>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonTips;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonTips;
}
FText __UIGetter_Content(const FVM_CommonTips &inout Model)
{
    return Model.GetContent();
}
TEUIModelRef<FVM_CommonTips> __UIGetter_Self(const FVM_CommonTips &inout Model)
{
    return TEUIModelRef<FVM_CommonTips>(Model);
}
int __IndexOf_Content()
{
    return 0;
}
int __IndexOf_bEnableAutoCloseByLifetime()
{
    return 1;
}
int __IndexOf_AutoCloseLifetimeSeconds()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CommonTips
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_ImportantTips
{
FVM_ImportantTips& Create(const UObject ContextObject, const EImportantTipsStyle Style)
{
    return FVM_ImportantTips::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ImportantTips CreateByManager(const UEUIManagerSubsystem Manager, const EImportantTipsStyle Style)
{
    FVM_ImportantTips __r;
    TEUIModelRef<FVM_ImportantTips> local_6 = TEUIModelRef<FVM_ImportantTips>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ImportantTips::ModelId, 0, Style));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "StyleIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ImportantTips>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ImportantTips;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ImportantTips;
}
int __UIGetter_StyleIndex(const FVM_ImportantTips &inout Model)
{
    return Model.GetStyleIndex();
}
TEUIModelRef<FVM_ImportantTips> __UIGetter_Self(const FVM_ImportantTips &inout Model)
{
    return TEUIModelRef<FVM_ImportantTips>(Model);
}
int __IndexOf_Style()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_ImportantTips
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
