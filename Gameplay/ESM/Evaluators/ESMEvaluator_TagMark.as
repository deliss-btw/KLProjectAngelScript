

// NOTE: class defaults are not authored in this module: UESMTagMarkEvaluatorBase (default scalar field UESMEvaluator.bConfigEditable has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

UCLASS(Abstract)
class UESMTagMarkEvaluatorBase : UESMTagMarkEvaluator
{
    UESMTagMarkEvaluatorBase()
    {
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FSystemUtils::GetClassDisplayName(this.GetClass());
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Mark;
    }
}

class UESMEvaluator_BanMove : UESMTagMarkEvaluatorBase
{
    UESMEvaluator_BanMove()
    {
        super();
        return;
    }
}

class UESMEvaluator_BanSkill : UESMTagMarkEvaluatorBase
{
    UESMEvaluator_BanSkill()
    {
        super();
        return;
    }
}

class UESMEvaluator_BanCancel : UESMTagMarkEvaluatorBase
{
    UESMEvaluator_BanCancel()
    {
        super();
        return;
    }
}

class UESMEvaluator_BanAim : UESMTagMarkEvaluatorBase
{
    UESMEvaluator_BanAim()
    {
        super();
        return;
    }
}

class UESMEvaluator_BanUpperSM : UESMTagMarkEvaluatorBase
{
    UESMEvaluator_BanUpperSM()
    {
        super();
        return;
    }
}

class UESMEvaluator_ForceWalk : UESMTagMarkEvaluatorBase
{
    UESMEvaluator_ForceWalk()
    {
        super();
        return;
    }
}

class UESMEvaluator_MotionFlag_Attack : UESMTagMarkEvaluatorBase
{
    UESMEvaluator_MotionFlag_Attack()
    {
        super();
        return;
    }
}

class UESMEvaluator_MuteCatch : UESMTagMarkEvaluatorBase
{
    UESMEvaluator_MuteCatch()
    {
        super();
        return;
    }
}

class UESMEvaluator_BanSwitchAvatar : UESMTagMarkEvaluatorBase
{
    UESMEvaluator_BanSwitchAvatar()
    {
        super();
        return;
    }
}

