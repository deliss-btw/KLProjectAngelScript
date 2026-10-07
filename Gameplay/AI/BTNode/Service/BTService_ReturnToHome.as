

// NOTE: class defaults are not authored in this module: FAICommand_ReturnToHome (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FAICommand_ReturnToHomeData
{
    UPROPERTY()
    FVector HomeLocation;

    FAICommand_ReturnToHomeData()
    {
        return;
    }
}

struct FAICommand_ReturnToHome : FAICommandScript
{
    FAICommandScript _base_FAICommandScript;

    FAICommand_ReturnToHome()
    {
        this.__InitDefaults();
        return;
    }
    const UScriptStruct GetInstanceDataType_Implementation() const
    {
        UScriptStruct local_2 = FAICommand_ReturnToHomeData;
        return local_2;
    }
    FAICommand_ReturnToHomeData GetInstanceData(const FAICommandParams &inout Params) const
    {
        FAICommand_ReturnToHomeData __r;
        return __r;
    }
    void Execute_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        ::FAIQuitCombatUtils::BeginReturnToHome(Params.GetPawnProxy());
        return;
    }
    void Finish_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        ::FAIQuitCombatUtils::EndReturnToHome(Params.GetPawnProxy());
        return;
    }
}

class UBTService_ReturnToHome : UBTService_AICommandScript
{
    UPROPERTY()
    FAISmart_Vector HomeLocation = FAISmart_Vector(n"HomeLocation", EAISmartValue(0));
    UPROPERTY()
    FAICommand_ReturnToHome AICommand;

    UBTService_ReturnToHome()
    {
        return;
    }
    UFUNCTION()
    void OnInitCommandInstanceData_Implementation(const FAICommandInstanceDataInitContextPtr &inout Context) const
    {
        GetInstanceData local_4 = FAICommandInstanceDataInitContextPtr::GetInstanceData(Context);
        0.HomeLocation = this.HomeLocation.GetValue(Context.GetOwnerContext());
        return;
    }
}

