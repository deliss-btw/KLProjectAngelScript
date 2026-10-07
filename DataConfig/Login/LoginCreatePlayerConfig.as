

struct FLoginCreatePlayerConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    EGenderType DefaultGender = EGenderType(1);
    UPROPERTY()
    bool bForbidMaleSelect = false;
    UPROPERTY()
    FText NotSelectTip;
    UPROPERTY()
    FText SelectForbidTip;
    UPROPERTY()
    FDataObjectPtr m_MaleDefaultFashion;
    UPROPERTY()
    FDataObjectPtr m_FemaleDefaultFashion;
    UPROPERTY()
    TArray<FDataObjectPtr> m_AvailableFace;
    UPROPERTY()
    int DefaultFaceIndex = 0;
    UPROPERTY()
    TArray<FDataObjectPtr> m_AvailableHair;
    UPROPERTY()
    int DefaultHairIndex = 0;
    UPROPERTY()
    TArray<FDataObjectPtr> m_AvailableTop;
    UPROPERTY()
    int DefaultTopIndex = 0;
    UPROPERTY()
    TArray<FDataObjectPtr> m_AvailableBottom;
    UPROPERTY()
    int DefaultBottomIndex = 0;
    UPROPERTY()
    TArray<FDataObjectPtr> m_AvailableSuit;
    UPROPERTY()
    int DefaultSuitIndex = 0;
    UPROPERTY()
    bool bGenderPhaseUseSelectFace = false;
    UPROPERTY()
    bool bGenderPhaseUseSelectHair = false;
    UPROPERTY()
    bool bGenderPhaseUseSelectFashion = false;
    UPROPERTY()
    bool bOpenPre = true;
    UPROPERTY()
    float32 MaskTime = 0.5f;
    UPROPERTY()
    float32 MaskFadeOutTime = 0.5f;


    const TDataObjectPtr<FCharacterDefaultFashionConfig> GetMaleDefaultFashion() const property
    {
        const TDataObjectPtr<FCharacterDefaultFashionConfig> __r;
        return __r;
    }
    void SetMaleDefaultFashion(const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FCharacterDefaultFashionConfig>> local_2;
        this.m_MaleDefaultFashion = local_2;
        return;
    }
    const TDataObjectPtr<FCharacterDefaultFashionConfig> GetFemaleDefaultFashion() const property
    {
        const TDataObjectPtr<FCharacterDefaultFashionConfig> __r;
        return __r;
    }
    void SetFemaleDefaultFashion(const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FCharacterDefaultFashionConfig>> local_2;
        this.m_FemaleDefaultFashion = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FFacePresetConfig>> GetAvailableFace() const property
    {
        const TArray<TDataObjectPtr<FFacePresetConfig>> __r;
        return __r;
    }
    void SetAvailableFace(const TArray<TDataObjectPtr<FFacePresetConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FFacePresetConfig>>> local_2;
        this.m_AvailableFace = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FFashionConfig>> GetAvailableHair() const property
    {
        const TArray<TDataObjectPtr<FFashionConfig>> __r;
        return __r;
    }
    void SetAvailableHair(const TArray<TDataObjectPtr<FFashionConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FFashionConfig>>> local_2;
        this.m_AvailableHair = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FFashionConfig>> GetAvailableTop() const property
    {
        const TArray<TDataObjectPtr<FFashionConfig>> __r;
        return __r;
    }
    void SetAvailableTop(const TArray<TDataObjectPtr<FFashionConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FFashionConfig>>> local_2;
        this.m_AvailableTop = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FFashionConfig>> GetAvailableBottom() const property
    {
        const TArray<TDataObjectPtr<FFashionConfig>> __r;
        return __r;
    }
    void SetAvailableBottom(const TArray<TDataObjectPtr<FFashionConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FFashionConfig>>> local_2;
        this.m_AvailableBottom = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FFashionConfig>> GetAvailableSuit() const property
    {
        const TArray<TDataObjectPtr<FFashionConfig>> __r;
        return __r;
    }
    void SetAvailableSuit(const TArray<TDataObjectPtr<FFashionConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FFashionConfig>>> local_2;
        this.m_AvailableSuit = local_2;
        return;
    }
}

