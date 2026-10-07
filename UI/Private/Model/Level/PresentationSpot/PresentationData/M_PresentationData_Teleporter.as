
namespace FM_PresentationData_Teleporter
{
    const int ModelId = 0;

}
struct FM_PresentationData_Teleporter : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> m_TeleporterConfig;

    FM_PresentationData_Teleporter()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_PresentationData_Teleporter' by default constructor.");
        return;
    }
    FM_PresentationData_Teleporter(const FM_PresentationData_Teleporter &inout Other)
    {
        this.m_TeleporterConfig = Other.m_TeleporterConfig;
        return;
    }
    FM_PresentationData_Teleporter(const TDataObjectPtr<FTeleporterConfig> &inout InTeleporterConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTeleporterConfig(InTeleporterConfig);
        return;
    }
    FM_PresentationData_Teleporter& opAssign(const FM_PresentationData_Teleporter &inout Other)
    {
        return Other.m_TeleporterConfig;
    }
    const TDataObjectPtr<FTeleporterConfig> GetTeleporterConfig() const property
    {
        const TDataObjectPtr<FTeleporterConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FTeleporterConfig> GetModify_TeleporterConfig() property
    {
        TDataObjectPtr<FTeleporterConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTeleporterConfig(const TDataObjectPtr<FTeleporterConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeleporterConfig = __Value;
        return;
    }
}

TEUIModelRef<FM_PresentationData_Teleporter> GetTeleporterData(const FM_Spot &inout Spot, const FSpotViewAdapter &inout SpotViewAdapter = FSpotViewAdapter())
{
    if (FInstancedStruct(PresentationDataUtils::GetPresentationData(Spot, EPresentationDataType(10), SpotViewAdapter)).IsValid())
    {
        Get local_12;
        return TEUIModelRef<FM_PresentationData_Teleporter>(local_12.opCall());
    }
    return TEUIModelRef<FM_PresentationData_Teleporter>();
}
TEUIModelRef<FM_PresentationData_Teleporter> AddTeleporterData(FM_Spot &inout Spot, const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    FM_PresentationData_Teleporter& local_4 = FM_PresentationData_Teleporter::Create(Spot.GetManager(), TeleporterConfig);
    FEUIModelRef local_6 = FEUIModelRef(local_4);
    EPresentationDataType local_10;
    FInstancedStruct::Make(local_10);
    return TEUIModelRef<FM_PresentationData_Teleporter>(local_4);
}
void RemoveTeleporterData(FM_Spot &inout Spot, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    if (Spot)
    {
        PresentationDataUtils::RemovePresentationData(Spot, EPresentationDataType(10), Registry);
    }
    return;
}
namespace FM_PresentationData_Teleporter
{
FM_PresentationData_Teleporter& Create(const UObject ContextObject, const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig)
{
    return FM_PresentationData_Teleporter::CreateByManager(EUIInternal::GetContextManager(ContextObject), TeleporterConfig);
}
FM_PresentationData_Teleporter CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig)
{
    FM_PresentationData_Teleporter __r;
    TEUIModelRef<FM_PresentationData_Teleporter> local_6 = TEUIModelRef<FM_PresentationData_Teleporter>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_PresentationData_Teleporter::ModelId, 0, TeleporterConfig));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_PresentationData_Teleporter;
}
int __IndexOf_TeleporterConfig()
{
    return 0;
}
}
