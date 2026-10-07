

// NOTE: class defaults are not authored in this module: FPlayerShopStateCondition (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FPlayerShopStateCondition : FDialogueConditionBase
{
    FDialogueConditionBase _base_FDialogueConditionBase;
    UPROPERTY()
    TDataObjectPtr<FShopConfig> ShopConfig;
    UPROPERTY()
    bool bIsUnlocked;

    FPlayerShopStateCondition()
    {
        this.bIsUnlocked = false;
        this.__InitDefaults();
        return;
    }
    bool CheckCondition_Implementation(const FECSEntity &inout DialogueContextEntity, const FECSEntity &inout InteractTarget)
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            return true;
        }
        if (::FASCommonUtils::GetLocalPlayerController() != nullptr)
        {
            bool local_10;
            bool local_1_2 = ::UScriptAsToCppModelFunctionRouter::Get().OnIsShopUnlocked.Execute(this.ShopConfig);
            local_10 = !(local_1_2);
            local_10 = (local_10 == !(this.bIsUnlocked));
            return local_10;
        }
        XWarning(ELog(64), FString().Append("Failed to check player shop state, local player controller is not found"));
        return false;
    }
}

struct FSystemControlCondition : FDialogueConditionBase
{
    FDialogueConditionBase _base_FDialogueConditionBase;
    UPROPERTY()
    TDataObjectPtr<FSystemControlConfig> SystemControlConfig;
    UPROPERTY()
    bool bExpectUnlocked;

    FSystemControlCondition()
    {
        this.bExpectUnlocked = true;
        this.__InitDefaults();
        return;
    }
    bool CheckCondition_Implementation(const FECSEntity &inout DialogueContextEntity, const FECSEntity &inout InteractTarget)
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            return true;
        }
        if (::FASCommonUtils::GetLocalPlayerController() != nullptr)
        {
            FAsToCpp_IsSystemUnlockedDelegate local_12 = FAsToCpp_IsSystemUnlockedDelegate(::UScriptAsToCppModelFunctionRouter::Get().OnIsSystemUnlock);
            if (local_12.IsBound())
            {
                bool local_13;
                bool local_14 = local_12.Execute(this.SystemControlConfig, false);
                local_13 = !(local_14);
                local_13 = (local_13 == !(this.bExpectUnlocked));
                return local_13;
            }
        }
        else
        {
            XWarning(ELog(64), FString().Append("Failed to check system control, local player controller is not found"));
        }
        return false;
    }
}

struct FInteractTargetEBBCondition : FDialogueConditionBase
{
    FDialogueConditionBase _base_FDialogueConditionBase;
    UPROPERTY()
    FString BBKey;
    UPROPERTY()
    bool bExpectTrue;

    FInteractTargetEBBCondition()
    {
        this.bExpectTrue = true;
        this.__InitDefaults();
        return;
    }
    bool CheckCondition_Implementation(const FECSEntity &inout DialogueContextEntity, const FECSEntity &inout InteractTarget)
    {
        if (!(InteractTarget.IsValid()))
        {
            XWarning(ELog(64), FString().Append("InteractTargetEBBCondition: InteractTarget is invalid"));
            return false;
        }
        FName local_11 = FName(this.BBKey);
        if (!(InteractTarget.HasEntityBB(local_11.opImplConv())))
        {
            return !(this.bExpectTrue);
        }
        bool local_23 = (!(InteractTarget.GetBB_Bool(local_11.opImplConv())) == !(this.bExpectTrue));
        return local_23;
    }
}

