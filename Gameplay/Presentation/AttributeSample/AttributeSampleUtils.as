
namespace AttributeSampleUtils
{
void AddAttributeSample(const FECSEntity &inout SampledEntity, const EAttributeSampleType SampledAttribute, const EAttributeSampleRequester Requester, const FECSEntity &inout Sampler = ENTITY_NULL)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void RemoveAttributeSample(const FECSEntity &inout SampledEntity, const EAttributeSampleType SampledAttribute, const EAttributeSampleRequester Requester, const FECSEntity &inout Sampler = ENTITY_NULL)
{
    Modify local_4;
    FC_AttributeSample& local_6 = local_4.opCall();
    if (local_6)
    {
        TRawPtr<FAttributeSampleInfo> local_10 = local_6.AttributeSamples.Find(SampledAttribute);
        if (local_10)
        {
            if (local_10.opArrow().IsEmpty())
            {
                if (local_6.AttributeSamples.IsEmpty())
                {
                    Remove local_16;
                    local_16.opCall();
                }
            }
        }
    }
    return;
}
void RemoveAllAttributeSamples(const FECSEntity &inout SampledEntity, const EAttributeSampleRequester Requester)
{
    Modify local_4;
    FC_AttributeSample& local_6 = local_4.opCall();
    if (local_6)
    {
        for (auto& local_26 : local_6.AttributeSamples)
        {
            local_26;
            ENTITY_NULL.RemoveSample();
            if (local_6.AttributeSamples.IsEmpty())
            {
                Remove local_30;
                local_30.opCall();
            }
        }
    }
    return;
}
bool IsAttributeSampled(const FECSEntityId &inout SampledEntityId, const EAttributeSampleType SampledAttribute, const FECSEntity &inout Sampler = ENTITY_NULL)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        return AttributeSampleUtils_Internal::Server_IsAttributeSampled(FECSEntity(SampledEntityId), EAttributeSampleType(SampledAttribute), Sampler);
    }
    return AttributeSampleUtils_Internal::Client_IsAttributeSampled(SampledEntityId, EAttributeSampleType(SampledAttribute), Sampler);
}
bool SamplePosition2D(const FECSEntity &inout LocalPlayer, const FECSEntityId &inout SampledEntityId, FVector2D &out Position2D)
{
    FVector2D local_4;
    Position2D = local_4;
    if (!(AttributeSampleUtils_Internal::Client_IsAttributeSampledByPlayer(LocalPlayer, SampledEntityId, EAttributeSampleType(1))))
    {
        return false;
    }
    FECSWorldPtr local_8 = LocalPlayer.GetWorld();
    Get local_12;
    const FCS_Position2DAttributeSample& local_14 = local_12.opCall();
    if (local_14)
    {
        if (local_14.GetPosition2DMap().Find(SampledEntityId, Position2D))
        {
            return true;
        }
    }
    return false;
}
bool SamplePosition(const FECSEntity &inout LocalPlayer, const FECSEntityId &inout SampledEntityId, FVector &out Position)
{
    float32 local_13;
    FVector local_6;
    int local_22 = 0;
    int local_28 = 0;
    Position = local_6;
    if (!(AttributeSampleUtils_Internal::Client_IsAttributeSampledByPlayer(LocalPlayer, SampledEntityId, EAttributeSampleType(3))))
    {
        return false;
    }
    FVector2D local_12;
    FECSWorldPtr local_16 = LocalPlayer.GetWorld();
    FECSWorldPtr local_16_2 = LocalPlayer.GetWorld();
    if (!(local_22) || !(local_28) || !(local_28.GetPositionZMap().Find(SampledEntityId, local_13)) || !(local_22.GetPosition2DMap().Find(SampledEntityId, local_12)))
    {
        return false;
    }
    Position.X = local_12.X;
    Position.Y = local_12.Y;
    Position.Z = local_13;
    return true;
}
bool SampleRotationAngle(const FECSEntity &inout LocalPlayer, const FECSEntityId &inout SampledEntityId, float32 &out RotationAngle)
{
    RotationAngle = 0.0f;
    if (!(AttributeSampleUtils_Internal::Client_IsAttributeSampledByPlayer(LocalPlayer, SampledEntityId, EAttributeSampleType(8))))
    {
        return false;
    }
    FECSWorldPtr local_6 = LocalPlayer.GetWorld();
    Get local_10;
    const FCS_RotationZAttributeSample& local_12 = local_10.opCall();
    if (local_12)
    {
        if (local_12.GetRotationZMap().Find(SampledEntityId, RotationAngle))
        {
            return true;
        }
    }
    return false;
}
bool SampleRotation(const FECSEntity &inout LocalPlayer, const FECSEntityId &inout SampledEntityId, FVector3f &out EulerRotation)
{
    float32 local_8;
    FVector3f local_3;
    int local_16 = 0;
    int local_22 = 0;
    EulerRotation = local_3;
    if (!(AttributeSampleUtils_Internal::Client_IsAttributeSampledByPlayer(LocalPlayer, SampledEntityId, EAttributeSampleType(12))))
    {
        return false;
    }
    FVector2f local_7;
    FECSWorldPtr local_10 = LocalPlayer.GetWorld();
    FECSWorldPtr local_10_2 = LocalPlayer.GetWorld();
    if (!(local_16) || !(local_22) || !(local_16.GetRotationXYMap().Find(SampledEntityId, local_7)) || !(local_22.GetRotationZMap().Find(SampledEntityId, local_8)))
    {
        return false;
    }
    return true;
}
bool SampleHP(const FECSEntity &inout LocalPlayer, const FECSEntityId &inout SampledEntityId, float32 &out HP)
{
    HP = 0.0f;
    if (!(AttributeSampleUtils_Internal::Client_IsAttributeSampledByPlayer(LocalPlayer, SampledEntityId, EAttributeSampleType(16))))
    {
        return false;
    }
    FECSWorldPtr local_6 = LocalPlayer.GetWorld();
    Get local_10;
    const FCS_HPAttributeSample& local_12 = local_10.opCall();
    if (local_12)
    {
        if (local_12.GetHPMap().Find(SampledEntityId, HP))
        {
            return true;
        }
    }
    return false;
}
}
namespace AttributeSampleUtils_Internal
{
bool Server_IsAttributeSampled(const FECSEntity &inout SampledEntity, const EAttributeSampleType SampledAttribute, const FECSEntity &inout Sampler = ENTITY_NULL)
{
    Get local_4;
    const FC_AttributeSample& local_6 = local_4.opCall();
    if (local_6)
    {
        TConstRawPtr<FAttributeSampleInfo> local_10 = local_6.AttributeSamples.Find(SampledAttribute);
        if (local_10)
        {
            return local_10.opArrow().HasAnySample(Sampler);
        }
    }
    return false;
}
bool Client_IsAttributeSampled(const FECSEntityId &inout SampledEntityId, const EAttributeSampleType SampledAttribute, const FECSEntity &inout Sampler = ENTITY_NULL)
{
    if ((Sampler == ENTITY_NULL))
    {
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Get local_8;
        const FCS_GlobalAttributeSampler& local_10 = local_8.opCall();
        if (local_10)
        {
            FBitSet32 local_11;
            if (local_10.GetAttributeSampleEntities().Find(SampledEntityId, local_11))
            {
                int local_12 = int(SampledAttribute);
                return !((local_11 & FBitSet32(local_12)).IsEmpty());
            }
        }
        return false;
    }
    Get local_18;
    const FC_AttributeSampler& local_20 = local_18.opCall();
    if (local_20)
    {
        FBitSet32 local_11;
        if (local_20.GetAttributeSampleEntities().Find(SampledEntityId, local_11))
        {
            int local_12_2 = int(SampledAttribute);
            return !((local_11 & FBitSet32(local_12_2)).IsEmpty());
        }
    }
    return false;
}
bool Client_IsAttributeSampledByPlayer(const FECSEntity &inout PlayerEntity, const FECSEntityId &inout SampledEntityId, const EAttributeSampleType SampledAttribute)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
}
