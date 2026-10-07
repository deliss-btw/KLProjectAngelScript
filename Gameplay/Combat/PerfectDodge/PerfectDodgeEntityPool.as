

// NOTE: class defaults are not authored in this module: UPerfectDodgePoolMeta (default scalar field UECSEntityPoolMeta.InitSize has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

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

