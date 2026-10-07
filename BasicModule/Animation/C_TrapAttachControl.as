
namespace __INTENRAL_FC_TrapAttachData_NS
{
    const TECSComponentDerivedPtr<FC_TrapAttachData> DerivedPtr = TECSComponentDerivedPtr<FC_TrapAttachData>();
    const FC_TrapAttachData DefaultValue = FC_TrapAttachData();

}
struct FC_TrapAttachData : FECSComponent
{
    UPROPERTY()
    float32 Alpha = 0.0f;
    UPROPERTY()
    FTransform TrapTMTop;
    UPROPERTY()
    FTransform TrapTMFrontL;
    UPROPERTY()
    FTransform TrapTMFrontM;
    UPROPERTY()
    FTransform TrapTMFrontR;
    UPROPERTY()
    FTransform TrapTMBackL;
    UPROPERTY()
    FTransform TrapTMBackM;
    UPROPERTY()
    FTransform TrapTMBackR;
    UPROPERTY()
    FTransform TrapTMHalfFrontL;
    UPROPERTY()
    FTransform TrapTMHalfFrontM;
    UPROPERTY()
    FTransform TrapTMHalfFrontR;
    UPROPERTY()
    FTransform TrapTMHalfBackL;
    UPROPERTY()
    FTransform TrapTMHalfBackM;
    UPROPERTY()
    FTransform TrapTMHalfBackR;
    UPROPERTY()
    bool IsOpen = false;


}

class UESMAction_TrapAttachUpdate : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FRuntimeFloatCurve Weight = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);
    UPROPERTY()
    UDataTable TrapOffsetTable;
    UPROPERTY()
    float32 InterpSpeed = 1000.0f;

    default TrapOffsetTable = Cast<UDataTable>(LoadObject(nullptr, "/Script/Engine.DataTable'/Game/MoleRes/Dev/Data/Combat/Ability/Prop/DT_TrapAttachOffset.DT_TrapAttachOffset'"));


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        const AActor local_14;
        USkeletalMeshComponent local_28;
        float32 local_293;
        FECSEntity local_8 = this.GetMonsterEntity(Context.GetEntity());
        if (!(local_8.IsValid()))
        {
            return;
        }
        local_14 = local_8.GetActor();
        if ((!((local_14 != nullptr))))
        {
            return;
        }
        AGameCharacter local_18 = (Cast<AGameCharacter>(local_14));
        if ((!((local_18 != nullptr))))
        {
            return;
        }
        USkeletalMeshComponent local_20 = local_18.ViewMesh;
        if ((!((local_20 != nullptr))))
        {
            return;
        }
        if ((!((Context.GetEntity().GetActor() != nullptr))))
        {
            return;
        }
        if ((!((local_28 != nullptr))))
        {
            return;
        }
        FTransform local_76 = local_28.GetWorldTransform();
        FTrapAttachOffsetRow local_146;
        FName local_148(n"Root");
        FName local_150(n"pelvis");
        float32 local_151 = 0.65f;
        float32 local_153 = 1.0f;
        FVector local_160;
        if (this.TryGetRowFromTable(local_8, local_146))
        {
            local_148 = local_146.RootBoneName;
            local_150 = local_146.PelvisBoneName;
            local_160 = local_146.TopMOffset;
            local_151 = local_146.UpperLayerBlendRatio;
            local_153 = local_146.HalfLayerRadiusScale;
        }
        FTransform local_52 = this.GetBoneWorldTransform(local_20, local_148);
        FTransform local_184 = this.GetBoneWorldTransform(local_20, local_150);
        FQuat local_224 = this.GetRootYawQuat(local_52);
        FVector local_242 = local_76.InverseTransformPosition((local_184.GetLocation() + local_224.RotateVector(local_160)));
        FTransform local_208 = FTransform(FQuat::Identity, local_242, FVector::OneVector);
        FVector local_286(FVector::ZeroVector);
        TArray<FTransform> local_290;
        local_290.SetNum(6);
        float32 local_152 = local_146.OuterRadius;
        if (local_152 > 0.0f)
        {
            local_293 = local_146.OuterRadius;
        }
        else
        {
            local_293 = 100.0f;
        }
        float32 local_295 = local_146.AngleOffset;
        TArray<FVector> local_306;
        local_306.SetNum(6);
        local_306[0] = local_146.FrontLOffset;
        local_306[1] = local_146.FrontMOffset;
        local_306[2] = local_146.FrontROffset;
        local_306[3] = local_146.BackLOffset;
        local_306[4] = local_146.BackMOffset;
        local_306[5] = local_146.BackROffset;
        TArray<float32> local_314 = this.GetDirectionAngles();
        this.ComputeOuterTargets_CS(local_286, local_146.BaseOffset, local_293, local_146.OuterHeight, local_295, local_314, local_306, local_290);
        TArray<FTransform> local_318;
        local_318.SetNum(6);
        this.ComputeHalfTargets(local_208, local_290, local_286, local_151, local_153, local_318);
        float local_326 = Time.WorldDeltaTime.ToSeconds();
        float32 local_291 = float32(local_326);
        FC_TrapAttachData local_324;
        if (local_324.Alpha < 0.01f)
        {
            this.WriteAllToData(local_324, local_208, local_290, local_318);
        }
        else
        {
            this.InterpAllToData(local_324, local_208, local_290, local_318, local_291, this.InterpSpeed);
        }
        local_324.IsOpen = true;
        float local_326_2 = Time.ActionDuration.ToSeconds();
        if (local_326_2 > 0.001)
        {
            local_152 = float32((Time.ActionLastTime.ToSeconds() / local_326_2));
        }
        else
        {
            local_152 = 1.0f;
        }
        local_324.Alpha = this.Weight.GetFloatValue(local_152, 0.0f);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_TrapAttachData& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.Alpha = 0.0f;
            local_6.IsOpen = false;
        }
        return;
    }
    TArray<float32> GetDirectionAngles() const
    {
        TArray<float32> local_4;
        local_4.Add(300.0f);
        local_4.Add(0.0f);
        local_4.Add(60.0f);
        local_4.Add(240.0f);
        local_4.Add(180.0f);
        local_4.Add(120.0f);
        return local_4;
    }
    FECSEntity GetMonsterEntity(const FECSEntity &inout VinetrapEntity) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return ENTITY_NULL;
        }
        FNameHandle_EntityBBVarEntity local_10;
        local_10;
        return VinetrapEntity.GetBB_Entity(local_10);
    }
    bool TryGetRowFromTable(const FECSEntity &inout MonsterEntity, FTrapAttachOffsetRow &inout OutRow) const
    {
        if (!(IsValid(this.TrapOffsetTable)))
        {
            return false;
        }
        TDataObjectPtr<FBasePrefabConfig> local_26 = ::GetPrefabConfigPtr(MonsterEntity);
        if ((local_26 == nullptr))
        {
            return false;
        }
        FName local_52(local_26.GetDataName());
        if ((local_52 == NAME_None))
        {
            return false;
        }
        return this.TrapOffsetTable.FindRow(local_52, OutRow);
    }
    FTransform GetBoneWorldTransform(const USkeletalMeshComponent Mesh, const FName &inout BoneName) const
    {
        if (!((BoneName == NAME_None)) && (Mesh.GetBoneIndex(BoneName) >= 0))
        {
            return Mesh.GetBoneTransform(BoneName, ERelativeTransformSpace(0));
        }
        return Mesh.GetWorldTransform();
    }
    FQuat GetRootYawQuat(const FTransform &inout RootWorld) const
    {
        FRotator local_28 = FRotator(0.0, RootWorld.GetRotation().Rotator().Yaw, 0.0);
        return local_28.Quaternion();
    }
    void ComputeOuterTargets_CS(const FVector &inout CenterCS, const FVector &inout BaseOffset, const float32 Radius, const float32 Height, const float32 AngleOffset, const TArray<float32> &inout Angles, const TArray<FVector> &inout PolarOffsets, TArray<FTransform> &inout OutCS) const
    {
        int local_1 = 0;
        for (; local_1 < 6; )
        {
            float32 local_6 = Angles[local_1];
            local_6 = local_6 + AngleOffset;
            local_6 = local_6 * 0.017453292f;
            FVector local_20 = FVector(FMath::Cos(local_6), FMath::Sin(local_6), 0.0);
            FVector local_14 = FVector(-FMath::Sin(local_6), FMath::Cos(local_6), 0.0);
            FVector local_50 = ((local_20 * PolarOffsets[local_1].X) + (local_14 * PolarOffsets[local_1].Y));
            FVector local_44 = (local_50 + FVector(0.0, 0.0, PolarOffsets[local_1].Z));
            FVector local_38 = (local_20 * Radius);
            local_50 = (local_38 + FVector(0.0, 0.0, Height));
            local_38 = (local_50 + local_44);
            OutCS[local_1] = FTransform(FQuat::Identity, ((CenterCS + BaseOffset) + local_38), FVector::OneVector);
            ++local_1;
        }
        return;
    }
    void ComputeHalfTargets(const FTransform &inout TopMCS, const TArray<FTransform> &inout OuterCS, const FVector &inout RootCSPos, const float32 BlendRatio, const float32 RadiusScale, TArray<FTransform> &inout OutHalfCS) const
    {
        int local_1 = 0;
        for (; local_1 < 6; )
        {
            FVector local_36 = TopMCS.GetLocation();
            FVector local_28 = (OuterCS[local_1].GetLocation() - TopMCS.GetLocation());
            FVector local_22 = (local_36 + (local_28 * BlendRatio));
            FVector local_10 = FVector((local_22.X - RootCSPos.X), (local_22.Y - RootCSPos.Y), 0.0);
            local_28 = FVector(RootCSPos.X, RootCSPos.Y, 0.0);
            local_36 = (local_28 + (local_10 * RadiusScale));
            local_22.X = local_36.X;
            local_22.Y = local_36.Y;
            OutHalfCS[local_1] = FTransform(FQuat::Identity, local_22, FVector::OneVector);
            ++local_1;
        }
        return;
    }
    void WriteAllToData(FC_TrapAttachData &inout Data, const FTransform &inout TopM, const TArray<FTransform> &inout OuterArr, const TArray<FTransform> &inout HalfArr) const
    {
        Data.TrapTMTop = TopM;
        Data.TrapTMFrontL = OuterArr[0];
        Data.TrapTMFrontM = OuterArr[1];
        Data.TrapTMFrontR = OuterArr[2];
        Data.TrapTMBackL = OuterArr[3];
        Data.TrapTMBackM = OuterArr[4];
        Data.TrapTMBackR = OuterArr[5];
        Data.TrapTMHalfFrontL = HalfArr[0];
        Data.TrapTMHalfFrontM = HalfArr[1];
        Data.TrapTMHalfFrontR = HalfArr[2];
        Data.TrapTMHalfBackL = HalfArr[3];
        Data.TrapTMHalfBackM = HalfArr[4];
        Data.TrapTMHalfBackR = HalfArr[5];
        return;
    }
    void InterpTransformSingle(FTransform &inout Current, const FTransform &inout Target, const float32 Dt, const float32 Speed) const
    {
        Current.SetLocation(FMath::VInterpTo(Current.GetLocation(), Target.GetLocation(), Dt, Speed));
        Current.SetRotation(FQuat::Identity);
        return;
    }
    void InterpAllToData(FC_TrapAttachData &inout Data, const FTransform &inout TopM, const TArray<FTransform> &inout OuterArr, const TArray<FTransform> &inout HalfArr, const float32 Dt, const float32 Speed) const
    {
        this.InterpTransformSingle(Data.TrapTMTop, TopM, Dt, Speed);
        this.InterpTransformSingle(Data.TrapTMFrontL, OuterArr[0], Dt, Speed);
        this.InterpTransformSingle(Data.TrapTMFrontM, OuterArr[1], Dt, Speed);
        this.InterpTransformSingle(Data.TrapTMFrontR, OuterArr[2], Dt, Speed);
        this.InterpTransformSingle(Data.TrapTMBackL, OuterArr[3], Dt, Speed);
        this.InterpTransformSingle(Data.TrapTMBackM, OuterArr[4], Dt, Speed);
        this.InterpTransformSingle(Data.TrapTMBackR, OuterArr[5], Dt, Speed);
        this.InterpTransformSingle(Data.TrapTMHalfFrontL, HalfArr[0], Dt, Speed);
        this.InterpTransformSingle(Data.TrapTMHalfFrontM, HalfArr[1], Dt, Speed);
        this.InterpTransformSingle(Data.TrapTMHalfFrontR, HalfArr[2], Dt, Speed);
        this.InterpTransformSingle(Data.TrapTMHalfBackL, HalfArr[3], Dt, Speed);
        this.InterpTransformSingle(Data.TrapTMHalfBackM, HalfArr[4], Dt, Speed);
        this.InterpTransformSingle(Data.TrapTMHalfBackR, HalfArr[5], Dt, Speed);
        return;
    }
}

namespace ECSFunc_FC_TrapAttachData
{
UFUNCTION()
bool HasTrapAttachData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TrapAttachData);
}
FC_TrapAttachData& AssignTrapAttachData(const FECSEntity &inout Entity, const FC_TrapAttachData &inout DefaultValue = FC_TrapAttachData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TrapAttachData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTrapAttachData_BP(const FECSEntity &inout Entity, const FC_TrapAttachData &inout DefaultValue = FC_TrapAttachData())
{
    ECSFunc_FC_TrapAttachData::AssignTrapAttachData(Entity, DefaultValue);
    return;
}
FC_TrapAttachData& ModifyTrapAttachData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TrapAttachData));
    return local_12.GetComp();
}
FC_TrapAttachData& ModifyOrAddTrapAttachData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TrapAttachData));
    return local_12.GetComp();
}
const FC_TrapAttachData& GetTrapAttachData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TrapAttachData));
    return local_12.GetComp();
}
UFUNCTION()
FC_TrapAttachData GetTrapAttachData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TrapAttachData& local_4 = ECSFunc_FC_TrapAttachData::GetTrapAttachData(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TrapAttachData();
}
const FC_TrapAttachData GetDefaultedTrapAttachData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TrapAttachData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TrapAttachData);
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
FC_TrapAttachData GetDefaultedTrapAttachData_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TrapAttachData::GetDefaultedTrapAttachData(Entity);
}
UFUNCTION()
bool RemoveTrapAttachData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TrapAttachData);
}
}
FECSMonitorRuntimeView __GetMonitorTrapAttachDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TrapAttachData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrapAttachDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TrapAttachData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrapAttachDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TrapAttachData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrapAttachDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TrapAttachData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrapAttachDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TrapAttachData, bFixedFrame, bMustHandleAll);
}
void __MonitorTrapAttachDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TrapAttachData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTrapAttachDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TrapAttachData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTrapAttachDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TrapAttachData, bFixedFrame, Details);
    return;
}
