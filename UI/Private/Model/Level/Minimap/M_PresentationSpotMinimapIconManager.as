
namespace FPresentationSpotMinimapStats
{
    const FStatID StatID_OnTransformModified = FStatID();
    const FStatID StatID_TransformFindHandle = FStatID();
    const FStatID StatID_TransformGetPosition2D = FStatID();
    const FStatID StatID_TransformUpdateIconPosition = FStatID();
}
namespace FMS_PresentationSpotMinimapIconManager
{
    const int ModelId = 0;

}
struct FMsg_MinimapIconInfoChanged : FEUIMessage
{
    FMsg_MinimapIconInfoChanged()
    {
        return;
    }
}

struct FMinimapIconData : FEUIMinimapIconData
{
    FEUIMinimapIconData _base_FEUIMinimapIconData;
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;
    UPROPERTY()
    EPresentationSpotUsage SpotUsage = EPresentationSpotUsage(0);


}

struct FMS_PresentationSpotMinimapIconManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_SpotView> m_SpotView;
    UPROPERTY()
    TMap<TEUIModelRef<FM_Spot>, FMinimapIconHandle> m_SpotIconHandles;

    FMS_PresentationSpotMinimapIconManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_PresentationSpotMinimapIconManager(const FMS_PresentationSpotMinimapIconManager &inout Other)
    {
        this.m_SpotView = Other.m_SpotView;
        this.m_SpotIconHandles = Other.m_SpotIconHandles;
        return;
    }
    FMS_PresentationSpotMinimapIconManager& opAssign(const FMS_PresentationSpotMinimapIconManager &inout Other)
    {
        this.m_SpotView = Other.m_SpotView;
        return Other.m_SpotIconHandles;
    }
    void PostConstruct()
    {
        this.SetSpotView(TEUIModelRef<FM_SpotView>(::FM_SpotView::CreateDefault(this.GetManager(), EPresentationDataType(1))));
        for (auto& local_26 : this.GetSpotView().opArrow().GetAllInterestedSpots())
        {
            this.SyncSpotToMinimap(local_26);
        }
        return;
    }
    void OnSpotPresentationDataModified(const FMsg_SpotPresentationDataModified &inout Message)
    {
        if (this.GetSpotView().opArrow().IsInterestedSpot(Message.Spot) && (int(Message.DataType) == 1))
        {
            this.SyncSpotToMinimap(Message.Spot);
        }
        return;
    }
    void OnSpotTransformModified(const FMsg_SpotTransformModified &inout Message)
    {
        FScopeCycleCounter local_1 = FScopeCycleCounter(FPresentationSpotMinimapStats::StatID_OnTransformModified, false);
        FMinimapIconHandle local_5;
        bool local_6 = false;
        FScopeCycleCounter local_7 = FScopeCycleCounter(FPresentationSpotMinimapStats::StatID_TransformFindHandle, false);
        local_6 = this.GetSpotIconHandles().Find(Message.Spot, local_5);
        if (local_6)
        {
            bool local_105;
            FVector2D local_12;
            FScopeCycleCounter local_7_2 = FScopeCycleCounter(FPresentationSpotMinimapStats::StatID_TransformGetPosition2D, false);
            local_12 = Message.Spot.opArrow().GetTransform().GetPosition2D();
            float local_104 = (local_12 - ::MinimapUtils::GetIconInfo(local_5).WorldPosition).Size();
            local_105 = false;
            FSpotViewAdapter local_114;
            TEUIModelRef<FM_PresentationData_Mark> local_116 = ::GetMarkData(Message.Spot.opArrow(), local_114);
            if (local_116)
            {
                local_105 = local_116.opArrow().GetbIsPositionMark();
            }
            else
            {
                FECSEntityId local_123 = ::GetOwnerEntityId(Message.Spot.opArrow());
                FECSEntity local_122 = FECSEntity(local_123);
                if (local_122)
                {
                    FVector local_134;
                    local_105 = ::LevelSpotMarkUtils::TryGetPositionMarkWorldPos(local_122, local_134);
                }
            }
            if ((local_105 && (local_104 > 1.0)))
            {
                ::MinimapUtils::UnregisterIcon(local_5);
                this.SyncSpotToMinimap(Message.Spot);
                return;
            }
            FScopeCycleCounter local_7_3 = FScopeCycleCounter(FPresentationSpotMinimapStats::StatID_TransformUpdateIconPosition, false);
            ::MinimapUtils::UpdateIconPosition(local_5, local_12);
        }
        return;
    }
    void OnMinimapIconAdded(const FMsg_InterestedSpotAdded &inout Message)
    {
        this.SyncSpotToMinimap(Message.Spot);
        return;
    }
    void OnMinimapIconRemoved(const FMsg_InterestedSpotRemoved &inout Message)
    {
        this.ForceUnregisterSpotIcon(Message.Spot);
        return;
    }
    void ForceUnregisterSpotIcon(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        FMinimapIconHandle local_3;
        if (this.GetModify_SpotIconHandles().RemoveAndCopyValue(Spot, local_3))
        {
            ::MinimapUtils::UnregisterIcon(local_3);
        }
        return;
    }
    void SyncSpotToMinimap(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        FSpotViewAdapter local_32;
        if (::GetMinimapIconConfig(Spot.opArrow(), local_32))
        {
            FMinimapIconHandle local_60;
            if (this.GetSpotIconHandles().Find(Spot, local_60))
            {
                bool local_157;
                FMinimapIconInfo local_102 = ::MinimapUtils::GetIconInfo(local_60);
                float local_156 = (Spot.opArrow().GetTransform().GetPosition2D() - local_102.WorldPosition).Size();
                local_157 = false;
                TEUIModelRef<FM_PresentationData_Mark> local_160 = ::GetMarkData(Spot.opArrow(), local_32);
                if (local_160)
                {
                    local_157 = local_160.opArrow().GetbIsPositionMark();
                }
                else
                {
                    FECSEntityId local_167 = ::GetOwnerEntityId(Spot.opArrow());
                    FECSEntity local_166 = FECSEntity(local_167);
                    if (local_166)
                    {
                        FVector local_178;
                        local_157 = ::LevelSpotMarkUtils::TryGetPositionMarkWorldPos(local_166, local_178);
                    }
                }
                if ((local_157 && (local_156 > 1.0)))
                {
                    ::MinimapUtils::UnregisterIcon(local_60);
                    FMinimapIconInfo local_222;
                    this.SyncSpotDataToIconInfo(Spot, local_222);
                    this.GetModify_SpotIconHandles().Add(Spot, this.GetIconRegistry().AddIcon(local_222));
                    return;
                }
                this.SyncSpotDataToIconInfo(Spot, local_102);
                ::MinimapUtils::UpdateIconInfo(local_60, local_102);
            }
            else
            {
                FMinimapIconInfo local_222;
                this.SyncSpotDataToIconInfo(Spot, local_222);
                local_60 = this.GetIconRegistry().AddIcon(local_222);
                this.GetModify_SpotIconHandles().Add(Spot, local_60);
            }
            return;
        }
        this.ForceUnregisterSpotIcon(Spot);
        return;
    }
    TSoftClassPtr<UUserWidget> GetIconWidget(const TDataObjectPtr<FMinimapIconConfig> &inout IconSettings) const
    {
        UMinimapGlobalConfig local_4 = ::MinimapUtils::GetMinimapGlobalConfig();
        if (int(IconSettings.opArrow().IconType) == 2)
        {
            CastTo local_12;
            return local_12.opCall().opArrow().IconWidget;
        }
        TSoftClassPtr<UUserWidget> local_46;
        if (local_4.DefaultIconWidgets.Find(IconSettings.opArrow().IconType, local_46))
        {
            return local_46;
        }
        return local_46;
    }
    UMinimapIconRegistry GetIconRegistry() const
    {
        TSubclassOf<UMinimapIconRegistryAsset> local_6 = TSubclassOf<UMinimapIconRegistryAsset>(::MinimapUtils::GetMinimapGlobalConfig().DefaultLevelSpotIconRegistry);
        if (local_6.IsValid())
        {
            return local_6.GetDefaultObject().GetIconRegistry(__GetWorldContext());
        }
        return nullptr;
    }
    void SyncSpotDataToIconInfo(const TEUIModelRef<FM_Spot> &inout Spot, FMinimapIconInfo &inout IconInfo) const
    {
        FSpotViewAdapter local_8;
        TDataObjectPtr<FMinimapIconConfig> local_32 = ::GetMinimapIconConfig(Spot.opArrow(), local_8);
        IconInfo.DisplaySettings = local_32.opArrow().DisplaySettings;
        IconInfo.IconSize = local_32.opArrow().IconSize;
        int local_57 = local_32.opArrow().ZOrder;
        IconInfo.IconWidget = this.GetIconWidget(local_32);
        IconInfo.WorldPosition = Spot.opArrow().GetTransform().GetPosition2D();
        FMinimapIconData local_80;
        local_80.Spot = Spot;
        IconInfo.UserData = FInstancedStruct::Make(local_80);
        FEUIModelRef local_90 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_90);
        return;
    }
    TEUIModelRef<FM_SpotView> GetSpotView() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SpotView;
    }
    void SetSpotView(const TEUIModelRef<FM_SpotView> &inout __Value) property
    {
        TEUIModelRef<FM_SpotView> local_2;
        local_2 = this.m_SpotView;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SpotView = __Value;
        return;
    }
    const TMap<TEUIModelRef<FM_Spot>, FMinimapIconHandle> GetSpotIconHandles() const property
    {
        const TMap<TEUIModelRef<FM_Spot>, FMinimapIconHandle> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<TEUIModelRef<FM_Spot>, FMinimapIconHandle> GetModify_SpotIconHandles() property
    {
        TMap<TEUIModelRef<FM_Spot>, FMinimapIconHandle> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSpotIconHandles(const TMap<TEUIModelRef<FM_Spot>, FMinimapIconHandle> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpotIconHandles = __Value;
        return;
    }
}

namespace FMS_PresentationSpotMinimapIconManager
{
FMS_PresentationSpotMinimapIconManager& Get(const UObject ContextObject)
{
    return FMS_PresentationSpotMinimapIconManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PresentationSpotMinimapIconManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_PresentationSpotMinimapIconManager __r;
    TEUIModelRef<FMS_PresentationSpotMinimapIconManager> local_6 = TEUIModelRef<FMS_PresentationSpotMinimapIconManager>(EUIInternal::MakeModelWithManager(Manager, FMS_PresentationSpotMinimapIconManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FMS_PresentationSpotMinimapIconManager;
}
void __OnSpotPresentationDataModified(FMS_PresentationSpotMinimapIconManager &inout Model, const FMsg_SpotPresentationDataModified &inout Message)
{
    Model.OnSpotPresentationDataModified(Message);
    return;
}
void __OnSpotTransformModified(FMS_PresentationSpotMinimapIconManager &inout Model, const FMsg_SpotTransformModified &inout Message)
{
    Model.OnSpotTransformModified(Message);
    return;
}
void __OnMinimapIconAdded(FMS_PresentationSpotMinimapIconManager &inout Model, const FMsg_InterestedSpotAdded &inout Message)
{
    Model.OnMinimapIconAdded(Message);
    return;
}
void __OnMinimapIconRemoved(FMS_PresentationSpotMinimapIconManager &inout Model, const FMsg_InterestedSpotRemoved &inout Message)
{
    Model.OnMinimapIconRemoved(Message);
    return;
}
int __IndexOf_SpotView()
{
    return 0;
}
int __IndexOf_SpotIconHandles()
{
    return 1;
}
}
