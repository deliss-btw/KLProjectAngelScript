

struct FConditionInstanceHandle
{
    UPROPERTY()
    TDataObjectPtr<FConditionConfigBase> m_m_ConditionConfig;
    UPROPERTY()
    int m_LocalConditionOrConditionGroupInstanceID;

    FConditionInstanceHandle()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FConditionInstanceHandle(const TDataObjectPtr<FLocalConditionConfig> &inout InConditionConfig, const int InLocalConditionInstanceID)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FConditionInstanceHandle(const TDataObjectPtr<FConditionGroupConfig> &inout InConditionGroupConfig, const int InLocalConditionGroupInstanceID)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    bool IsValid() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
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
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    int GetLocalConditionGroupInstanceID() const property
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
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
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
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

