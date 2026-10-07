
namespace __INTENRAL_FC_SyncChangeMaterialParamRequests_NS
{
    const TECSComponentDerivedPtr<FC_SyncChangeMaterialParamRequests> DerivedPtr = TECSComponentDerivedPtr<FC_SyncChangeMaterialParamRequests>();
    const FC_SyncChangeMaterialParamRequests DefaultValue = FC_SyncChangeMaterialParamRequests();
}
namespace __INTENRAL_FC_SyncBlendingOutChangeMaterialTag_NS
{
    const TECSComponentDerivedPtr<FC_SyncBlendingOutChangeMaterialTag> DerivedPtr = TECSComponentDerivedPtr<FC_SyncBlendingOutChangeMaterialTag>();
    const FC_SyncBlendingOutChangeMaterialTag DefaultValue = FC_SyncBlendingOutChangeMaterialTag();
}
namespace __INTENRAL_FC_LocalChangeMaterialParamRequests_NS
{
    const TECSComponentDerivedPtr<FC_LocalChangeMaterialParamRequests> DerivedPtr = TECSComponentDerivedPtr<FC_LocalChangeMaterialParamRequests>();
    const FC_LocalChangeMaterialParamRequests DefaultValue = FC_LocalChangeMaterialParamRequests();
}
namespace __INTENRAL_FC_LocalBlendingOutChangeMaterialTag_NS
{
    const TECSComponentDerivedPtr<FC_LocalBlendingOutChangeMaterialTag> DerivedPtr = TECSComponentDerivedPtr<FC_LocalBlendingOutChangeMaterialTag>();
    const FC_LocalBlendingOutChangeMaterialTag DefaultValue = FC_LocalBlendingOutChangeMaterialTag();
}
namespace __INTENRAL_FC_ChangeMaterialRequestUpdatedTag_NS
{
    const TECSComponentDerivedPtr<FC_ChangeMaterialRequestUpdatedTag> DerivedPtr = TECSComponentDerivedPtr<FC_ChangeMaterialRequestUpdatedTag>();
    const FC_ChangeMaterialRequestUpdatedTag DefaultValue = FC_ChangeMaterialRequestUpdatedTag();
}
namespace __INTENRAL_FC_MaterialParamBlendingTag_NS
{
    const TECSComponentDerivedPtr<FC_MaterialParamBlendingTag> DerivedPtr = TECSComponentDerivedPtr<FC_MaterialParamBlendingTag>();
    const FC_MaterialParamBlendingTag DefaultValue = FC_MaterialParamBlendingTag();
}
namespace __INTENRAL_FC_CachedAllChangeMateraialData_NS
{
    const TECSComponentDerivedPtr<FC_CachedAllChangeMateraialData> DerivedPtr = TECSComponentDerivedPtr<FC_CachedAllChangeMateraialData>();
    const FC_CachedAllChangeMateraialData DefaultValue = FC_CachedAllChangeMateraialData();
}
namespace __INTENRAL_FC_CachedDynamicMaskedMaterialComps_NS
{
    const TECSComponentDerivedPtr<FC_CachedDynamicMaskedMaterialComps> DerivedPtr = TECSComponentDerivedPtr<FC_CachedDynamicMaskedMaterialComps>();
    const FC_CachedDynamicMaskedMaterialComps DefaultValue = FC_CachedDynamicMaskedMaterialComps();
}
namespace __INTENRAL_FC_CachedMaterialOverrides_NS
{
    const TECSComponentDerivedPtr<FC_CachedMaterialOverrides> DerivedPtr = TECSComponentDerivedPtr<FC_CachedMaterialOverrides>();
    const FC_CachedMaterialOverrides DefaultValue = FC_CachedMaterialOverrides();

}
struct FFloatParamBlendData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFloatParamRequestData m_RequestData;
    UPROPERTY()
    float32 m_DefaultValue;
    UPROPERTY()
    float32 m_StartValue;
    UPROPERTY()
    float32 m_CurrentValue;
    UPROPERTY()
    FFPTime m_StartTime;
    UPROPERTY()
    FFPTime m_LastUpdatedTime;
    UPROPERTY()
    bool m_bBlendFinish;

    FFloatParamBlendData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FFloatParamBlendData(const FFloatParamBlendData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FFloatParamBlendData opAssign(const FFloatParamBlendData &inout Other)
    {
        FFloatParamBlendData __r;
        this.SetRequestData(Other.GetRequestData());
        this.SetDefaultValue(Other.GetDefaultValue());
        this.SetStartValue(Other.GetStartValue());
        this.SetCurrentValue(Other.GetCurrentValue());
        this.SetStartTime(Other.GetStartTime());
        this.SetLastUpdatedTime(Other.GetLastUpdatedTime());
        this.SetbBlendFinish(Other.GetbBlendFinish());
        return __r;
    }
    const FFloatParamRequestData GetRequestData() const property
    {
        const FFloatParamRequestData __r;
        return __r;
    }
    FFloatParamRequestData GetModify_RequestData() property
    {
        FFloatParamRequestData __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRequestData(const FFloatParamRequestData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RequestData = __Value;
        return;
    }
    float32 GetDefaultValue() const property
    {
        return this.m_DefaultValue;
    }
    void SetDefaultValue(const float32 __Value) property
    {
        if (this.m_DefaultValue == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DefaultValue = __Value;
        return;
    }
    float32 GetStartValue() const property
    {
        return this.m_StartValue;
    }
    void SetStartValue(const float32 __Value) property
    {
        if (this.m_StartValue == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_StartValue = __Value;
        return;
    }
    float32 GetCurrentValue() const property
    {
        return this.m_CurrentValue;
    }
    void SetCurrentValue(const float32 __Value) property
    {
        if (this.m_CurrentValue == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_CurrentValue = __Value;
        return;
    }
    FFPTime GetStartTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_StartTime = __Value;
        return;
    }
    const FFPTime GetLastUpdatedTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastUpdatedTime() property
    {
        FFPTime __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetLastUpdatedTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_LastUpdatedTime = __Value;
        return;
    }
    bool GetbBlendFinish() const property
    {
        return this.m_bBlendFinish;
    }
    void SetbBlendFinish(const bool __Value) property
    {
        if (!(this.m_bBlendFinish) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bBlendFinish = __Value;
        return;
    }
}

struct FVectorParamBlendData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVectorParamRequestData m_RequestData;
    UPROPERTY()
    FLinearColor m_DefaultValue;
    UPROPERTY()
    FLinearColor m_StartValue;
    UPROPERTY()
    FLinearColor m_CurrentValue;
    UPROPERTY()
    FFPTime m_StartTime;
    UPROPERTY()
    FFPTime m_LastUpdatedTime;
    UPROPERTY()
    bool m_bBlendFinish;

    FVectorParamBlendData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FVectorParamBlendData(const FVectorParamBlendData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FVectorParamBlendData opAssign(const FVectorParamBlendData &inout Other)
    {
        FVectorParamBlendData __r;
        this.SetRequestData(Other.GetRequestData());
        this.SetDefaultValue(Other.GetDefaultValue());
        this.SetStartValue(Other.GetStartValue());
        this.SetCurrentValue(Other.GetCurrentValue());
        this.SetStartTime(Other.GetStartTime());
        this.SetLastUpdatedTime(Other.GetLastUpdatedTime());
        this.SetbBlendFinish(Other.GetbBlendFinish());
        return __r;
    }
    const FVectorParamRequestData GetRequestData() const property
    {
        const FVectorParamRequestData __r;
        return __r;
    }
    FVectorParamRequestData GetModify_RequestData() property
    {
        FVectorParamRequestData __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRequestData(const FVectorParamRequestData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RequestData = __Value;
        return;
    }
    FLinearColor GetDefaultValue() const property
    {
        FLinearColor __r;
        return __r;
    }
    FLinearColor GetModify_DefaultValue() property
    {
        FLinearColor __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetDefaultValue(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DefaultValue = __Value;
        return;
    }
    FLinearColor GetStartValue() const property
    {
        FLinearColor __r;
        return __r;
    }
    FLinearColor GetModify_StartValue() property
    {
        FLinearColor __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetStartValue(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_StartValue = __Value;
        return;
    }
    FLinearColor GetCurrentValue() const property
    {
        FLinearColor __r;
        return __r;
    }
    FLinearColor GetModify_CurrentValue() property
    {
        FLinearColor __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetCurrentValue(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_CurrentValue = __Value;
        return;
    }
    FFPTime GetStartTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_StartTime = __Value;
        return;
    }
    const FFPTime GetLastUpdatedTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastUpdatedTime() property
    {
        FFPTime __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetLastUpdatedTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_LastUpdatedTime = __Value;
        return;
    }
    bool GetbBlendFinish() const property
    {
        return this.m_bBlendFinish;
    }
    void SetbBlendFinish(const bool __Value) property
    {
        if (!(this.m_bBlendFinish) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bBlendFinish = __Value;
        return;
    }
}

struct FTextureParamBlendData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FTextureParamRequestData m_RequestData;
    UPROPERTY()
    FSoftObjectPath m_DefaultTexture;
    UPROPERTY()
    FSoftObjectPath m_CurrentTexture;
    UPROPERTY()
    FFPTime m_StartTime;
    UPROPERTY()
    FFPTime m_BlendOutTime;
    UPROPERTY()
    FFPTime m_LastUpdatedTime;

    FTextureParamBlendData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTextureParamBlendData(const FTextureParamBlendData &inout Other)
    {
        this.m_RequestData = Other.m_RequestData;
        this.m_DefaultTexture = Other.m_DefaultTexture;
        this.m_CurrentTexture = Other.m_CurrentTexture;
        this.m_StartTime = Other.m_StartTime;
        this.m_BlendOutTime = Other.m_BlendOutTime;
        this.m_LastUpdatedTime = Other.m_LastUpdatedTime;
        return;
    }
    FTextureParamBlendData opAssign(const FTextureParamBlendData &inout Other)
    {
        FTextureParamBlendData __r;
        this.SetRequestData(Other.GetRequestData());
        this.SetDefaultTexture(Other.GetDefaultTexture());
        this.SetCurrentTexture(Other.GetCurrentTexture());
        this.SetStartTime(Other.GetStartTime());
        this.SetBlendOutTime(Other.GetBlendOutTime());
        this.SetLastUpdatedTime(Other.GetLastUpdatedTime());
        return __r;
    }
    const FTextureParamRequestData GetRequestData() const property
    {
        const FTextureParamRequestData __r;
        return __r;
    }
    FTextureParamRequestData GetModify_RequestData() property
    {
        FTextureParamRequestData __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRequestData(const FTextureParamRequestData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RequestData = __Value;
        return;
    }
    FSoftObjectPath GetDefaultTexture() const property
    {
        return this.m_DefaultTexture;
    }
    void SetDefaultTexture(const FSoftObjectPath &inout __Value) property
    {
        if ((this.m_DefaultTexture == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DefaultTexture = __Value;
        return;
    }
    FSoftObjectPath GetCurrentTexture() const property
    {
        return this.m_CurrentTexture;
    }
    void SetCurrentTexture(const FSoftObjectPath &inout __Value) property
    {
        if ((this.m_CurrentTexture == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_CurrentTexture = __Value;
        return;
    }
    FFPTime GetStartTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_StartTime = __Value;
        return;
    }
    FFPTime GetBlendOutTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_BlendOutTime() property
    {
        FFPTime __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetBlendOutTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_BlendOutTime = __Value;
        return;
    }
    const FFPTime GetLastUpdatedTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastUpdatedTime() property
    {
        FFPTime __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetLastUpdatedTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_LastUpdatedTime = __Value;
        return;
    }
}

struct FSingleMaterialParamRequestData
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    bool m_bUseLogicName;
    UPROPERTY()
    FName m_MeshName;
    UPROPERTY()
    bool m_bIsOverlayMaterial;
    UPROPERTY()
    bool m_bApplyToAllSlot;
    UPROPERTY()
    bool m_bUseSlotName;
    UPROPERTY()
    int m_MaterialIndex;
    UPROPERTY()
    FName m_MaterialSlotName;
    UPROPERTY()
    FSoftObjectPath m_OverrideMaterialPath;
    UPROPERTY()
    bool m_bEnableDynamicMaskedMaterial;
    UPROPERTY()
    TArray<FFloatParamRequestData> m_FloatParams;
    UPROPERTY()
    TArray<FVectorParamRequestData> m_VectorParams;
    UPROPERTY()
    TArray<FTextureParamRequestData> m_TextureParams;

    FSingleMaterialParamRequestData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSingleMaterialParamRequestData(const FSingleMaterialParamRequestData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSingleMaterialParamRequestData opAssign(const FSingleMaterialParamRequestData &inout Other)
    {
        FSingleMaterialParamRequestData __r;
        this.SetbUseLogicName(Other.GetbUseLogicName());
        this.SetMeshName(Other.GetMeshName());
        this.SetbIsOverlayMaterial(Other.GetbIsOverlayMaterial());
        this.SetbApplyToAllSlot(Other.GetbApplyToAllSlot());
        this.SetbUseSlotName(Other.GetbUseSlotName());
        this.SetMaterialIndex(Other.GetMaterialIndex());
        this.SetMaterialSlotName(Other.GetMaterialSlotName());
        this.SetOverrideMaterialPath(Other.GetOverrideMaterialPath());
        this.SetbEnableDynamicMaskedMaterial(Other.GetbEnableDynamicMaskedMaterial());
        this.SetFloatParams(Other.GetFloatParams());
        this.SetVectorParams(Other.GetVectorParams());
        this.SetTextureParams(Other.GetTextureParams());
        return __r;
    }
    bool GetbUseLogicName() const property
    {
        return this.m_bUseLogicName;
    }
    void SetbUseLogicName(const bool __Value) property
    {
        if (!(this.m_bUseLogicName) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bUseLogicName = __Value;
        return;
    }
    FName GetMeshName() const property
    {
        return this.m_MeshName;
    }
    void SetMeshName(const FName &inout __Value) property
    {
        if ((this.m_MeshName == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MeshName = __Value;
        return;
    }
    bool GetbIsOverlayMaterial() const property
    {
        return this.m_bIsOverlayMaterial;
    }
    void SetbIsOverlayMaterial(const bool __Value) property
    {
        if (!(this.m_bIsOverlayMaterial) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bIsOverlayMaterial = __Value;
        return;
    }
    bool GetbApplyToAllSlot() const property
    {
        return this.m_bApplyToAllSlot;
    }
    void SetbApplyToAllSlot(const bool __Value) property
    {
        if (!(this.m_bApplyToAllSlot) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bApplyToAllSlot = __Value;
        return;
    }
    bool GetbUseSlotName() const property
    {
        return this.m_bUseSlotName;
    }
    void SetbUseSlotName(const bool __Value) property
    {
        if (!(this.m_bUseSlotName) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bUseSlotName = __Value;
        return;
    }
    int GetMaterialIndex() const property
    {
        return this.m_MaterialIndex;
    }
    void SetMaterialIndex(const int __Value) property
    {
        if (this.m_MaterialIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_MaterialIndex = __Value;
        return;
    }
    FName GetMaterialSlotName() const property
    {
        return this.m_MaterialSlotName;
    }
    void SetMaterialSlotName(const FName &inout __Value) property
    {
        if ((this.m_MaterialSlotName == __Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_MaterialSlotName = __Value;
        return;
    }
    FSoftObjectPath GetOverrideMaterialPath() const property
    {
        return this.m_OverrideMaterialPath;
    }
    void SetOverrideMaterialPath(const FSoftObjectPath &inout __Value) property
    {
        if ((this.m_OverrideMaterialPath == __Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_OverrideMaterialPath = __Value;
        return;
    }
    bool GetbEnableDynamicMaskedMaterial() const property
    {
        return this.m_bEnableDynamicMaskedMaterial;
    }
    void SetbEnableDynamicMaskedMaterial(const bool __Value) property
    {
        if (!(this.m_bEnableDynamicMaskedMaterial) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_bEnableDynamicMaskedMaterial = __Value;
        return;
    }
    const TArray<FFloatParamRequestData> GetFloatParams() const property
    {
        const TArray<FFloatParamRequestData> __r;
        return __r;
    }
    TArray<FFloatParamRequestData> GetModify_FloatParams() property
    {
        TArray<FFloatParamRequestData> __r;
        this.__MarkDirty(9);
        return __r;
    }
    void SetFloatParams(const TArray<FFloatParamRequestData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_FloatParams = __Value;
        return;
    }
    const TArray<FVectorParamRequestData> GetVectorParams() const property
    {
        const TArray<FVectorParamRequestData> __r;
        return __r;
    }
    TArray<FVectorParamRequestData> GetModify_VectorParams() property
    {
        TArray<FVectorParamRequestData> __r;
        this.__MarkDirty(10);
        return __r;
    }
    void SetVectorParams(const TArray<FVectorParamRequestData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_VectorParams = __Value;
        return;
    }
    const TArray<FTextureParamRequestData> GetTextureParams() const property
    {
        const TArray<FTextureParamRequestData> __r;
        return __r;
    }
    TArray<FTextureParamRequestData> GetModify_TextureParams() property
    {
        TArray<FTextureParamRequestData> __r;
        this.__MarkDirty(11);
        return __r;
    }
    void SetTextureParams(const TArray<FTextureParamRequestData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_TextureParams = __Value;
        return;
    }
}

struct FSingleMaterialParamBlendData
{
    UPROPERTY()
    FName MeshName;
    UPROPERTY()
    bool bIsOverlayMaterial;
    UPROPERTY()
    int MaterialIndex;
    UPROPERTY()
    bool bEnableDynamicMaskedMaterial = false;
    UPROPERTY()
    TArray<FFloatParamBlendData> FloatParams;
    UPROPERTY()
    TArray<FVectorParamBlendData> VectorParams;
    UPROPERTY()
    TArray<FTextureParamBlendData> TextureParams;


    int FindFloatParamIndex(const FName &inout ParamName)
    {
        int local_1 = 0;
        for (; local_1 < this.FloatParams.Num(); ++local_1)
        {
            if ((FName(this.FloatParams[local_1].GetRequestData().ParamName) == ParamName))
            {
                return local_1;
            }
        }
        return -1;
    }
    int FindVectorParamIndex(const FName &inout ParamName)
    {
        int local_1 = 0;
        for (; local_1 < this.VectorParams.Num(); ++local_1)
        {
            if ((FName(this.VectorParams[local_1].GetRequestData().ParamName) == ParamName))
            {
                return local_1;
            }
        }
        return -1;
    }
    int FindTextureParamIndex(const FName &inout ParamName)
    {
        int local_1 = 0;
        for (; local_1 < this.TextureParams.Num(); ++local_1)
        {
            if ((FName(this.TextureParams[local_1].GetRequestData().ParamName) == ParamName))
            {
                return local_1;
            }
        }
        return -1;
    }
}

struct FChangeMaterialParamRequest
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_RequestName;
    UPROPERTY()
    FFPTime m_StartTime;
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> m_Data;
    UPROPERTY()
    bool m_bIsBlendingOut;
    UPROPERTY()
    FFPTime m_BlendOutStartTime;
    UPROPERTY()
    float32 m_BlendOutTime;
    UPROPERTY()
    FSoftObjectPath m_BlendOutCurvePath;

    FChangeMaterialParamRequest()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FChangeMaterialParamRequest(const FChangeMaterialParamRequest &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FChangeMaterialParamRequest opAssign(const FChangeMaterialParamRequest &inout Other)
    {
        FChangeMaterialParamRequest __r;
        this.SetRequestName(Other.GetRequestName());
        this.SetStartTime(Other.GetStartTime());
        this.SetData(Other.GetData());
        this.SetbIsBlendingOut(Other.GetbIsBlendingOut());
        this.SetBlendOutStartTime(Other.GetBlendOutStartTime());
        this.SetBlendOutTime(Other.GetBlendOutTime());
        this.SetBlendOutCurvePath(Other.GetBlendOutCurvePath());
        return __r;
    }
    FName GetRequestName() const property
    {
        return this.m_RequestName;
    }
    void SetRequestName(const FName &inout __Value) property
    {
        if ((this.m_RequestName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RequestName = __Value;
        return;
    }
    FFPTime GetStartTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_StartTime = __Value;
        return;
    }
    const TArray<FSingleMaterialParamRequestData> GetData() const property
    {
        const TArray<FSingleMaterialParamRequestData> __r;
        return __r;
    }
    TArray<FSingleMaterialParamRequestData> GetModify_Data() property
    {
        TArray<FSingleMaterialParamRequestData> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetData(const TArray<FSingleMaterialParamRequestData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Data = __Value;
        return;
    }
    bool GetbIsBlendingOut() const property
    {
        return this.m_bIsBlendingOut;
    }
    void SetbIsBlendingOut(const bool __Value) property
    {
        if (!(this.m_bIsBlendingOut) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bIsBlendingOut = __Value;
        return;
    }
    const FFPTime GetBlendOutStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_BlendOutStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetBlendOutStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_BlendOutStartTime = __Value;
        return;
    }
    float32 GetBlendOutTime() const property
    {
        return this.m_BlendOutTime;
    }
    void SetBlendOutTime(const float32 __Value) property
    {
        if (this.m_BlendOutTime == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_BlendOutTime = __Value;
        return;
    }
    FSoftObjectPath GetBlendOutCurvePath() const property
    {
        return this.m_BlendOutCurvePath;
    }
    void SetBlendOutCurvePath(const FSoftObjectPath &inout __Value) property
    {
        if ((this.m_BlendOutCurvePath == __Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_BlendOutCurvePath = __Value;
        return;
    }
}

struct FC_SyncChangeMaterialParamRequests : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FChangeMaterialParamRequest> m_Requests;

    FC_SyncChangeMaterialParamRequests()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SyncChangeMaterialParamRequests(const FC_SyncChangeMaterialParamRequests &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Requests = Other.m_Requests;
        return;
    }
    FC_SyncChangeMaterialParamRequests opAssign(const FC_SyncChangeMaterialParamRequests &inout Other)
    {
        FC_SyncChangeMaterialParamRequests __r;
        this.SetRequests(Other.GetRequests());
        return __r;
    }
    const TArray<FChangeMaterialParamRequest> GetRequests() const property
    {
        const TArray<FChangeMaterialParamRequest> __r;
        return __r;
    }
    TArray<FChangeMaterialParamRequest> GetModify_Requests() property
    {
        TArray<FChangeMaterialParamRequest> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRequests(const TArray<FChangeMaterialParamRequest> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Requests = __Value;
        return;
    }
}

struct FC_SyncBlendingOutChangeMaterialTag : FECSComponent
{
    FC_SyncBlendingOutChangeMaterialTag()
    {
        return;
    }
}

struct FC_LocalChangeMaterialParamRequests : FECSComponent
{
    UPROPERTY()
    TArray<FChangeMaterialParamRequest> Requests;

    FC_LocalChangeMaterialParamRequests()
    {
        return;
    }
}

struct FC_LocalBlendingOutChangeMaterialTag : FECSComponent
{
    FC_LocalBlendingOutChangeMaterialTag()
    {
        return;
    }
}

struct FC_ChangeMaterialRequestUpdatedTag : FECSComponent
{
    FC_ChangeMaterialRequestUpdatedTag()
    {
        return;
    }
}

struct FC_MaterialParamBlendingTag : FECSComponent
{
    FC_MaterialParamBlendingTag()
    {
        return;
    }
}

struct FC_CachedAllChangeMateraialData : FECSComponent
{
    UPROPERTY()
    TArray<FSingleMaterialParamBlendData> CachedData;

    FC_CachedAllChangeMateraialData()
    {
        return;
    }
    int FindCachedOverlayDataIndex(const FName &inout MeshName)
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            bool local_4 = (FName(this[local_1].MeshName) == MeshName);
            if (!(local_4))
            {
                local_4 = false;
            }
            else
            {
                local_4 = this[local_1].bIsOverlayMaterial;
            }
            if (local_4)
            {
                return local_1;
            }
        }
        return -1;
    }
    int FindCachedDataIndex(const FName &inout MeshName, const int MaterialIndex)
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            if (!(this[local_1].bIsOverlayMaterial) && (FName(this[local_1].MeshName) == MeshName) && (this[local_1].MaterialIndex == MaterialIndex))
            {
                return local_1;
            }
        }
        return -1;
    }
}

struct FC_CachedDynamicMaskedMaterialComps : FECSComponent
{
    UPROPERTY()
    TArray<FName> ComponentNames;

    FC_CachedDynamicMaskedMaterialComps()
    {
        return;
    }
}

struct FMaterialIdx
{
    UPROPERTY()
    bool bIsOverlayMaterial;
    UPROPERTY()
    bool bUseSlotName = false;
    UPROPERTY()
    int MaterialIdx;
    UPROPERTY()
    FName MaterialSlotName;
    UPROPERTY()
    FSoftObjectPath MaterialPath;


}

struct FMeshMaterialInfo
{
    UPROPERTY()
    FName MeshName;
    UPROPERTY()
    TArray<FMaterialIdx> Materials;

    FMeshMaterialInfo()
    {
        return;
    }
}

struct FRuntimeSingleMaterialOverride
{
    UPROPERTY()
    FName MeshName;
    UPROPERTY()
    bool bIsOverlayMaterial;
    UPROPERTY()
    int MaterialIdx;
    UPROPERTY()
    FSoftObjectPath OriginMaterialPath;
    UPROPERTY()
    FSoftObjectPath OverrideMaterialPath;
    UPROPERTY()
    FSoftObjectPath CurrentMaterialPath;
    UPROPERTY()
    FFPTime LastUpdatedTime;


}

struct FC_CachedMaterialOverrides : FECSComponent
{
    UPROPERTY()
    TArray<FRuntimeSingleMaterialOverride> MeshMaterialOverrides;

    FC_CachedMaterialOverrides()
    {
        return;
    }
    int FindMeshOverlayMaterialOverridesIndex(const FName &inout MeshName)
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            bool local_4 = (FName(this[local_1].MeshName) == MeshName);
            if (!(local_4))
            {
                local_4 = false;
            }
            else
            {
                local_4 = this[local_1].bIsOverlayMaterial;
            }
            if (local_4)
            {
                return local_1;
            }
        }
        return -1;
    }
    int FindMeshMaterialOverridesIndex(const FName &inout MeshName, const int MaterialIdx)
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            if ((FName(this[local_1].MeshName) == MeshName) && !(this[local_1].bIsOverlayMaterial) && (this[local_1].MaterialIdx == MaterialIdx))
            {
                return local_1;
            }
        }
        return -1;
    }
}

namespace ECSFunc_FC_SyncChangeMaterialParamRequests
{
UFUNCTION()
bool HasSyncChangeMaterialParamRequests(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SyncChangeMaterialParamRequests);
}
FC_SyncChangeMaterialParamRequests& AssignSyncChangeMaterialParamRequests(const FECSEntity &inout Entity, const FC_SyncChangeMaterialParamRequests &inout DefaultValue = FC_SyncChangeMaterialParamRequests())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SyncChangeMaterialParamRequests, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSyncChangeMaterialParamRequests_BP(const FECSEntity &inout Entity, const FC_SyncChangeMaterialParamRequests &inout DefaultValue = FC_SyncChangeMaterialParamRequests())
{
    ECSFunc_FC_SyncChangeMaterialParamRequests::AssignSyncChangeMaterialParamRequests(Entity, DefaultValue);
    return;
}
FC_SyncChangeMaterialParamRequests& ModifySyncChangeMaterialParamRequests(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SyncChangeMaterialParamRequests));
    return local_12.GetComp();
}
FC_SyncChangeMaterialParamRequests& ModifyOrAddSyncChangeMaterialParamRequests(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SyncChangeMaterialParamRequests));
    return local_12.GetComp();
}
const FC_SyncChangeMaterialParamRequests& GetSyncChangeMaterialParamRequests(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SyncChangeMaterialParamRequests));
    return local_12.GetComp();
}
UFUNCTION()
FC_SyncChangeMaterialParamRequests GetSyncChangeMaterialParamRequests_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SyncChangeMaterialParamRequests& local_4 = ECSFunc_FC_SyncChangeMaterialParamRequests::GetSyncChangeMaterialParamRequests(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SyncChangeMaterialParamRequests();
}
const FC_SyncChangeMaterialParamRequests GetDefaultedSyncChangeMaterialParamRequests(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SyncChangeMaterialParamRequests __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SyncChangeMaterialParamRequests);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_SyncChangeMaterialParamRequests GetDefaultedSyncChangeMaterialParamRequests_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SyncChangeMaterialParamRequests::GetDefaultedSyncChangeMaterialParamRequests(Entity);
}
UFUNCTION()
bool RemoveSyncChangeMaterialParamRequests(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SyncChangeMaterialParamRequests);
}
}
FECSMonitorRuntimeView __GetMonitorSyncChangeMaterialParamRequestsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SyncChangeMaterialParamRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncChangeMaterialParamRequestsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SyncChangeMaterialParamRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncChangeMaterialParamRequestsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SyncChangeMaterialParamRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncChangeMaterialParamRequestsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SyncChangeMaterialParamRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncChangeMaterialParamRequestsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SyncChangeMaterialParamRequests, bFixedFrame, bMustHandleAll);
}
void __MonitorSyncChangeMaterialParamRequestsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SyncChangeMaterialParamRequests, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncChangeMaterialParamRequestsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SyncChangeMaterialParamRequests, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncChangeMaterialParamRequestsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SyncChangeMaterialParamRequests, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SyncBlendingOutChangeMaterialTag
{
UFUNCTION()
bool HasSyncBlendingOutChangeMaterialTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SyncBlendingOutChangeMaterialTag);
}
FC_SyncBlendingOutChangeMaterialTag& AssignSyncBlendingOutChangeMaterialTag(const FECSEntity &inout Entity, const FC_SyncBlendingOutChangeMaterialTag &inout DefaultValue = FC_SyncBlendingOutChangeMaterialTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SyncBlendingOutChangeMaterialTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSyncBlendingOutChangeMaterialTag_BP(const FECSEntity &inout Entity, const FC_SyncBlendingOutChangeMaterialTag &inout DefaultValue = FC_SyncBlendingOutChangeMaterialTag())
{
    ECSFunc_FC_SyncBlendingOutChangeMaterialTag::AssignSyncBlendingOutChangeMaterialTag(Entity, DefaultValue);
    return;
}
FC_SyncBlendingOutChangeMaterialTag& ModifySyncBlendingOutChangeMaterialTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SyncBlendingOutChangeMaterialTag));
    return local_12.GetComp();
}
FC_SyncBlendingOutChangeMaterialTag& ModifyOrAddSyncBlendingOutChangeMaterialTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SyncBlendingOutChangeMaterialTag));
    return local_12.GetComp();
}
const FC_SyncBlendingOutChangeMaterialTag& GetSyncBlendingOutChangeMaterialTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SyncBlendingOutChangeMaterialTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_SyncBlendingOutChangeMaterialTag GetSyncBlendingOutChangeMaterialTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SyncBlendingOutChangeMaterialTag& local_4 = ECSFunc_FC_SyncBlendingOutChangeMaterialTag::GetSyncBlendingOutChangeMaterialTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SyncBlendingOutChangeMaterialTag();
}
const FC_SyncBlendingOutChangeMaterialTag GetDefaultedSyncBlendingOutChangeMaterialTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SyncBlendingOutChangeMaterialTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SyncBlendingOutChangeMaterialTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_SyncBlendingOutChangeMaterialTag GetDefaultedSyncBlendingOutChangeMaterialTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SyncBlendingOutChangeMaterialTag::GetDefaultedSyncBlendingOutChangeMaterialTag(Entity);
}
UFUNCTION()
bool RemoveSyncBlendingOutChangeMaterialTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SyncBlendingOutChangeMaterialTag);
}
}
FECSMonitorRuntimeView __GetMonitorSyncBlendingOutChangeMaterialTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SyncBlendingOutChangeMaterialTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncBlendingOutChangeMaterialTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SyncBlendingOutChangeMaterialTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncBlendingOutChangeMaterialTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SyncBlendingOutChangeMaterialTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncBlendingOutChangeMaterialTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SyncBlendingOutChangeMaterialTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncBlendingOutChangeMaterialTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SyncBlendingOutChangeMaterialTag, bFixedFrame, bMustHandleAll);
}
void __MonitorSyncBlendingOutChangeMaterialTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SyncBlendingOutChangeMaterialTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncBlendingOutChangeMaterialTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SyncBlendingOutChangeMaterialTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncBlendingOutChangeMaterialTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SyncBlendingOutChangeMaterialTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LocalChangeMaterialParamRequests
{
UFUNCTION()
bool HasLocalChangeMaterialParamRequests(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LocalChangeMaterialParamRequests);
}
FC_LocalChangeMaterialParamRequests& AssignLocalChangeMaterialParamRequests(const FECSEntity &inout Entity, const FC_LocalChangeMaterialParamRequests &inout DefaultValue = FC_LocalChangeMaterialParamRequests())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LocalChangeMaterialParamRequests, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLocalChangeMaterialParamRequests_BP(const FECSEntity &inout Entity, const FC_LocalChangeMaterialParamRequests &inout DefaultValue = FC_LocalChangeMaterialParamRequests())
{
    ECSFunc_FC_LocalChangeMaterialParamRequests::AssignLocalChangeMaterialParamRequests(Entity, DefaultValue);
    return;
}
FC_LocalChangeMaterialParamRequests& ModifyLocalChangeMaterialParamRequests(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LocalChangeMaterialParamRequests));
    return local_12.GetComp();
}
FC_LocalChangeMaterialParamRequests& ModifyOrAddLocalChangeMaterialParamRequests(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LocalChangeMaterialParamRequests));
    return local_12.GetComp();
}
const FC_LocalChangeMaterialParamRequests& GetLocalChangeMaterialParamRequests(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LocalChangeMaterialParamRequests));
    return local_12.GetComp();
}
UFUNCTION()
FC_LocalChangeMaterialParamRequests GetLocalChangeMaterialParamRequests_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LocalChangeMaterialParamRequests __r;
    bValid = false;
    bValid = ECSFunc_FC_LocalChangeMaterialParamRequests::GetLocalChangeMaterialParamRequests(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LocalChangeMaterialParamRequests GetDefaultedLocalChangeMaterialParamRequests(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LocalChangeMaterialParamRequests __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LocalChangeMaterialParamRequests);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LocalChangeMaterialParamRequests GetDefaultedLocalChangeMaterialParamRequests_BP(const FECSEntity &inout Entity)
{
    FC_LocalChangeMaterialParamRequests __r;
    return __r;
}
UFUNCTION()
bool RemoveLocalChangeMaterialParamRequests(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LocalChangeMaterialParamRequests);
}
}
FECSMonitorRuntimeView __GetMonitorLocalChangeMaterialParamRequestsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LocalChangeMaterialParamRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalChangeMaterialParamRequestsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LocalChangeMaterialParamRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalChangeMaterialParamRequestsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LocalChangeMaterialParamRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalChangeMaterialParamRequestsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LocalChangeMaterialParamRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalChangeMaterialParamRequestsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LocalChangeMaterialParamRequests, bFixedFrame, bMustHandleAll);
}
void __MonitorLocalChangeMaterialParamRequestsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LocalChangeMaterialParamRequests, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalChangeMaterialParamRequestsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LocalChangeMaterialParamRequests, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalChangeMaterialParamRequestsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LocalChangeMaterialParamRequests, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LocalBlendingOutChangeMaterialTag
{
UFUNCTION()
bool HasLocalBlendingOutChangeMaterialTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LocalBlendingOutChangeMaterialTag);
}
FC_LocalBlendingOutChangeMaterialTag& AssignLocalBlendingOutChangeMaterialTag(const FECSEntity &inout Entity, const FC_LocalBlendingOutChangeMaterialTag &inout DefaultValue = FC_LocalBlendingOutChangeMaterialTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LocalBlendingOutChangeMaterialTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLocalBlendingOutChangeMaterialTag_BP(const FECSEntity &inout Entity, const FC_LocalBlendingOutChangeMaterialTag &inout DefaultValue = FC_LocalBlendingOutChangeMaterialTag())
{
    ECSFunc_FC_LocalBlendingOutChangeMaterialTag::AssignLocalBlendingOutChangeMaterialTag(Entity, DefaultValue);
    return;
}
FC_LocalBlendingOutChangeMaterialTag& ModifyLocalBlendingOutChangeMaterialTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LocalBlendingOutChangeMaterialTag));
    return local_12.GetComp();
}
FC_LocalBlendingOutChangeMaterialTag& ModifyOrAddLocalBlendingOutChangeMaterialTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LocalBlendingOutChangeMaterialTag));
    return local_12.GetComp();
}
const FC_LocalBlendingOutChangeMaterialTag& GetLocalBlendingOutChangeMaterialTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LocalBlendingOutChangeMaterialTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_LocalBlendingOutChangeMaterialTag GetLocalBlendingOutChangeMaterialTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LocalBlendingOutChangeMaterialTag& local_4 = ECSFunc_FC_LocalBlendingOutChangeMaterialTag::GetLocalBlendingOutChangeMaterialTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LocalBlendingOutChangeMaterialTag();
}
const FC_LocalBlendingOutChangeMaterialTag GetDefaultedLocalBlendingOutChangeMaterialTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LocalBlendingOutChangeMaterialTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LocalBlendingOutChangeMaterialTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LocalBlendingOutChangeMaterialTag GetDefaultedLocalBlendingOutChangeMaterialTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LocalBlendingOutChangeMaterialTag::GetDefaultedLocalBlendingOutChangeMaterialTag(Entity);
}
UFUNCTION()
bool RemoveLocalBlendingOutChangeMaterialTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LocalBlendingOutChangeMaterialTag);
}
}
FECSMonitorRuntimeView __GetMonitorLocalBlendingOutChangeMaterialTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LocalBlendingOutChangeMaterialTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalBlendingOutChangeMaterialTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LocalBlendingOutChangeMaterialTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalBlendingOutChangeMaterialTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LocalBlendingOutChangeMaterialTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalBlendingOutChangeMaterialTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LocalBlendingOutChangeMaterialTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalBlendingOutChangeMaterialTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LocalBlendingOutChangeMaterialTag, bFixedFrame, bMustHandleAll);
}
void __MonitorLocalBlendingOutChangeMaterialTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LocalBlendingOutChangeMaterialTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalBlendingOutChangeMaterialTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LocalBlendingOutChangeMaterialTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalBlendingOutChangeMaterialTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LocalBlendingOutChangeMaterialTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ChangeMaterialRequestUpdatedTag
{
UFUNCTION()
bool HasChangeMaterialRequestUpdatedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ChangeMaterialRequestUpdatedTag);
}
FC_ChangeMaterialRequestUpdatedTag& AssignChangeMaterialRequestUpdatedTag(const FECSEntity &inout Entity, const FC_ChangeMaterialRequestUpdatedTag &inout DefaultValue = FC_ChangeMaterialRequestUpdatedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ChangeMaterialRequestUpdatedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignChangeMaterialRequestUpdatedTag_BP(const FECSEntity &inout Entity, const FC_ChangeMaterialRequestUpdatedTag &inout DefaultValue = FC_ChangeMaterialRequestUpdatedTag())
{
    ECSFunc_FC_ChangeMaterialRequestUpdatedTag::AssignChangeMaterialRequestUpdatedTag(Entity, DefaultValue);
    return;
}
FC_ChangeMaterialRequestUpdatedTag& ModifyChangeMaterialRequestUpdatedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ChangeMaterialRequestUpdatedTag));
    return local_12.GetComp();
}
FC_ChangeMaterialRequestUpdatedTag& ModifyOrAddChangeMaterialRequestUpdatedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ChangeMaterialRequestUpdatedTag));
    return local_12.GetComp();
}
const FC_ChangeMaterialRequestUpdatedTag& GetChangeMaterialRequestUpdatedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ChangeMaterialRequestUpdatedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ChangeMaterialRequestUpdatedTag GetChangeMaterialRequestUpdatedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ChangeMaterialRequestUpdatedTag& local_4 = ECSFunc_FC_ChangeMaterialRequestUpdatedTag::GetChangeMaterialRequestUpdatedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ChangeMaterialRequestUpdatedTag();
}
const FC_ChangeMaterialRequestUpdatedTag GetDefaultedChangeMaterialRequestUpdatedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ChangeMaterialRequestUpdatedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ChangeMaterialRequestUpdatedTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_ChangeMaterialRequestUpdatedTag GetDefaultedChangeMaterialRequestUpdatedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ChangeMaterialRequestUpdatedTag::GetDefaultedChangeMaterialRequestUpdatedTag(Entity);
}
UFUNCTION()
bool RemoveChangeMaterialRequestUpdatedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ChangeMaterialRequestUpdatedTag);
}
}
FECSMonitorRuntimeView __GetMonitorChangeMaterialRequestUpdatedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ChangeMaterialRequestUpdatedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChangeMaterialRequestUpdatedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ChangeMaterialRequestUpdatedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChangeMaterialRequestUpdatedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ChangeMaterialRequestUpdatedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChangeMaterialRequestUpdatedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ChangeMaterialRequestUpdatedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChangeMaterialRequestUpdatedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ChangeMaterialRequestUpdatedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorChangeMaterialRequestUpdatedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ChangeMaterialRequestUpdatedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorChangeMaterialRequestUpdatedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ChangeMaterialRequestUpdatedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorChangeMaterialRequestUpdatedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ChangeMaterialRequestUpdatedTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MaterialParamBlendingTag
{
UFUNCTION()
bool HasMaterialParamBlendingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MaterialParamBlendingTag);
}
FC_MaterialParamBlendingTag& AssignMaterialParamBlendingTag(const FECSEntity &inout Entity, const FC_MaterialParamBlendingTag &inout DefaultValue = FC_MaterialParamBlendingTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MaterialParamBlendingTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMaterialParamBlendingTag_BP(const FECSEntity &inout Entity, const FC_MaterialParamBlendingTag &inout DefaultValue = FC_MaterialParamBlendingTag())
{
    ECSFunc_FC_MaterialParamBlendingTag::AssignMaterialParamBlendingTag(Entity, DefaultValue);
    return;
}
FC_MaterialParamBlendingTag& ModifyMaterialParamBlendingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MaterialParamBlendingTag));
    return local_12.GetComp();
}
FC_MaterialParamBlendingTag& ModifyOrAddMaterialParamBlendingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MaterialParamBlendingTag));
    return local_12.GetComp();
}
const FC_MaterialParamBlendingTag& GetMaterialParamBlendingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MaterialParamBlendingTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_MaterialParamBlendingTag GetMaterialParamBlendingTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MaterialParamBlendingTag& local_4 = ECSFunc_FC_MaterialParamBlendingTag::GetMaterialParamBlendingTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MaterialParamBlendingTag();
}
const FC_MaterialParamBlendingTag GetDefaultedMaterialParamBlendingTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MaterialParamBlendingTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MaterialParamBlendingTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_MaterialParamBlendingTag GetDefaultedMaterialParamBlendingTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MaterialParamBlendingTag::GetDefaultedMaterialParamBlendingTag(Entity);
}
UFUNCTION()
bool RemoveMaterialParamBlendingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MaterialParamBlendingTag);
}
}
FECSMonitorRuntimeView __GetMonitorMaterialParamBlendingTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MaterialParamBlendingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMaterialParamBlendingTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MaterialParamBlendingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMaterialParamBlendingTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MaterialParamBlendingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMaterialParamBlendingTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MaterialParamBlendingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMaterialParamBlendingTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MaterialParamBlendingTag, bFixedFrame, bMustHandleAll);
}
void __MonitorMaterialParamBlendingTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MaterialParamBlendingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMaterialParamBlendingTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MaterialParamBlendingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMaterialParamBlendingTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MaterialParamBlendingTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CachedAllChangeMateraialData
{
UFUNCTION()
bool HasCachedAllChangeMateraialData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CachedAllChangeMateraialData);
}
FC_CachedAllChangeMateraialData& AssignCachedAllChangeMateraialData(const FECSEntity &inout Entity, const FC_CachedAllChangeMateraialData &inout DefaultValue = FC_CachedAllChangeMateraialData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CachedAllChangeMateraialData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCachedAllChangeMateraialData_BP(const FECSEntity &inout Entity, const FC_CachedAllChangeMateraialData &inout DefaultValue = FC_CachedAllChangeMateraialData())
{
    ECSFunc_FC_CachedAllChangeMateraialData::AssignCachedAllChangeMateraialData(Entity, DefaultValue);
    return;
}
FC_CachedAllChangeMateraialData& ModifyCachedAllChangeMateraialData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CachedAllChangeMateraialData));
    return local_12.GetComp();
}
FC_CachedAllChangeMateraialData& ModifyOrAddCachedAllChangeMateraialData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CachedAllChangeMateraialData));
    return local_12.GetComp();
}
const FC_CachedAllChangeMateraialData& GetCachedAllChangeMateraialData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CachedAllChangeMateraialData));
    return local_12.GetComp();
}
UFUNCTION()
FC_CachedAllChangeMateraialData GetCachedAllChangeMateraialData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CachedAllChangeMateraialData __r;
    bValid = false;
    bValid = ECSFunc_FC_CachedAllChangeMateraialData::GetCachedAllChangeMateraialData(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CachedAllChangeMateraialData GetDefaultedCachedAllChangeMateraialData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CachedAllChangeMateraialData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CachedAllChangeMateraialData);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_CachedAllChangeMateraialData GetDefaultedCachedAllChangeMateraialData_BP(const FECSEntity &inout Entity)
{
    FC_CachedAllChangeMateraialData __r;
    return __r;
}
UFUNCTION()
bool RemoveCachedAllChangeMateraialData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CachedAllChangeMateraialData);
}
}
FECSMonitorRuntimeView __GetMonitorCachedAllChangeMateraialDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CachedAllChangeMateraialData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCachedAllChangeMateraialDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CachedAllChangeMateraialData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCachedAllChangeMateraialDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CachedAllChangeMateraialData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCachedAllChangeMateraialDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CachedAllChangeMateraialData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCachedAllChangeMateraialDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CachedAllChangeMateraialData, bFixedFrame, bMustHandleAll);
}
void __MonitorCachedAllChangeMateraialDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CachedAllChangeMateraialData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCachedAllChangeMateraialDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CachedAllChangeMateraialData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCachedAllChangeMateraialDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CachedAllChangeMateraialData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CachedDynamicMaskedMaterialComps
{
UFUNCTION()
bool HasCachedDynamicMaskedMaterialComps(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CachedDynamicMaskedMaterialComps);
}
FC_CachedDynamicMaskedMaterialComps& AssignCachedDynamicMaskedMaterialComps(const FECSEntity &inout Entity, const FC_CachedDynamicMaskedMaterialComps &inout DefaultValue = FC_CachedDynamicMaskedMaterialComps())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CachedDynamicMaskedMaterialComps, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCachedDynamicMaskedMaterialComps_BP(const FECSEntity &inout Entity, const FC_CachedDynamicMaskedMaterialComps &inout DefaultValue = FC_CachedDynamicMaskedMaterialComps())
{
    ECSFunc_FC_CachedDynamicMaskedMaterialComps::AssignCachedDynamicMaskedMaterialComps(Entity, DefaultValue);
    return;
}
FC_CachedDynamicMaskedMaterialComps& ModifyCachedDynamicMaskedMaterialComps(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CachedDynamicMaskedMaterialComps));
    return local_12.GetComp();
}
FC_CachedDynamicMaskedMaterialComps& ModifyOrAddCachedDynamicMaskedMaterialComps(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CachedDynamicMaskedMaterialComps));
    return local_12.GetComp();
}
const FC_CachedDynamicMaskedMaterialComps& GetCachedDynamicMaskedMaterialComps(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CachedDynamicMaskedMaterialComps));
    return local_12.GetComp();
}
UFUNCTION()
FC_CachedDynamicMaskedMaterialComps GetCachedDynamicMaskedMaterialComps_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CachedDynamicMaskedMaterialComps __r;
    bValid = false;
    bValid = ECSFunc_FC_CachedDynamicMaskedMaterialComps::GetCachedDynamicMaskedMaterialComps(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CachedDynamicMaskedMaterialComps GetDefaultedCachedDynamicMaskedMaterialComps(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CachedDynamicMaskedMaterialComps __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CachedDynamicMaskedMaterialComps);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_CachedDynamicMaskedMaterialComps GetDefaultedCachedDynamicMaskedMaterialComps_BP(const FECSEntity &inout Entity)
{
    FC_CachedDynamicMaskedMaterialComps __r;
    return __r;
}
UFUNCTION()
bool RemoveCachedDynamicMaskedMaterialComps(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CachedDynamicMaskedMaterialComps);
}
}
FECSMonitorRuntimeView __GetMonitorCachedDynamicMaskedMaterialCompsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CachedDynamicMaskedMaterialComps, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCachedDynamicMaskedMaterialCompsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CachedDynamicMaskedMaterialComps, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCachedDynamicMaskedMaterialCompsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CachedDynamicMaskedMaterialComps, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCachedDynamicMaskedMaterialCompsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CachedDynamicMaskedMaterialComps, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCachedDynamicMaskedMaterialCompsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CachedDynamicMaskedMaterialComps, bFixedFrame, bMustHandleAll);
}
void __MonitorCachedDynamicMaskedMaterialCompsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CachedDynamicMaskedMaterialComps, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCachedDynamicMaskedMaterialCompsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CachedDynamicMaskedMaterialComps, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCachedDynamicMaskedMaterialCompsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CachedDynamicMaskedMaterialComps, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CachedMaterialOverrides
{
UFUNCTION()
bool HasCachedMaterialOverrides(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CachedMaterialOverrides);
}
FC_CachedMaterialOverrides& AssignCachedMaterialOverrides(const FECSEntity &inout Entity, const FC_CachedMaterialOverrides &inout DefaultValue = FC_CachedMaterialOverrides())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CachedMaterialOverrides, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCachedMaterialOverrides_BP(const FECSEntity &inout Entity, const FC_CachedMaterialOverrides &inout DefaultValue = FC_CachedMaterialOverrides())
{
    ECSFunc_FC_CachedMaterialOverrides::AssignCachedMaterialOverrides(Entity, DefaultValue);
    return;
}
FC_CachedMaterialOverrides& ModifyCachedMaterialOverrides(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CachedMaterialOverrides));
    return local_12.GetComp();
}
FC_CachedMaterialOverrides& ModifyOrAddCachedMaterialOverrides(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CachedMaterialOverrides));
    return local_12.GetComp();
}
const FC_CachedMaterialOverrides& GetCachedMaterialOverrides(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CachedMaterialOverrides));
    return local_12.GetComp();
}
UFUNCTION()
FC_CachedMaterialOverrides GetCachedMaterialOverrides_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CachedMaterialOverrides __r;
    bValid = false;
    bValid = ECSFunc_FC_CachedMaterialOverrides::GetCachedMaterialOverrides(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CachedMaterialOverrides GetDefaultedCachedMaterialOverrides(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CachedMaterialOverrides __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CachedMaterialOverrides);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_CachedMaterialOverrides GetDefaultedCachedMaterialOverrides_BP(const FECSEntity &inout Entity)
{
    FC_CachedMaterialOverrides __r;
    return __r;
}
UFUNCTION()
bool RemoveCachedMaterialOverrides(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CachedMaterialOverrides);
}
}
FECSMonitorRuntimeView __GetMonitorCachedMaterialOverridesOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CachedMaterialOverrides, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCachedMaterialOverridesOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CachedMaterialOverrides, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCachedMaterialOverridesOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CachedMaterialOverrides, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCachedMaterialOverridesOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CachedMaterialOverrides, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCachedMaterialOverridesOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CachedMaterialOverrides, bFixedFrame, bMustHandleAll);
}
void __MonitorCachedMaterialOverridesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CachedMaterialOverrides, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCachedMaterialOverridesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CachedMaterialOverrides, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCachedMaterialOverridesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CachedMaterialOverrides, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FFloatParamBlendData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FFloatParamBlendData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FFloatParamBlendData
{
int __IndexOf_RequestData()
{
    return 0;
}
int __IndexOf_DefaultValue()
{
    return 1;
}
int __IndexOf_StartValue()
{
    return 2;
}
int __IndexOf_CurrentValue()
{
    return 3;
}
int __IndexOf_StartTime()
{
    return 4;
}
int __IndexOf_LastUpdatedTime()
{
    return 5;
}
int __IndexOf_bBlendFinish()
{
    return 6;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FVectorParamBlendData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FVectorParamBlendData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FVectorParamBlendData
{
int __IndexOf_RequestData()
{
    return 0;
}
int __IndexOf_DefaultValue()
{
    return 1;
}
int __IndexOf_StartValue()
{
    return 2;
}
int __IndexOf_CurrentValue()
{
    return 3;
}
int __IndexOf_StartTime()
{
    return 4;
}
int __IndexOf_LastUpdatedTime()
{
    return 5;
}
int __IndexOf_bBlendFinish()
{
    return 6;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FTextureParamBlendData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FTextureParamBlendData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FTextureParamBlendData
{
int __IndexOf_RequestData()
{
    return 0;
}
int __IndexOf_DefaultTexture()
{
    return 1;
}
int __IndexOf_CurrentTexture()
{
    return 2;
}
int __IndexOf_StartTime()
{
    return 3;
}
int __IndexOf_BlendOutTime()
{
    return 4;
}
int __IndexOf_LastUpdatedTime()
{
    return 5;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FSingleMaterialParamRequestData &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FSingleMaterialParamRequestData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FSingleMaterialParamRequestData
{
int __IndexOf_bUseLogicName()
{
    return 0;
}
int __IndexOf_MeshName()
{
    return 1;
}
int __IndexOf_bIsOverlayMaterial()
{
    return 2;
}
int __IndexOf_bApplyToAllSlot()
{
    return 3;
}
int __IndexOf_bUseSlotName()
{
    return 4;
}
int __IndexOf_MaterialIndex()
{
    return 5;
}
int __IndexOf_MaterialSlotName()
{
    return 6;
}
int __IndexOf_OverrideMaterialPath()
{
    return 7;
}
int __IndexOf_bEnableDynamicMaskedMaterial()
{
    return 8;
}
int __IndexOf_FloatParams()
{
    return 9;
}
int __IndexOf_VectorParams()
{
    return 10;
}
int __IndexOf_TextureParams()
{
    return 11;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FChangeMaterialParamRequest &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FChangeMaterialParamRequest &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FChangeMaterialParamRequest
{
int __IndexOf_RequestName()
{
    return 0;
}
int __IndexOf_StartTime()
{
    return 1;
}
int __IndexOf_Data()
{
    return 2;
}
int __IndexOf_bIsBlendingOut()
{
    return 3;
}
int __IndexOf_BlendOutStartTime()
{
    return 4;
}
int __IndexOf_BlendOutTime()
{
    return 5;
}
int __IndexOf_BlendOutCurvePath()
{
    return 6;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SyncChangeMaterialParamRequests &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SyncChangeMaterialParamRequests &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SyncChangeMaterialParamRequests &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SyncChangeMaterialParamRequests
{
int __IndexOf_Requests()
{
    return 0;
}
}
