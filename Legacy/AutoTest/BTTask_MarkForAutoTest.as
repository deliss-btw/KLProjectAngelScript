

class UBTTask_MarkForAutoTest : UBTTask_ECSScriptBase
{
    UPROPERTY()
    bool bFinishMark = false;

    default SetNodeName("Mark for AutoTest");


    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        if (!(::AutoTest::BTTaskUtils::GetBTTaskShouldStart()))
        {
            return EBTNodeResult(1);
        }
        ::AutoTest::BTTaskUtils::SetBTTaskFinishMark(this.bFinishMark);
        if (this.bFinishMark)
        {
            ::AutoTest::BTTaskUtils::SetBTTaskShouldStart(false);
        }
        return EBTNodeResult(0);
    }
}

