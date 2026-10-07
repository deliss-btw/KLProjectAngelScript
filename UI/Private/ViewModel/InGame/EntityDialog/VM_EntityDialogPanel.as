
namespace FVMS_EntityDialogPanel
{
    const int ModelId = 0;

}
struct FVMS_EntityDialogPanel : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TArray<FECSEntity> m_Speakers;

    FVMS_EntityDialogPanel()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_EntityDialogPanel(const FVMS_EntityDialogPanel &inout Other)
    {
        this.m_Speakers = Other.m_Speakers;
        return;
    }
    FVMS_EntityDialogPanel& opAssign(const FVMS_EntityDialogPanel &inout Other)
    {
        return Other.m_Speakers;
    }
    void HandleSpeakers()
    {
        Get local_4;
        const FCS_EntityDialogSpeakers& local_6 = local_4.opCall();
        if (local_6)
        {
            this.SetSpeakers(local_6.GetInRangeEntities());
            return;
        }
        this.GetModify_Speakers().Reset(0);
        return;
    }
    const TArray<FECSEntity> GetSpeakers() const property
    {
        const TArray<FECSEntity> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FECSEntity> GetModify_Speakers() property
    {
        TArray<FECSEntity> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSpeakers(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Speakers = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_EntityDialogPanel
{
    UPROPERTY()
    TEUIModelRef<FVMS_EntityDialogPanel> Self;

    __GeneratedProperties_FVMS_EntityDialogPanel()
    {
        return;
    }
}

namespace FVMS_EntityDialogPanel
{
FVMS_EntityDialogPanel& Get(const UObject ContextObject)
{
    return FVMS_EntityDialogPanel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_EntityDialogPanel GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_EntityDialogPanel __r;
    TEUIModelRef<FVMS_EntityDialogPanel> local_6 = TEUIModelRef<FVMS_EntityDialogPanel>(EUIInternal::MakeModelWithManager(Manager, FVMS_EntityDialogPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Speakers";
    local_14.TypeName = "TArray<FECSEntity>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_EntityDialogPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_EntityDialogPanel;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "HandleSpeakers";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_EntityDialogPanel;
}
TArray<FECSEntity> __UIGetter_Speakers(const FVMS_EntityDialogPanel &inout Model)
{
    return Model.GetSpeakers();
}
TEUIModelRef<FVMS_EntityDialogPanel> __UIGetter_Self(const FVMS_EntityDialogPanel &inout Model)
{
    return TEUIModelRef<FVMS_EntityDialogPanel>(Model);
}
int __IndexOf_Speakers()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_EntityDialogPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
