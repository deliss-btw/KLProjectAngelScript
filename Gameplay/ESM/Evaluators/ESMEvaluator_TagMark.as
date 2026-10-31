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

