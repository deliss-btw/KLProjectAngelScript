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
        TEUIModelRef<FM_ModeMatchConfirm> local_2 = TEUIModelRef<FM_ModeMatchConfirm>(Business);
        if (!(local_2.IsValid()))
        {
            return FEUIModelContainer();
        }
        return FEUIModelContainer(::FVM_PVX_MatchConfirmContent::Create(Context.Manager, local_2));
    }
}

