
enum ERedPointEvent
{
    None,
    RP_Partner_GetNewRole,
    RP_Avatar_GetNewAvatar,
    RP_Chat_PrivateMsg,
    RP_Mail_NewMail,
    RP_Mail_NewMailAttachment,
    RP_ModeEntrance_NewGameMode,
    RP_Avatar_NewTalent,
    RP_DivineSkill_New,
    RP_Mission_NewMainMission,
    RP_Mission_NewSideMission,
    RP_Talisman_NewTalismanSlot,
    RP_Talisman_NewTalisman,
    RP_Weapon_NewWeapon,
    RP_Weapon_NewWeaponCanChange,
    RP_Craft_NewCraftUnlocked,
    RP_Stigmata_NewInherentStigmata,
    RP_Talent_NewTalent,
    RP_Friend_NewApply,
    RP_Inventory_NewItem,
    RP_Stigmata_NewBreakthrough,
    RP_Fashion_NewFashion,
    RP_Talent_CanUpgrade,
    RP_Talisman_NewTalismanForEmptySlot,
}

enum ERedDotType
{
    Normal,
    DataNum,
    Text,
}


struct FRedPointNodeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ERedDotType NodeDisplayType;
    UPROPERTY()
    FGameplayTag NodeTag;
    UPROPERTY()
    TArray<FDataObjectPtr> m_ParentNodeList;


    const TArray<TDataObjectPtr<FRedPointNodeConfig>> GetParentNodeList() const property
    {
        const TArray<TDataObjectPtr<FRedPointNodeConfig>> __r;
        return __r;
    }
    void SetParentNodeList(const TArray<TDataObjectPtr<FRedPointNodeConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FRedPointNodeConfig>>> local_2;
        this.m_ParentNodeList = local_2;
        return;
    }
}

struct FRedPointConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ESystemModule ModuleType;
    UPROPERTY()
    ERedPointEvent EventType = ERedPointEvent(0);
    UPROPERTY()
    FDataObjectPtr m_NodeConfig;


    TDataObjectPtr<FRedPointNodeConfig> GetNodeConfig() const property
    {
        TDataObjectPtr<FRedPointNodeConfig> __r;
        return __r;
    }
    void SetNodeConfig(const TDataObjectPtr<FRedPointNodeConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRedPointNodeConfig>> local_2;
        this.m_NodeConfig = local_2;
        return;
    }
}

