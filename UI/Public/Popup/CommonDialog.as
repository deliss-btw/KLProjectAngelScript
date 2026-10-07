
enum ECommonDialogAnswerType
{
    Ignored,
    Confirm,
    Reject,
    UnsaveQuit,
    SaveQuit,
}


struct FCommonDialogAnswer
{
    UPROPERTY()
    ECommonDialogAnswerType AnswerType;
    UPROPERTY()
    int OptionIndex;


}

