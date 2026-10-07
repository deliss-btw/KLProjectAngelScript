

struct FSimpleModelEvent : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FSimpleModelEvent()
    {
        FEUIModelEvent local_22 = FEUIModelEvent("", "");
        return;
    }
    void Broadcast() const
    {
        Z__CastTemplate local_4;
        local_4.opCall().Broadcast();
        return;
    }
}

