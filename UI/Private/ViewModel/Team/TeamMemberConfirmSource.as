

UCLASS(Abstract)
class UTeamMemberConfirmSourceBase : UObject
{
    UTeamMemberConfirmSourceBase()
    {
        return;
    }
    FText GetTitleName(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return FText();
    }
    float32 GetReplyTimeout(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return 0.0f;
    }
    TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> BuildMembers(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> local_4;
        return local_4;
    }
    void RefreshMembers(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business, const TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> &inout Members) const
    {
        return;
    }
    int GetReplyStatusIndex(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return 0;
    }
    FText GetReplyProgressText(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return FText();
    }
    FText GetWarningText(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return FText();
    }
    bool IsNoneReject(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return true;
    }
    TSoftClassPtr<UEUIUserWidget> GetContentWidgetClass(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return TSoftClassPtr<UEUIUserWidget>(nullptr);
    }
    FEUIModelContainer GetContentModel(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return FEUIModelContainer();
    }
    void OnAgree(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return;
    }
    void OnReject(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return;
    }
    void OnCancel(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return;
    }
    int GetCloseRequest(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return 0;
    }
    float32 GetCloseDelay(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return 0.0f;
    }
    void OnBeforeClose(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return;
    }
    void OnDestroy(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return;
    }
}

