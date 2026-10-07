

class AEntityTriggerBox : AEntityTriggerSimpleShape
{
    UPROPERTY()
    USceneComponent Root;
    UPROPERTY()
    UBoxComponent BoxCollisionComponent;

    AEntityTriggerBox()
    {
        super();
        if (this.BoxCollisionComponent != nullptr)
        {
            this.BoxCollisionComponent.SetCollisionProfileName(n"EventVolume", true);
            this.BoxCollisionComponent.SetBoxExtent(FVector(100.0, 100.0, 100.0), true);
        }
        return;
    }
}

