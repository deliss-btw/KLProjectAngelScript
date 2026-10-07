

class UPvxMatchContentAdapter : UModeMatchContentAdapterBase
{
    default MatchMode = 1;

    UPvxMatchContentAdapter()
    {
        super();
        return;
    }
    FEUIModelContainer MakeViewModels(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        if (!(TEUIModelRef<FM_ModeMatchConfirm>(Business).IsValid()))
        {
            return FEUIModelContainer();
        }
        return FEUIModelContainer();
    }
}

