struct FSimpleModelEvent : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent = FEUIModelEvent("", "");

    FSimpleModelEvent()
    {
        return;
    }
    void Broadcast() const
    {
        Z__CastTemplate local_4;
        local_4.opCall().Broadcast();
        return;
    }
}

