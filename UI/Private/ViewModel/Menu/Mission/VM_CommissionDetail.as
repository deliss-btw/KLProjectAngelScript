
namespace FVM_CommissionDetail
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnViewLocationButtonClicked = FEUIModelCallbackSignature();

}
struct FVM_CommissionDetail : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> m_CommissionConfig;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionInfo> m_CurrentCommission;

    FVM_CommissionDetail()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionDetail' by default constructor.");
        return;
    }
    FVM_CommissionDetail(const FVM_CommissionDetail &inout Other)
    {
        this.m_CommissionConfig = Other.m_CommissionConfig;
        this.m_CurrentCommission = Other.m_CurrentCommission;
        return;
    }
    FVM_CommissionDetail(const TDataObjectPtr<FCommissionConfig> &inout InCommissionConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommissionConfig(InCommissionConfig);
        return;
    }
    FVM_CommissionDetail& opAssign(const FVM_CommissionDetail &inout Other)
    {
        this.m_CommissionConfig = Other.m_CommissionConfig;
        return Other.m_CurrentCommission;
    }
    void PostConstruct()
    {
        TEUIModelRef<FM_Commission> local_4 = ::FMS_CommissionGameplayData::Get(this.GetContext().Manager).GetCurrentCommission();
        TEUIModelRef<FM_Commission> local_2;
        if (local_2.IsValid())
        {
            this.SetCurrentCommission(TEUIModelRef<FVM_CommissionInfo>(::FVM_CommissionInfo::Create(this.GetContext().Manager, local_2)));
        }
        else
        {
            XError(ELog(16), FString().Append("Failed to find current commission model for commission config: ").Append(this.GetCommissionConfig().GetDataName()));
        }
        return;
    }
    TEUIModelRef<FVM_CommissionMonsterInfo> GetCurrentCommissionMonsterInfo() const
    {
        if (this.GetCurrentCommission())
        {
            return this.GetCurrentCommission().opArrow().GetCommissionMonsterInfo();
        }
        return TEUIModelRef<FVM_CommissionMonsterInfo>();
    }
    TEUIModelRef<FVM_MonsterInfo> GetSelectedMonsterInfo() const
    {
        if (this.GetCurrentCommission())
        {
            TEUIModelRef<FVM_CommissionMonsterInfo> local_8 = this.GetCurrentCommission().opArrow().GetCommissionMonsterInfo();
            TEUIModelRef<FVM_CommissionMonsterInfo> local_6;
            if (local_6)
            {
                return local_6.opArrow().GetSelectedMonsterInfo();
            }
        }
        return TEUIModelRef<FVM_MonsterInfo>();
    }
    void OnViewLocationButtonClicked()
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Get local_6;
        const FCS_CommissionInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            for (auto& local_24 : local_8.CommissionTargetEntityInfos)
            {
                FVector local_36;
                if (local_24.GetEntity().IsValid())
                {
                    local_36 = ::FASCommonUtils::GetEntityLocation(local_24.GetEntity());
                }
                else
                {
                    local_36 = local_24.GetPosition();
                }
                ::GuideUtils::OpenMinimap(local_36);
                return;
            }
        }
        XWarning(ELog(62), FString().Append("Failed to find commission target entity"));
        FCommonTipsParam local_56;
        ::CommonPopup::WeakTips(NSLOCTEXT("Guide", "FailedToFindCommissionTargetEntity", "жњЄиѓЅж‰ѕе€°з›®ж ‡пјЊж— жі•жџҐзњ‹"), local_56);
        return;
    }
    TDataObjectPtr<FCommissionConfig> GetCommissionConfig() const property
    {
        TDataObjectPtr<FCommissionConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FCommissionConfig> GetModify_CommissionConfig() property
    {
        TDataObjectPtr<FCommissionConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCommissionConfig(const TDataObjectPtr<FCommissionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionConfig = __Value;
        return;
    }
    TEUIModelRef<FVM_CommissionInfo> GetCurrentCommission() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurrentCommission;
    }
    void SetCurrentCommission(const TEUIModelRef<FVM_CommissionInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_CommissionInfo> local_2;
        local_2 = this.m_CurrentCommission;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentCommission = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionDetail
{
    UPROPERTY()
    TEUIModelRef<FVM_CommissionMonsterInfo> CurrentCommissionMonsterInfo;
    UPROPERTY()
    TEUIModelRef<FVM_MonsterInfo> SelectedMonsterInfo;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionDetail> Self;

    __GeneratedProperties_FVM_CommissionDetail()
    {
        return;
    }
}

namespace FVM_CommissionDetail
{
FVM_CommissionDetail& Create(const UObject ContextObject, const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    return FVM_CommissionDetail::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommissionConfig);
}
FVM_CommissionDetail CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    FVM_CommissionDetail __r;
    TEUIModelRef<FVM_CommissionDetail> local_6 = TEUIModelRef<FVM_CommissionDetail>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionDetail::ModelId, 0, CommissionConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrentCommission";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentCommissionMonsterInfo";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionMonsterInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedMonsterInfo";
    local_14.TypeName = "TEUIModelRef<FVM_MonsterInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionDetail;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionDetail;
}
TEUIModelRef<FVM_CommissionInfo> __UIGetter_CurrentCommission(const FVM_CommissionDetail &inout Model)
{
    return Model.GetCurrentCommission();
}
TEUIModelRef<FVM_CommissionMonsterInfo> __UIGetter_CurrentCommissionMonsterInfo(const FVM_CommissionDetail &inout Model)
{
    return Model.GetCurrentCommissionMonsterInfo();
}
TEUIModelRef<FVM_MonsterInfo> __UIGetter_SelectedMonsterInfo(const FVM_CommissionDetail &inout Model)
{
    return Model.GetSelectedMonsterInfo();
}
TEUIModelRef<FVM_CommissionDetail> __UIGetter_Self(const FVM_CommissionDetail &inout Model)
{
    return TEUIModelRef<FVM_CommissionDetail>(Model);
}
int __IndexOf_CommissionConfig()
{
    return 0;
}
int __IndexOf_CurrentCommission()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CommissionDetail
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
