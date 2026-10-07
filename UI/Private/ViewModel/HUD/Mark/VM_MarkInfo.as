
namespace FVM_MarkInfo
{
    const int ModelId = 0;

}
struct FVM_MarkInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TDataObjectPtr<FMarkConfig> m_MarkConfig;
    UPROPERTY()
    TEUIModelRef<FVM_TeammateInfo> m_CreatorInfo;

    FVM_MarkInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MarkInfo' by default constructor.");
        return;
    }
    FVM_MarkInfo(const FVM_MarkInfo &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_MarkConfig = Other.m_MarkConfig;
        this.m_CreatorInfo = Other.m_CreatorInfo;
        return;
    }
    FVM_MarkInfo(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_MarkInfo& opAssign(const FVM_MarkInfo &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_MarkConfig = Other.m_MarkConfig;
        return Other.m_CreatorInfo;
    }
    bool HasCreatorInfo() const
    {
        return this.GetCreatorInfo().IsValid();
    }
    TEUIModelRef<FVM_Index> GetCreatorIndex() const
    {
        if (this.GetCreatorInfo())
        {
            return this.GetCreatorInfo().opArrow().GetIndex();
        }
        return TEUIModelRef<FVM_Index>();
    }
    int GetCreatorDisplayIndex() const
    {
        if (this.GetCreatorInfo())
        {
            TEUIModelRef<FVM_Index> local_6 = this.GetCreatorInfo().opArrow().GetIndex();
            if (local_6)
            {
                return local_6.opArrow().GetDisplayIndex();
            }
        }
        return 0;
    }
    bool IsSelfCreateMark() const
    {
        if (this.GetCreatorInfo())
        {
            return this.GetCreatorInfo().opArrow().IsSelf();
        }
        return true;
    }
    bool IsPositionMark() const
    {
        FSpotViewAdapter local_10;
        TEUIModelRef<FM_PresentationData_Mark> local_12 = ::GetMarkData(this.GetSpot().opArrow(), local_10);
        if (local_12)
        {
            return local_12.opArrow().GetbIsPositionMark();
        }
        return false;
    }
    FSoftBrush GetMarkIcon() const
    {
        if (this.GetMarkConfig())
        {
            return ::PresentationSpotDisplayUtils::GetSpotIcon(this.GetSpot(), EPresentationSpotUsage(4));
        }
        return FSoftBrush();
    }
    void PostConstruct()
    {
        this.UpdateMarkInfo();
        return;
    }
    void OnSpotPresentationDataModified(const FMsg_SpotPresentationDataModified &inout Message)
    {
        if (int(Message.DataType) == 6)
        {
            this.UpdateMarkInfo();
        }
        return;
    }
    void UpdateMarkInfo()
    {
        FSpotViewAdapter local_10;
        TEUIModelRef<FM_PresentationData_Mark> local_12 = ::GetMarkData(this.GetSpot().opArrow(), local_10);
        if (!(local_12))
        {
            TDataObjectPtr<FMarkConfig> local_40;
            this.SetMarkConfig(local_40);
            this.SetCreatorInfo(TEUIModelRef<FVM_TeammateInfo>());
            return;
        }
        TEUIModelRef<FM_Player> local_44 = local_12.opArrow().GetDisplayMarkPlayer();
        if (local_44)
        {
            this.SetMarkConfig(local_12.opArrow().GetPlayerMarkDataMap().Find(local_44).opArrow().MarkConfig);
            TEUIModelRef<FM_TeamMember> local_52 = ::FMS_PlayerCombatTeamData::Get(this.GetManager()).FindTeamMemberByPlayer(local_44);
            if (local_52)
            {
                this.SetCreatorInfo(TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(this.GetManager(), local_52)));
                return;
            }
        }
        this.SetCreatorInfo(TEUIModelRef<FVM_TeammateInfo>());
        return;
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Spot = __Value;
        return;
    }
    const TDataObjectPtr<FMarkConfig> GetMarkConfig() const property
    {
        const TDataObjectPtr<FMarkConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FMarkConfig> GetModify_MarkConfig() property
    {
        TDataObjectPtr<FMarkConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetMarkConfig(const TDataObjectPtr<FMarkConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MarkConfig = __Value;
        return;
    }
    TEUIModelRef<FVM_TeammateInfo> GetCreatorInfo() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CreatorInfo;
    }
    void SetCreatorInfo(const TEUIModelRef<FVM_TeammateInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_TeammateInfo> local_2;
        local_2 = this.m_CreatorInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CreatorInfo = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MarkInfo
{
    UPROPERTY()
    bool HasCreatorInfo;
    UPROPERTY()
    TEUIModelRef<FVM_Index> CreatorIndex;
    UPROPERTY()
    int CreatorDisplayIndex;
    UPROPERTY()
    bool IsSelfCreateMark;
    UPROPERTY()
    bool IsPositionMark;
    UPROPERTY()
    FSoftBrush MarkIcon;
    UPROPERTY()
    TEUIModelRef<FVM_MarkInfo> Self;


}

namespace FVM_MarkInfo
{
FVM_MarkInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_MarkInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_MarkInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_MarkInfo __r;
    TEUIModelRef<FVM_MarkInfo> local_6 = TEUIModelRef<FVM_MarkInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MarkInfo::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_MarkInfo;
}
void __OnSpotPresentationDataModified(FVM_MarkInfo &inout Model, const FMsg_SpotPresentationDataModified &inout Message)
{
    Model.OnSpotPresentationDataModified(Message);
    return;
}
TDataObjectPtr<FMarkConfig> __UIGetter_MarkConfig(const FVM_MarkInfo &inout Model)
{
    return Model.GetMarkConfig();
}
TEUIModelRef<FVM_TeammateInfo> __UIGetter_CreatorInfo(const FVM_MarkInfo &inout Model)
{
    return Model.GetCreatorInfo();
}
bool __UIGetter_HasCreatorInfo(const FVM_MarkInfo &inout Model)
{
    return Model.HasCreatorInfo();
}
TEUIModelRef<FVM_Index> __UIGetter_CreatorIndex(const FVM_MarkInfo &inout Model)
{
    return Model.GetCreatorIndex();
}
int __UIGetter_CreatorDisplayIndex(const FVM_MarkInfo &inout Model)
{
    return Model.GetCreatorDisplayIndex();
}
bool __UIGetter_IsSelfCreateMark(const FVM_MarkInfo &inout Model)
{
    return Model.IsSelfCreateMark();
}
bool __UIGetter_IsPositionMark(const FVM_MarkInfo &inout Model)
{
    return Model.IsPositionMark();
}
FSoftBrush __UIGetter_MarkIcon(const FVM_MarkInfo &inout Model)
{
    return Model.GetMarkIcon();
}
TEUIModelRef<FVM_MarkInfo> __UIGetter_Self(const FVM_MarkInfo &inout Model)
{
    return TEUIModelRef<FVM_MarkInfo>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_MarkConfig()
{
    return 1;
}
int __IndexOf_CreatorInfo()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MarkInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
