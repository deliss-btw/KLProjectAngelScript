
enum ECustomWheelOptionType
{
    Emoji,
    Signal,
    SocialAction,
    Message,
}


struct FSignalConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText SignalName;
    UPROPERTY()
    FText SignalContext;
    UPROPERTY()
    FSoftBrush SignalIconObject;
    UPROPERTY()
    TSoftClassPtr<AFXActor> FXActor;

    FSignalConfig()
    {
        return;
    }
}

struct FCustomWheelOptionConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    int Index;
    UPROPERTY()
    ECustomWheelOptionType OptionType;
    UPROPERTY()
    FName OptionName;
    UPROPERTY()
    FDataObjectPtr m_DefaultEmojiData;
    UPROPERTY()
    FDataObjectPtr m_DefaultSignalData;
    UPROPERTY()
    FDataObjectPtr m_DefaultMotionData;


    const TDataObjectPtr<FEmojiData> GetDefaultEmojiData() const property
    {
        const TDataObjectPtr<FEmojiData> __r;
        return __r;
    }
    void SetDefaultEmojiData(const TDataObjectPtr<FEmojiData> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FEmojiData>> local_2;
        this.m_DefaultEmojiData = local_2;
        return;
    }
    const TDataObjectPtr<FSignalConfig> GetDefaultSignalData() const property
    {
        const TDataObjectPtr<FSignalConfig> __r;
        return __r;
    }
    void SetDefaultSignalData(const TDataObjectPtr<FSignalConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FSignalConfig>> local_2;
        this.m_DefaultSignalData = local_2;
        return;
    }
    const TDataObjectPtr<FMotionData> GetDefaultMotionData() const property
    {
        const TDataObjectPtr<FMotionData> __r;
        return __r;
    }
    void SetDefaultMotionData(const TDataObjectPtr<FMotionData> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMotionData>> local_2;
        this.m_DefaultMotionData = local_2;
        return;
    }
}

