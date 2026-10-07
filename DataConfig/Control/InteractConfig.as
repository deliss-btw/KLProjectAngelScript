
enum EInteractMode
{
    InteractMode_F,
    InteractMode_Z,
}


struct FInteractionPointTypeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<TSubclassOf<UInteractionBehaviorBase>> Behaviors;
    UPROPERTY()
    EInteractMode InteractMode = EInteractMode(0);


}

