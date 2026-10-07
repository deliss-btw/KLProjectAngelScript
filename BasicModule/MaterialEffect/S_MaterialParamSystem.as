
const FConsoleVariable CVar_Material_WarnMissingParam = FConsoleVariable();

class US_MaterialParamSystem : UECSScriptSystem
{
    US_MaterialParamSystem()
    {
        return;
    }
    TSoftObjectPtr<UMaterialInterface> FindMaterialFromRequestData(const UMeshComponent Mesh, const FSoftObjectPath &inout OverrideMaterialPath, const FSingleMaterialParamBlendData &inout BlendData) const
    {
        UMaterialInterface local_20;
        TSoftObjectPtr<UMaterialInterface> local_10;
        int local_11 = BlendData.MaterialIndex;
        if (OverrideMaterialPath.IsNull())
        {
            if (BlendData.bIsOverlayMaterial)
            {
                local_20 = Mesh.GetOverlayMaterial();
            }
            else
            {
                local_20 = Mesh.GetMaterial(local_11);
            }
            local_10 = local_20;
        }
        else
        {
            local_10 = TSoftObjectPtr<UMaterialInterface>(OverrideMaterialPath);
        }
        if (!(local_10.IsValid()))
        {
            if (BlendData.bIsOverlayMaterial)
            {
                XWarning(ELog(55), FString().Append("FindMaterialFromRequestData: failed to get overlay material, Mesh: ").Append(Mesh));
            }
            else
            {
                XWarning(ELog(55), FString().Append("FindMaterialFromRequestData: failed to get material Idx: ").Append(local_11).Append(" Mesh: ").Append(Mesh));
            }
        }
        return local_10;
    }
    TSoftObjectPtr<UMaterialInterface> FindMaterialFromRequestData(const UDecalComponent Decal, const FSoftObjectPath &inout OverrideMaterialPath, const FSingleMaterialParamBlendData &inout BlendData) const
    {
        TSoftObjectPtr<UMaterialInterface> local_10;
        if (OverrideMaterialPath.IsNull())
        {
            local_10 = Decal.GetDecalMaterial();
        }
        else
        {
            local_10 = TSoftObjectPtr<UMaterialInterface>(OverrideMaterialPath);
        }
        if (!(local_10.IsValid()))
        {
            XWarning(ELog(55), FString().Append("FindMaterialFromRequestData: failed to get decal material, Decal: ").Append(Decal));
        }
        return local_10;
    }
    void BuildFloatParamForBlendData(const FChangeMaterialParamRequest &inout Request, const TSoftObjectPtr<UMaterialInterface> &inout Mat, const FFloatParamRequestData &inout RequestParam, FFloatParamBlendData &inout OutFloatParam, const bool bAllowMissingParam = false) const
    {
        float32 local_3;
        UMaterialInterface local_10;
        if (!(Mat.IsValid()))
        {
            return;
        }
        float32 local_2 = 0.0f;
        if (RequestParam.bUseMaterialParameterInfo)
        {
            int local_5 = int(RequestParam.LayerOrBlendIndex);
        }
        else
        {
        }
        if (RequestParam.bUseMaterialParameterInfo)
        {
            int local_7 = int(RequestParam.ParamAssociation);
        }
        else
        {
        }
        if (GameMaterial::GetFloatParameterDefaultValue(local_2, local_10, RequestParam.ParamName))
        {
            if (Request.GetbIsBlendingOut())
            {
                OutFloatParam.GetModify_RequestData().bUseNormalizedBlendInCurve = true;
                OutFloatParam.GetModify_RequestData().BlendTime = Request.GetBlendOutTime();
                OutFloatParam.GetModify_RequestData().BlendCurvePath = Request.GetBlendOutCurvePath();
                if (OutFloatParam.GetRequestData().bSpecificBlendoutValue)
                {
                    local_3 = OutFloatParam.GetRequestData().BlendoutValue;
                }
                else
                {
                    local_3 = local_2;
                }
                OutFloatParam.GetModify_RequestData().TargetValue = local_3;
                OutFloatParam.SetStartValue(OutFloatParam.GetCurrentValue());
            }
            else
            {
                OutFloatParam.SetRequestData(RequestParam);
                OutFloatParam.SetStartValue(local_2);
            }
            OutFloatParam.SetDefaultValue(local_2);
            OutFloatParam.SetStartTime(Request.GetStartTime());
            OutFloatParam.SetLastUpdatedTime(ECS::GetContextTime());
            OutFloatParam.SetbBlendFinish(false);
            return;
        }
        if (!(bAllowMissingParam) || CVar_Material_WarnMissingParam.GetBool())
        {
            FString local_28 = ((FString("BuildFloatParamForBlendData: failed to get default value for float param: ") + RequestParam.ParamName) + " Material: ");
            FString local_32_2 = Mat.ToString();
        }
        return;
    }
    void BuildVectorParamForBlendData(const FChangeMaterialParamRequest &inout Request, const TSoftObjectPtr<UMaterialInterface> &inout Mat, const FVectorParamRequestData &inout RequestParam, FVectorParamBlendData &inout OutVectorParam, const bool bAllowMissingParam = false) const
    {
        UMaterialInterface local_12;
        if (!(Mat.IsValid()))
        {
            return;
        }
        FLinearColor local_5;
        if (RequestParam.bUseMaterialParameterInfo)
        {
            int local_7 = int(RequestParam.LayerOrBlendIndex);
        }
        else
        {
        }
        if (RequestParam.bUseMaterialParameterInfo)
        {
            int local_9 = int(RequestParam.ParamAssociation);
        }
        else
        {
        }
        if (GameMaterial::GetVectorParameterDefaultValue(local_5, local_12, RequestParam.ParamName))
        {
            if (Request.GetbIsBlendingOut())
            {
                OutVectorParam.GetModify_RequestData().bUseNormalizedBlendInCurve = true;
                OutVectorParam.GetModify_RequestData().BlendTime = Request.GetBlendOutTime();
                OutVectorParam.GetModify_RequestData().BlendCurvePath = Request.GetBlendOutCurvePath();
                FLinearColor local_26;
                if (OutVectorParam.GetRequestData().bSpecificBlendoutValue)
                {
                    local_26 = OutVectorParam.GetRequestData().BlendoutValue;
                }
                else
                {
                    local_26 = local_5;
                }
                OutVectorParam.GetModify_RequestData().TargetValue = local_26;
                OutVectorParam.SetStartValue(OutVectorParam.GetCurrentValue());
            }
            else
            {
                OutVectorParam.SetRequestData(RequestParam);
                OutVectorParam.SetStartValue(local_5);
            }
            OutVectorParam.SetDefaultValue(local_5);
            OutVectorParam.SetStartTime(Request.GetStartTime());
            OutVectorParam.SetLastUpdatedTime(ECS::GetContextTime());
            OutVectorParam.SetbBlendFinish(false);
            return;
        }
        if (!(bAllowMissingParam) || CVar_Material_WarnMissingParam.GetBool())
        {
            FString local_34 = ((FString("BuildVectorParamForBlendData: failed to get default value for vector param: ") + RequestParam.ParamName) + " Material: ");
            FString local_38_2 = Mat.ToString();
        }
        return;
    }
    void BuildTextureParamForBlendData(const FChangeMaterialParamRequest &inout Request, const TSoftObjectPtr<UMaterialInterface> &inout Mat, const FTextureParamRequestData &inout RequestParam, FTextureParamBlendData &inout OutTextureParam, const bool bAllowMissingParam = false) const
    {
        UTexture local_4;
        UMaterialInterface local_10;
        if (!(Mat.IsValid()))
        {
            return;
        }
        if (RequestParam.bUseMaterialParameterInfo)
        {
            int local_6 = int(RequestParam.LayerOrBlendIndex);
        }
        else
        {
        }
        if (RequestParam.bUseMaterialParameterInfo)
        {
            int local_8 = int(RequestParam.ParamAssociation);
        }
        else
        {
        }
        if (GameMaterial::GetTextureParameterDefaultValue(local_4, local_10, RequestParam.ParamName))
        {
            if (Request.GetbIsBlendingOut())
            {
                OutTextureParam.GetModify_RequestData().TargetTexture = FSoftObjectPath(local_4);
                OutTextureParam.SetBlendOutTime(FFPTime(Request.GetBlendOutTime()));
            }
            else
            {
                OutTextureParam.GetModify_RequestData().TargetTexture = RequestParam.TargetTexture;
                OutTextureParam.SetBlendOutTime(FFPTime(0));
            }
            OutTextureParam.SetDefaultTexture(FSoftObjectPath(local_4));
            OutTextureParam.SetStartTime(Request.GetStartTime());
            OutTextureParam.SetLastUpdatedTime(ECS::GetContextTime());
            return;
        }
        if (!(bAllowMissingParam) || CVar_Material_WarnMissingParam.GetBool())
        {
            FString local_30 = ((FString("BuildTextureParamForBlendData: failed to get default texture for TextureParam: ") + RequestParam.ParamName) + " Material: ");
            FString local_34_2 = Mat.ToString();
        }
        return;
    }
    bool UpdateMaterialParamForActor(const FECSEntity &inout Entity, TArray<FSingleMaterialParamBlendData> &inout BlendDataList, const FFPTime &inout CurrentTime) const
    {
        bool local_1 = false;
        int local_6 = BlendDataList.Num() - 1;
        for (; local_6 >= 0; --local_6)
        {
            FSingleMaterialParamBlendData& local_8 = BlendDataList[local_6];
            FECSActorComponentProxy local_12 = Entity.ModifyActorComponent(local_8.MeshName);
            FECSMeshComponentProxy local_20 = local_12.CastToMeshComponent();
            if (local_20)
            {
                if (local_8.bIsOverlayMaterial)
                {
                    FECSViewData_Material& local_26 = local_20.ModifyOverlayMaterial();
                    bool local_2 = this.UpdateFloatParameters(local_8.FloatParams, local_26, CurrentTime);
                    bool local_27 = this.UpdateVectorParameters(local_8.VectorParams, local_26, CurrentTime);
                    bool local_28 = this.UpdateTextureParameters(local_8.TextureParams, local_26, CurrentTime);
                    local_1 = local_1 || local_2 || local_27 || local_28;
                }
                else
                {
                    FECSViewData_Material& local_26_2 = local_20.ModifyMaterial(int(local_8.MaterialIndex));
                    bool local_29 = this.UpdateFloatParameters(local_8.FloatParams, local_26_2, CurrentTime);
                    bool local_2_2 = this.UpdateVectorParameters(local_8.VectorParams, local_26_2, CurrentTime);
                    bool local_27_2 = this.UpdateTextureParameters(local_8.TextureParams, local_26_2, CurrentTime);
                    local_1 = local_1 || local_29 || local_2_2 || local_27_2;
                }
                continue;
            }
            FECSDecalComponentProxy local_34 = local_12.CastToDecalComponent();
            if (local_34)
            {
                FECSViewData_Material& local_26_3 = local_34.ModifyMaterial();
                bool local_28_2 = this.UpdateFloatParameters(local_8.FloatParams, local_26_3, CurrentTime);
                bool local_27_3 = this.UpdateVectorParameters(local_8.VectorParams, local_26_3, CurrentTime);
                bool local_29_2 = this.UpdateTextureParameters(local_8.TextureParams, local_26_3, CurrentTime);
                local_1 = local_1 || local_28_2 || local_27_3 || local_29_2;
            }
        }
        return local_1;
    }
    bool UpdateFloatParameters(TArray<FFloatParamBlendData> &inout FloatParams, FECSViewData_Material &inout Mat, const FFPTime &inout CurrentTime) const
    {
        UCurveFloat local_20;
        bool local_1 = false;
        int local_6 = FloatParams.Num() - 1;
        for (; local_6 >= 0; --local_6)
        {
            FFloatParamBlendData& local_8 = FloatParams[local_6];
            if (local_8.GetbBlendFinish())
            {
                continue;
            }
            float32 local_15 = float32(((CurrentTime - local_8.GetStartTime()).ToSeconds()));
            bool local_2 = local_8.GetRequestData().bUseNormalizedBlendInCurve;
            if (local_2)
            {
                float32 local_17;
                float32 local_16;
                local_16 = local_8.GetRequestData().TargetValue;
                local_17 = 1.0f;
                float32 local_9 = local_8.GetRequestData().BlendTime;
                if (local_9 > 0.0f)
                {
                    local_17 = local_15 / local_8.GetRequestData().BlendTime;
                    local_20 = Cast<UCurveFloat>(local_8.GetRequestData().BlendCurvePath.TryLoad());
                    if (local_20 != nullptr)
                    {
                        local_17 = local_20.GetFloatValue(local_17);
                    }
                    local_17 = FMath::Clamp(local_17, 0.0f, 1.0f);
                }
                local_16 = FMath::Lerp(local_8.GetStartValue(), local_8.GetRequestData().TargetValue, local_17);
                local_8.SetCurrentValue(local_16);
                this.SetMaterialParamByFloatBlendData(Mat, local_8, local_16);
            }
            else
            {
                local_20 = Cast<UCurveFloat>(local_8.GetRequestData().ValueCurvePath.TryLoad());
                if (local_20 != nullptr)
                {
                    this.SetMaterialParamByFloatBlendData(Mat, local_8, local_20.GetFloatValue(local_15));
                }
            }
            float32 local_25 = local_8.GetRequestData().BlendTime;
            local_8.SetbBlendFinish((local_15 >= local_25));
            local_1 = local_1 || !(local_8.GetbBlendFinish());
        }
        return local_1;
    }
    bool UpdateVectorParameters(TArray<FVectorParamBlendData> &inout VectorParams, FECSViewData_Material &inout Mat, const FFPTime &inout CurrentTime) const
    {
        UCurveFloat local_22;
        UCurveVector local_36;
        bool local_1 = false;
        int local_6 = VectorParams.Num() - 1;
        for (; local_6 >= 0; --local_6)
        {
            FVectorParamBlendData& local_8 = VectorParams[local_6];
            if (local_8.GetbBlendFinish())
            {
                continue;
            }
            float32 local_15 = float32(((CurrentTime - local_8.GetStartTime()).ToSeconds()));
            bool local_2 = local_8.GetRequestData().bUseNormalizedBlendInCurve;
            if (local_2)
            {
                float32 local_27;
                FLinearColor local_19 = FLinearColor(local_8.GetRequestData().TargetValue);
                local_22 = Cast<UCurveFloat>(local_8.GetRequestData().BlendCurvePath.TryLoad());
                local_27 = 1.0f;
                if (local_8.GetRequestData().BlendTime > 0.0f)
                {
                    local_27 = local_15 / local_8.GetRequestData().BlendTime;
                    if (local_22 != nullptr)
                    {
                        local_27 = local_22.GetFloatValue(local_27);
                    }
                    local_27 = FMath::Clamp(local_27, 0.0f, 1.0f);
                }
                local_19 = FMath::Lerp(local_8.GetStartValue(), local_8.GetRequestData().TargetValue, local_27);
                local_8.SetCurrentValue(local_19);
                this.SetMaterialParamByVectorBlendData(Mat, local_8, local_19);
            }
            else
            {
                local_36 = Cast<UCurveVector>(local_8.GetRequestData().ValueCurvePath.TryLoad());
                if (local_36 != nullptr)
                {
                    this.SetMaterialParamByVectorBlendData(Mat, local_8, FLinearColor(local_36.GetVectorValue(local_15), 1.0f));
                }
            }
            float32 local_9_2 = local_8.GetRequestData().BlendTime;
            local_8.SetbBlendFinish((local_15 >= local_9_2));
            local_1 = local_1 || !(local_8.GetbBlendFinish());
        }
        return local_1;
    }
    bool UpdateTextureParameters(TArray<FTextureParamBlendData> &inout TextureParams, FECSViewData_Material &inout Mat, const FFPTime &inout CurrentTime) const
    {
        bool local_1 = false;
        int local_6 = TextureParams.Num() - 1;
        for (; local_6 >= 0; --local_6)
        {
            FTextureParamBlendData& local_8 = TextureParams[local_6];
            bool local_2 = (local_8.GetBlendOutTime().opCmp((float32(((CurrentTime - local_8.GetStartTime()).ToSeconds())))) <= 0);
            local_1 = local_1 || !(local_2);
            if (!(local_2) || (FSoftObjectPath(local_8.GetRequestData().TargetTexture) == local_8.GetCurrentTexture()))
            {
                continue;
            }
            local_8.SetCurrentTexture(local_8.GetRequestData().TargetTexture);
            TSoftObjectPtr<UTexture> local_44 = TSoftObjectPtr<UTexture>(local_8.GetCurrentTexture());
            if (local_44.IsValid())
            {
                this.SetMaterialParamByTextureBlendData(Mat, local_8, local_44);
            }
        }
        return local_1;
    }
    void BuildCachedMaterialOverrides(const FECSEntity &inout Entity, const UMeshComponent Mesh, const FSingleMaterialParamRequestData &inout RequestData) const
    {
        int local_6 = 0;
        int local_7 = -1;
        int local_9 = RequestData.GetMaterialIndex();
        FSoftObjectPath local_18;
        if (RequestData.GetbIsOverlayMaterial())
        {
            local_7 = local_6.FindMeshOverlayMaterialOverridesIndex(Mesh.GetFName());
            local_18 = ::FMaterialUtils::MakeSoftObjectPathForMaterial(Mesh.GetOverlayMaterial());
        }
        else
        {
            if (RequestData.GetbUseSlotName())
            {
                local_9 = Mesh.GetMaterialIndex(RequestData.GetMaterialSlotName());
            }
            if (local_9 < 0)
            {
                XWarning(ELog(55), FString().Append("BuildCachedMaterialOverrides: invalid MaterialIndex ").Append(local_9).Append(" on Mesh: ").Append(Mesh).Append(", bUseSlotName: ").Append(RequestData.GetbUseSlotName()).Append(", SlotName: ").Append(RequestData.GetMaterialSlotName()));
                return;
            }
            local_7 = local_6.FindMeshMaterialOverridesIndex(Mesh.GetFName(), local_9);
            local_18 = ::FMaterialUtils::MakeSoftObjectPathForMaterial(Mesh.GetMaterial(local_9));
        }
        if (local_7 == -1)
        {
            FRuntimeSingleMaterialOverride local_68;
            local_68.MeshName = Mesh.GetFName();
            local_68.MaterialIdx = local_9;
            local_68.bIsOverlayMaterial = RequestData.GetbIsOverlayMaterial();
            local_68.OriginMaterialPath = local_18;
            local_6.MeshMaterialOverrides.Add(local_68);
            local_7 = local_6.MeshMaterialOverrides.Num() - 1;
        }
        FRuntimeSingleMaterialOverride& local_72 = local_6.MeshMaterialOverrides[local_7];
        local_72.OverrideMaterialPath = RequestData.GetOverrideMaterialPath();
        local_72.LastUpdatedTime = ECS::GetContextTime();
        return;
    }
    void BuildCachedMaterialOverrides(const FECSEntity &inout Entity, const UDecalComponent Decal, const FSingleMaterialParamRequestData &inout RequestData) const
    {
        int local_6 = 0;
        int local_7 = 0;
        int local_8 = local_6.FindMeshMaterialOverridesIndex(Decal.GetFName(), local_7);
        FSoftObjectPath local_30 = ::FMaterialUtils::MakeSoftObjectPathForMaterial(Decal.GetDecalMaterial());
        if (local_8 == -1)
        {
            FRuntimeSingleMaterialOverride local_62;
            local_62.MeshName = Decal.GetFName();
            local_62.MaterialIdx = local_7;
            local_62.bIsOverlayMaterial = false;
            local_62.OriginMaterialPath = local_30;
            local_6.MeshMaterialOverrides.Add(local_62);
            local_8 = local_6.MeshMaterialOverrides.Num() - 1;
        }
        FRuntimeSingleMaterialOverride& local_66 = local_6.MeshMaterialOverrides[local_8];
        local_66.OverrideMaterialPath = RequestData.GetOverrideMaterialPath();
        local_66.LastUpdatedTime = ECS::GetContextTime();
        return;
    }
    void BuildCachedChangeMaterialData(const UMeshComponent Mesh, const FChangeMaterialParamRequest &inout Request, const FSingleMaterialParamRequestData &inout RequestData, FC_CachedAllChangeMateraialData &inout CachedAllDatas) const
    {
        int local_6;
        if (RequestData.GetbIsOverlayMaterial())
        {
            this.BuildCachedChangeSingleMaterialData(Mesh, Request, RequestData, CachedAllDatas, CachedAllDatas.FindCachedOverlayDataIndex(Mesh.GetFName()), INDEX_NONE);
            return;
        }
        if (RequestData.GetbApplyToAllSlot())
        {
            int local_5 = 0;
            for (; local_5 < Mesh.GetNumMaterials(); )
            {
                local_6 = CachedAllDatas.FindCachedDataIndex(Mesh.GetFName(), local_5);
                this.BuildCachedChangeSingleMaterialData(Mesh, Request, RequestData, CachedAllDatas, local_6, local_5);
                ++local_5;
            }
            return;
        }
        local_6 = RequestData.GetMaterialIndex();
        if (RequestData.GetbUseSlotName())
        {
            local_6 = Mesh.GetMaterialIndex(RequestData.GetMaterialSlotName());
        }
        int local_2 = CachedAllDatas.FindCachedDataIndex(Mesh.GetFName(), local_6);
        this.BuildCachedChangeSingleMaterialData(Mesh, Request, RequestData, CachedAllDatas, local_2, local_6);
        return;
    }
    void BuildCachedChangeMaterialData(const UDecalComponent Decal, const FChangeMaterialParamRequest &inout Request, const FSingleMaterialParamRequestData &inout RequestData, FC_CachedAllChangeMateraialData &inout CachedAllDatas) const
    {
        int local_1 = 0;
        int local_2 = CachedAllDatas.FindCachedDataIndex(Decal.GetFName(), local_1);
        this.BuildCachedChangeSingleMaterialData(Decal, Request, RequestData, CachedAllDatas, local_2, local_1);
        return;
    }
    void BuildCachedChangeSingleMaterialData(const UMeshComponent Mesh, const FChangeMaterialParamRequest &inout Request, const FSingleMaterialParamRequestData &inout RequestData, FC_CachedAllChangeMateraialData &inout CachedAllDatas, const int InCacheDataIdx, const int MaterialIndex) const
    {
        int local_1 = InCacheDataIdx;
        if (InCacheDataIdx == -1)
        {
            FSingleMaterialParamBlendData local_22;
            local_22.MeshName = Mesh.GetFName();
            local_22.bIsOverlayMaterial = RequestData.GetbIsOverlayMaterial();
            local_22.MaterialIndex = MaterialIndex;
            CachedAllDatas.CachedData.Add(local_22);
            local_1 = CachedAllDatas.CachedData.Num() - 1;
        }
        FSingleMaterialParamBlendData& local_28 = CachedAllDatas.CachedData[local_1];
        local_28.bEnableDynamicMaskedMaterial = RequestData.GetbEnableDynamicMaskedMaterial();
        TSoftObjectPtr<UMaterialInterface> local_56 = this.FindMaterialFromRequestData(Mesh, RequestData.GetOverrideMaterialPath(), local_28);
        for (auto& local_70 : RequestData.GetFloatParams())
        {
            int local_25 = local_28.FindFloatParamIndex(local_70.ParamName);
            if (local_25 == -1)
            {
                FFloatParamBlendData local_108;
                local_28.FloatParams.Add(local_108);
                local_25 = local_28.FloatParams.Num() - 1;
            }
            FFloatParamBlendData& local_110 = local_28.FloatParams[local_25];
            local_110.GetModify_RequestData().ParamName = local_70.ParamName;
            local_110.GetModify_RequestData().bUseMaterialParameterInfo = local_70.bUseMaterialParameterInfo;
            local_110.GetModify_RequestData().ParamAssociation = (int(local_70.ParamAssociation) != 0);
            local_110.GetModify_RequestData().LayerOrBlendIndex = int(local_70.LayerOrBlendIndex);
            this.BuildFloatParamForBlendData(Request, local_56, local_70, local_110, RequestData.GetbApplyToAllSlot());
        }
        for (auto& local_126 : RequestData.GetVectorParams())
        {
            int local_71 = local_28.FindVectorParamIndex(local_126.ParamName);
            if (local_71 == -1)
            {
                FVectorParamBlendData local_176;
                local_28.VectorParams.Add(local_176);
                local_71 = local_28.VectorParams.Num() - 1;
            }
            FVectorParamBlendData& local_178 = local_28.VectorParams[local_71];
            local_178.GetModify_RequestData().ParamName = local_126.ParamName;
            local_178.GetModify_RequestData().bUseMaterialParameterInfo = local_126.bUseMaterialParameterInfo;
            local_178.GetModify_RequestData().ParamAssociation = (int(local_126.ParamAssociation) != 0);
            local_178.GetModify_RequestData().LayerOrBlendIndex = int(local_126.LayerOrBlendIndex);
            this.BuildVectorParamForBlendData(Request, local_56, local_126, local_178, RequestData.GetbApplyToAllSlot());
        }
        for (auto& local_192 : RequestData.GetTextureParams())
        {
            int local_25_2 = local_28.FindTextureParamIndex(local_192.ParamName);
            if (local_25_2 == -1)
            {
                FTextureParamBlendData local_228;
                local_28.TextureParams.Add(local_228);
                local_25_2 = local_28.TextureParams.Num() - 1;
            }
            FTextureParamBlendData& local_230 = local_28.TextureParams[local_25_2];
            local_230.GetModify_RequestData().ParamName = local_192.ParamName;
            local_230.GetModify_RequestData().bUseMaterialParameterInfo = local_192.bUseMaterialParameterInfo;
            local_230.GetModify_RequestData().ParamAssociation = (int(local_192.ParamAssociation) != 0);
            local_230.GetModify_RequestData().LayerOrBlendIndex = int(local_192.LayerOrBlendIndex);
            this.BuildTextureParamForBlendData(Request, local_56, local_192, local_230, RequestData.GetbApplyToAllSlot());
        }
        return;
    }
    void BuildCachedChangeSingleMaterialData(const UDecalComponent Decal, const FChangeMaterialParamRequest &inout Request, const FSingleMaterialParamRequestData &inout RequestData, FC_CachedAllChangeMateraialData &inout CachedAllDatas, const int InCacheDataIdx, const int MaterialIndex) const
    {
        int local_1 = InCacheDataIdx;
        if (InCacheDataIdx == -1)
        {
            FSingleMaterialParamBlendData local_22;
            local_22.MeshName = Decal.GetFName();
            local_22.bIsOverlayMaterial = false;
            local_22.MaterialIndex = MaterialIndex;
            CachedAllDatas.CachedData.Add(local_22);
            local_1 = CachedAllDatas.CachedData.Num() - 1;
        }
        FSingleMaterialParamBlendData& local_28 = CachedAllDatas.CachedData[local_1];
        local_28.bEnableDynamicMaskedMaterial = RequestData.GetbEnableDynamicMaskedMaterial();
        TSoftObjectPtr<UMaterialInterface> local_56 = this.FindMaterialFromRequestData(Decal, RequestData.GetOverrideMaterialPath(), local_28);
        for (auto& local_70 : RequestData.GetFloatParams())
        {
            int local_25 = local_28.FindFloatParamIndex(local_70.ParamName);
            if (local_25 == -1)
            {
                FFloatParamBlendData local_108;
                local_28.FloatParams.Add(local_108);
                local_25 = local_28.FloatParams.Num() - 1;
            }
            FFloatParamBlendData& local_110 = local_28.FloatParams[local_25];
            local_110.GetModify_RequestData().ParamName = local_70.ParamName;
            local_110.GetModify_RequestData().bUseMaterialParameterInfo = local_70.bUseMaterialParameterInfo;
            local_110.GetModify_RequestData().ParamAssociation = (int(local_70.ParamAssociation) != 0);
            local_110.GetModify_RequestData().LayerOrBlendIndex = int(local_70.LayerOrBlendIndex);
            this.BuildFloatParamForBlendData(Request, local_56, local_70, local_110, RequestData.GetbApplyToAllSlot());
        }
        for (auto& local_126 : RequestData.GetVectorParams())
        {
            int local_71 = local_28.FindVectorParamIndex(local_126.ParamName);
            if (local_71 == -1)
            {
                FVectorParamBlendData local_176;
                local_28.VectorParams.Add(local_176);
                local_71 = local_28.VectorParams.Num() - 1;
            }
            FVectorParamBlendData& local_178 = local_28.VectorParams[local_71];
            local_178.GetModify_RequestData().ParamName = local_126.ParamName;
            local_178.GetModify_RequestData().bUseMaterialParameterInfo = local_126.bUseMaterialParameterInfo;
            local_178.GetModify_RequestData().ParamAssociation = (int(local_126.ParamAssociation) != 0);
            local_178.GetModify_RequestData().LayerOrBlendIndex = int(local_126.LayerOrBlendIndex);
            this.BuildVectorParamForBlendData(Request, local_56, local_126, local_178, RequestData.GetbApplyToAllSlot());
        }
        for (auto& local_192 : RequestData.GetTextureParams())
        {
            int local_25_2 = local_28.FindTextureParamIndex(local_192.ParamName);
            if (local_25_2 == -1)
            {
                FTextureParamBlendData local_228;
                local_28.TextureParams.Add(local_228);
                local_25_2 = local_28.TextureParams.Num() - 1;
            }
            FTextureParamBlendData& local_230 = local_28.TextureParams[local_25_2];
            local_230.GetModify_RequestData().ParamName = local_192.ParamName;
            local_230.GetModify_RequestData().bUseMaterialParameterInfo = local_192.bUseMaterialParameterInfo;
            local_230.GetModify_RequestData().ParamAssociation = (int(local_192.ParamAssociation) != 0);
            local_230.GetModify_RequestData().LayerOrBlendIndex = int(local_192.LayerOrBlendIndex);
            this.BuildTextureParamForBlendData(Request, local_56, local_192, local_230, RequestData.GetbApplyToAllSlot());
        }
        return;
    }
    bool CheckBlendingOutRequests(TArray<FChangeMaterialParamRequest> &inout Requests) const
    {
        bool local_1;
        local_1 = false;
        int local_6 = Requests.Num() - 1;
        for (; local_6 >= 0; --local_6)
        {
            FChangeMaterialParamRequest& local_8 = Requests[local_6];
            if (local_8.GetbIsBlendingOut())
            {
                if (float32((ECS::GetContextTime() - local_8.GetBlendOutStartTime()).ToSeconds()) > local_8.GetBlendOutTime())
                {
                    Requests.RemoveAt(local_6);
                }
            }
        }
        if (Requests.Num() == 0)
        {
            local_1 = false;
        }
        return local_1;
    }
    void UpdateDynamicMaskedMaterialComponents(const FECSEntity &inout Entity, const TMap<FName, bool> &inout DesiredDynamicMaskedComponentMap) const
    {
        int local_6 = 0;
        int local_10 = local_6.ComponentNames.Num() - 1;
        for (; local_10 >= 0; --local_10)
        {
            FName local_13(local_6.ComponentNames[local_10]);
            if (DesiredDynamicMaskedComponentMap.Contains(local_13))
            {
                continue;
            }
            FECSMeshComponentProxy local_22 = Entity.ModifyActorComponent(local_13).CastToMeshComponent();
            if (local_22)
            {
                local_22.SetEnableDynamicMaskedMaterial(false);
            }
            local_6.ComponentNames.RemoveAt(local_10);
        }
        for (auto& local_44 : DesiredDynamicMaskedComponentMap)
        {
            FName local_13_2(local_44.GetKey());
            if (local_6.ComponentNames.Contains(local_13_2))
            {
                continue;
            }
            FECSMeshComponentProxy local_26 = Entity.ModifyActorComponent(local_13_2).CastToMeshComponent();
            if (local_26)
            {
                local_26.SetEnableDynamicMaskedMaterial(true);
                local_6.ComponentNames.Add(local_13_2);
            }
        }
        if (local_6.ComponentNames.Num() == 0)
        {
            Remove local_48;
            local_48.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_TickSyncBlendingOutMaterialParamLifeTime(const FECSEntity &inout Entity, FC_SyncChangeMaterialParamRequests &inout C_SyncChangeMaterialParamRequests) const
    {
        TArray<FChangeMaterialParamRequest>& local_2 = C_SyncChangeMaterialParamRequests.GetModify_Requests();
        bool local_4 = this.CheckBlendingOutRequests(local_2);
        if (local_2.Num() == 0)
        {
            Remove local_10;
            local_10.opCall();
        }
        if (!(local_4))
        {
            Remove local_14;
            local_14.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_LoadLocalChangeMaterial(const FECSEntity &inout Entity, const FC_LocalChangeMaterialParamRequests &inout C_LocalChangeMaterialParamRequests) const
    {
        for (auto& local_18 : C_LocalChangeMaterialParamRequests.Requests)
        {
            for (auto& local_32 : local_18.GetData())
            {
                if (!(local_32.GetOverrideMaterialPath().IsNull()))
                {
                    local_32.GetOverrideMaterialPath().TryLoad();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_LoadSyncChangeMaterial(const FECSEntity &inout Entity, const FC_SyncChangeMaterialParamRequests &inout SyncChangeMaterialParamRequests) const
    {
        const TArray<FChangeMaterialParamRequest>& local_2 = SyncChangeMaterialParamRequests.GetRequests();
        for (auto& local_18 : local_2)
        {
            for (auto& local_32 : local_18.GetData())
            {
                if (!(local_32.GetOverrideMaterialPath().IsNull()))
                {
                    local_32.GetOverrideMaterialPath().TryLoad();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickLocalBlendingOutMaterialParamLifeTime(const FECSEntity &inout Entity, FC_LocalChangeMaterialParamRequests &inout C_LocalChangeMaterialParamRequests) const
    {
        TArray<FChangeMaterialParamRequest> local_2 = C_LocalChangeMaterialParamRequests.Requests;
        bool local_4 = this.CheckBlendingOutRequests(local_2);
        if (local_2.Num() == 0)
        {
            Remove local_10;
            local_10.opCall();
        }
        if (!(local_4))
        {
            Remove local_14;
            local_14.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_SyncChangeMaterialParamRequests(const FECSEntity &inout Entity, const FC_SyncChangeMaterialParamRequests &inout SyncChangeMaterialParamRequests) const
    {
        if (Entity.IsValid())
        {
            FC_ChangeMaterialRequestUpdatedTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
        }
        return;
    }
    UFUNCTION()
    void Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(const FECSEntity &inout Entity, const FC_LocalChangeMaterialParamRequests &inout LocalChangeMaterialParamRequests) const
    {
        if (Entity.IsValid())
        {
            FC_ChangeMaterialRequestUpdatedTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
        }
        return;
    }
    UFUNCTION()
    void Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(const FECSEntity &inout Entity, const FC_LocalChangeMaterialParamRequests &inout LocalChangeMaterialParamRequests) const
    {
        if (Entity.IsValid())
        {
            FC_ChangeMaterialRequestUpdatedTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
        }
        return;
    }
    UFUNCTION()
    void Monitor_RemoveSocialOverrideMaterialTag(const FECSEntity &inout Entity, const FC_SocialOverrideMaterialTag &inout SocialOverrideMaterialTag) const
    {
        if (Entity.IsValid())
        {
            FC_ChangeMaterialRequestUpdatedTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_MergeChangeMaterialParamRequests(const FECSEntity &inout Entity) const
    {
        const AActor local_4;
        int local_54 = 0;
        AGameActor local_86;
        UMeshComponent local_118;
        UDecalComponent local_130;
        UActorComponent local_136;
        local_4 = Entity.GetActor();
        if ((!((local_4 != nullptr))))
        {
            Remove local_10;
            local_10.opCall();
            return;
        }
        TArray<FChangeMaterialParamRequest> local_14;
        Get local_18;
        const FC_SyncChangeMaterialParamRequests& local_20 = local_18.opCall();
        if (local_20)
        {
            local_14.Append(local_20.GetRequests());
        }
        Get local_24;
        const FC_LocalChangeMaterialParamRequests& local_26 = local_24.opCall();
        if (local_26)
        {
            local_14.Append(local_26.Requests);
        }
        TMap<FName, bool> local_46;
        if (local_14.Num() > 0)
        {
            for (auto& local_68 : local_14)
            {
                for (auto& local_82 : local_68.GetData())
                {
                    if (local_82.GetbUseLogicName())
                    {
                        local_86 = Cast<AGameActor>(local_4);
                        if (local_86 != nullptr)
                        {
                            TArray<USceneComponent> local_96 = local_86.GetCachedSceneComponentByLogicName(local_82.GetMeshName());
                            if (local_96.IsEmpty())
                            {
                                XWarning(ELog(55), FString().Append("ClientJob_MergeChangeMaterialParamRequests: failed to find mesh/decal component: ").Append(local_82.GetMeshName()).Append(", bUseLogicName: ").Append(local_82.GetbUseLogicName()));
                            }
                            else
                            {
                                for (auto local_116 : local_96)
                                {
                                    local_118 = Cast<UMeshComponent>(local_116);
                                    if (local_118 != nullptr)
                                    {
                                        if (!(local_82.GetOverrideMaterialPath().IsNull()))
                                        {
                                            this.BuildCachedMaterialOverrides(Entity, local_118, local_82);
                                        }
                                        if (local_82.GetbEnableDynamicMaskedMaterial())
                                        {
                                            FName local_92 = local_116.GetFName();
                                            local_46.FindOrAdd(local_92) = true;
                                        }
                                        this.BuildCachedChangeMaterialData(local_118, local_68, local_82, local_54);
                                    }
                                    else
                                    {
                                        local_130 = Cast<UDecalComponent>(local_116);
                                        if (local_130 != nullptr)
                                        {
                                            if (!(local_82.GetOverrideMaterialPath().IsNull()))
                                            {
                                                this.BuildCachedMaterialOverrides(Entity, local_130, local_82);
                                            }
                                            this.BuildCachedChangeMaterialData(local_130, local_68, local_82, local_54);
                                        }
                                    }
                                }
                            }
                        }
                        continue;
                    }
                    local_136 = local_4.FindComponentByName(local_82.GetMeshName());
                    local_118 = Cast<UMeshComponent>(local_136);
                    if (local_118 != nullptr)
                    {
                        if (!(local_82.GetOverrideMaterialPath().IsNull()))
                        {
                            this.BuildCachedMaterialOverrides(Entity, local_118, local_82);
                        }
                        if (local_82.GetbEnableDynamicMaskedMaterial())
                        {
                            FName local_92_2 = local_136.GetFName();
                            local_46.FindOrAdd(local_92_2) = true;
                        }
                        this.BuildCachedChangeMaterialData(local_118, local_68, local_82, local_54);
                    }
                    else
                    {
                        local_130 = Cast<UDecalComponent>(local_136);
                        if (local_130 != nullptr)
                        {
                            if (!(local_82.GetOverrideMaterialPath().IsNull()))
                            {
                                this.BuildCachedMaterialOverrides(Entity, local_130, local_82);
                            }
                            this.BuildCachedChangeMaterialData(local_130, local_68, local_82, local_54);
                        }
                        else
                        {
                            XWarning(ELog(55), FString().Append("ClientJob_MergeChangeMaterialParamRequests: failed to find mesh/decal component: ").Append(local_82.GetMeshName()).Append(", bUseLogicName: ").Append(local_82.GetbUseLogicName()));
                        }
                    }
                }
            }
        }
        this.UpdateDynamicMaskedMaterialComponents(Entity, local_46);
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateCachedMaterialOverrides(const FECSEntity &inout Entity, FC_CachedMaterialOverrides &inout CachedMaterialOverrides) const
    {
        bool local_21;
        FFPTime local_4 = ECS::GetContextTime();
        int local_8 = CachedMaterialOverrides.MeshMaterialOverrides.Num() - 1;
        TSoftObjectPtr<UMaterialInterface> local_48;
        for (; local_8 >= 0; --local_8)
        {
            FRuntimeSingleMaterialOverride& local_12 = CachedMaterialOverrides.MeshMaterialOverrides[local_8];
            FSoftObjectPath local_20;
            local_21 = false;
            FFPTime local_2 = local_12.LastUpdatedTime;
            if (local_2.opCmp(local_4) < 0)
            {
                local_20 = local_12.OriginMaterialPath;
                local_21 = true;
            }
            else
            {
                local_20 = local_12.OverrideMaterialPath;
            }
            if (!((local_12.CurrentMaterialPath == local_20)))
            {
                local_12.CurrentMaterialPath = local_20;
                FECSActorComponentProxy local_34 = Entity.ModifyActorComponent(local_12.MeshName);
                FECSMeshComponentProxy local_62 = local_34.CastToMeshComponent();
                if (local_62)
                {
                    if (local_12.bIsOverlayMaterial)
                    {
                        local_62.SetOverlayMaterial(local_48);
                    }
                    else
                    {
                        if (local_48.IsValid())
                        {
                            local_62.SetMaterial(int(local_12.MaterialIdx), local_48);
                        }
                        else
                        {
                            FString local_74 = "UpdateCachedMaterialOverrides: Failed to load material: ";
                            FString local_70 = local_20.ToString();
                        }
                    }
                }
                else
                {
                    FECSDecalComponentProxy local_84 = local_34.CastToDecalComponent();
                    if (local_84)
                    {
                        if (local_48.IsValid())
                        {
                            local_84.SetMaterial(local_48);
                        }
                        else
                        {
                            FString local_70_2 = "UpdateCachedMaterialOverrides: Failed to load material: ";
                            FString local_74_2 = local_20.ToString();
                        }
                    }
                }
            }
            if (local_21)
            {
                CachedMaterialOverrides.MeshMaterialOverrides.RemoveAt(local_8);
            }
        }
        if (CachedMaterialOverrides.MeshMaterialOverrides.Num() == 0)
        {
            Remove local_92;
            local_92.opCall();
        }
        return;
    }
    void SetMaterialParamByFloatBlendData(FECSViewData_Material &inout MaterialData, const FFloatParamBlendData &inout FloatParam, const float32 Value) const
    {
        FECSViewData_MaterialParam& local_2 = MaterialData.ModifyParamByName(FloatParam.GetRequestData().ParamName);
        if (FloatParam.GetRequestData().bUseMaterialParameterInfo)
        {
            local_2.ParamInfo.Association = (int(FloatParam.GetRequestData().ParamAssociation) != 0);
            local_2.ParamInfo.Index = int(FloatParam.GetRequestData().LayerOrBlendIndex);
        }
        local_2.ParamValue.SetFloatValue(Value);
        return;
    }
    void SetMaterialParamByVectorBlendData(FECSViewData_Material &inout MaterialData, const FVectorParamBlendData &inout VectorParam, const FLinearColor &inout Value) const
    {
        FECSViewData_MaterialParam& local_2 = MaterialData.ModifyParamByName(VectorParam.GetRequestData().ParamName);
        if (VectorParam.GetRequestData().bUseMaterialParameterInfo)
        {
            local_2.ParamInfo.Association = (int(VectorParam.GetRequestData().ParamAssociation) != 0);
            local_2.ParamInfo.Index = int(VectorParam.GetRequestData().LayerOrBlendIndex);
        }
        local_2.ParamValue.SetVectorValue(Value);
        return;
    }
    void SetMaterialParamByTextureBlendData(FECSViewData_Material &inout MaterialData, const FTextureParamBlendData &inout TextureParam, const TSoftObjectPtr<UTexture> &inout Value) const
    {
        FECSViewData_MaterialParam& local_2 = MaterialData.ModifyParamByName(TextureParam.GetRequestData().ParamName);
        if (TextureParam.GetRequestData().bUseMaterialParameterInfo)
        {
            local_2.ParamInfo.Association = (int(TextureParam.GetRequestData().ParamAssociation) != 0);
            local_2.ParamInfo.Index = int(TextureParam.GetRequestData().LayerOrBlendIndex);
        }
        local_2.ParamValue.SetTextureValue(Value);
        return;
    }
    void SetMaterialDataParams(FECSViewData_Material &inout MaterialData, FSingleMaterialParamBlendData &inout BlendData, const FFPTime &inout CurrentTime) const
    {
        int local_4 = BlendData.FloatParams.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            FFloatParamBlendData& local_8 = BlendData.FloatParams[local_4];
            FFPTime local_10 = FFPTime(local_8.GetLastUpdatedTime());
            if (local_10.opCmp(CurrentTime) < 0)
            {
                this.SetMaterialParamByFloatBlendData(MaterialData, local_8, local_8.GetDefaultValue());
                BlendData.FloatParams.RemoveAt(local_4);
            }
        }
        int local_3 = BlendData.VectorParams.Num() - 1;
        for (; local_3 >= 0; --local_3)
        {
            FVectorParamBlendData& local_14 = BlendData.VectorParams[local_3];
            FFPTime local_10_2 = FFPTime(local_14.GetLastUpdatedTime());
            if (local_10_2.opCmp(CurrentTime) < 0)
            {
                this.SetMaterialParamByVectorBlendData(MaterialData, local_14, local_14.GetDefaultValue());
                BlendData.VectorParams.RemoveAt(local_3);
            }
        }
        int local_2 = BlendData.TextureParams.Num() - 1;
        for (; local_2 >= 0; --local_2)
        {
            FTextureParamBlendData& local_16 = BlendData.TextureParams[local_2];
            FFPTime local_10_3 = FFPTime(local_16.GetLastUpdatedTime());
            if (local_10_3.opCmp(CurrentTime) < 0)
            {
                TSoftObjectPtr<UTexture> local_26 = TSoftObjectPtr<UTexture>(local_16.GetDefaultTexture());
                if (local_26.IsValid())
                {
                    this.SetMaterialParamByTextureBlendData(MaterialData, local_16, local_26);
                }
                BlendData.TextureParams.RemoveAt(local_2);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_RestoreValueForRemovedMaterialParams(const FECSEntity &inout Entity, FC_CachedAllChangeMateraialData &inout C_CachedAllChangeMateraialData) const
    {
        const AActor local_4;
        local_4 = Entity.GetActor();
        FFPTime local_8 = ECS::GetContextTime();
        int local_12 = C_CachedAllChangeMateraialData.CachedData.Num() - 1;
        for (; local_12 >= 0; --local_12)
        {
            FSingleMaterialParamBlendData& local_16 = C_CachedAllChangeMateraialData.CachedData[local_12];
            FECSActorComponentProxy local_20 = Entity.ModifyActorComponent(local_16.MeshName);
            FECSMeshComponentProxy local_28 = local_20.CastToMeshComponent();
            if (local_28)
            {
                if (local_16.bIsOverlayMaterial)
                {
                    FECSViewData_Material& local_34 = local_28.ModifyOverlayMaterial();
                    this.SetMaterialDataParams(local_34, local_16, local_8);
                }
                else
                {
                    FECSViewData_Material& local_34_2 = local_28.ModifyMaterial(int(local_16.MaterialIndex));
                    this.SetMaterialDataParams(local_34_2, local_16, local_8);
                }
            }
            else
            {
                FECSDecalComponentProxy local_38 = local_20.CastToDecalComponent();
                if (local_38)
                {
                    FECSViewData_Material& local_34_3 = local_38.ModifyMaterial();
                    this.SetMaterialDataParams(local_34_3, local_16, local_8);
                }
            }
            if (local_16.FloatParams.IsEmpty() && local_16.VectorParams.IsEmpty() && local_16.TextureParams.IsEmpty())
            {
                C_CachedAllChangeMateraialData.CachedData.RemoveAt(local_12);
            }
        }
        if (C_CachedAllChangeMateraialData.CachedData.Num() == 0)
        {
            Remove local_48;
            local_48.opCall();
            Remove local_52;
            local_52.opCall();
        }
        else
        {
            FC_MaterialParamBlendingTag local_58;
            Assign local_56;
            local_56.opCall(local_58);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_ClearChangeMaterialRequestUpdatedTag(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateMaterialParamBlending(const FECSEntity &inout Entity, FC_CachedAllChangeMateraialData &inout C_CachedAllChangeMateraialData) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Run_Job_TickSyncBlendingOutMaterialParamLifeTime() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_174 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_TickSyncBlendingOutMaterialParamLifeTime(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_36 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_TickSyncBlendingOutMaterialParamLifeTime(local_174, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_LoadLocalChangeMaterial_StaticReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLocalChangeMaterialParamRequestsOnAssignView(this.GetECSWorld(), EECSRegType(1), false, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_LoadLocalChangeMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLocalChangeMaterialParamRequestsOnModifyView(this.GetECSWorld(), EECSRegType(1), false, false);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_LoadLocalChangeMaterial(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_LoadLocalChangeMaterial_DefaultReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLocalChangeMaterialParamRequestsOnAssignView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_LoadLocalChangeMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLocalChangeMaterialParamRequestsOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_LoadLocalChangeMaterial(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_LoadLocalChangeMaterial_LocalReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLocalChangeMaterialParamRequestsOnAssignView(this.GetECSWorld(), EECSRegType(2), false, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_LoadLocalChangeMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLocalChangeMaterialParamRequestsOnModifyView(this.GetECSWorld(), EECSRegType(2), false, false);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_LoadLocalChangeMaterial(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_LoadSyncChangeMaterial() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSyncChangeMaterialParamRequestsOnAssignView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_LoadSyncChangeMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorSyncChangeMaterialParamRequestsOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_LoadSyncChangeMaterial(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickLocalBlendingOutMaterialParamLifeTime_StaticReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 1;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_TickLocalBlendingOutMaterialParamLifeTime(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickLocalBlendingOutMaterialParamLifeTime(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickLocalBlendingOutMaterialParamLifeTime_DefaultReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_TickLocalBlendingOutMaterialParamLifeTime(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickLocalBlendingOutMaterialParamLifeTime(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickLocalBlendingOutMaterialParamLifeTime_LocalReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_TickLocalBlendingOutMaterialParamLifeTime(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickLocalBlendingOutMaterialParamLifeTime(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_SyncChangeMaterialParamRequests() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSyncChangeMaterialParamRequestsOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_SyncChangeMaterialParamRequests(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorSyncChangeMaterialParamRequestsOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_SyncChangeMaterialParamRequests(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorSyncChangeMaterialParamRequestsOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_SyncChangeMaterialParamRequests(local_46, local_52);
        }
        FECSMonitorRuntimeView local_60 = ::__GetMonitorSyncChangeMaterialParamRequestsOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40_2 = local_60.Iterator();
        for (; local_40_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_4 = local_40_2.Proceed();
            FECSEntityScopeCycleCounter local_43_4 = FECSEntityScopeCycleCounter(local_42_4.Entity);
            GetComponent local_50_4 = FECSMonitorRuntimeViewItem::GetComponent(local_42_4);
            this.Monitor_SyncChangeMaterialParamRequests(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial_StaticReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLocalChangeMaterialParamRequestsOnModifyView(this.GetECSWorld(), EECSRegType(1), false, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLocalChangeMaterialParamRequestsOnAssignView(this.GetECSWorld(), EECSRegType(1), false, false);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorLocalChangeMaterialParamRequestsOnActiveView(this.GetECSWorld(), EECSRegType(1), false, false);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_60 = ::__GetMonitorLocalChangeMaterialParamRequestsOnRemoveView(this.GetECSWorld(), EECSRegType(1), false, false);
        FECSMonitorRuntimeViewIterator local_40_2 = local_60.Iterator();
        for (; local_40_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_4 = local_40_2.Proceed();
            FECSEntityScopeCycleCounter local_43_4 = FECSEntityScopeCycleCounter(local_42_4.Entity);
            GetComponent local_50_4 = FECSMonitorRuntimeViewItem::GetComponent(local_42_4);
            this.Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial_DefaultReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLocalChangeMaterialParamRequestsOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLocalChangeMaterialParamRequestsOnAssignView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorLocalChangeMaterialParamRequestsOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_60 = ::__GetMonitorLocalChangeMaterialParamRequestsOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_40_2 = local_60.Iterator();
        for (; local_40_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_4 = local_40_2.Proceed();
            FECSEntityScopeCycleCounter local_43_4 = FECSEntityScopeCycleCounter(local_42_4.Entity);
            GetComponent local_50_4 = FECSMonitorRuntimeViewItem::GetComponent(local_42_4);
            this.Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial_LocalReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLocalChangeMaterialParamRequestsOnModifyView(this.GetECSWorld(), EECSRegType(2), false, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLocalChangeMaterialParamRequestsOnAssignView(this.GetECSWorld(), EECSRegType(2), false, false);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorLocalChangeMaterialParamRequestsOnActiveView(this.GetECSWorld(), EECSRegType(2), false, false);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(local_46, local_52);
        }
        FECSMonitorRuntimeView local_60 = ::__GetMonitorLocalChangeMaterialParamRequestsOnRemoveView(this.GetECSWorld(), EECSRegType(2), false, false);
        FECSMonitorRuntimeViewIterator local_40_2 = local_60.Iterator();
        for (; local_40_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_4 = local_40_2.Proceed();
            FECSEntityScopeCycleCounter local_43_4 = FECSEntityScopeCycleCounter(local_42_4.Entity);
            GetComponent local_50_4 = FECSMonitorRuntimeViewItem::GetComponent(local_42_4);
            this.Monitor_LocalChangeMaterialParamRequestsWhenTickMaterial(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject_StaticReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLocalChangeMaterialParamRequestsOnModifyView(this.GetECSWorld(), EECSRegType(1), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLocalChangeMaterialParamRequestsOnAssignView(this.GetECSWorld(), EECSRegType(1), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorLocalChangeMaterialParamRequestsOnActiveView(this.GetECSWorld(), EECSRegType(1), false, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(local_46, local_52);
        }
        FECSMonitorRuntimeView local_60 = ::__GetMonitorLocalChangeMaterialParamRequestsOnRemoveView(this.GetECSWorld(), EECSRegType(1), false, true);
        FECSMonitorRuntimeViewIterator local_40_2 = local_60.Iterator();
        for (; local_40_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_4 = local_40_2.Proceed();
            FECSEntityScopeCycleCounter local_43_4 = FECSEntityScopeCycleCounter(local_42_4.Entity);
            GetComponent local_50_4 = FECSMonitorRuntimeViewItem::GetComponent(local_42_4);
            this.Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject_DefaultReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLocalChangeMaterialParamRequestsOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLocalChangeMaterialParamRequestsOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorLocalChangeMaterialParamRequestsOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(local_46, local_52);
        }
        FECSMonitorRuntimeView local_60 = ::__GetMonitorLocalChangeMaterialParamRequestsOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40_2 = local_60.Iterator();
        for (; local_40_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_4 = local_40_2.Proceed();
            FECSEntityScopeCycleCounter local_43_4 = FECSEntityScopeCycleCounter(local_42_4.Entity);
            GetComponent local_50_4 = FECSMonitorRuntimeViewItem::GetComponent(local_42_4);
            this.Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject_LocalReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLocalChangeMaterialParamRequestsOnModifyView(this.GetECSWorld(), EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLocalChangeMaterialParamRequestsOnAssignView(this.GetECSWorld(), EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorLocalChangeMaterialParamRequestsOnActiveView(this.GetECSWorld(), EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(local_46, local_52);
        }
        FECSMonitorRuntimeView local_60 = ::__GetMonitorLocalChangeMaterialParamRequestsOnRemoveView(this.GetECSWorld(), EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_40_2 = local_60.Iterator();
        for (; local_40_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_4 = local_40_2.Proceed();
            FECSEntityScopeCycleCounter local_43_4 = FECSEntityScopeCycleCounter(local_42_4.Entity);
            GetComponent local_50_4 = FECSMonitorRuntimeViewItem::GetComponent(local_42_4);
            this.Monitor_LocalChangeMaterialParamRequestsAfterRecycleViewObject(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RemoveSocialOverrideMaterialTag() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSocialOverrideMaterialTagOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_RemoveSocialOverrideMaterialTag(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_MergeChangeMaterialParamRequests_StaticReg() const
    {
        const FECSEntity& local_36;
        int local_152 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 1;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_MergeChangeMaterialParamRequests(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_80 = 0;
        FECSRuntimeViewIterator local_114 = local_74.Iterator();
        for (; local_114.CanProceed;)
        {
            local_36 = local_114.Proceed();
            ++local_80;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_MergeChangeMaterialParamRequests(local_152);
        }
        local_2.UpdateCachedEntityCount(local_80);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_MergeChangeMaterialParamRequests_DefaultReg() const
    {
        const FECSEntity& local_36;
        int local_152 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_MergeChangeMaterialParamRequests(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_80 = 0;
        FECSRuntimeViewIterator local_114 = local_74.Iterator();
        for (; local_114.CanProceed;)
        {
            local_36 = local_114.Proceed();
            ++local_80;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_MergeChangeMaterialParamRequests(local_152);
        }
        local_2.UpdateCachedEntityCount(local_80);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_MergeChangeMaterialParamRequests_LocalReg() const
    {
        const FECSEntity& local_36;
        int local_152 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_MergeChangeMaterialParamRequests(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_80 = 0;
        FECSRuntimeViewIterator local_114 = local_74.Iterator();
        for (; local_114.CanProceed;)
        {
            local_36 = local_114.Proceed();
            ++local_80;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_MergeChangeMaterialParamRequests(local_152);
        }
        local_2.UpdateCachedEntityCount(local_80);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateCachedMaterialOverrides_StaticReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 1;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_UpdateCachedMaterialOverrides(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateCachedMaterialOverrides(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateCachedMaterialOverrides_DefaultReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_UpdateCachedMaterialOverrides(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateCachedMaterialOverrides(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateCachedMaterialOverrides_LocalReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_UpdateCachedMaterialOverrides(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateCachedMaterialOverrides(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_RestoreValueForRemovedMaterialParams_StaticReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 1;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_RestoreValueForRemovedMaterialParams(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_RestoreValueForRemovedMaterialParams(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_RestoreValueForRemovedMaterialParams_DefaultReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_RestoreValueForRemovedMaterialParams(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_RestoreValueForRemovedMaterialParams(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_RestoreValueForRemovedMaterialParams_LocalReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_RestoreValueForRemovedMaterialParams(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_RestoreValueForRemovedMaterialParams(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ClearChangeMaterialRequestUpdatedTag_StaticReg() const
    {
        const FECSEntity& local_36;
        int local_152 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 1;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_ClearChangeMaterialRequestUpdatedTag(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_80 = 0;
        FECSRuntimeViewIterator local_114 = local_74.Iterator();
        for (; local_114.CanProceed;)
        {
            local_36 = local_114.Proceed();
            ++local_80;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_ClearChangeMaterialRequestUpdatedTag(local_152);
        }
        local_2.UpdateCachedEntityCount(local_80);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ClearChangeMaterialRequestUpdatedTag_DefaultReg() const
    {
        const FECSEntity& local_36;
        int local_152 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_ClearChangeMaterialRequestUpdatedTag(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_80 = 0;
        FECSRuntimeViewIterator local_114 = local_74.Iterator();
        for (; local_114.CanProceed;)
        {
            local_36 = local_114.Proceed();
            ++local_80;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_ClearChangeMaterialRequestUpdatedTag(local_152);
        }
        local_2.UpdateCachedEntityCount(local_80);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ClearChangeMaterialRequestUpdatedTag_LocalReg() const
    {
        const FECSEntity& local_36;
        int local_152 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_ClearChangeMaterialRequestUpdatedTag(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_80 = 0;
        FECSRuntimeViewIterator local_114 = local_74.Iterator();
        for (; local_114.CanProceed;)
        {
            local_36 = local_114.Proceed();
            ++local_80;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_ClearChangeMaterialRequestUpdatedTag(local_152);
        }
        local_2.UpdateCachedEntityCount(local_80);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateMaterialParamBlending_StaticReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 1;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_UpdateMaterialParamBlending(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateMaterialParamBlending(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateMaterialParamBlending_DefaultReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_UpdateMaterialParamBlending(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateMaterialParamBlending(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateMaterialParamBlending_LocalReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_UpdateMaterialParamBlending(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateMaterialParamBlending(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

