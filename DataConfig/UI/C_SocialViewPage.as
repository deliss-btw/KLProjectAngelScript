
enum ESocialViewPageOperatorType
{
    None,
    OpenPage,
    Chat,
    AddFriend,
    DeleteFriend,
    InviteToDS,
    InviteJoinTeam,
    RequestJoinTeam,
    KickOutTeam,
    GiveTeamLeader,
}


struct FSocialViewPageButtonConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    UInputAction InputAction = nullptr;
    UPROPERTY()
    ESocialViewPageOperatorType OperatorType = ESocialViewPageOperatorType(0);
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PageWidget;


    bool ShowPageConfig() const
    {
        return (int(this.OperatorType) == 1);
    }
}

struct FSocialViewPageData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ESocialViewPageOpenType EnterPageType = ESocialViewPageOpenType(0);
    UPROPERTY()
    TArray<FDataObjectPtr> m_BigButtons;
    UPROPERTY()
    TArray<FDataObjectPtr> m_SmallButtons;
    UPROPERTY()
    TArray<FDataObjectPtr> m_HiddenSmallButtons;


    const TArray<TDataObjectPtr<FSocialViewPageButtonConfig>> GetBigButtons() const property
    {
        const TArray<TDataObjectPtr<FSocialViewPageButtonConfig>> __r;
        return __r;
    }
    void SetBigButtons(const TArray<TDataObjectPtr<FSocialViewPageButtonConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FSocialViewPageButtonConfig>>> local_2;
        this.m_BigButtons = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FSocialViewPageButtonConfig>> GetSmallButtons() const property
    {
        const TArray<TDataObjectPtr<FSocialViewPageButtonConfig>> __r;
        return __r;
    }
    void SetSmallButtons(const TArray<TDataObjectPtr<FSocialViewPageButtonConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FSocialViewPageButtonConfig>>> local_2;
        this.m_SmallButtons = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FSocialViewPageButtonConfig>> GetHiddenSmallButtons() const property
    {
        const TArray<TDataObjectPtr<FSocialViewPageButtonConfig>> __r;
        return __r;
    }
    void SetHiddenSmallButtons(const TArray<TDataObjectPtr<FSocialViewPageButtonConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FSocialViewPageButtonConfig>>> local_2;
        this.m_HiddenSmallButtons = local_2;
        return;
    }
}

