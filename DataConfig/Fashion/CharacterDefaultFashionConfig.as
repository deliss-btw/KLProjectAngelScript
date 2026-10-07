

struct FCharacterDefaultFashionConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_Avatar;
    UPROPERTY()
    EBodyType BodyType;
    UPROPERTY()
    FDataObjectPtr m_InitHair;
    UPROPERTY()
    FDataObjectPtr m_InitTop;
    UPROPERTY()
    FDataObjectPtr m_InitBottom;
    UPROPERTY()
    FDataObjectPtr m_InitSuit;
    UPROPERTY()
    FDataObjectPtr m_InitBathrobeTop;
    UPROPERTY()
    FDataObjectPtr m_InitBathrobeBottom;


    TDataObjectPtr<FAvatarPrefabConfig> GetAvatar() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        return __r;
    }
    void SetAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAvatarPrefabConfig>> local_2;
        this.m_Avatar = local_2;
        return;
    }
    const TDataObjectPtr<FFashionConfig> GetInitHair() const property
    {
        const TDataObjectPtr<FFashionConfig> __r;
        return __r;
    }
    void SetInitHair(const TDataObjectPtr<FFashionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FFashionConfig>> local_2;
        this.m_InitHair = local_2;
        return;
    }
    const TDataObjectPtr<FFashionConfig> GetInitTop() const property
    {
        const TDataObjectPtr<FFashionConfig> __r;
        return __r;
    }
    void SetInitTop(const TDataObjectPtr<FFashionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FFashionConfig>> local_2;
        this.m_InitTop = local_2;
        return;
    }
    const TDataObjectPtr<FFashionConfig> GetInitBottom() const property
    {
        const TDataObjectPtr<FFashionConfig> __r;
        return __r;
    }
    void SetInitBottom(const TDataObjectPtr<FFashionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FFashionConfig>> local_2;
        this.m_InitBottom = local_2;
        return;
    }
    const TDataObjectPtr<FFashionConfig> GetInitSuit() const property
    {
        const TDataObjectPtr<FFashionConfig> __r;
        return __r;
    }
    void SetInitSuit(const TDataObjectPtr<FFashionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FFashionConfig>> local_2;
        this.m_InitSuit = local_2;
        return;
    }
    const TDataObjectPtr<FFashionConfig> GetInitBathrobeTop() const property
    {
        const TDataObjectPtr<FFashionConfig> __r;
        return __r;
    }
    void SetInitBathrobeTop(const TDataObjectPtr<FFashionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FFashionConfig>> local_2;
        this.m_InitBathrobeTop = local_2;
        return;
    }
    const TDataObjectPtr<FFashionConfig> GetInitBathrobeBottom() const property
    {
        const TDataObjectPtr<FFashionConfig> __r;
        return __r;
    }
    void SetInitBathrobeBottom(const TDataObjectPtr<FFashionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FFashionConfig>> local_2;
        this.m_InitBathrobeBottom = local_2;
        return;
    }
}

