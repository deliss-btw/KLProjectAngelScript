
enum EMessageHintIconSource
{
    DirectSet,
    FromTextArgument,
}


struct FMessageHintIcon
{
    UPROPERTY()
    EMessageHintIconSource Source;
    UPROPERTY()
    FSoftBrush IconBrush;
    UPROPERTY()
    int ArgPosition;


}

struct FShowMessageHintParams
{
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> m_Config;
    UPROPERTY()
    TArray<FTextArgument> m_Arguments;

    FShowMessageHintParams()
    {
        return;
    }
    FString ToString() const
    {
        TArray<FString> local_4;
        for (auto& local_20 : this.GetArguments())
        {
            local_4.Add(local_20.ToString());
        }
        if (local_4.IsEmpty())
        {
            return this.GetConfig().ToString();
        }
        return FString().Append(this.GetConfig().ToString()).Append(" with args ").Append(FString::Join(local_4, ", "));
    }
    TDataObjectPtr<FMessageHintConfig> GetConfig() const property
    {
        TDataObjectPtr<FMessageHintConfig> __r;
        return __r;
    }
    TDataObjectPtr<FMessageHintConfig> GetConfig() property
    {
        TDataObjectPtr<FMessageHintConfig> __r;
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FMessageHintConfig> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const TArray<FTextArgument> GetArguments() const property
    {
        const TArray<FTextArgument> __r;
        return __r;
    }
    TArray<FTextArgument> GetArguments() property
    {
        TArray<FTextArgument> __r;
        return __r;
    }
    void SetArguments(const TArray<FTextArgument> &inout __Value) property
    {
        this.m_Arguments = __Value;
        return;
    }
}

UCLASS(Abstract)
class UMessageHintHandler : UObject
{
    UMessageHintHandler()
    {
        return;
    }
    void ShowMessageHint(const FShowMessageHintParams &inout Params) const
    {
        FString local_6 = this.GetClass().GetName();
        return;
    }
}

class UMessageHintSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<FGameplayTag, UMessageHintHandler> Handlers;

    UMessageHintSettings()
    {
        return;
    }
}

