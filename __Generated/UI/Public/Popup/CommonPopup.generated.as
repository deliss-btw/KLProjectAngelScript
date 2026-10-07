

struct FDialogModelCallback : FEUIModelDelegate
{
    FEUIModelDelegate _base_FEUIModelDelegate;

    FDialogModelCallback()
    {
        FEUIModelDelegate local_26 = FEUIModelDelegate("bool", "FCommonDialogAnswer");
        return;
    }
    bool Execute(const FCommonDialogAnswer &inout Arg0) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().Execute(Arg0);
    }
    bool ExecuteIfBound(const FCommonDialogAnswer &inout Arg0, bool &inout OutResult) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().ExecuteIfBound(Arg0, OutResult);
    }
}

