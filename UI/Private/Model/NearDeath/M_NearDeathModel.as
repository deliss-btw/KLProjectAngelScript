
namespace FMS_NearDeathModel
{
    const int ModelId = 0;

}
struct FMS_NearDeathModel : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FEUIWidgetRef m_NearDeathPageHandle;
    UPROPERTY()
    FEUIWidgetRef m_WaitRebornPageHandle;
    UPROPERTY()
    FEUIWidgetRef m_RescueOtherPageHandle;

    FMS_NearDeathModel()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_NearDeathModel(const FMS_NearDeathModel &inout Other)
    {
        this.m_NearDeathPageHandle = Other.m_NearDeathPageHandle;
        this.m_WaitRebornPageHandle = Other.m_WaitRebornPageHandle;
        this.m_RescueOtherPageHandle = Other.m_RescueOtherPageHandle;
        return;
    }
    FMS_NearDeathModel& opAssign(const FMS_NearDeathModel &inout Other)
    {
        this.m_NearDeathPageHandle = Other.m_NearDeathPageHandle;
        this.m_WaitRebornPageHandle = Other.m_WaitRebornPageHandle;
        return Other.m_RescueOtherPageHandle;
    }
    void OnPlayerNearDeath(const FC_NearDeathInfo &inout PlayerNearDeathInfo)
    {
        if (PlayerNearDeathInfo)
        {
            if (!(this.GetNearDeathPageHandle()))
            {
                FEUIWidget::RemoveLayoutWidgets(this.GetContext().UELocalPlayer, EEUILayoutLayer(4));
                FEUIModelRef local_4;
                this.SetNearDeathPageHandle(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_HUD_NearDeath, local_4));
            }
            return;
        }
        if (this.GetNearDeathPageHandle())
        {
            FEUIWidget::RemoveWidget(this.GetNearDeathPageHandle());
        }
        return;
    }
    void OnPlayerWaitReborn(const FC_PlayerWaitForReborn &inout PlayerNearWaitReborn)
    {
        if (PlayerNearWaitReborn)
        {
            if (!(this.GetWaitRebornPageHandle()))
            {
                FEUIWidget::RemoveLayoutWidgets(this.GetContext().UELocalPlayer, EEUILayoutLayer(4));
                int local_3 = int(PlayerNearWaitReborn.GetDeathReason());
                FEUIModelRef local_6;
                this.SetWaitRebornPageHandle(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Reborn, local_6));
            }
            return;
        }
        if (this.GetWaitRebornPageHandle())
        {
            FEUIWidget::RemoveWidget(this.GetWaitRebornPageHandle());
        }
        return;
    }
    void OnPlayerRescueOther(const FC_InRescuedOtherInfo &inout PlayerRescueInfo)
    {
        if (PlayerRescueInfo)
        {
            if (!(this.GetRescueOtherPageHandle()))
            {
                FEUIModelRef local_4;
                this.SetRescueOtherPageHandle(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_HUD_RescuedOther, local_4));
            }
            return;
        }
        if (this.GetRescueOtherPageHandle())
        {
            FEUIWidget::RemoveWidget(this.GetRescueOtherPageHandle());
        }
        return;
    }
    const FEUIWidgetRef GetNearDeathPageHandle() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIWidgetRef GetModify_NearDeathPageHandle() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetNearDeathPageHandle(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_NearDeathPageHandle = __Value;
        return;
    }
    const FEUIWidgetRef GetWaitRebornPageHandle() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIWidgetRef GetModify_WaitRebornPageHandle() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetWaitRebornPageHandle(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_WaitRebornPageHandle = __Value;
        return;
    }
    const FEUIWidgetRef GetRescueOtherPageHandle() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIWidgetRef GetModify_RescueOtherPageHandle() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetRescueOtherPageHandle(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RescueOtherPageHandle = __Value;
        return;
    }
}

namespace FMS_NearDeathModel
{
FMS_NearDeathModel& Get(const UObject ContextObject)
{
    return FMS_NearDeathModel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_NearDeathModel GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_NearDeathModel __r;
    TEUIModelRef<FMS_NearDeathModel> local_6 = TEUIModelRef<FMS_NearDeathModel>(EUIInternal::MakeModelWithManager(Manager, FMS_NearDeathModel::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnPlayerNearDeath";
    local_14.ComponentType = FC_NearDeathInfo;
    Result.MonitorFunctions.Add(local_14);
    local_14.FunctionName = "__OnPlayerWaitReborn";
    local_14.ComponentType = FC_PlayerWaitForReborn;
    Result.MonitorFunctions.Add(local_14);
    local_14.FunctionName = "__OnPlayerRescueOther";
    local_14.ComponentType = FC_InRescuedOtherInfo;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_NearDeathModel;
}
void __OnPlayerNearDeath(FMS_NearDeathModel &inout Model, const FECSEntity &inout Entity, const FC_NearDeathInfo &inout Component)
{
    Model.OnPlayerNearDeath(Component);
    return;
}
void __OnPlayerWaitReborn(FMS_NearDeathModel &inout Model, const FECSEntity &inout Entity, const FC_PlayerWaitForReborn &inout Component)
{
    Model.OnPlayerWaitReborn(Component);
    return;
}
void __OnPlayerRescueOther(FMS_NearDeathModel &inout Model, const FECSEntity &inout Entity, const FC_InRescuedOtherInfo &inout Component)
{
    Model.OnPlayerRescueOther(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_NearDeathPageHandle()
{
    return 0;
}
int __IndexOf_WaitRebornPageHandle()
{
    return 1;
}
int __IndexOf_RescueOtherPageHandle()
{
    return 2;
}
}
