
namespace AppearanceMeshUtils
{
    const FName FaceChildName = n"Face";
    const FName HairChildName = n"Hair";
    const FName UpperChildName = n"UpperCloth";
    const FName LowerChildName = n"LowerCloth";
    const FName BodyMaterialSlotName = n"Body";

FName DecoChildName(const EFashionDecoSocket DecoSocket)
{
    switch (int(DecoSocket))
    {
    case 1:
    {
        return n"HairDeco";
    }
    case 2:
    {
        return n"HeadDeco";
    }
    case 3:
    {
        return n"FaceDeco";
    }
    case 4:
    {
        return n"EarDeco_L";
    }
    case 5:
    {
        return n"EarDeco_R";
    }
    case 6:
    {
        return n"NeckDeco";
    }
    case 7:
    {
        return n"ShoulderDeco_L";
    }
    case 8:
    {
        return n"ShoulderDeco_R";
    }
    case 9:
    {
        return n"HandDeco_L";
    }
    case 10:
    {
        return n"HandDeco_R";
    }
    case 11:
    {
        return n"WaistDeco";
    }
    case 12:
    {
        return n"HipDeco";
    }
    case 13:
    {
        return n"BackDeco";
    }
    }
    return NAME_None;
}
USkeletalMeshComponent ResolveViewMesh(const AActor Actor, bool &out bIsShowCase)
{
    bIsShowCase = false;
    bIsShowCase = false;
    if (Actor == nullptr)
    {
        return nullptr;
    }
    AGameCharacter local_12 = (Cast<AGameCharacter>(Actor));
    if (local_12 != nullptr)
    {
        return local_12.ViewMesh;
    }
    AShowCaseActorBase local_16 = (Cast<AShowCaseActorBase>(Actor));
    if (local_16 == nullptr)
    {
        return nullptr;
    }
    bIsShowCase = true;
    return Cast<USkeletalMeshComponent>(Actor.FindComponentByName(n"ViewMesh"));
}
USkeletalMeshComponent FindChildSkeletalMesh(const USkeletalMeshComponent Parent, const FName &inout ChildName)
{
    if (Parent == nullptr)
    {
        return nullptr;
    }
    int local_4 = 0;
    for (; local_4 < Parent.GetNumChildrenComponents(); ++local_4)
    {
        USceneComponent local_10 = Parent.GetChildComponent(local_4);
        if ((ChildName == local_10.GetName()))
        {
            return Cast<USkeletalMeshComponent>(local_10);
        }
    }
    return nullptr;
}
void ResetMaterialOverrides(const USkeletalMeshComponent SkComp)
{
    if (SkComp == nullptr)
    {
        return;
    }
    int local_5 = SkComp.GetNumMaterials();
    int local_6 = 0;
    for (; local_6 < local_5; )
    {
        SkComp.SetMaterial(local_6, nullptr);
        ++local_6;
    }
    return;
}
}
