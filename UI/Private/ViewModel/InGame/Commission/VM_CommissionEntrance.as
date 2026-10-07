
namespace FVM_CommissionEntrance
{
    const int ModelId = 0;

}
struct FVM_CommissionEntrance : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_LockedOpacity;

    FVM_CommissionEntrance()
    {
        this.m_LockedOpacity = 0.5f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommissionEntrance(const FVM_CommissionEntrance &inout Other)
    {
        this.m_LockedOpacity = 0.5f;
        this.m_LockedOpacity = Other.m_LockedOpacity;
        return;
    }
    FVM_CommissionEntrance opAssign(const FVM_CommissionEntrance &inout Other)
    {
        FVM_CommissionEntrance __r;
        this.m_LockedOpacity = Other.m_LockedOpacity;
        return __r;
    }
    void LoadConfig(const FConfigVM_CommissionEntrance &inout InConfig)
    {
        this.SetLockedOpacity(InConfig.LockedOpacity);
        return;
    }
    float32 GetNormalEntranceOpacity() const
    {
        return ::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(1), false) ? 1.0f : this.GetLockedOpacity();
    }
    float32 GetHardEntranceOpacity() const
    {
        return ::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(2), false) ? 1.0f : this.GetLockedOpacity();
    }
    float32 GetExtremeEntranceOpacity() const
    {
        return ::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(4), false) ? 1.0f : this.GetLockedOpacity();
    }
    float32 GetActivityEntranceOpacity() const
    {
        return ::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(5), false) ? 1.0f : this.GetLockedOpacity();
    }
    bool GetIsNormalEntranceUnlock() const
    {
        return ::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(1), false);
    }
    bool GetIsNormalEntranceLock() const
    {
        return !(::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(1), false));
    }
    bool GetIsHardEntranceUnlock() const
    {
        return ::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(2), false);
    }
    bool GetIsHardEntranceLock() const
    {
        return !(::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(2), false));
    }
    bool GetIsExtremeEntranceUnlock() const
    {
        return ::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(4), false);
    }
    bool GetIsExtremeEntranceLock() const
    {
        return !(::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(4), false));
    }
    bool GetIsActivityEntranceUnlock() const
    {
        return ::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(5), false);
    }
    bool GetIsActivityEntranceLock() const
    {
        return !(::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(5), false));
    }
    const float32 GetLockedOpacity() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_LockedOpacity() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLockedOpacity(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LockedOpacity = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionEntrance
{
    UPROPERTY()
    float32 NormalEntranceOpacity;
    UPROPERTY()
    float32 HardEntranceOpacity;
    UPROPERTY()
    float32 ExtremeEntranceOpacity;
    UPROPERTY()
    float32 ActivityEntranceOpacity;
    UPROPERTY()
    bool IsNormalEntranceUnlock;
    UPROPERTY()
    bool IsNormalEntranceLock;
    UPROPERTY()
    bool IsHardEntranceUnlock;
    UPROPERTY()
    bool IsHardEntranceLock;
    UPROPERTY()
    bool IsExtremeEntranceUnlock;
    UPROPERTY()
    bool IsExtremeEntranceLock;
    UPROPERTY()
    bool IsActivityEntranceUnlock;
    UPROPERTY()
    bool IsActivityEntranceLock;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionEntrance> Self;


}

namespace FVM_CommissionEntrance
{
FVM_CommissionEntrance& Create(const UObject ContextObject)
{
    return FVM_CommissionEntrance::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommissionEntrance CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommissionEntrance __r;
    TEUIModelRef<FVM_CommissionEntrance> local_6 = TEUIModelRef<FVM_CommissionEntrance>(EUIInternal::MakeModelWithManager(Manager, FVM_CommissionEntrance::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "NormalEntranceOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HardEntranceOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExtremeEntranceOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActivityEntranceOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNormalEntranceUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNormalEntranceLock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsHardEntranceUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsHardEntranceLock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsExtremeEntranceUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsExtremeEntranceLock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsActivityEntranceUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsActivityEntranceLock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionEntrance>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionEntrance;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionEntrance;
}
float32 __UIGetter_NormalEntranceOpacity(const FVM_CommissionEntrance &inout Model)
{
    return Model.GetNormalEntranceOpacity();
}
float32 __UIGetter_HardEntranceOpacity(const FVM_CommissionEntrance &inout Model)
{
    return Model.GetHardEntranceOpacity();
}
float32 __UIGetter_ExtremeEntranceOpacity(const FVM_CommissionEntrance &inout Model)
{
    return Model.GetExtremeEntranceOpacity();
}
float32 __UIGetter_ActivityEntranceOpacity(const FVM_CommissionEntrance &inout Model)
{
    return Model.GetActivityEntranceOpacity();
}
bool __UIGetter_IsNormalEntranceUnlock(const FVM_CommissionEntrance &inout Model)
{
    return Model.GetIsNormalEntranceUnlock();
}
bool __UIGetter_IsNormalEntranceLock(const FVM_CommissionEntrance &inout Model)
{
    return Model.GetIsNormalEntranceLock();
}
bool __UIGetter_IsHardEntranceUnlock(const FVM_CommissionEntrance &inout Model)
{
    return Model.GetIsHardEntranceUnlock();
}
bool __UIGetter_IsHardEntranceLock(const FVM_CommissionEntrance &inout Model)
{
    return Model.GetIsHardEntranceLock();
}
bool __UIGetter_IsExtremeEntranceUnlock(const FVM_CommissionEntrance &inout Model)
{
    return Model.GetIsExtremeEntranceUnlock();
}
bool __UIGetter_IsExtremeEntranceLock(const FVM_CommissionEntrance &inout Model)
{
    return Model.GetIsExtremeEntranceLock();
}
bool __UIGetter_IsActivityEntranceUnlock(const FVM_CommissionEntrance &inout Model)
{
    return Model.GetIsActivityEntranceUnlock();
}
bool __UIGetter_IsActivityEntranceLock(const FVM_CommissionEntrance &inout Model)
{
    return Model.GetIsActivityEntranceLock();
}
TEUIModelRef<FVM_CommissionEntrance> __UIGetter_Self(const FVM_CommissionEntrance &inout Model)
{
    return TEUIModelRef<FVM_CommissionEntrance>(Model);
}
int __IndexOf_LockedOpacity()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_CommissionEntrance
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
