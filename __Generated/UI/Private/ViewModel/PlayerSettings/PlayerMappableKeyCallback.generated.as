struct FPlayerMappableKeyCallback : FEUIModelDelegate
{
    FEUIModelDelegate _base_FEUIModelDelegate = FEUIModelDelegate("bool", "FKey");

    FPlayerMappableKeyCallback()
    {
        return;
    }
    bool Execute(const FKey &inout Arg0) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().Execute(Arg0);
    }
    bool ExecuteIfBound(const FKey &inout Arg0, bool &inout OutResult) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().ExecuteIfBound(Arg0, OutResult);
    }
}

