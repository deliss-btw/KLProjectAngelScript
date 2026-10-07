
namespace FVM_TauntHint
{
    const int ModelId = 0;

}
struct FVM_TauntHint : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_SelfEntity;
    UPROPERTY()
    TArray<FECSEntity> m_TauntTargets;
    UPROPERTY()
    TArray<FEUIModelRef> m_PlayerTauntHintModelArray;

    FVM_TauntHint()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TauntHint' by default constructor.");
        return;
    }
    FVM_TauntHint(const FVM_TauntHint &inout Other)
    {
        this.m_SelfEntity = Other.m_SelfEntity;
        this.m_TauntTargets = Other.m_TauntTargets;
        this.m_PlayerTauntHintModelArray = Other.m_PlayerTauntHintModelArray;
        return;
    }
    FVM_TauntHint(const FECSEntity &inout InSelfEntity)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSelfEntity(InSelfEntity);
        return;
    }
    FVM_TauntHint& opAssign(const FVM_TauntHint &inout Other)
    {
        this.m_SelfEntity = Other.m_SelfEntity;
        this.m_TauntTargets = Other.m_TauntTargets;
        return Other.m_PlayerTauntHintModelArray;
    }
    void Tick()
    {
        this.GetModify_PlayerTauntHintModelArray().Empty(0);
        for (auto& local_18 : this.GetTauntTargets())
        {
            if (!(local_18.IsValid()))
            {
                continue;
            }
            if ((int(::FASCommonUtils::GetMonsterRank(local_18))) == 2)
            {
                this.GetModify_PlayerTauntHintModelArray().Add(FEUIModelRef(::FVM_TauntHintPointer::Create(this.GetContext().Manager, local_18)));
            }
        }
        return;
    }
    const FECSEntity GetSelfEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_SelfEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSelfEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SelfEntity = __Value;
        return;
    }
    const TArray<FECSEntity> GetTauntTargets() const property
    {
        const TArray<FECSEntity> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FECSEntity> GetModify_TauntTargets() property
    {
        TArray<FECSEntity> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTauntTargets(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TauntTargets = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetPlayerTauntHintModelArray() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_PlayerTauntHintModelArray() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPlayerTauntHintModelArray(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PlayerTauntHintModelArray = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TauntHint
{
    UPROPERTY()
    TEUIModelRef<FVM_TauntHint> Self;

    __GeneratedProperties_FVM_TauntHint()
    {
        return;
    }
}

namespace FVM_TauntHint
{
FVM_TauntHint& Create(const UObject ContextObject, const FECSEntity &inout SelfEntity)
{
    return FVM_TauntHint::CreateByManager(EUIInternal::GetContextManager(ContextObject), SelfEntity);
}
FVM_TauntHint CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout SelfEntity)
{
    FVM_TauntHint __r;
    TEUIModelRef<FVM_TauntHint> local_6 = TEUIModelRef<FVM_TauntHint>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TauntHint::ModelId, 0, SelfEntity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PlayerTauntHintModelArray";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TauntHint>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TauntHint;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TauntHint;
}
void __Tick(FVM_TauntHint &inout Model)
{
    Model.Tick();
    return;
}
TArray<FEUIModelRef> __UIGetter_PlayerTauntHintModelArray(const FVM_TauntHint &inout Model)
{
    return Model.GetPlayerTauntHintModelArray();
}
TEUIModelRef<FVM_TauntHint> __UIGetter_Self(const FVM_TauntHint &inout Model)
{
    return TEUIModelRef<FVM_TauntHint>(Model);
}
int __IndexOf_SelfEntity()
{
    return 0;
}
int __IndexOf_TauntTargets()
{
    return 1;
}
int __IndexOf_PlayerTauntHintModelArray()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_TauntHint
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
