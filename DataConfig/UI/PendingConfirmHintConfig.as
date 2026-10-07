
enum EPendingConfirmFeature
{
    AddFriend,
    RequestJoinTeam,
    InviteJoinTeam,
    InviteToDS,
    InviteTeamToDS,
}

enum EPendingConfirmSource
{
    DiverseServer,
    GameServer,
    Function,
}

enum EPendingConfirmAction
{
    Refuse,
    Accept,
}

enum EPendingConfirmTimeOutAction
{
    AutoRefuse,
    AutoAccept,
    AutoHold,
}

enum EPendingConfirmScenePersistence
{
    Keep,
    Clear,
}


struct FPendingConfirmHintConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    int ID;
    UPROPERTY()
    int Priority = 5;
    UPROPERTY()
    float32 Duration = 10.0f;
    UPROPERTY()
    TArray<EPendingConfirmAction> ActionBar;
    UPROPERTY()
    EPendingConfirmTimeOutAction DurationTimeOutAutoAction = EPendingConfirmTimeOutAction(0);
    UPROPERTY()
    EPendingConfirmScenePersistence ScenePersistence = EPendingConfirmScenePersistence(0);
    UPROPERTY()
    FText Title;
    UPROPERTY()
    FSoftBrush TitleImage;
    UPROPERTY()
    FText Content;


}

