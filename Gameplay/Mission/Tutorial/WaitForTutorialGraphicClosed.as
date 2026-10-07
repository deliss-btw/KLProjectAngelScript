

// NOTE: class defaults are not authored in this module: FASWaitForTutorialGraphicClosed (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FASWaitForTutorialGraphicClosed : FECSAsyncAction
{
    FECSAsyncAction _base_FECSAsyncAction;
    UPROPERTY()
    FECSEntity PlayerEntity;
    UPROPERTY()
    TDataObjectPtr<FGuideGroupConfig> GraphicConfig;
    UPROPERTY()
    FECSAsyncActionDelegate OnClosed;

    FASWaitForTutorialGraphicClosed()
    {
        this.__InitDefaults();
        return;
    }
    void Activate_Implementation()
    {
        int local_20 = 0;
        if (!(this.PlayerEntity.IsValid()))
        {
            return;
        }
        ULevelEventManager local_4 = ::ULevelEventManager::Get();
        local_4.RegisterTutorialGraphicClosedAction(this.GraphicConfig, this.GetActionHandle());
        FFPTime local_16 = FFPTime(-1);
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        local_20.GraphicId = this.GraphicConfig;
        return;
    }
    void Deactivate_Implementation()
    {
        ULevelEventManager local_2 = ::ULevelEventManager::Get();
        local_2.UnRegisterTutorialGraphicClosedAction(this.GraphicConfig, this.GetActionHandle());
        return;
    }
    void Init(const FECSEntity &inout InPlayerEntity, const TDataObjectPtr<FGuideGroupConfig> &inout InGraphicConfig)
    {
        this.PlayerEntity = InPlayerEntity;
        this.GraphicConfig = InGraphicConfig;
        return;
    }
}

