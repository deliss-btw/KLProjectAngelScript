
namespace FMS_Feedback
{
    const int ModelId = 0;

}
struct FMS_Feedback : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;

    FMS_Feedback()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_Feedback(const FMS_Feedback &inout Other)
    {
        return;
    }
    FMS_Feedback opAssign(const FMS_Feedback &inout Other)
    {
        FMS_Feedback __r;
        return __r;
    }
    void Feedback()
    {
        const UFeedbackSettings local_22;
        FString local_4;
        FString local_8 = "{token}";
        FString local_14 = ::UGameClientConnectionSubsystem::Get().GetCachedFeedbackToken();
        if (local_14.IsEmpty())
        {
            XWarning(ELog(16), "Feedback hyperlink skipped: invalid feedback token");
            return;
        }
        GetGameplaySettings<UFeedbackSettings> local_24;
        local_22 = local_24;
        if ((!((local_22 != nullptr))))
        {
            XWarning(ELog(16), "Feedback hyperlink skipped: failed to get UFeedbackSettings");
            return;
        }
        local_4 = local_22.FeedbackUrl;
        if (local_4.IsEmpty())
        {
            XWarning(ELog(16), "Feedback hyperlink skipped: href is empty");
            return;
        }
        if (!(local_4.Contains(local_8, ESearchCase(1), ESearchDir(0))))
        {
            XWarning(ELog(16), FString().Append("Feedback hyperlink skipped: href does not contain ").Append(local_8).Append(", href=").Append(local_4));
            return;
        }
        FString local_36 = local_4.Replace(local_8, FString().Append(local_14), ESearchCase(1));
        FString local_40;
        FPlatformProcess::LaunchURL(local_36, FString(), local_40);
        if (local_40.Len() > 0)
        {
            XWarning(ELog(16), FString().Append("Feedback hyperlink launch failed: ").Append(local_40).Append(", href(token masked)=").Append(local_4));
        }
        return;
    }
}

namespace FMS_Feedback
{
FMS_Feedback& Get(const UObject ContextObject)
{
    return FMS_Feedback::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_Feedback GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_Feedback __r;
    TEUIModelRef<FMS_Feedback> local_6 = TEUIModelRef<FMS_Feedback>(EUIInternal::MakeModelWithManager(Manager, FMS_Feedback::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_Feedback;
}
}
