

struct FSpawnAppendantEntityParam
{
    UPROPERTY()
    bool bUseOwnerAttackerValues = true;
    UPROPERTY()
    bool bAttachToOwner = false;
    UPROPERTY()
    FName AttachToSocketName = NAME_None;
    UPROPERTY()
    FVector Position = FVector::ZeroVector;
    UPROPERTY()
    FQuat Rotation = FQuat::Identity;


}

