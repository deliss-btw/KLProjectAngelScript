struct FConditionInstanceHandle
{
    UPROPERTY()
    TDataObjectPtr<FConditionConfigBase> m_m_ConditionConfig;
    UPROPERTY()
    int m_LocalConditionOrConditionGroupInstanceID = INDEX_NONE;

    FConditionInstanceHandle(const TDataObjectPtr<FLocalConditionConfig> &inout InConditionConfig, const int InLocalConditionInstanceID)
    {
        CastTo local_4;
        this.Setm_ConditionConfig(local_4.opCall());
        this.SetLocalConditionOrConditionGroupInstanceID(InLocalConditionInstanceID);
        return;
    }
    FConditionInstanceHandle(const TDataObjectPtr<FConditionGroupConfig> &inout InConditionGroupConfig, const int InLocalConditionGroupInstanceID)
    {
        CastTo local_4;
        this.Setm_ConditionConfig(local_4.opCall());
        this.SetLocalConditionOrConditionGroupInstanceID(InLocalConditionGroupInstanceID);
        return;
    }
    bool IsValid() const
    {
        return this.Getm_ConditionConfig() && (this.GetLocalConditionOrConditionGroupInstanceID() != INDEX_NONE);
    }
    EConditionConfigType GetConditionConfigType() const property
    {
        if (this.Getm_ConditionConfig())
        {
            return this.Getm_ConditionConfig().opArrow().ConfigType;
        }
        return EConditionConfigType(0);
    }
    ELocalConditionConfigType GetLocalConditionType() const property
    {
        if ((int(this.GetConditionConfigType())) == 2)
        {
            TDataObjectPtr<FConditionConfigBase> local_28 = this.GetConditionConfig();
            CastTo local_32;
            return ELocalConditionConfigType(local_32.opCall().opArrow().LocalConditionType);
        }
        return ELocalConditionConfigType(0);
    }
    TDataObjectPtr<FConditionConfigBase> GetConditionConfig() const property
    {
        return this.Getm_ConditionConfig();
    }
    int GetLocalConditionInstanceID() const property
    {
        if ((int(this.GetLocalConditionType())) == 1)
        {
            return this.GetLocalConditionOrConditionGroupInstanceID();
        }
        return INDEX_NONE;
    }
    int GetLocalConditionGroupInstanceID() const property
    {
        if ((int(this.GetLocalConditionType())) == 2)
        {
            return this.GetLocalConditionOrConditionGroupInstanceID();
        }
        return INDEX_NONE;
    }
    int opCmp(const FConditionInstanceHandle &inout Other) const
    {
        if ((this.GetConditionConfig() == Other.GetConditionConfig().opImplConv()) && (this.GetLocalConditionOrConditionGroupInstanceID() == Other.GetLocalConditionOrConditionGroupInstanceID()))
        {
            return 0;
        }
        return 1;
    }
    const TDataObjectPtr<FConditionConfigBase> Getm_ConditionConfig() const property
    {
        const TDataObjectPtr<FConditionConfigBase> __r;
        return __r;
    }
    TDataObjectPtr<FConditionConfigBase> Getm_ConditionConfig() property
    {
        TDataObjectPtr<FConditionConfigBase> __r;
        return __r;
    }
    void Setm_ConditionConfig(const TDataObjectPtr<FConditionConfigBase> &inout __Value) property
    {
        this.m_m_ConditionConfig = __Value;
        return;
    }
    int GetLocalConditionOrConditionGroupInstanceID() const property
    {
        return this.m_LocalConditionOrConditionGroupInstanceID;
    }
    void SetLocalConditionOrConditionGroupInstanceID(const int __Value) property
    {
        this.m_LocalConditionOrConditionGroupInstanceID = __Value;
        return;
    }
}

