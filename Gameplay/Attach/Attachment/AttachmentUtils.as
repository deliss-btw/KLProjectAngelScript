
namespace FAttachmentUtils
{
UFUNCTION()
void ResolveDetachLogicTransform(const FECSEntity &inout ChildEntity, const FECSEntity &inout ParentEntity, const bool bUseRootRotationOffset, const bool bUseDetachLocationOffset, const bool bUseDetachRotationOffset, const FVector &inout LocationOffset, const FRotator &inout RotationOffset, const FCS_FixedTime &inout FixedTime, FVector &inout OutPosition, FRotator &inout OutRotation)
{
    int local_2 = 0;
    int local_8 = 0;
    int local_32 = 0;
    FVector local_14 = local_8.GetPosition();
    FRotator local_26 = local_8.GetRotation().Rotator();
    if (local_32 && !((local_32.GetSocketName() == NAME_None)) && !(bUseRootRotationOffset))
    {
        bool local_37;
        local_37 = false;
        FTransform local_92;
        local_92 = FTransformUtils::GetSocketTransformInGameMesh(ParentEntity, local_32.GetSocketName(), FixedTime.Time, local_37, FDownsampleConfig());
        if (local_37)
        {
            local_14 = local_92.GetLocation();
            local_26 = local_92.GetRotation().Rotator();
        }
    }
    FVector local_126;
    if (bUseDetachLocationOffset)
    {
        local_126 = (local_14 + local_26.RotateVector(LocationOffset));
    }
    else
    {
        local_126 = local_2.GetPosition();
    }
    FRotator local_144;
    if (bUseDetachRotationOffset)
    {
        local_144 = (local_26 + RotationOffset).GetNormalized();
    }
    else
    {
        local_144 = local_2.GetRotation().Rotator();
    }
    if ((local_32 && local_32.GetbRestoreAlignedStaticSocketOnDetach() && bUseDetachLocationOffset) && bUseDetachRotationOffset)
    {
        FTransform local_92;
        local_92.SetLocation(local_126);
        local_92.SetRotation(local_144.Quaternion());
        local_126 = local_92.TransformPosition(local_32.GetAlignedStaticSocketInverseLocationOffset());
        local_144 = local_92.TransformRotation(local_32.GetAlignedStaticSocketInverseRotationOffset()).Rotator();
    }
    OutPosition = local_126;
    OutRotation = local_144;
    return;
}
UFUNCTION()
void EntityAttachToParent(const FECSEntity &inout Entity, const FECSEntity &inout ParentEntity, const FFPTime &inout Time, const FName &inout SocketName, const bool bAttachOffsetBaseOnRootTransform, const FVector &inout LocationOffset, const FRotator &inout RotationOffset, const float32 BlendDuration = 0.f, const float32 BlendKeepDuration = 0.f, const int AttachSocketUpdatePeriod = 0, const FVector &inout LogicLocationOffsetExtra = FVector::ZeroVector, const float32 BlendOutDuration = 0.f, const bool bRestoreAlignedStaticSocketOnDetach = false)
{
    if (Entity.IsValid() && ParentEntity.IsValid())
    {
        FCE_EntityAttachmentOperation local_20;
        FFPTime local_12;
        if (Time.opCmp(0.0) <= 0)
        {
            local_12 = ECS::GetContextTime();
        }
        else
        {
            local_12 = Time;
        }
        FECSWorldPtr local_14 = Entity.GetWorld();
        local_20.bIsAttach = true;
        FEventAttachToEntity local_22 = local_20.AttachEvent;
        local_22.SetParent(ParentEntity);
        local_22.GetAttachmentInfo().SetSocketName(SocketName);
        local_22.GetAttachmentInfo().SetbAttachOffsetBaseOnRootTransform(bAttachOffsetBaseOnRootTransform);
        local_22.GetAttachmentInfo().SetLocationOffset(LocationOffset);
        local_22.GetAttachmentInfo().SetRotationOffset(RotationOffset);
        local_22.GetAttachmentInfo().SetbRestoreAlignedStaticSocketOnDetach(bRestoreAlignedStaticSocketOnDetach);
        local_22.SetAttachBlendInDuration(BlendDuration);
        local_22.SetAttachBlendKeepDuration(BlendKeepDuration);
        local_22.SetAttachSocketUpdatePeriod(AttachSocketUpdatePeriod);
        local_22.SetLogicLocationOffsetExtra(LogicLocationOffsetExtra);
        local_22.SetDetachBlendOutDuration(BlendOutDuration);
    }
    return;
}
UFUNCTION()
void EntityDetach(const FECSEntity &inout Entity, const FFPTime &inout Time, const FVector &inout LogicLocationOffset = FVector::ZeroVector, const FRotator &inout LogicRotationOffset = FRotator::ZeroRotator, const bool bUseRootRotationOffset = false, const uint8 ZeroOutRotationAxisWhenDetach = 0, const bool bAvoidPenetrationFromParentPos = false)
{
    if (Entity.IsValid())
    {
        FCE_EntityAttachmentOperation local_10;
        FECSWorldPtr local_4 = Entity.GetWorld();
        local_10.bIsAttach = (0 != 0);
        FEventDetachFromEntity local_12 = local_10.DetachEvent;
        local_12.SetLocationOffset(LogicLocationOffset);
        local_12.SetRotationOffset(LogicRotationOffset);
        local_12.SetbOffsetBaseOnRootTransform(bUseRootRotationOffset);
        local_12.SetZeroOutRotationAxisWhenDetach(uint8(ZeroOutRotationAxisWhenDetach));
        local_12.SetbAvoidPenetrationFromParentPos(bAvoidPenetrationFromParentPos);
    }
    return;
}
UFUNCTION()
void EntityDetachWithoutOffset(const FECSEntity &inout Entity, const FFPTime &inout Time, const bool bUseRootRotationOffset = false, const uint8 ZeroOutRotationAxisWhenDetach = 0)
{
    if (Entity.IsValid())
    {
        FCE_EntityAttachmentOperation local_10;
        FECSWorldPtr local_4 = Entity.GetWorld();
        local_10.bIsAttach = (0 != 0);
        FEventDetachFromEntity local_12 = local_10.DetachEvent;
        local_12.SetbUseDetachLocationOffset(false);
        local_12.SetbUseDetachRotationOffset(false);
        local_12.SetbOffsetBaseOnRootTransform(bUseRootRotationOffset);
        local_12.SetZeroOutRotationAxisWhenDetach(uint8(ZeroOutRotationAxisWhenDetach));
    }
    return;
}
UFUNCTION()
bool IsEntityAttachedToParent(const FECSEntity &inout Entity, const FECSEntity &inout ParentEntity)
{
    if (Entity.IsValid() && ParentEntity.IsValid())
    {
        Get local_6;
        const FC_AttachmentParent& local_8 = local_6.opCall();
        if (local_8)
        {
            return (FECSEntity(local_8.GetParent()) == ParentEntity);
        }
    }
    return false;
}
UFUNCTION()
FECSEntity GetEntityAttachedParent(const FECSEntity &inout Entity)
{
    if (Entity.IsValid())
    {
        Get local_6;
        const FC_AttachmentParent& local_8 = local_6.opCall();
        if (local_8)
        {
            return local_8.GetParent();
        }
    }
    return ENTITY_NULL;
}
UFUNCTION()
TArray<FECSEntity> GetEntityAttachedChild(const FECSEntity &inout Entity)
{
    if (Entity.IsValid())
    {
        Get local_10;
        const FC_AttachmentChildren& local_12 = local_10.opCall();
        if (local_12)
        {
            return local_12.GetChildren();
        }
    }
    return TArray<FECSEntity>();
}
}
