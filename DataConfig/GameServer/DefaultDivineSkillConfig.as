

struct FDefaultDivineSkillConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    EDivineSkillType DivineSkillType;
    UPROPERTY()
    FDataObjectPtr m_DivineSkill;


    TDataObjectPtr<FDivineSkillConfig> GetDivineSkill() const property
    {
        TDataObjectPtr<FDivineSkillConfig> __r;
        return __r;
    }
    void SetDivineSkill(const TDataObjectPtr<FDivineSkillConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDivineSkillConfig>> local_2;
        this.m_DivineSkill = local_2;
        return;
    }
}

