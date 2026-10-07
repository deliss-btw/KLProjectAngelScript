

struct FMailConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText MailTitle;
    UPROPERTY()
    FText MailContent;
    UPROPERTY()
    FText MailSender;
    UPROPERTY()
    int ExpireDay;
    UPROPERTY()
    FDataObjectPtr m_AttachmentRewardConfig;
    UPROPERTY()
    FDataObjectPtr m_Condition;
    UPROPERTY()
    bool IsRepeatable;


    const TDataObjectPtr<FRewardConfig> GetAttachmentRewardConfig() const property
    {
        const TDataObjectPtr<FRewardConfig> __r;
        return __r;
    }
    void SetAttachmentRewardConfig(const TDataObjectPtr<FRewardConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRewardConfig>> local_2;
        this.m_AttachmentRewardConfig = local_2;
        return;
    }
    const TDataObjectPtr<FServerConditionConfigBase> GetCondition() const property
    {
        const TDataObjectPtr<FServerConditionConfigBase> __r;
        return __r;
    }
    void SetCondition(const TDataObjectPtr<FServerConditionConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FServerConditionConfigBase>> local_2;
        this.m_Condition = local_2;
        return;
    }
}

