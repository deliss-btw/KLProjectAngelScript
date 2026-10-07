
namespace FVM_Lifetime
{
    const int ModelId = 0;
}
namespace FVM_FPTime
{
    const int ModelId = 0;

}
struct FVM_Lifetime : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FFPTime m_Lifetime;
    UPROPERTY()
    FFPTime m_CreateTime;

    FVM_Lifetime()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_Lifetime' by default constructor.");
        return;
    }
    FVM_Lifetime(const FVM_Lifetime &inout Other)
    {
        this.m_Lifetime = Other.m_Lifetime;
        this.m_CreateTime = Other.m_CreateTime;
        return;
    }
    FVM_Lifetime(const FFPTime &inout InLifetime)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetLifetime(InLifetime);
        return;
    }
    FVM_Lifetime& opAssign(const FVM_Lifetime &inout Other)
    {
        this.m_Lifetime = Other.m_Lifetime;
        return Other.m_CreateTime;
    }
    void PostConstruct()
    {
        this.SetCreateTime(this.GetContext().Time);
        XWarningIf((FFPTime(this.GetLifetime()).opCmp(0.0) <= 0), ELog(16), FString().Append("[").Append(this.GetUniqueNameString()).Append("] Lifetime value is less than or equal to 0, this may lead to unexpected behavior"));
        return;
    }
    FFPTime GetRemainingLifetime() const
    {
        FFPTime local_2 = (FFPTime(this.GetLifetime()) - (FFPTime(this.GetContext().Time) - this.GetCreateTime()));
        if (local_2.opCmp(0.0) <= 0)
        {
            return FFPTime(0);
        }
        return local_2;
    }
    bool IsExpired() const
    {
        FFPTime local_4 = (FFPTime(this.GetContext().Time) - this.GetCreateTime());
        return (local_4.opCmp(this.GetLifetime()) >= 0);
    }
    float32 GetRemainingLifetimePercentage() const
    {
        if (FFPTime(this.GetLifetime()).opCmp(0.0) <= 0)
        {
            return 0.0f;
        }
        return float32((this.GetRemainingLifetime().ToSeconds() / this.GetLifetime().ToSeconds()));
    }
    const FFPTime GetLifetime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FFPTime GetModify_Lifetime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLifetime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Lifetime = __Value;
        return;
    }
    FFPTime GetCreateTime() const property
    {
        FFPTime __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FFPTime GetModify_CreateTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCreateTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CreateTime = __Value;
        return;
    }
}

struct FVM_FPTime : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FFPTime m_FPTime;

    FVM_FPTime()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_FPTime' by default constructor.");
        return;
    }
    FVM_FPTime(const FVM_FPTime &inout Other)
    {
        this.m_FPTime = Other.m_FPTime;
        return;
    }
    FVM_FPTime(const FFPTime &inout InFPTime)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetFPTime(InFPTime);
        return;
    }
    FVM_FPTime& opAssign(const FVM_FPTime &inout Other)
    {
        return Other.m_FPTime;
    }
    const FFPTime GetFPTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FFPTime GetModify_FPTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetFPTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_FPTime = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Lifetime
{
    UPROPERTY()
    FFPTime RemainingLifetime;
    UPROPERTY()
    bool IsExpired;
    UPROPERTY()
    float32 RemainingLifetimePercentage;
    UPROPERTY()
    TEUIModelRef<FVM_Lifetime> Self;


}

struct __GeneratedProperties_FVM_FPTime
{
    UPROPERTY()
    TEUIModelRef<FVM_FPTime> Self;

    __GeneratedProperties_FVM_FPTime()
    {
        return;
    }
}

namespace FVM_Lifetime
{
FVM_Lifetime& Create(const UObject ContextObject, const FFPTime &inout Lifetime)
{
    return FVM_Lifetime::CreateByManager(EUIInternal::GetContextManager(ContextObject), Lifetime);
}
FVM_Lifetime CreateByManager(const UEUIManagerSubsystem Manager, const FFPTime &inout Lifetime)
{
    FVM_Lifetime __r;
    TEUIModelRef<FVM_Lifetime> local_6 = TEUIModelRef<FVM_Lifetime>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Lifetime::ModelId, 0, Lifetime));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RemainingLifetime";
    local_14.TypeName = "FFPTime";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsExpired";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RemainingLifetimePercentage";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Lifetime>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Lifetime;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Lifetime;
}
FFPTime __UIGetter_RemainingLifetime(const FVM_Lifetime &inout Model)
{
    return Model.GetRemainingLifetime();
}
bool __UIGetter_IsExpired(const FVM_Lifetime &inout Model)
{
    return Model.IsExpired();
}
float32 __UIGetter_RemainingLifetimePercentage(const FVM_Lifetime &inout Model)
{
    return Model.GetRemainingLifetimePercentage();
}
TEUIModelRef<FVM_Lifetime> __UIGetter_Self(const FVM_Lifetime &inout Model)
{
    return TEUIModelRef<FVM_Lifetime>(Model);
}
int __IndexOf_Lifetime()
{
    return 0;
}
int __IndexOf_CreateTime()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_Lifetime
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_FPTime
{
FVM_FPTime& Create(const UObject ContextObject, const FFPTime &inout FPTime)
{
    return FVM_FPTime::CreateByManager(EUIInternal::GetContextManager(ContextObject), FPTime);
}
FVM_FPTime CreateByManager(const UEUIManagerSubsystem Manager, const FFPTime &inout FPTime)
{
    FVM_FPTime __r;
    TEUIModelRef<FVM_FPTime> local_6 = TEUIModelRef<FVM_FPTime>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_FPTime::ModelId, 0, FPTime));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "FPTime";
    local_14.TypeName = "FFPTime";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_FPTime>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_FPTime;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_FPTime;
}
FFPTime __UIGetter_FPTime(const FVM_FPTime &inout Model)
{
    return Model.GetFPTime();
}
TEUIModelRef<FVM_FPTime> __UIGetter_Self(const FVM_FPTime &inout Model)
{
    return TEUIModelRef<FVM_FPTime>(Model);
}
int __IndexOf_FPTime()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_FPTime
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
