
enum EAbnormalFXPrefabType
{
    Avatar,
    Monster,
    Boss,
    Elite,
}

enum EAbnormalActiveState
{
    AccumulateExceedThreshold,
    NormalActive,
    EnhancedActive,
}

namespace __INTENRAL_FC_AbnormalState_NS
{
    const TECSComponentDerivedPtr<FC_AbnormalState> DerivedPtr = TECSComponentDerivedPtr<FC_AbnormalState>();
    const FC_AbnormalState DefaultValue = FC_AbnormalState();
}
namespace __INTENRAL_FC_BeRemovedAbnormalStates_NS
{
    const TECSComponentDerivedPtr<FC_BeRemovedAbnormalStates> DerivedPtr = TECSComponentDerivedPtr<FC_BeRemovedAbnormalStates>();
    const FC_BeRemovedAbnormalStates DefaultValue = FC_BeRemovedAbnormalStates();
}
namespace __INTENRAL_FC_AbnormalClearTag_NS
{
    const TECSComponentDerivedPtr<FC_AbnormalClearTag> DerivedPtr = TECSComponentDerivedPtr<FC_AbnormalClearTag>();
    const FC_AbnormalClearTag DefaultValue = FC_AbnormalClearTag();
}
namespace __INTENRAL_FC_AbnormalPresentation_NS
{
    const TECSComponentDerivedPtr<FC_AbnormalPresentation> DerivedPtr = TECSComponentDerivedPtr<FC_AbnormalPresentation>();
    const FC_AbnormalPresentation DefaultValue = FC_AbnormalPresentation();
}
namespace __INTENRAL_FC_MiniHPBarConfig_NS
{
    const TECSComponentDerivedPtr<FC_MiniHPBarConfig> DerivedPtr = TECSComponentDerivedPtr<FC_MiniHPBarConfig>();
    const FC_MiniHPBarConfig DefaultValue = FC_MiniHPBarConfig();
}
namespace __INTENRAL_FC_MiniHPBarHiddenCounter_NS
{
    const TECSComponentDerivedPtr<FC_MiniHPBarHiddenCounter> DerivedPtr = TECSComponentDerivedPtr<FC_MiniHPBarHiddenCounter>();
    const FC_MiniHPBarHiddenCounter DefaultValue = FC_MiniHPBarHiddenCounter();
}
namespace __INTENRAL_FC_ExecuteInfo_NS
{
    const TECSComponentDerivedPtr<FC_ExecuteInfo> DerivedPtr = TECSComponentDerivedPtr<FC_ExecuteInfo>();
    const FC_ExecuteInfo DefaultValue = FC_ExecuteInfo();
}
namespace __INTENRAL_FC_ExecutedInfo_NS
{
    const TECSComponentDerivedPtr<FC_ExecutedInfo> DerivedPtr = TECSComponentDerivedPtr<FC_ExecutedInfo>();
    const FC_ExecutedInfo DefaultValue = FC_ExecutedInfo();
}
namespace __INTENRAL_FC_ExecutedConfig_NS
{
    const TECSComponentDerivedPtr<FC_ExecutedConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ExecutedConfig>();
    const FC_ExecutedConfig DefaultValue = FC_ExecutedConfig();
}
namespace __INTENRAL_FC_WaitPlayerReadyForExecutionTag_NS
{
    const TECSComponentDerivedPtr<FC_WaitPlayerReadyForExecutionTag> DerivedPtr = TECSComponentDerivedPtr<FC_WaitPlayerReadyForExecutionTag>();
    const FC_WaitPlayerReadyForExecutionTag DefaultValue = FC_WaitPlayerReadyForExecutionTag();
}
namespace __INTENRAL_FC_ExecutionPresentationInfo_NS
{
    const TECSComponentDerivedPtr<FC_ExecutionPresentationInfo> DerivedPtr = TECSComponentDerivedPtr<FC_ExecutionPresentationInfo>();
    const FC_ExecutionPresentationInfo DefaultValue = FC_ExecutionPresentationInfo();
}
namespace __INTENRAL_FC_TeammateRescuedInfo_NS
{
    const TECSComponentDerivedPtr<FC_TeammateRescuedInfo> DerivedPtr = TECSComponentDerivedPtr<FC_TeammateRescuedInfo>();
    const FC_TeammateRescuedInfo DefaultValue = FC_TeammateRescuedInfo();
}
namespace __INTENRAL_FC_StrikeFreezeAttenuation_NS
{
    const TECSComponentDerivedPtr<FC_StrikeFreezeAttenuation> DerivedPtr = TECSComponentDerivedPtr<FC_StrikeFreezeAttenuation>();
    const FC_StrikeFreezeAttenuation DefaultValue = FC_StrikeFreezeAttenuation();
}
namespace __INTENRAL_FC_CacheHitPresentationDatas_NS
{
    const TECSComponentDerivedPtr<FC_CacheHitPresentationDatas> DerivedPtr = TECSComponentDerivedPtr<FC_CacheHitPresentationDatas>();
    const FC_CacheHitPresentationDatas DefaultValue = FC_CacheHitPresentationDatas();
}
namespace __INTENRAL_FCS_BossLowHPList_NS
{
    const TECSComponentDerivedPtr<FCS_BossLowHPList> DerivedPtr = TECSComponentDerivedPtr<FCS_BossLowHPList>();
    const FCS_BossLowHPList DefaultValue = FCS_BossLowHPList();
}
namespace __INTENRAL_FC_BossLowHPTag_NS
{
    const TECSComponentDerivedPtr<FC_BossLowHPTag> DerivedPtr = TECSComponentDerivedPtr<FC_BossLowHPTag>();
    const FC_BossLowHPTag DefaultValue = FC_BossLowHPTag();
}
namespace __INTENRAL_FCE_ExecutionStateChangedEvent_NS
{
    const TECSEventDerivedPtr<FCE_ExecutionStateChangedEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ExecutionStateChangedEvent>();
}
namespace __INTENRAL_FCE_DeadDuringDeathResistanceEvent_NS
{
    const TECSEventDerivedPtr<FCE_DeadDuringDeathResistanceEvent> DerivedPtr = TECSEventDerivedPtr<FCE_DeadDuringDeathResistanceEvent>();

}
struct FAbnormalFXConfigData
{
    UPROPERTY()
    float32 Duration = -1.0f;
    UPROPERTY()
    bool bInstanceFX = false;
    UPROPERTY()
    TSubclassOf<AFXActor> FX;
    UPROPERTY()
    TArray<FFXOverrideParam> OverrideFXParam;
    UPROPERTY()
    bool bFXAttached = true;
    UPROPERTY()
    FName FXAttachSocket;
    UPROPERTY()
    bool bOverrideMaterial = false;
    UPROPERTY()
    FName OverrideMaterialRequestName;
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> OverrideMaterialParam;


}

struct FAbnormalFXConfig
{
    UPROPERTY()
    TArray<FAbnormalFXConfigData> FXConfigDatas;

    FAbnormalFXConfig()
    {
        return;
    }
}

struct FAbnormalState
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EAbnormalState m_AbnormalStateType;
    UPROPERTY()
    EAbnormalActiveState m_ActiveState;
    UPROPERTY()
    FBuffConfigRef m_BuffConfig;
    UPROPERTY()
    FBuffConfigRef m_WeaknessBuffConfig;
    UPROPERTY()
    FECSEntity m_Attacker;
    UPROPERTY()
    FFPTime m_EndTime;

    FAbnormalState()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAbnormalState(const FAbnormalState &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAbnormalState opAssign(const FAbnormalState &inout Other)
    {
        FAbnormalState __r;
        this.SetAbnormalStateType(Other.GetAbnormalStateType());
        this.SetActiveState(Other.GetActiveState());
        this.SetBuffConfig(Other.GetBuffConfig());
        this.SetWeaknessBuffConfig(Other.GetWeaknessBuffConfig());
        this.SetAttacker(Other.GetAttacker());
        this.SetEndTime(Other.GetEndTime());
        return __r;
    }
    bool IsActiving() const
    {
        return (int(this.GetActiveState()) != 0);
    }
    void RemoveBuffFromPawn(const FECSEntity &inout Pawn, const FFPTime &inout Time) const
    {
        if (this.GetBuffConfig().IsValid() && FBuffUtils::HasBuff(Pawn, this.GetBuffConfig()))
        {
            FBuffUtils::RemoveBuff(Pawn, this.GetBuffConfig(), Time, EBuffEndType(0));
        }
        if (this.GetWeaknessBuffConfig().IsValid() && FBuffUtils::HasBuff(Pawn, this.GetWeaknessBuffConfig()))
        {
            FBuffUtils::RemoveBuff(Pawn, this.GetWeaknessBuffConfig(), Time, EBuffEndType(0));
        }
        return;
    }
    bool AddBuffToPawn(const FECSEntity &inout Pawn, const FFPTime &inout Time) const
    {
        bool local_1 = false;
        if (this.GetBuffConfig().IsValid() && !(FBuffUtils::HasBuff(Pawn, this.GetBuffConfig())))
        {
            FECSEntity local_14 = FBuffUtils::AddBuff(Pawn, this.GetBuffConfig(), Time, this.GetAttacker(), false, -1.0f, 1, false);
            local_1 = local_14.IsValid();
        }
        if (this.GetWeaknessBuffConfig().IsValid() && !(FBuffUtils::HasBuff(Pawn, this.GetWeaknessBuffConfig())))
        {
            FBuffUtils::AddBuff(Pawn, this.GetWeaknessBuffConfig(), Time, this.GetAttacker(), false, -1.0f, 1, false);
        }
        return local_1;
    }
    EAbnormalState GetAbnormalStateType() const property
    {
        return this.m_AbnormalStateType;
    }
    void SetAbnormalStateType(const EAbnormalState __Value) property
    {
        if (int(this.m_AbnormalStateType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AbnormalStateType = __Value;
        return;
    }
    EAbnormalActiveState GetActiveState() const property
    {
        return this.m_ActiveState;
    }
    void SetActiveState(const EAbnormalActiveState __Value) property
    {
        if (int(this.m_ActiveState) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ActiveState = __Value;
        return;
    }
    FBuffConfigRef GetBuffConfig() const property
    {
        FBuffConfigRef __r;
        return __r;
    }
    FBuffConfigRef GetModify_BuffConfig() property
    {
        FBuffConfigRef __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetBuffConfig(const FBuffConfigRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_BuffConfig = __Value;
        return;
    }
    const FBuffConfigRef GetWeaknessBuffConfig() const property
    {
        const FBuffConfigRef __r;
        return __r;
    }
    FBuffConfigRef GetModify_WeaknessBuffConfig() property
    {
        FBuffConfigRef __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetWeaknessBuffConfig(const FBuffConfigRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_WeaknessBuffConfig = __Value;
        return;
    }
    const FECSEntity GetAttacker() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_Attacker() property
    {
        FECSEntity __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetAttacker(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Attacker = __Value;
        return;
    }
    FFPTime GetEndTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_EndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_EndTime = __Value;
        return;
    }
}

struct FC_AbnormalState : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FAbnormalState> m_AbnormalStates;

    FC_AbnormalState()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_AbnormalState(const FC_AbnormalState &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_AbnormalStates = Other.m_AbnormalStates;
        return;
    }
    FC_AbnormalState opAssign(const FC_AbnormalState &inout Other)
    {
        FC_AbnormalState __r;
        this.SetAbnormalStates(Other.GetAbnormalStates());
        return __r;
    }
    const TArray<FAbnormalState> GetAbnormalStates() const property
    {
        const TArray<FAbnormalState> __r;
        return __r;
    }
    TArray<FAbnormalState> GetModify_AbnormalStates() property
    {
        TArray<FAbnormalState> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAbnormalStates(const TArray<FAbnormalState> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AbnormalStates = __Value;
        return;
    }
}

struct FC_BeRemovedAbnormalStates : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<EAbnormalState> m_ToBeRemovedAbnormalStates;

    FC_BeRemovedAbnormalStates()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_BeRemovedAbnormalStates(const FC_BeRemovedAbnormalStates &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ToBeRemovedAbnormalStates = Other.m_ToBeRemovedAbnormalStates;
        return;
    }
    FC_BeRemovedAbnormalStates opAssign(const FC_BeRemovedAbnormalStates &inout Other)
    {
        FC_BeRemovedAbnormalStates __r;
        this.SetToBeRemovedAbnormalStates(Other.GetToBeRemovedAbnormalStates());
        return __r;
    }
    const TArray<EAbnormalState> GetToBeRemovedAbnormalStates() const property
    {
        const TArray<EAbnormalState> __r;
        return __r;
    }
    TArray<EAbnormalState> GetModify_ToBeRemovedAbnormalStates() property
    {
        TArray<EAbnormalState> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetToBeRemovedAbnormalStates(const TArray<EAbnormalState> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ToBeRemovedAbnormalStates = __Value;
        return;
    }
}

struct FC_AbnormalClearTag : FECSComponent
{
    FC_AbnormalClearTag()
    {
        return;
    }
}

struct FAbnormalFX
{
    UPROPERTY()
    EAbnormalActiveState ActiveState = EAbnormalActiveState(0);
    UPROPERTY()
    EAbnormalState AbnormalState;
    UPROPERTY()
    TArray<FECSEntity> FXEntity;
    UPROPERTY()
    TArray<FName> OverrideMaterialParams;
    UPROPERTY()
    FFPTime EndTime;


}

struct FC_AbnormalPresentation : FECSComponent
{
    UPROPERTY()
    TArray<FAbnormalFX> AbnormalFXs;

    FC_AbnormalPresentation()
    {
        return;
    }
    int FindAbnormalState(const EAbnormalState AbnormalStateType, const EAbnormalActiveState ActiveState) const
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            if (int(this[local_1].ActiveState) == int(ActiveState) && (int(this[local_1].AbnormalState) == int(AbnormalStateType)))
            {
                return local_1;
            }
        }
        return -1;
    }
}

struct FAbnormalEnhancedConfig
{
    UPROPERTY()
    FGameplayTag StateTag;
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    FBuffConfigRef WeaknessBuffConfig;
    UPROPERTY()
    TMap<EAbnormalFXPrefabType, FAbnormalFXConfig> AbnormalFXConfigs;
    UPROPERTY()
    TMap<FGameplayTag, FAbnormalFXConfig> SpecialBossAbnormalFXConfigs;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig;
    UPROPERTY()
    float32 HintRange = 5000.0f;


}

struct FAbnormalStateConfig
{
    UPROPERTY()
    FGameplayTag StateTag;
    UPROPERTY()
    FGameAttributeRef AccumulationAttribute;
    UPROPERTY()
    FGameAttributeRef AccumulationAttributeCoefficient;
    UPROPERTY()
    FGameAttributeRef AccumulationAttributeMax;
    UPROPERTY()
    float32 AccumulatingBuffThreshold = 0.5f;
    UPROPERTY()
    FBuffConfigRef AccumulatingBuffConfig;
    UPROPERTY()
    FBuffConfigRef AbnormalStateBuffConfig;
    UPROPERTY()
    FBuffConfigRef MonsterStateBuffConfig;
    UPROPERTY()
    FBuffConfigRef MonsterWeaknessBuffConfig;
    UPROPERTY()
    UTexture2D AbnormalImage = nullptr;
    UPROPERTY()
    FLinearColor AccumulationColor;
    UPROPERTY()
    FLinearColor TakeEffectColor;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> AbnormalMessageHintConfig;
    UPROPERTY()
    float32 AbnormalHintRange = 2000.0f;
    UPROPERTY()
    TMap<EAbnormalFXPrefabType, FAbnormalFXConfig> AbnormalFXConfigs;
    UPROPERTY()
    TMap<FGameplayTag, FAbnormalFXConfig> SpecialBossAbnormalFXConfigs;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> AbnormalAccumulationMessageHintConfig;
    UPROPERTY()
    float32 AbnormalAccumulationHintRange = 2000.0f;
    UPROPERTY()
    TMap<EAbnormalFXPrefabType, FAbnormalFXConfig> AbnormalAccumulationFXConfigs;
    UPROPERTY()
    TMap<FGameplayTag, FAbnormalFXConfig> SpecialBossAbnormalAccumulationFXConfigs;
    UPROPERTY()
    FAbnormalEnhancedConfig MonsterEnhancedConfig;


}

struct FC_MiniHPBarConfig : FECSComponent
{
    UPROPERTY()
    bool HasMiniHPBar = true;
    UPROPERTY()
    bool bUseEnvBreakHPAttribute = false;
    UPROPERTY()
    FLinearColor BarColor = FLinearColor(0.9f, 0.0f, 0.05f, 0.9f);


}

struct FC_MiniHPBarHiddenCounter : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint8 m_Counter;

    FC_MiniHPBarHiddenCounter()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MiniHPBarHiddenCounter(const FC_MiniHPBarHiddenCounter &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MiniHPBarHiddenCounter opAssign(const FC_MiniHPBarHiddenCounter &inout Other)
    {
        FC_MiniHPBarHiddenCounter __r;
        this.SetCounter(uint8(Other.GetCounter()));
        return __r;
    }
    uint8 GetCounter() const property
    {
        return this.m_Counter;
    }
    void SetCounter(const uint8 __Value) property
    {
        if (this.m_Counter == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Counter = (__Value != 0);
        return;
    }
}

struct FC_ExecuteInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EExecutedPreType m_ExecutePreType;

    FC_ExecuteInfo()
    {
        this.m_ExecutePreType = EExecutedPreType(0);
        this.__InitDirtyFlags();
        return;
    }
    FC_ExecuteInfo(const FC_ExecuteInfo &inout Other)
    {
        this.m_ExecutePreType = EExecutedPreType(0);
        this.__InitDirtyFlags();
        this.m_ExecutePreType = Other.m_ExecutePreType;
        return;
    }
    FC_ExecuteInfo opAssign(const FC_ExecuteInfo &inout Other)
    {
        FC_ExecuteInfo __r;
        this.SetExecutePreType(Other.GetExecutePreType());
        return __r;
    }
    EExecutedPreType GetExecutePreType() const property
    {
        return this.m_ExecutePreType;
    }
    void SetExecutePreType(const EExecutedPreType __Value) property
    {
        if (int(this.m_ExecutePreType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ExecutePreType = __Value;
        return;
    }
}

struct FCE_ExecutionStateChangedEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ExecutionStateChangedEvent()
    {
        return;
    }
}

struct FC_ExecutedInfo : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    EExecutionState m_ExecutionState;
    UPROPERTY()
    bool m_bQTESuccess;
    UPROPERTY()
    int m_CurrentMaxPlayerNum;
    UPROPERTY()
    TArray<FECSEntity> m_ExecuteEntityArray;
    UPROPERTY()
    TArray<FECSEntity> m_AddBuffEntityArray;
    UPROPERTY()
    FECSEntity m_ExecuteTeamEntity;
    UPROPERTY()
    FFPTime m_LastAddPlayerTime;
    UPROPERTY()
    FECSEntity m_ChaosKnotFXEntity;
    UPROPERTY()
    FFPTime m_CanRecoverFromExecutedTime;

    FC_ExecutedInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ExecutedInfo(const FC_ExecutedInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ExecutedInfo opAssign(const FC_ExecutedInfo &inout Other)
    {
        FC_ExecutedInfo __r;
        this.SetExecutionState(Other.GetExecutionState());
        this.SetbQTESuccess(Other.GetbQTESuccess());
        this.SetCurrentMaxPlayerNum(Other.GetCurrentMaxPlayerNum());
        this.SetExecuteEntityArray(Other.GetExecuteEntityArray());
        this.SetAddBuffEntityArray(Other.GetAddBuffEntityArray());
        this.SetExecuteTeamEntity(Other.GetExecuteTeamEntity());
        this.SetLastAddPlayerTime(Other.GetLastAddPlayerTime());
        this.SetChaosKnotFXEntity(Other.GetChaosKnotFXEntity());
        this.SetCanRecoverFromExecutedTime(Other.GetCanRecoverFromExecutedTime());
        return __r;
    }
    bool CheckNoExecuteOrMyTeamExecuting(const FECSEntity &inout PawnEntity) const
    {
        if (this.GetExecuteTeamEntity().IsValid())
        {
            return (::FTeamUtils::GetTeamEntityForPawn(PawnEntity) == this.GetExecuteTeamEntity());
        }
        if (!(this.GetExecuteEntityArray().IsEmpty()))
        {
            return (FECSEntity(this.GetExecuteEntityArray()[0]) == PawnEntity);
        }
        return true;
    }
    bool CheckCanAddNotExceedConfigMax(const FECSEntity &inout PawnEntity, const FC_ExecutedConfig &inout Config) const
    {
        if (this.GetExecuteEntityArray().IsEmpty())
        {
            return true;
        }
        if (this.GetExecuteTeamEntity().IsValid())
        {
            FECSEntity local_10 = ::FTeamUtils::GetTeamEntityForPawn(PawnEntity);
            if (!((local_10 == this.GetExecuteTeamEntity())))
            {
                return false;
            }
        }
        if (this.GetExecuteEntityArray().Num() >= Config.GetMaxExecutedNum())
        {
            return false;
        }
        if (this.GetExecuteEntityArray().Contains(PawnEntity))
        {
            return false;
        }
        return true;
    }
    EExecutionState GetExecutionState() const property
    {
        return this.m_ExecutionState;
    }
    void SetExecutionState(const EExecutionState __Value) property
    {
        if (int(this.m_ExecutionState) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ExecutionState = __Value;
        return;
    }
    bool GetbQTESuccess() const property
    {
        return this.m_bQTESuccess;
    }
    void SetbQTESuccess(const bool __Value) property
    {
        if (!(this.m_bQTESuccess) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bQTESuccess = __Value;
        return;
    }
    int GetCurrentMaxPlayerNum() const property
    {
        return this.m_CurrentMaxPlayerNum;
    }
    void SetCurrentMaxPlayerNum(const int __Value) property
    {
        if (this.m_CurrentMaxPlayerNum == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_CurrentMaxPlayerNum = __Value;
        return;
    }
    const TArray<FECSEntity> GetExecuteEntityArray() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_ExecuteEntityArray() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetExecuteEntityArray(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ExecuteEntityArray = __Value;
        return;
    }
    const TArray<FECSEntity> GetAddBuffEntityArray() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_AddBuffEntityArray() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetAddBuffEntityArray(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_AddBuffEntityArray = __Value;
        return;
    }
    const FECSEntity GetExecuteTeamEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_ExecuteTeamEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetExecuteTeamEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_ExecuteTeamEntity = __Value;
        return;
    }
    const FFPTime GetLastAddPlayerTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastAddPlayerTime() property
    {
        FFPTime __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetLastAddPlayerTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_LastAddPlayerTime = __Value;
        return;
    }
    const FECSEntity GetChaosKnotFXEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_ChaosKnotFXEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetChaosKnotFXEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_ChaosKnotFXEntity = __Value;
        return;
    }
    const FFPTime GetCanRecoverFromExecutedTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_CanRecoverFromExecutedTime() property
    {
        FFPTime __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetCanRecoverFromExecutedTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_CanRecoverFromExecutedTime = __Value;
        return;
    }
}

struct FC_ExecutedConfig : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FExecutionConfigDataObject> ExecutionConfigData;

    FC_ExecutedConfig()
    {
        return;
    }
    int GetMaxExecutedNum() const
    {
        int local_2 = 0;
        if (this)
        {
            return local_2;
        }
        return 0;
    }
    float32 GetExecutedDamageHPRatio() const
    {
        float32 local_2 = 0.0f;
        if (this)
        {
            return local_2;
        }
        return 0.0f;
    }
    EExecutedPreType GetExecutedPreType() const
    {
        int local_2 = 0;
        if (this)
        {
            return EExecutedPreType(local_2);
        }
        return EExecutedPreType(1);
    }
    FName GetExecuterAnimKey() const
    {
        FName __return;
        if (this)
        {
        }
        else
        {
            __return = NAME_None;
        }
        return __return;
    }
    FBuffConfigRef GetExecuteBuff() const
    {
        FBuffConfigRef __return;
        if (this)
        {
        }
        else
        {
            __return = FBuffConfigRef();
        }
        return __return;
    }
    TDataObjectPtr<FMessageHintConfig> GetMessageHintConfig() const
    {
        if (this)
        {
            return GetMessageHintConfig();
        }
        return TDataObjectPtr<FMessageHintConfig>();
    }
}

struct FC_WaitPlayerReadyForExecutionTag : FECSComponent
{
    FC_WaitPlayerReadyForExecutionTag()
    {
        return;
    }
}

class UWidget_MultiExecution_TimeLimit : UASUserWidget
{
    UPROPERTY()
    UProgressBar AS_ProgressBar_TimeLimit;

    UWidget_MultiExecution_TimeLimit()
    {
        return;
    }
}

struct FC_ExecutionPresentationInfo : FECSComponent
{
    UPROPERTY()
    UWidget_MultiExecution_TimeLimit TimeLimitWidget;

    FC_ExecutionPresentationInfo()
    {
        return;
    }
}

struct FC_TeammateRescuedInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_Rescuer;
    UPROPERTY()
    FVector m_RescuerLocation;

    FC_TeammateRescuedInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_TeammateRescuedInfo(const FC_TeammateRescuedInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Rescuer = Other.m_Rescuer;
        this.m_RescuerLocation = Other.m_RescuerLocation;
        return;
    }
    FC_TeammateRescuedInfo opAssign(const FC_TeammateRescuedInfo &inout Other)
    {
        FC_TeammateRescuedInfo __r;
        this.SetRescuer(Other.GetRescuer());
        this.SetRescuerLocation(Other.GetRescuerLocation());
        return __r;
    }
    const FECSEntity GetRescuer() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_Rescuer() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRescuer(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Rescuer = __Value;
        return;
    }
    const FVector GetRescuerLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_RescuerLocation() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetRescuerLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RescuerLocation = __Value;
        return;
    }
}

struct FC_StrikeFreezeAttenuation : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FName, uint8> m_StrikeHitCounter;
    UPROPERTY()
    TMap<FName, uint8> m_StrikeInvokeCounter;

    FC_StrikeFreezeAttenuation()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_StrikeFreezeAttenuation(const FC_StrikeFreezeAttenuation &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_StrikeHitCounter = Other.m_StrikeHitCounter;
        this.m_StrikeInvokeCounter = Other.m_StrikeInvokeCounter;
        return;
    }
    FC_StrikeFreezeAttenuation opAssign(const FC_StrikeFreezeAttenuation &inout Other)
    {
        FC_StrikeFreezeAttenuation __r;
        this.SetStrikeHitCounter(Other.GetStrikeHitCounter());
        this.SetStrikeInvokeCounter(Other.GetStrikeInvokeCounter());
        return __r;
    }
    const TMap<FName, uint8> GetStrikeHitCounter() const property
    {
        const TMap<FName, uint8> __r;
        return __r;
    }
    TMap<FName, uint8> GetModify_StrikeHitCounter() property
    {
        TMap<FName, uint8> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetStrikeHitCounter(const TMap<FName, uint8> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StrikeHitCounter = __Value;
        return;
    }
    const TMap<FName, uint8> GetStrikeInvokeCounter() const property
    {
        const TMap<FName, uint8> __r;
        return __r;
    }
    TMap<FName, uint8> GetModify_StrikeInvokeCounter() property
    {
        TMap<FName, uint8> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetStrikeInvokeCounter(const TMap<FName, uint8> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_StrikeInvokeCounter = __Value;
        return;
    }
}

struct FCE_DeadDuringDeathResistanceEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId KillerEntityId;

    FCE_DeadDuringDeathResistanceEvent()
    {
        return;
    }
}

struct FCacheHitPresentationData
{
    UPROPERTY()
    FName StrikeKey;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FHitPresentationData HitPresentationData;

    FCacheHitPresentationData()
    {
        return;
    }
}

struct FCacheHitPresentationDatas
{
    UPROPERTY()
    TArray<FCacheHitPresentationData> OneFrameCachedDatas;

    FCacheHitPresentationDatas()
    {
        return;
    }
}

struct FC_CacheHitPresentationDatas : FECSComponent
{
    UPROPERTY()
    TMap<FFPTime, FCacheHitPresentationDatas> CacheHitPresentationDatas;
    UPROPERTY()
    FFPTime DelayRemovedTime = FFPTime(4);

    FC_CacheHitPresentationDatas()
    {
        return;
    }
    void SetHitPresentationDataFromCache(const FName &inout StrikeKey, const FECSEntity &inout TargetEntity, const FFPTime &inout Time, const FHitPresentationData &inout InData)
    {
        if (!(this.Contains(Time)))
        {
        }
        FCacheHitPresentationData local_38;
        local_38.StrikeKey = StrikeKey;
        local_38.TargetEntity = TargetEntity;
        local_38.HitPresentationData = InData;
        TArray<FCacheHitPresentationData> local_8;
        local_8.Add(local_38);
        TArray<FFPTime> local_44;
        for (auto& local_62 : this)
        {
            FFPTime local_66 = (FFPTime(local_62.GetKey()) + this.DelayRemovedTime);
            if (local_66.opCmp(Time) <= 0)
            {
                local_44.Add(local_62.GetKey());
            }
        }
        int local_67 = 0;
        for (; local_67 < local_44.Num(); )
        {
            ++local_67;
        }
        return;
    }
    bool GetHitPresentationDataFromCache(const FName &inout StrikeKey, const FECSEntity &inout TargetEntity, const FFPTime &inout Time, FHitPresentationData &inout OutData) const
    {
        if (this.Contains(Time))
        {
            TArray<FCacheHitPresentationData> local_4;
            int local_5 = 0;
            for (; local_5 < local_4.Num(); ++local_5)
            {
                if ((FName(local_4[local_5].StrikeKey) == StrikeKey) && (FECSEntity(local_4[local_5].TargetEntity) == TargetEntity))
                {
                    OutData = local_4[local_5].HitPresentationData;
                    return true;
                }
            }
        }
        return false;
    }
}

struct FCS_BossLowHPList : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FECSEntityId> m_BossLowHPList;

    FCS_BossLowHPList()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_BossLowHPList(const FCS_BossLowHPList &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_BossLowHPList = Other.m_BossLowHPList;
        return;
    }
    FCS_BossLowHPList opAssign(const FCS_BossLowHPList &inout Other)
    {
        FCS_BossLowHPList __r;
        this.SetBossLowHPList(Other.GetBossLowHPList());
        return __r;
    }
    const TArray<FECSEntityId> GetBossLowHPList() const property
    {
        const TArray<FECSEntityId> __r;
        return __r;
    }
    TArray<FECSEntityId> GetModify_BossLowHPList() property
    {
        TArray<FECSEntityId> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetBossLowHPList(const TArray<FECSEntityId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_BossLowHPList = __Value;
        return;
    }
}

struct FC_BossLowHPTag : FECSComponent
{
    FC_BossLowHPTag()
    {
        return;
    }
}

namespace ECSFunc_FC_AbnormalState
{
UFUNCTION()
bool HasAbnormalState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AbnormalState);
}
FC_AbnormalState& AssignAbnormalState(const FECSEntity &inout Entity, const FC_AbnormalState &inout DefaultValue = FC_AbnormalState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AbnormalState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAbnormalState_BP(const FECSEntity &inout Entity, const FC_AbnormalState &inout DefaultValue = FC_AbnormalState())
{
    ECSFunc_FC_AbnormalState::AssignAbnormalState(Entity, DefaultValue);
    return;
}
FC_AbnormalState& ModifyAbnormalState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AbnormalState));
    return local_12.GetComp();
}
FC_AbnormalState& ModifyOrAddAbnormalState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AbnormalState));
    return local_12.GetComp();
}
const FC_AbnormalState& GetAbnormalState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AbnormalState));
    return local_12.GetComp();
}
UFUNCTION()
FC_AbnormalState GetAbnormalState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AbnormalState& local_4 = ECSFunc_FC_AbnormalState::GetAbnormalState(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AbnormalState();
}
const FC_AbnormalState GetDefaultedAbnormalState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AbnormalState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AbnormalState);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AbnormalState GetDefaultedAbnormalState_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AbnormalState::GetDefaultedAbnormalState(Entity);
}
UFUNCTION()
bool RemoveAbnormalState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AbnormalState);
}
}
FECSMonitorRuntimeView __GetMonitorAbnormalStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AbnormalState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AbnormalState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AbnormalState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AbnormalState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AbnormalState, bFixedFrame, bMustHandleAll);
}
void __MonitorAbnormalStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AbnormalState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAbnormalStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AbnormalState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAbnormalStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AbnormalState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BeRemovedAbnormalStates
{
UFUNCTION()
bool HasBeRemovedAbnormalStates(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BeRemovedAbnormalStates);
}
FC_BeRemovedAbnormalStates& AssignBeRemovedAbnormalStates(const FECSEntity &inout Entity, const FC_BeRemovedAbnormalStates &inout DefaultValue = FC_BeRemovedAbnormalStates())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BeRemovedAbnormalStates, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBeRemovedAbnormalStates_BP(const FECSEntity &inout Entity, const FC_BeRemovedAbnormalStates &inout DefaultValue = FC_BeRemovedAbnormalStates())
{
    ECSFunc_FC_BeRemovedAbnormalStates::AssignBeRemovedAbnormalStates(Entity, DefaultValue);
    return;
}
FC_BeRemovedAbnormalStates& ModifyBeRemovedAbnormalStates(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BeRemovedAbnormalStates));
    return local_12.GetComp();
}
FC_BeRemovedAbnormalStates& ModifyOrAddBeRemovedAbnormalStates(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BeRemovedAbnormalStates));
    return local_12.GetComp();
}
const FC_BeRemovedAbnormalStates& GetBeRemovedAbnormalStates(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BeRemovedAbnormalStates));
    return local_12.GetComp();
}
UFUNCTION()
FC_BeRemovedAbnormalStates GetBeRemovedAbnormalStates_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BeRemovedAbnormalStates& local_4 = ECSFunc_FC_BeRemovedAbnormalStates::GetBeRemovedAbnormalStates(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BeRemovedAbnormalStates();
}
const FC_BeRemovedAbnormalStates GetDefaultedBeRemovedAbnormalStates(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BeRemovedAbnormalStates __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BeRemovedAbnormalStates);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_BeRemovedAbnormalStates GetDefaultedBeRemovedAbnormalStates_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BeRemovedAbnormalStates::GetDefaultedBeRemovedAbnormalStates(Entity);
}
UFUNCTION()
bool RemoveBeRemovedAbnormalStates(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BeRemovedAbnormalStates);
}
}
FECSMonitorRuntimeView __GetMonitorBeRemovedAbnormalStatesOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BeRemovedAbnormalStates, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeRemovedAbnormalStatesOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BeRemovedAbnormalStates, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeRemovedAbnormalStatesOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BeRemovedAbnormalStates, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeRemovedAbnormalStatesOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BeRemovedAbnormalStates, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeRemovedAbnormalStatesOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BeRemovedAbnormalStates, bFixedFrame, bMustHandleAll);
}
void __MonitorBeRemovedAbnormalStatesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BeRemovedAbnormalStates, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeRemovedAbnormalStatesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BeRemovedAbnormalStates, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeRemovedAbnormalStatesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BeRemovedAbnormalStates, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AbnormalClearTag
{
UFUNCTION()
bool HasAbnormalClearTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AbnormalClearTag);
}
FC_AbnormalClearTag& AssignAbnormalClearTag(const FECSEntity &inout Entity, const FC_AbnormalClearTag &inout DefaultValue = FC_AbnormalClearTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AbnormalClearTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAbnormalClearTag_BP(const FECSEntity &inout Entity, const FC_AbnormalClearTag &inout DefaultValue = FC_AbnormalClearTag())
{
    ECSFunc_FC_AbnormalClearTag::AssignAbnormalClearTag(Entity, DefaultValue);
    return;
}
FC_AbnormalClearTag& ModifyAbnormalClearTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AbnormalClearTag));
    return local_12.GetComp();
}
FC_AbnormalClearTag& ModifyOrAddAbnormalClearTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AbnormalClearTag));
    return local_12.GetComp();
}
const FC_AbnormalClearTag& GetAbnormalClearTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AbnormalClearTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AbnormalClearTag GetAbnormalClearTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AbnormalClearTag& local_4 = ECSFunc_FC_AbnormalClearTag::GetAbnormalClearTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AbnormalClearTag();
}
const FC_AbnormalClearTag GetDefaultedAbnormalClearTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AbnormalClearTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AbnormalClearTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AbnormalClearTag GetDefaultedAbnormalClearTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AbnormalClearTag::GetDefaultedAbnormalClearTag(Entity);
}
UFUNCTION()
bool RemoveAbnormalClearTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AbnormalClearTag);
}
}
FECSMonitorRuntimeView __GetMonitorAbnormalClearTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AbnormalClearTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalClearTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AbnormalClearTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalClearTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AbnormalClearTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalClearTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AbnormalClearTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalClearTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AbnormalClearTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAbnormalClearTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AbnormalClearTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAbnormalClearTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AbnormalClearTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAbnormalClearTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AbnormalClearTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AbnormalPresentation
{
UFUNCTION()
bool HasAbnormalPresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AbnormalPresentation);
}
FC_AbnormalPresentation& AssignAbnormalPresentation(const FECSEntity &inout Entity, const FC_AbnormalPresentation &inout DefaultValue = FC_AbnormalPresentation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AbnormalPresentation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAbnormalPresentation_BP(const FECSEntity &inout Entity, const FC_AbnormalPresentation &inout DefaultValue = FC_AbnormalPresentation())
{
    ECSFunc_FC_AbnormalPresentation::AssignAbnormalPresentation(Entity, DefaultValue);
    return;
}
FC_AbnormalPresentation& ModifyAbnormalPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AbnormalPresentation));
    return local_12.GetComp();
}
FC_AbnormalPresentation& ModifyOrAddAbnormalPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AbnormalPresentation));
    return local_12.GetComp();
}
const FC_AbnormalPresentation& GetAbnormalPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AbnormalPresentation));
    return local_12.GetComp();
}
UFUNCTION()
FC_AbnormalPresentation GetAbnormalPresentation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AbnormalPresentation __r;
    bValid = false;
    bValid = ECSFunc_FC_AbnormalPresentation::GetAbnormalPresentation(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AbnormalPresentation GetDefaultedAbnormalPresentation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AbnormalPresentation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AbnormalPresentation);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AbnormalPresentation GetDefaultedAbnormalPresentation_BP(const FECSEntity &inout Entity)
{
    FC_AbnormalPresentation __r;
    return __r;
}
UFUNCTION()
bool RemoveAbnormalPresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AbnormalPresentation);
}
}
FECSMonitorRuntimeView __GetMonitorAbnormalPresentationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AbnormalPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalPresentationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AbnormalPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalPresentationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AbnormalPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalPresentationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AbnormalPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalPresentationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AbnormalPresentation, bFixedFrame, bMustHandleAll);
}
void __MonitorAbnormalPresentationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AbnormalPresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAbnormalPresentationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AbnormalPresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAbnormalPresentationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AbnormalPresentation, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MiniHPBarConfig
{
UFUNCTION()
bool HasMiniHPBarConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarConfig);
}
FC_MiniHPBarConfig& AssignMiniHPBarConfig(const FECSEntity &inout Entity, const FC_MiniHPBarConfig &inout DefaultValue = FC_MiniHPBarConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMiniHPBarConfig_BP(const FECSEntity &inout Entity, const FC_MiniHPBarConfig &inout DefaultValue = FC_MiniHPBarConfig())
{
    ECSFunc_FC_MiniHPBarConfig::AssignMiniHPBarConfig(Entity, DefaultValue);
    return;
}
FC_MiniHPBarConfig& ModifyMiniHPBarConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarConfig));
    return local_12.GetComp();
}
FC_MiniHPBarConfig& ModifyOrAddMiniHPBarConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarConfig));
    return local_12.GetComp();
}
const FC_MiniHPBarConfig& GetMiniHPBarConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_MiniHPBarConfig GetMiniHPBarConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MiniHPBarConfig& local_4 = ECSFunc_FC_MiniHPBarConfig::GetMiniHPBarConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MiniHPBarConfig();
}
const FC_MiniHPBarConfig GetDefaultedMiniHPBarConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MiniHPBarConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarConfig);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_MiniHPBarConfig GetDefaultedMiniHPBarConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MiniHPBarConfig::GetDefaultedMiniHPBarConfig(Entity);
}
UFUNCTION()
bool RemoveMiniHPBarConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarConfig);
}
}
FECSMonitorRuntimeView __GetMonitorMiniHPBarConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MiniHPBarConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMiniHPBarConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MiniHPBarConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMiniHPBarConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MiniHPBarConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMiniHPBarConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MiniHPBarConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMiniHPBarConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MiniHPBarConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorMiniHPBarConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MiniHPBarConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMiniHPBarConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MiniHPBarConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMiniHPBarConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MiniHPBarConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MiniHPBarHiddenCounter
{
UFUNCTION()
bool HasMiniHPBarHiddenCounter(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarHiddenCounter);
}
FC_MiniHPBarHiddenCounter& AssignMiniHPBarHiddenCounter(const FECSEntity &inout Entity, const FC_MiniHPBarHiddenCounter &inout DefaultValue = FC_MiniHPBarHiddenCounter())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarHiddenCounter, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMiniHPBarHiddenCounter_BP(const FECSEntity &inout Entity, const FC_MiniHPBarHiddenCounter &inout DefaultValue = FC_MiniHPBarHiddenCounter())
{
    ECSFunc_FC_MiniHPBarHiddenCounter::AssignMiniHPBarHiddenCounter(Entity, DefaultValue);
    return;
}
FC_MiniHPBarHiddenCounter& ModifyMiniHPBarHiddenCounter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarHiddenCounter));
    return local_12.GetComp();
}
FC_MiniHPBarHiddenCounter& ModifyOrAddMiniHPBarHiddenCounter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarHiddenCounter));
    return local_12.GetComp();
}
const FC_MiniHPBarHiddenCounter& GetMiniHPBarHiddenCounter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarHiddenCounter));
    return local_12.GetComp();
}
UFUNCTION()
FC_MiniHPBarHiddenCounter GetMiniHPBarHiddenCounter_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MiniHPBarHiddenCounter& local_4 = ECSFunc_FC_MiniHPBarHiddenCounter::GetMiniHPBarHiddenCounter(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MiniHPBarHiddenCounter();
}
const FC_MiniHPBarHiddenCounter GetDefaultedMiniHPBarHiddenCounter(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MiniHPBarHiddenCounter __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarHiddenCounter);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_MiniHPBarHiddenCounter GetDefaultedMiniHPBarHiddenCounter_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MiniHPBarHiddenCounter::GetDefaultedMiniHPBarHiddenCounter(Entity);
}
UFUNCTION()
bool RemoveMiniHPBarHiddenCounter(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MiniHPBarHiddenCounter);
}
}
FECSMonitorRuntimeView __GetMonitorMiniHPBarHiddenCounterOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MiniHPBarHiddenCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMiniHPBarHiddenCounterOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MiniHPBarHiddenCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMiniHPBarHiddenCounterOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MiniHPBarHiddenCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMiniHPBarHiddenCounterOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MiniHPBarHiddenCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMiniHPBarHiddenCounterOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MiniHPBarHiddenCounter, bFixedFrame, bMustHandleAll);
}
void __MonitorMiniHPBarHiddenCounterLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MiniHPBarHiddenCounter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMiniHPBarHiddenCounterActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MiniHPBarHiddenCounter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMiniHPBarHiddenCounterModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MiniHPBarHiddenCounter, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ExecuteInfo
{
UFUNCTION()
bool HasExecuteInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ExecuteInfo);
}
FC_ExecuteInfo& AssignExecuteInfo(const FECSEntity &inout Entity, const FC_ExecuteInfo &inout DefaultValue = FC_ExecuteInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ExecuteInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignExecuteInfo_BP(const FECSEntity &inout Entity, const FC_ExecuteInfo &inout DefaultValue = FC_ExecuteInfo())
{
    ECSFunc_FC_ExecuteInfo::AssignExecuteInfo(Entity, DefaultValue);
    return;
}
FC_ExecuteInfo& ModifyExecuteInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ExecuteInfo));
    return local_12.GetComp();
}
FC_ExecuteInfo& ModifyOrAddExecuteInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ExecuteInfo));
    return local_12.GetComp();
}
const FC_ExecuteInfo& GetExecuteInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ExecuteInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_ExecuteInfo GetExecuteInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ExecuteInfo& local_4 = ECSFunc_FC_ExecuteInfo::GetExecuteInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ExecuteInfo();
}
const FC_ExecuteInfo GetDefaultedExecuteInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ExecuteInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ExecuteInfo);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_ExecuteInfo GetDefaultedExecuteInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ExecuteInfo::GetDefaultedExecuteInfo(Entity);
}
UFUNCTION()
bool RemoveExecuteInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ExecuteInfo);
}
}
FECSMonitorRuntimeView __GetMonitorExecuteInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ExecuteInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecuteInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ExecuteInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecuteInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ExecuteInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecuteInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ExecuteInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecuteInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ExecuteInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorExecuteInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ExecuteInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorExecuteInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ExecuteInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorExecuteInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ExecuteInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ExecutedInfo
{
UFUNCTION()
bool HasExecutedInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ExecutedInfo);
}
FC_ExecutedInfo& AssignExecutedInfo(const FECSEntity &inout Entity, const FC_ExecutedInfo &inout DefaultValue = FC_ExecutedInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ExecutedInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignExecutedInfo_BP(const FECSEntity &inout Entity, const FC_ExecutedInfo &inout DefaultValue = FC_ExecutedInfo())
{
    ECSFunc_FC_ExecutedInfo::AssignExecutedInfo(Entity, DefaultValue);
    return;
}
FC_ExecutedInfo& ModifyExecutedInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ExecutedInfo));
    return local_12.GetComp();
}
FC_ExecutedInfo& ModifyOrAddExecutedInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ExecutedInfo));
    return local_12.GetComp();
}
const FC_ExecutedInfo& GetExecutedInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ExecutedInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_ExecutedInfo GetExecutedInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ExecutedInfo& local_4 = ECSFunc_FC_ExecutedInfo::GetExecutedInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ExecutedInfo();
}
const FC_ExecutedInfo GetDefaultedExecutedInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ExecutedInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ExecutedInfo);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_ExecutedInfo GetDefaultedExecutedInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ExecutedInfo::GetDefaultedExecutedInfo(Entity);
}
UFUNCTION()
bool RemoveExecutedInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ExecutedInfo);
}
}
FECSMonitorRuntimeView __GetMonitorExecutedInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ExecutedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecutedInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ExecutedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecutedInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ExecutedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecutedInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ExecutedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecutedInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ExecutedInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorExecutedInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ExecutedInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorExecutedInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ExecutedInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorExecutedInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ExecutedInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ExecutedConfig
{
UFUNCTION()
bool HasExecutedConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ExecutedConfig);
}
FC_ExecutedConfig& AssignExecutedConfig(const FECSEntity &inout Entity, const FC_ExecutedConfig &inout DefaultValue = FC_ExecutedConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ExecutedConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignExecutedConfig_BP(const FECSEntity &inout Entity, const FC_ExecutedConfig &inout DefaultValue = FC_ExecutedConfig())
{
    ECSFunc_FC_ExecutedConfig::AssignExecutedConfig(Entity, DefaultValue);
    return;
}
FC_ExecutedConfig& ModifyExecutedConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ExecutedConfig));
    return local_12.GetComp();
}
FC_ExecutedConfig& ModifyOrAddExecutedConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ExecutedConfig));
    return local_12.GetComp();
}
const FC_ExecutedConfig& GetExecutedConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ExecutedConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ExecutedConfig GetExecutedConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ExecutedConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_ExecutedConfig::GetExecutedConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ExecutedConfig GetDefaultedExecutedConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ExecutedConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ExecutedConfig);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_ExecutedConfig GetDefaultedExecutedConfig_BP(const FECSEntity &inout Entity)
{
    FC_ExecutedConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveExecutedConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ExecutedConfig);
}
}
FECSMonitorRuntimeView __GetMonitorExecutedConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ExecutedConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecutedConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ExecutedConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecutedConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ExecutedConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecutedConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ExecutedConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecutedConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ExecutedConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorExecutedConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ExecutedConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorExecutedConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ExecutedConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorExecutedConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ExecutedConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_WaitPlayerReadyForExecutionTag
{
UFUNCTION()
bool HasWaitPlayerReadyForExecutionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_WaitPlayerReadyForExecutionTag);
}
FC_WaitPlayerReadyForExecutionTag& AssignWaitPlayerReadyForExecutionTag(const FECSEntity &inout Entity, const FC_WaitPlayerReadyForExecutionTag &inout DefaultValue = FC_WaitPlayerReadyForExecutionTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_WaitPlayerReadyForExecutionTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignWaitPlayerReadyForExecutionTag_BP(const FECSEntity &inout Entity, const FC_WaitPlayerReadyForExecutionTag &inout DefaultValue = FC_WaitPlayerReadyForExecutionTag())
{
    ECSFunc_FC_WaitPlayerReadyForExecutionTag::AssignWaitPlayerReadyForExecutionTag(Entity, DefaultValue);
    return;
}
FC_WaitPlayerReadyForExecutionTag& ModifyWaitPlayerReadyForExecutionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_WaitPlayerReadyForExecutionTag));
    return local_12.GetComp();
}
FC_WaitPlayerReadyForExecutionTag& ModifyOrAddWaitPlayerReadyForExecutionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_WaitPlayerReadyForExecutionTag));
    return local_12.GetComp();
}
const FC_WaitPlayerReadyForExecutionTag& GetWaitPlayerReadyForExecutionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_WaitPlayerReadyForExecutionTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_WaitPlayerReadyForExecutionTag GetWaitPlayerReadyForExecutionTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_WaitPlayerReadyForExecutionTag& local_4 = ECSFunc_FC_WaitPlayerReadyForExecutionTag::GetWaitPlayerReadyForExecutionTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_WaitPlayerReadyForExecutionTag();
}
const FC_WaitPlayerReadyForExecutionTag GetDefaultedWaitPlayerReadyForExecutionTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_WaitPlayerReadyForExecutionTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_WaitPlayerReadyForExecutionTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_WaitPlayerReadyForExecutionTag GetDefaultedWaitPlayerReadyForExecutionTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_WaitPlayerReadyForExecutionTag::GetDefaultedWaitPlayerReadyForExecutionTag(Entity);
}
UFUNCTION()
bool RemoveWaitPlayerReadyForExecutionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_WaitPlayerReadyForExecutionTag);
}
}
FECSMonitorRuntimeView __GetMonitorWaitPlayerReadyForExecutionTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_WaitPlayerReadyForExecutionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWaitPlayerReadyForExecutionTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_WaitPlayerReadyForExecutionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWaitPlayerReadyForExecutionTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_WaitPlayerReadyForExecutionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWaitPlayerReadyForExecutionTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_WaitPlayerReadyForExecutionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWaitPlayerReadyForExecutionTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_WaitPlayerReadyForExecutionTag, bFixedFrame, bMustHandleAll);
}
void __MonitorWaitPlayerReadyForExecutionTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_WaitPlayerReadyForExecutionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWaitPlayerReadyForExecutionTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_WaitPlayerReadyForExecutionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWaitPlayerReadyForExecutionTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_WaitPlayerReadyForExecutionTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ExecutionPresentationInfo
{
UFUNCTION()
bool HasExecutionPresentationInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ExecutionPresentationInfo);
}
FC_ExecutionPresentationInfo& AssignExecutionPresentationInfo(const FECSEntity &inout Entity, const FC_ExecutionPresentationInfo &inout DefaultValue = FC_ExecutionPresentationInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ExecutionPresentationInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignExecutionPresentationInfo_BP(const FECSEntity &inout Entity, const FC_ExecutionPresentationInfo &inout DefaultValue = FC_ExecutionPresentationInfo())
{
    ECSFunc_FC_ExecutionPresentationInfo::AssignExecutionPresentationInfo(Entity, DefaultValue);
    return;
}
FC_ExecutionPresentationInfo& ModifyExecutionPresentationInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ExecutionPresentationInfo));
    return local_12.GetComp();
}
FC_ExecutionPresentationInfo& ModifyOrAddExecutionPresentationInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ExecutionPresentationInfo));
    return local_12.GetComp();
}
const FC_ExecutionPresentationInfo& GetExecutionPresentationInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ExecutionPresentationInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_ExecutionPresentationInfo GetExecutionPresentationInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ExecutionPresentationInfo& local_4 = ECSFunc_FC_ExecutionPresentationInfo::GetExecutionPresentationInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ExecutionPresentationInfo();
}
const FC_ExecutionPresentationInfo GetDefaultedExecutionPresentationInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ExecutionPresentationInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ExecutionPresentationInfo);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_ExecutionPresentationInfo GetDefaultedExecutionPresentationInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ExecutionPresentationInfo::GetDefaultedExecutionPresentationInfo(Entity);
}
UFUNCTION()
bool RemoveExecutionPresentationInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ExecutionPresentationInfo);
}
}
FECSMonitorRuntimeView __GetMonitorExecutionPresentationInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ExecutionPresentationInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecutionPresentationInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ExecutionPresentationInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecutionPresentationInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ExecutionPresentationInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecutionPresentationInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ExecutionPresentationInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorExecutionPresentationInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ExecutionPresentationInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorExecutionPresentationInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ExecutionPresentationInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorExecutionPresentationInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ExecutionPresentationInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorExecutionPresentationInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ExecutionPresentationInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TeammateRescuedInfo
{
UFUNCTION()
bool HasTeammateRescuedInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TeammateRescuedInfo);
}
FC_TeammateRescuedInfo& AssignTeammateRescuedInfo(const FECSEntity &inout Entity, const FC_TeammateRescuedInfo &inout DefaultValue = FC_TeammateRescuedInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TeammateRescuedInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTeammateRescuedInfo_BP(const FECSEntity &inout Entity, const FC_TeammateRescuedInfo &inout DefaultValue = FC_TeammateRescuedInfo())
{
    ECSFunc_FC_TeammateRescuedInfo::AssignTeammateRescuedInfo(Entity, DefaultValue);
    return;
}
FC_TeammateRescuedInfo& ModifyTeammateRescuedInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TeammateRescuedInfo));
    return local_12.GetComp();
}
FC_TeammateRescuedInfo& ModifyOrAddTeammateRescuedInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TeammateRescuedInfo));
    return local_12.GetComp();
}
const FC_TeammateRescuedInfo& GetTeammateRescuedInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TeammateRescuedInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_TeammateRescuedInfo GetTeammateRescuedInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TeammateRescuedInfo& local_4 = ECSFunc_FC_TeammateRescuedInfo::GetTeammateRescuedInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TeammateRescuedInfo();
}
const FC_TeammateRescuedInfo GetDefaultedTeammateRescuedInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TeammateRescuedInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TeammateRescuedInfo);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_TeammateRescuedInfo GetDefaultedTeammateRescuedInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TeammateRescuedInfo::GetDefaultedTeammateRescuedInfo(Entity);
}
UFUNCTION()
bool RemoveTeammateRescuedInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TeammateRescuedInfo);
}
}
FECSMonitorRuntimeView __GetMonitorTeammateRescuedInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TeammateRescuedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeammateRescuedInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TeammateRescuedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeammateRescuedInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TeammateRescuedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeammateRescuedInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TeammateRescuedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeammateRescuedInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TeammateRescuedInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorTeammateRescuedInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TeammateRescuedInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeammateRescuedInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TeammateRescuedInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeammateRescuedInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TeammateRescuedInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_StrikeFreezeAttenuation
{
UFUNCTION()
bool HasStrikeFreezeAttenuation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_StrikeFreezeAttenuation);
}
FC_StrikeFreezeAttenuation& AssignStrikeFreezeAttenuation(const FECSEntity &inout Entity, const FC_StrikeFreezeAttenuation &inout DefaultValue = FC_StrikeFreezeAttenuation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_StrikeFreezeAttenuation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignStrikeFreezeAttenuation_BP(const FECSEntity &inout Entity, const FC_StrikeFreezeAttenuation &inout DefaultValue = FC_StrikeFreezeAttenuation())
{
    ECSFunc_FC_StrikeFreezeAttenuation::AssignStrikeFreezeAttenuation(Entity, DefaultValue);
    return;
}
FC_StrikeFreezeAttenuation& ModifyStrikeFreezeAttenuation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_StrikeFreezeAttenuation));
    return local_12.GetComp();
}
FC_StrikeFreezeAttenuation& ModifyOrAddStrikeFreezeAttenuation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_StrikeFreezeAttenuation));
    return local_12.GetComp();
}
const FC_StrikeFreezeAttenuation& GetStrikeFreezeAttenuation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_StrikeFreezeAttenuation));
    return local_12.GetComp();
}
UFUNCTION()
FC_StrikeFreezeAttenuation GetStrikeFreezeAttenuation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_StrikeFreezeAttenuation& local_4 = ECSFunc_FC_StrikeFreezeAttenuation::GetStrikeFreezeAttenuation(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_StrikeFreezeAttenuation();
}
const FC_StrikeFreezeAttenuation GetDefaultedStrikeFreezeAttenuation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_StrikeFreezeAttenuation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_StrikeFreezeAttenuation);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_StrikeFreezeAttenuation GetDefaultedStrikeFreezeAttenuation_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_StrikeFreezeAttenuation::GetDefaultedStrikeFreezeAttenuation(Entity);
}
UFUNCTION()
bool RemoveStrikeFreezeAttenuation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_StrikeFreezeAttenuation);
}
}
FECSMonitorRuntimeView __GetMonitorStrikeFreezeAttenuationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_StrikeFreezeAttenuation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStrikeFreezeAttenuationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_StrikeFreezeAttenuation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStrikeFreezeAttenuationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_StrikeFreezeAttenuation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStrikeFreezeAttenuationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_StrikeFreezeAttenuation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStrikeFreezeAttenuationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_StrikeFreezeAttenuation, bFixedFrame, bMustHandleAll);
}
void __MonitorStrikeFreezeAttenuationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_StrikeFreezeAttenuation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorStrikeFreezeAttenuationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_StrikeFreezeAttenuation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorStrikeFreezeAttenuationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_StrikeFreezeAttenuation, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CacheHitPresentationDatas
{
UFUNCTION()
bool HasCacheHitPresentationDatas(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CacheHitPresentationDatas);
}
FC_CacheHitPresentationDatas& AssignCacheHitPresentationDatas(const FECSEntity &inout Entity, const FC_CacheHitPresentationDatas &inout DefaultValue = FC_CacheHitPresentationDatas())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CacheHitPresentationDatas, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCacheHitPresentationDatas_BP(const FECSEntity &inout Entity, const FC_CacheHitPresentationDatas &inout DefaultValue = FC_CacheHitPresentationDatas())
{
    ECSFunc_FC_CacheHitPresentationDatas::AssignCacheHitPresentationDatas(Entity, DefaultValue);
    return;
}
FC_CacheHitPresentationDatas& ModifyCacheHitPresentationDatas(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CacheHitPresentationDatas));
    return local_12.GetComp();
}
FC_CacheHitPresentationDatas& ModifyOrAddCacheHitPresentationDatas(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CacheHitPresentationDatas));
    return local_12.GetComp();
}
const FC_CacheHitPresentationDatas& GetCacheHitPresentationDatas(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CacheHitPresentationDatas));
    return local_12.GetComp();
}
UFUNCTION()
FC_CacheHitPresentationDatas GetCacheHitPresentationDatas_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CacheHitPresentationDatas __r;
    bValid = false;
    bValid = ECSFunc_FC_CacheHitPresentationDatas::GetCacheHitPresentationDatas(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CacheHitPresentationDatas GetDefaultedCacheHitPresentationDatas(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CacheHitPresentationDatas __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CacheHitPresentationDatas);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_CacheHitPresentationDatas GetDefaultedCacheHitPresentationDatas_BP(const FECSEntity &inout Entity)
{
    FC_CacheHitPresentationDatas __r;
    return __r;
}
UFUNCTION()
bool RemoveCacheHitPresentationDatas(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CacheHitPresentationDatas);
}
}
FECSMonitorRuntimeView __GetMonitorCacheHitPresentationDatasOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CacheHitPresentationDatas, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCacheHitPresentationDatasOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CacheHitPresentationDatas, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCacheHitPresentationDatasOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CacheHitPresentationDatas, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCacheHitPresentationDatasOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CacheHitPresentationDatas, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCacheHitPresentationDatasOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CacheHitPresentationDatas, bFixedFrame, bMustHandleAll);
}
void __MonitorCacheHitPresentationDatasLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CacheHitPresentationDatas, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCacheHitPresentationDatasActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CacheHitPresentationDatas, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCacheHitPresentationDatasModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CacheHitPresentationDatas, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_BossLowHPList
{
UFUNCTION()
bool HasBossLowHPList(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_BossLowHPList);
}
FCS_BossLowHPList& AssignBossLowHPList(const FECSWorldPtr &inout World, const FCS_BossLowHPList &inout DefaultValue = FCS_BossLowHPList())
{
    UScriptStruct local_6 = FCS_BossLowHPList;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignBossLowHPList_BP(const FECSWorldPtr &inout World, const FCS_BossLowHPList &inout DefaultValue = FCS_BossLowHPList())
{
    ECSFunc_FCS_BossLowHPList::AssignBossLowHPList(World, DefaultValue);
    return;
}
FCS_BossLowHPList& ModifyBossLowHPList(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BossLowHPList;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_BossLowHPList& ModifyOrAddBossLowHPList(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BossLowHPList;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_BossLowHPList& GetBossLowHPList(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BossLowHPList;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_BossLowHPList GetBossLowHPList_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_BossLowHPList& local_4 = ECSFunc_FCS_BossLowHPList::GetBossLowHPList(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_BossLowHPList();
}
const FCS_BossLowHPList GetDefaultedBossLowHPList(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_BossLowHPList __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_BossLowHPList);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_BossLowHPList GetDefaultedBossLowHPList_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_BossLowHPList::GetDefaultedBossLowHPList(World);
}
UFUNCTION()
bool RemoveBossLowHPList(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_BossLowHPList);
}
}
void __MonitorBossLowHPListLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_BossLowHPList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBossLowHPListActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_BossLowHPList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBossLowHPListModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_BossLowHPList, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BossLowHPTag
{
UFUNCTION()
bool HasBossLowHPTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BossLowHPTag);
}
FC_BossLowHPTag& AssignBossLowHPTag(const FECSEntity &inout Entity, const FC_BossLowHPTag &inout DefaultValue = FC_BossLowHPTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BossLowHPTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBossLowHPTag_BP(const FECSEntity &inout Entity, const FC_BossLowHPTag &inout DefaultValue = FC_BossLowHPTag())
{
    ECSFunc_FC_BossLowHPTag::AssignBossLowHPTag(Entity, DefaultValue);
    return;
}
FC_BossLowHPTag& ModifyBossLowHPTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BossLowHPTag));
    return local_12.GetComp();
}
FC_BossLowHPTag& ModifyOrAddBossLowHPTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BossLowHPTag));
    return local_12.GetComp();
}
const FC_BossLowHPTag& GetBossLowHPTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BossLowHPTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_BossLowHPTag GetBossLowHPTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BossLowHPTag& local_4 = ECSFunc_FC_BossLowHPTag::GetBossLowHPTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BossLowHPTag();
}
const FC_BossLowHPTag GetDefaultedBossLowHPTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BossLowHPTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BossLowHPTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_BossLowHPTag GetDefaultedBossLowHPTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BossLowHPTag::GetDefaultedBossLowHPTag(Entity);
}
UFUNCTION()
bool RemoveBossLowHPTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BossLowHPTag);
}
}
FECSMonitorRuntimeView __GetMonitorBossLowHPTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BossLowHPTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBossLowHPTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BossLowHPTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBossLowHPTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BossLowHPTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBossLowHPTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BossLowHPTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBossLowHPTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BossLowHPTag, bFixedFrame, bMustHandleAll);
}
void __MonitorBossLowHPTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BossLowHPTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBossLowHPTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BossLowHPTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBossLowHPTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BossLowHPTag, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_ExecuteInfo_ExecutePreType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().GetExecutePreType()) != 0);
    return;
}
void GetEntityBBVar_TeammateRescuedInfo_RescuerLocation(const FECSEntity &inout Entity, FVector &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector(local_4.opCall().GetRescuerLocation());
    return;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FAbnormalState &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FAbnormalState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAbnormalState
{
int __IndexOf_AbnormalStateType()
{
    return 0;
}
int __IndexOf_ActiveState()
{
    return 1;
}
int __IndexOf_BuffConfig()
{
    return 2;
}
int __IndexOf_WeaknessBuffConfig()
{
    return 3;
}
int __IndexOf_Attacker()
{
    return 4;
}
int __IndexOf_EndTime()
{
    return 5;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AbnormalState &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AbnormalState &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AbnormalState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AbnormalState
{
int __IndexOf_AbnormalStates()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_BeRemovedAbnormalStates &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_BeRemovedAbnormalStates &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_BeRemovedAbnormalStates &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_BeRemovedAbnormalStates
{
int __IndexOf_ToBeRemovedAbnormalStates()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MiniHPBarHiddenCounter &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MiniHPBarHiddenCounter &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MiniHPBarHiddenCounter &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MiniHPBarHiddenCounter
{
int __IndexOf_Counter()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ExecuteInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ExecuteInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ExecuteInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ExecuteInfo
{
int __IndexOf_ExecutePreType()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_ExecutedInfo &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_ExecutedInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ExecutedInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ExecutedInfo
{
int __IndexOf_ExecutionState()
{
    return 0;
}
int __IndexOf_bQTESuccess()
{
    return 1;
}
int __IndexOf_CurrentMaxPlayerNum()
{
    return 2;
}
int __IndexOf_ExecuteEntityArray()
{
    return 3;
}
int __IndexOf_AddBuffEntityArray()
{
    return 4;
}
int __IndexOf_ExecuteTeamEntity()
{
    return 5;
}
int __IndexOf_LastAddPlayerTime()
{
    return 6;
}
int __IndexOf_ChaosKnotFXEntity()
{
    return 7;
}
int __IndexOf_CanRecoverFromExecutedTime()
{
    return 8;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_TeammateRescuedInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_TeammateRescuedInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TeammateRescuedInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TeammateRescuedInfo
{
int __IndexOf_Rescuer()
{
    return 0;
}
int __IndexOf_RescuerLocation()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_StrikeFreezeAttenuation &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_StrikeFreezeAttenuation &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_StrikeFreezeAttenuation &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_StrikeFreezeAttenuation
{
int __IndexOf_StrikeHitCounter()
{
    return 0;
}
int __IndexOf_StrikeInvokeCounter()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_BossLowHPList &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_BossLowHPList &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_BossLowHPList &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_BossLowHPList
{
int __IndexOf_BossLowHPList()
{
    return 0;
}
}
