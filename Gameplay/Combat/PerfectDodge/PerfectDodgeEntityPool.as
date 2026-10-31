class UPerfectDodgePoolMeta : UECSEntityPoolMeta
{
    UPerfectDodgePoolMeta()
    {
        return;
    }
    UFUNCTION()
    void Init_Implementation()
    {
        this.AddManagedTrait(FT_Hittable);
        this.AddManagedComponent(FC_PerfectDodge);
        this.AddManagedComponent(FC_PerfectDodgeDummyShapeRequest);
        this.AddManagedComponent(FC_Transform);
        this.AddManagedComponent(FC_Scale);
        this.AddManagedComponent(FC_Faction);
        this.AddManagedComponent(FC_Owner);
        this.AddManagedComponent(FC_NetRelevancePolicy);
        return;
    }
}

