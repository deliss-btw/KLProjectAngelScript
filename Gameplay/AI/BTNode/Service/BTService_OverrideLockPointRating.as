

// NOTE: class defaults are not authored in this module: FAICommand_OverrideLockPointRating (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FAICommand_OverrideLockPointRatingData
{
    UPROPERTY()
    TDataObjectPtr<FAILockPointRatingConfig> RatingConfig;

    FAICommand_OverrideLockPointRatingData()
    {
        return;
    }
}

struct FAICommand_OverrideLockPointRating : FAICommandScript
{
    FAICommandScript _base_FAICommandScript;

    FAICommand_OverrideLockPointRating()
    {
        this.__InitDefaults();
        return;
    }
    const UScriptStruct GetInstanceDataType_Implementation() const
    {
        UScriptStruct local_2 = FAICommand_OverrideLockPointRatingData;
        return local_2;
    }
    FAICommand_OverrideLockPointRatingData GetInstanceData(const FAICommandParams &inout Params) const
    {
        FAICommand_OverrideLockPointRatingData __r;
        return __r;
    }
    void Execute_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        FAICommand_OverrideLockPointRatingData local_2;
        ::FLockTargetUtils::PushLockPointRatingOverride(Params.GetPawnProxy(), local_2.RatingConfig);
        return;
    }
    void Finish_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        ::FLockTargetUtils::PopLockPointRatingOverride(Params.GetPawnProxy());
        return;
    }
}

class UBTService_OverrideLockPointRating : UBTService_AICommandScript
{
    UPROPERTY()
    TDataObjectPtr<FAILockPointRatingConfig> LockPointRatingConfig;
    UPROPERTY()
    FAICommand_OverrideLockPointRating AICommand;

    UBTService_OverrideLockPointRating()
    {
        return;
    }
    UFUNCTION()
    void OnInitCommandInstanceData_Implementation(const FAICommandInstanceDataInitContextPtr &inout Context) const
    {
        GetInstanceData local_4 = FAICommandInstanceDataInitContextPtr::GetInstanceData(Context);
        0.RatingConfig = this.LockPointRatingConfig;
        return;
    }
}

