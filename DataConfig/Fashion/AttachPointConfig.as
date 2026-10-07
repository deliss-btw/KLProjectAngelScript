

struct FDecoAttachOffset
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector3f m_Location = FVector3f::ZeroVector;
    UPROPERTY()
    FRotator3f m_Rotation = FRotator3f::ZeroRotator;
    UPROPERTY()
    float32 m_Scale = 1.0f;

    FDecoAttachOffset(const FDecoAttachOffset &inout Other)
    {
        this.m_Location = Other.m_Location;
        this.m_Rotation = Other.m_Rotation;
        this.m_Scale = Other.m_Scale;
        return;
    }
    FDecoAttachOffset opAssign(const FDecoAttachOffset &inout Other)
    {
        FDecoAttachOffset __r;
        this.SetLocation(Other.GetLocation());
        this.SetRotation(Other.GetRotation());
        this.SetScale(Other.GetScale());
        return __r;
    }
    FTransform ToTransform() const
    {
        return FTransform(FRotator(this.GetRotation()), FVector(this.GetLocation()), FVector(this.GetScale()));
    }
    FVector3f GetLocation() const property
    {
        FVector3f __r;
        return __r;
    }
    FVector3f GetModify_Location() property
    {
        FVector3f __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLocation(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Location = __Value;
        return;
    }
    FRotator3f GetRotation() const property
    {
        FRotator3f __r;
        return __r;
    }
    FRotator3f GetModify_Rotation() property
    {
        FRotator3f __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetRotation(const FRotator3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Rotation = __Value;
        return;
    }
    float32 GetScale() const property
    {
        return this.m_Scale;
    }
    void SetScale(const float32 __Value) property
    {
        if (this.m_Scale == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Scale = __Value;
        return;
    }
}

struct FAvatarDecoAttachOffsetOverride
{
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> Avatar;
    UPROPERTY()
    FDecoAttachOffset Offset;

    FAvatarDecoAttachOffsetOverride()
    {
        return;
    }
}

struct FAttachPointConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    EFashionSlotType SlotType;
    UPROPERTY()
    int MaxSlotCount = 1;
    UPROPERTY()
    TArray<FDataObjectPtr> m_DisabledAvatars;
    UPROPERTY()
    EFashionDecoSocket DecoSocket = EFashionDecoSocket(0);
    UPROPERTY()
    FDecoAttachOffset Offset;
    UPROPERTY()
    TArray<FAvatarDecoAttachOffsetOverride> AvatarOffsetOverrides;


    FDecoAttachOffset GetOffsetForAvatar(const uint AvatarId) const
    {
        for (auto& local_16 : this.AvatarOffsetOverrides)
        {
            if ((local_16.Avatar && (0 == AvatarId)))
            {
                return local_16.Offset;
            }
        }
        return this.Offset;
    }
    const TArray<TDataObjectPtr<FAvatarPrefabConfig>> GetDisabledAvatars() const property
    {
        const TArray<TDataObjectPtr<FAvatarPrefabConfig>> __r;
        return __r;
    }
    void SetDisabledAvatars(const TArray<TDataObjectPtr<FAvatarPrefabConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FAvatarPrefabConfig>>> local_2;
        this.m_DisabledAvatars = local_2;
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FDecoAttachOffset &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FDecoAttachOffset &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDecoAttachOffset
{
int __IndexOf_Location()
{
    return 0;
}
int __IndexOf_Rotation()
{
    return 1;
}
int __IndexOf_Scale()
{
    return 2;
}
}
