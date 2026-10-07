

struct FOrientalBoundingBoxBoneConfig
{
    UPROPERTY()
    FPT_BoneRef Bone;
    UPROPERTY()
    FVector LocationOffset = FVector(0.0, 0.0, 0.0);

    FOrientalBoundingBoxBoneConfig()
    {
        return;
    }
}

struct FOrientalBoundingBoxConfig
{
    UPROPERTY()
    TArray<FOrientalBoundingBoxBoneConfig> BoneConfigs;
    UPROPERTY()
    FPT_SocketRef ExportSocket;
    UPROPERTY()
    bool bWantDebugDraw = false;


}

class USPT_OrientalBoundingBox : USkeletalPoseTweaker
{
    UPROPERTY()
    TArray<FOrientalBoundingBoxConfig> OBBConfigs;
    FOrientalBoundingBox OrientalBoundingBox;

    USPT_OrientalBoundingBox()
    {
        this.OBBConfigs.SetNum(6);
        this.OBBConfigs[0].BoneConfigs.SetNum(7);
        this.OBBConfigs[0].BoneConfigs[0].Bone.SetBoneName(n"Bn_L_BigFeather05");
        this.OBBConfigs[0].BoneConfigs[1].Bone.SetBoneName(n"Bn_L_BigFeather_A03");
        this.OBBConfigs[0].BoneConfigs[2].Bone.SetBoneName(n"Bn_L_BigFeather_C03");
        this.OBBConfigs[0].BoneConfigs[3].Bone.SetBoneName(n"Bn_L_BigFeather_F03");
        this.OBBConfigs[0].BoneConfigs[4].Bone.SetBoneName(n"Bn_L_BigFeather_B03");
        this.OBBConfigs[0].BoneConfigs[5].Bone.SetBoneName(n"Bn_L_BigFeather_G02");
        this.OBBConfigs[0].BoneConfigs[5].LocationOffset = FVector(50.0, -50.0, 0.0);
        this.OBBConfigs[0].BoneConfigs[6].Bone.SetBoneName(n"Bn_L_BigFeather_D03");
        this.OBBConfigs[0].ExportSocket.SocketName = n"SKT_L_BigFeatherHitBox01";
        this.OBBConfigs[1].BoneConfigs.SetNum(7);
        this.OBBConfigs[1].BoneConfigs[0].Bone.SetBoneName(n"Bn_R_BigFeather05");
        this.OBBConfigs[1].BoneConfigs[1].Bone.SetBoneName(n"Bn_R_BigFeather_A03");
        this.OBBConfigs[1].BoneConfigs[2].Bone.SetBoneName(n"Bn_R_BigFeather_C03");
        this.OBBConfigs[1].BoneConfigs[3].Bone.SetBoneName(n"Bn_R_BigFeather_F03");
        this.OBBConfigs[1].BoneConfigs[4].Bone.SetBoneName(n"Bn_R_BigFeather_B03");
        this.OBBConfigs[1].BoneConfigs[5].Bone.SetBoneName(n"Bn_R_BigFeather_G02");
        this.OBBConfigs[1].BoneConfigs[5].LocationOffset = FVector(50.0, -50.0, 0.0);
        this.OBBConfigs[1].BoneConfigs[6].Bone.SetBoneName(n"Bn_R_BigFeather_D03");
        this.OBBConfigs[1].ExportSocket.SocketName = n"SKT_R_BigFeatherHitBox01";
        this.OBBConfigs[2].BoneConfigs.SetNum(4);
        this.OBBConfigs[2].BoneConfigs[0].Bone.SetBoneName(n"Bn_L_BigFeather05");
        this.OBBConfigs[2].BoneConfigs[0].LocationOffset = FVector(0.0, 30.0, 0.0);
        this.OBBConfigs[2].BoneConfigs[1].Bone.SetBoneName(n"Bn_L_BigFeather_H03");
        this.OBBConfigs[2].BoneConfigs[2].Bone.SetBoneName(n"Bn_L_BigFeather03");
        this.OBBConfigs[2].BoneConfigs[2].LocationOffset = FVector(0.0, 30.0, 0.0);
        this.OBBConfigs[2].BoneConfigs[3].Bone.SetBoneName(n"Bn_L_BigFeather_L03");
        this.OBBConfigs[2].ExportSocket.SocketName = n"SKT_L_BigFeatherHitBox02";
        this.OBBConfigs[3].BoneConfigs.SetNum(4);
        this.OBBConfigs[3].BoneConfigs[0].Bone.SetBoneName(n"Bn_R_BigFeather05");
        this.OBBConfigs[3].BoneConfigs[0].LocationOffset = FVector(0.0, -30.0, 0.0);
        this.OBBConfigs[3].BoneConfigs[1].Bone.SetBoneName(n"Bn_R_BigFeather_H03");
        this.OBBConfigs[3].BoneConfigs[2].Bone.SetBoneName(n"Bn_R_BigFeather03");
        this.OBBConfigs[3].BoneConfigs[2].LocationOffset = FVector(0.0, -30.0, 0.0);
        this.OBBConfigs[3].BoneConfigs[3].Bone.SetBoneName(n"Bn_R_BigFeather_L03");
        this.OBBConfigs[3].ExportSocket.SocketName = n"SKT_R_BigFeatherHitBox02";
        this.OBBConfigs[4].BoneConfigs.SetNum(5);
        this.OBBConfigs[4].BoneConfigs[0].Bone.SetBoneName(n"Bn_L_BigFeather02");
        this.OBBConfigs[4].BoneConfigs[0].LocationOffset = FVector(0.0, 30.0, 0.0);
        this.OBBConfigs[4].BoneConfigs[1].Bone.SetBoneName(n"Bn_L_BigFeather_P02");
        this.OBBConfigs[4].BoneConfigs[1].LocationOffset = FVector(100.0, 0.0, 0.0);
        this.OBBConfigs[4].BoneConfigs[2].Bone.SetBoneName(n"Bn_L_BigFeather03");
        this.OBBConfigs[4].BoneConfigs[2].LocationOffset = FVector(0.0, 50.0, 0.0);
        this.OBBConfigs[4].BoneConfigs[3].Bone.SetBoneName(n"Bn_L_BigFeather_M02");
        this.OBBConfigs[4].BoneConfigs[3].LocationOffset = FVector(80.0, 30.0, 0.0);
        this.OBBConfigs[4].BoneConfigs[4].Bone.SetBoneName(n"Bn_L_BigFeather01");
        this.OBBConfigs[4].ExportSocket.SocketName = n"SKT_L_BigFeatherHitBox03";
        this.OBBConfigs[5].BoneConfigs.SetNum(5);
        this.OBBConfigs[5].BoneConfigs[0].Bone.SetBoneName(n"Bn_R_BigFeather02");
        this.OBBConfigs[5].BoneConfigs[0].LocationOffset = FVector(0.0, -30.0, 0.0);
        this.OBBConfigs[5].BoneConfigs[1].Bone.SetBoneName(n"Bn_R_BigFeather_P02");
        this.OBBConfigs[5].BoneConfigs[1].LocationOffset = FVector(100.0, 0.0, 0.0);
        this.OBBConfigs[5].BoneConfigs[2].Bone.SetBoneName(n"Bn_R_BigFeather03");
        this.OBBConfigs[5].BoneConfigs[2].LocationOffset = FVector(0.0, -50.0, 0.0);
        this.OBBConfigs[5].BoneConfigs[3].Bone.SetBoneName(n"Bn_R_BigFeather_M02");
        this.OBBConfigs[5].BoneConfigs[3].LocationOffset = FVector(80.0, -30.0, 0.0);
        this.OBBConfigs[5].BoneConfigs[4].Bone.SetBoneName(n"Bn_R_BigFeather01");
        this.OBBConfigs[5].ExportSocket.SocketName = n"SKT_R_BigFeatherHitBox03";
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        for (auto& local_16 : this.OBBConfigs)
        {
            TArray<FVector> local_20;
            for (auto& local_34 : local_16.BoneConfigs)
            {
                FTransform local_60 = FTransform(local_34.Bone.GetTransform());
                FVector local_90 = local_60.TransformPositionNoScale(local_34.LocationOffset);
                local_20.Add((local_90 + (local_60.GetRotation().GetAxisZ() * 20.0)));
                local_20.Add((local_90 - (local_60.GetRotation().GetAxisZ() * 20.0)));
            }
            this.OrientalBoundingBox.Build(local_20);
            local_16.ExportSocket.SetTransform(this.OrientalBoundingBox.Transform);
            if (local_16.bWantDebugDraw)
            {
                for (auto& local_128 : local_20)
                {
                    this.DrawAnimDebugPoint(local_128);
                }
                this.VisualizeOBB(this.OrientalBoundingBox);
            }
        }
        return;
    }
    void VisualizeOBB(const FOrientalBoundingBox &inout OBB)
    {
        TArray<FVector> local_8 = OBB.GetVertices();
        this.DrawAnimDebugCubicShape(local_8[0], local_8[1], local_8[2], local_8[3], local_8[4], local_8[5], local_8[6], local_8[7], FColor::Red, EPTDebugDrawSpace(0), true);
        return;
    }
}

