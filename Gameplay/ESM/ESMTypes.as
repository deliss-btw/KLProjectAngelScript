
enum EESMActionTargetType
{
    Self,
    InteractTarget,
    LockTarget,
    BBValue,
}

namespace ESMActionColor
{
    const FLinearColor Combat = FLinearColor();
    const FLinearColor Movement = FLinearColor();
    const FLinearColor Mark = FLinearColor();
    const FLinearColor Effect = FLinearColor();
    const FLinearColor Camera = FLinearColor();

UFUNCTION()
FLinearColor ESMActionColor_Combat()
{
    return ESMActionColor::Combat;
}
UFUNCTION()
FLinearColor ESMActionColor_Movement()
{
    return ESMActionColor::Movement;
}
UFUNCTION()
FLinearColor ESMActionColor_Mark()
{
    return ESMActionColor::Mark;
}
}
