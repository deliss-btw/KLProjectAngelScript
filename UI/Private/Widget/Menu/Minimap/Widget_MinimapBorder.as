

UCLASS(Abstract)
class UWidget_MinimapBorder : UUserWidget
{
    UPROPERTY()
    UMaterialInstance BroderMaterial;
    UPROPERTY()
    FVector2D TextureSize = FVector2D(200.0, 200.0);
    UPROPERTY()
    FMinimapBorderInfo BorderInfo;
    UPROPERTY()
    UImage BorderImage;
    UPROPERTY()
    UMinimap MinimapWidget;
    UPROPERTY()
    UMaterialInstanceDynamic BroderMaterialDynamic;
    UPROPERTY()
    FMaterialParameterInfo TransformParameter;
    UPROPERTY()
    FMaterialParameterInfo TextureTilingParameter;
    UPROPERTY()
    FMaterialParameterInfo MaskParameter;

    UWidget_MinimapBorder()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.BorderImage.SetRenderOpacity(0.0f);
        return;
    }
    UFUNCTION()
    void SetMinimapWidget(const UMinimap InMinimapWidget)
    {
        if ((!((InMinimapWidget != nullptr))))
        {
            XError(ELog(16), "MinimapWidget is not null");
            return;
        }
        if (this.MinimapWidget != nullptr)
        {
            this.MinimapWidget.GetOnMinimapTransformChanged().UnbindObject(this);
        }
        if ((!((this.BroderMaterial != nullptr))))
        {
            XError(ELog(16), "BroderMaterial is not set");
            return;
        }
        this.MinimapWidget.GetOnMinimapTransformChanged().AddUFunction(this, n"OnMinimapTransformChanged");
        this.BroderMaterialDynamic = Material::CreateDynamicMaterialInstance(__GetWorldContext(), this.BroderMaterial, NAME_None, EMIDCreationFlags(0));
        this.BorderImage.SetBrushFromMaterial(this.BroderMaterialDynamic);
        this.TransformParameter = this.BroderMaterialDynamic.GetParameterInfo(EMaterialParameterAssociation(2), n"Transform", nullptr);
        this.TextureTilingParameter = this.BroderMaterialDynamic.GetParameterInfo(EMaterialParameterAssociation(2), n"TextureTiling", nullptr);
        this.MaskParameter = this.BroderMaterialDynamic.GetParameterInfo(EMaterialParameterAssociation(2), n"Mask", nullptr);
        return;
    }
    UFUNCTION()
    void SetBorderInfo(const FMinimapBorderInfo &inout InBorderInfo)
    {
        this.BorderInfo = InBorderInfo;
        this.UpdateBorder();
        return;
    }
    UFUNCTION()
    void OnMinimapTransformChanged()
    {
        this.UpdateBorder();
        return;
    }
    void UpdateBorder()
    {
        const FGeometry& local_2 = this.BorderImage.GetCachedGeometry();
        bool local_7 = local_2.GetLocalSize().IsZero();
        if (local_7)
        {
            this.BorderImage.SetRenderOpacity(0.0f);
            return;
        }
        if (!(this.BorderInfo.IsValid()))
        {
            this.BorderImage.SetRenderOpacity(0.0f);
            return;
        }
        float local_10 = local_2.GetLocalSize().X;
        float local_14 = local_2.GetLocalSize().Y;
        FLinearColor local_20 = ::MinimapBorderUtils::CalculateMaskTransformParameters(this.MinimapWidget, FVector2f(FVector2D(local_10, local_14)), this.BorderInfo.BorderWorldPosition);
        FLinearColor local_28;
        local_28.R = float32((local_10 / this.TextureSize.X));
        local_28.G = float32((local_14 / this.TextureSize.Y));
        local_28.B = 0.0f;
        local_28.A = 0.0f;
        this.BroderMaterialDynamic.SetVectorParameterValueByInfo(this.TransformParameter, local_20);
        this.BroderMaterialDynamic.SetVectorParameterValueByInfo(this.TextureTilingParameter, local_28);
        this.BroderMaterialDynamic.SetTextureParameterValueByInfo(this.MaskParameter, this.BorderInfo.BorderMask);
        this.BorderImage.SetRenderOpacity(1.0f);
        return;
    }
}

namespace MinimapBorderUtils
{
FLinearColor CalculateMaskTransformParameters(const UMinimap MinimapWidget, const FVector2f &inout PaintSize, const FBox2D &inout MaskWorldPosition)
{
    float32 local_2 = MinimapWidget.GetMapScale();
    float32 local_3 = PaintSize.X;
    float32 local_4 = PaintSize.Y;
    float32 local_1 = local_3 * local_2;
    float32 local_5 = local_4 * local_2;
    float local_14 = (MaskWorldPosition.Max.X - MaskWorldPosition.Min.X) / local_1;
    float local_16 = (MaskWorldPosition.Max.Y - MaskWorldPosition.Min.Y) / local_5;
    FVector2D local_22 = MinimapWidget.WorldPositionToMinimapWidgetPosition(MaskWorldPosition.Min);
    FLinearColor local_34;
    local_34.R = float32(local_14);
    local_34.G = float32(local_16);
    local_34.B = float32((local_22.X / local_3));
    local_34.A = float32((local_22.Y / local_4));
    return local_34;
}
}
