
namespace FVM_TutorialMain
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClose = FEUIModelCallbackSignature();

}
struct FVM_TutorialMain : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    uint m_GuideDataId;
    UPROPERTY()
    TEUIModelRef<FVM_GuideGroupDetail> m_GroupDetail;

    FVM_TutorialMain()
    {
        this.m_GuideDataId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TutorialMain' by default constructor.");
        return;
    }
    FVM_TutorialMain(const FVM_TutorialMain &inout Other)
    {
        this.m_GuideDataId = 0;
        this.m_GuideDataId = int(Other.m_GuideDataId);
        this.m_GroupDetail = Other.m_GroupDetail;
        return;
    }
    FVM_TutorialMain(const uint InGuideDataId)
    {
        this.m_GuideDataId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetGuideDataId(InGuideDataId);
        return;
    }
    FVM_TutorialMain& opAssign(const FVM_TutorialMain &inout Other)
    {
        this.m_GuideDataId = int(Other.m_GuideDataId);
        return Other.m_GroupDetail;
    }
    void PostConstruct()
    {
        int local_49 = this.GetGuideDataId();
        GetDataObjectByGSDataId<FGuideGroupConfig> local_48;
        TDataObjectPtr<FGuideGroupConfig> local_74 = local_48.opImplConv();
        this.SetGroupDetail(TEUIModelRef<FVM_GuideGroupDetail>(::FVM_GuideGroupDetail::Create(this.GetManager(), local_74)));
        ::FMS_GuideManual::Get(this.GetManager()).CompleteGuideOnShow(this.GetGuideDataId());
        return;
    }
    void OnClose()
    {
        int local_20 = 0;
        ::FMS_GuideManual::Get(this.GetManager()).OnTutorialPageClosed(this.GetGuideDataId());
        FFPTime local_16 = FFPTime(-1);
        FECSEntity local_10 = this.GetContext().GetLocalPlayer();
        int local_5 = this.GetGuideDataId();
        GetDataObjectByGSDataId<FGuideGroupConfig> local_44;
        local_20.GraphicId = local_44.opImplConv();
        return;
    }
    uint GetGuideDataId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_GuideDataId;
    }
    void SetGuideDataId(const uint __Value) property
    {
        if (this.m_GuideDataId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_GuideDataId = __Value;
        return;
    }
    TEUIModelRef<FVM_GuideGroupDetail> GetGroupDetail() const property
    {
        this.TrackPropertyRead(1);
        return this.m_GroupDetail;
    }
    void SetGroupDetail(const TEUIModelRef<FVM_GuideGroupDetail> &inout __Value) property
    {
        TEUIModelRef<FVM_GuideGroupDetail> local_2;
        local_2 = this.m_GroupDetail;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_GroupDetail = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TutorialMain
{
    UPROPERTY()
    TEUIModelRef<FVM_TutorialMain> Self;

    __GeneratedProperties_FVM_TutorialMain()
    {
        return;
    }
}

namespace FVM_TutorialMain
{
FVM_TutorialMain& Create(const UObject ContextObject, const uint GuideDataId)
{
    return FVM_TutorialMain::CreateByManager(EUIInternal::GetContextManager(ContextObject), GuideDataId);
}
FVM_TutorialMain CreateByManager(const UEUIManagerSubsystem Manager, const uint GuideDataId)
{
    FVM_TutorialMain __r;
    TEUIModelRef<FVM_TutorialMain> local_6 = TEUIModelRef<FVM_TutorialMain>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TutorialMain::ModelId, 0, GuideDataId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "GroupDetail";
    local_14.TypeName = "TEUIModelRef<FVM_GuideGroupDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TutorialMain>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TutorialMain;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TutorialMain;
}
TEUIModelRef<FVM_GuideGroupDetail> __UIGetter_GroupDetail(const FVM_TutorialMain &inout Model)
{
    return Model.GetGroupDetail();
}
TEUIModelRef<FVM_TutorialMain> __UIGetter_Self(const FVM_TutorialMain &inout Model)
{
    return TEUIModelRef<FVM_TutorialMain>(Model);
}
int __IndexOf_GuideDataId()
{
    return 0;
}
int __IndexOf_GroupDetail()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TutorialMain
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
