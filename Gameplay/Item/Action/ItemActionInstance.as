

struct FItemActionConfigPtr
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_ItemConfig;
    UPROPERTY()
    EItemActionType m_ActionType;

    FItemActionConfigPtr(const TDataObjectPtr<FItemConfig> &inout InItemConfig, const EItemActionType InActionType)
    {
        this.SetItemConfig(InItemConfig);
        this.SetActionType(EItemActionType(InActionType));
        return;
    }
    UItemActionConfigBase Get() const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        return nullptr;
    }
    bool IsValid() const
    {
        return !(!(this.GetItemConfig()));
    }
    void Reset()
    {
        this.SetItemConfig(TDataObjectPtr<FItemConfig>(nullptr));
        return;
    }
    bool opEquals(const FItemActionConfigPtr &inout Other) const
    {
        TDataObjectPtr<FItemConfig> local_24;
        local_24 = this.GetItemConfig();
        FDataObjectPtr local_72;
        local_72;
        return (local_24 == local_72) && (int(this.GetActionType()) == int(Other.GetActionType()));
    }
    bool opImplConv() const
    {
        return this.IsValid();
    }
    FString ToString() const
    {
        return FString().Append(this.GetItemConfig().GetDataName()).Append(".").Append(this.GetActionType());
    }
    TDataObjectPtr<FItemConfig> GetItemConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    void SetItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    EItemActionType GetActionType() const property
    {
        return this.m_ActionType;
    }
    void SetActionType(const EItemActionType __Value) property
    {
        this.m_ActionType = __Value;
        return;
    }
}

struct FItemActionInstance
{
    UPROPERTY()
    FItemActionConfigPtr Config;
    UPROPERTY()
    FItemActionRuntimeInfo RuntimeInfo;
    UPROPERTY()
    int ID;

    FItemActionInstance(const FItemActionConfigPtr &inout InConfig, const FItemActionRuntimeInfo &inout InRuntimeInfo, const int InInstanceID)
    {
        this.RuntimeInfo = InRuntimeInfo;
        this.ID = InInstanceID;
        return;
    }
    UItemActionConfigBase GetActionConfig() const property
    {
        UItemActionConfigBase local_2;
        return local_2;
    }
    FItemActionConfigPtr GetActionConfigPtr() const property
    {
        FItemActionConfigPtr __r;
        return __r;
    }
    int GetInstanceID() const property
    {
        return this.ID;
    }
    bool GetIsAlive() const property
    {
        return !(this.RuntimeInfo.GetbFailed()) && !(this.RuntimeInfo.GetbFinished());
    }
    bool GetIsFailed() const property
    {
        return this.RuntimeInfo.GetbFailed();
    }
    FItemActionRuntimeInfo GetRuntimeInfo()
    {
        FItemActionRuntimeInfo __r;
        return __r;
    }
}

