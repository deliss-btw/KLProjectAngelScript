struct FMinimapActionCallback : FEUIModelDelegate
{
    FEUIModelDelegate _base_FEUIModelDelegate = FEUIModelDelegate("bool", "");

    FMinimapActionCallback()
    {
        return;
    }
    bool Execute() const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().Execute();
    }
    bool ExecuteIfBound(bool &inout OutResult) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().ExecuteIfBound(OutResult);
    }
}

