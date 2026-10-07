

struct FTeamAssembleConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    int DSMaxCapacity;
    UPROPERTY()
    int DSExtraCapacity;
    UPROPERTY()
    int AssembleReservationTTL;
    UPROPERTY()
    int TravelDSReservationTTL;
    UPROPERTY()
    int TeamAssembleCD;
    UPROPERTY()
    int ScoreA;
    UPROPERTY()
    int ScoreB;
    UPROPERTY()
    int OverflowThreshold;
    UPROPERTY()
    int MaxPlayerOpTimeout;


}

