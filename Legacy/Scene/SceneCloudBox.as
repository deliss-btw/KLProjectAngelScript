

struct FCloudBoxSetting
{
    UPROPERTY()
    int ShapeIndex = 0;
    UPROPERTY()
    FName ConfigId = n"Default";
    UPROPERTY()
    float32 NoiseScale = 0.015f;
    UPROPERTY()
    float32 NoiseTilling = 5.0f;
    UPROPERTY()
    float32 NoiseSpeed = 0.03f;
    UPROPERTY()
    float32 FadeLength = 50000.0f;
    UPROPERTY()
    float32 FadeOffset = 20000.0f;
    UPROPERTY()
    float32 LightScale = 10.0f;
    UPROPERTY()
    float32 Density = 3.0f;
    UPROPERTY()
    FLinearColor EmissiveColor = FLinearColor(0.0f, 0.0f, 0.0f, 1.0f);


}

class ASceneCloudBox : AActor
{
    UPROPERTY()
    UStaticMesh DefaultMesh;
    UPROPERTY()
    UStaticMeshComponent MeshComp;
    UPROPERTY()
    UMaterialInstanceConstant Material;
    UPROPERTY()
    FCloudBoxSetting CloudboxSetting;

    default MeshComp.SetRelativeScale3D(FVector(200.0, 200.0, 150.0));
    default DefaultMesh = Cast<UStaticMesh>(LoadObject(nullptr, "/Script/Engine.StaticMesh'/Engine/BasicShapes/BasicCloudBox.BasicCloudBox'"));
    default MeshComp.SetStaticMesh(DefaultMesh);
    default MeshComp.SetCollisionEnabled(ECollisionEnabled(0));

    ASceneCloudBox()
    {
        return;
    }
    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        this.ApplyMaterialByShapeIndex(this.CloudboxSetting.ShapeIndex);
        this.FillCloudboxSettingToPrimitiveData();
        return;
    }
    UFUNCTION()
    void BeginPlay_Implementation()
    {
        this.FillCloudboxSettingToPrimitiveData();
        return;
    }
    UMaterialInstanceConstant LoadDefaultMaterial(const int MaterialIndex)
    {
        FString local_12 = (FString("/Script/Engine.MaterialInstanceConstant'/Game/Shader/Effect/CloudboxType/MI_SceneCloudBox_Type_") + MaterialIndex);
        FString local_12_2 = ((local_12 + ".MI_SceneCloudBox_Type_") + MaterialIndex);
        return Cast<UMaterialInstanceConstant>(LoadObject(nullptr, (local_12_2 + "'")));
    }
    void ApplyMaterialByShapeIndex(const int ShapeIndex)
    {
        int local_2 = FMath::IntegerDivisionTrunc(FMath::Max(0, ShapeIndex), 2);
        UMaterialInstanceConstant local_6 = ::CloudBoxConfigUtils::GetMaterialForConfig(this.CloudboxSetting.ConfigId, local_2);
        if (local_6 == nullptr)
        {
            local_6 = this.LoadDefaultMaterial(local_2);
        }
        if (local_6 == nullptr)
        {
            return;
        }
        this.Material = local_6;
        this.MeshComp.SetMaterial(0, local_6);
        return;
    }
    void FillCloudboxSettingToPrimitiveData()
    {
        int local_4;
        if (this.MeshComp == nullptr)
        {
            return;
        }
        this.MeshComp.SetCustomPrimitiveDataFloat(0, int(this.CloudboxSetting.NoiseScale));
        this.MeshComp.SetCustomPrimitiveDataFloat(1, int(this.CloudboxSetting.NoiseTilling));
        this.MeshComp.SetCustomPrimitiveDataFloat(2, int(this.CloudboxSetting.NoiseSpeed));
        this.MeshComp.SetCustomPrimitiveDataFloat(3, int(this.CloudboxSetting.LightScale));
        this.MeshComp.SetCustomPrimitiveDataFloat(4, int(this.CloudboxSetting.Density));
        this.MeshComp.SetCustomPrimitiveDataFloat(5, int(this.CloudboxSetting.FadeLength));
        this.MeshComp.SetCustomPrimitiveDataFloat(6, int(this.CloudboxSetting.FadeOffset));
        if (this.CloudboxSetting.ShapeIndex >= 0)
        {
            float local_7 = (this.CloudboxSetting.ShapeIndex % 2);
            local_4 = int(local_7);
        }
        else
        {
            local_4 = -1082130432;
        }
        this.MeshComp.SetCustomPrimitiveDataFloat(7, local_4);
        this.MeshComp.SetCustomPrimitiveDataFloat(8, this.CloudboxSetting.EmissiveColor.R);
        this.MeshComp.SetCustomPrimitiveDataFloat(9, int(this.CloudboxSetting.EmissiveColor.G));
        this.MeshComp.SetCustomPrimitiveDataFloat(10, this.CloudboxSetting.EmissiveColor.B);
        return;
    }
}

