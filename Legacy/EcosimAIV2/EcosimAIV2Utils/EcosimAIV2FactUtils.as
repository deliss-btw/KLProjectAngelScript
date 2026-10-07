
namespace FEcosimAIV2Utils
{
FString GameplayTagToPrologStr(const FGameplayTag &inout Tag)
{
    FString local_10 = (FString("tag_") + (Tag.GetTagName().ToString().Replace(".", "_", ESearchCase(1))));
    return local_10;
}
FString GetEntityRelationStr(const EEcosimAIV2EntityRelation EntityRelation)
{
    FString local_14 = (FString("enum_") + UEnum::GetEnumType(n"EEcosimAIV2EntityRelation").GetNameStringByValue(int(EntityRelation)));
    return local_14;
}
bool GetEntityControlledBy(const FECSEntity &inout Entity, FECSEntity &out ControlledByEntity)
{
    FECSEntity local_4;
    ControlledByEntity = local_4;
    Get local_8;
    const FC_MountIsDrivenBy& local_10 = local_8.opCall();
    if (local_10)
    {
        if (local_10.GetDriverEntity().IsValid())
        {
            ControlledByEntity = local_10.GetDriverEntity();
            return true;
        }
    }
    else
    {
        Get local_16;
        const FC_ChainParentInfo& local_18 = local_16.opCall();
        if (local_18)
        {
            if (local_18.GetParent().IsValid())
            {
                ControlledByEntity = local_18.GetParent();
                return true;
            }
        }
    }
    return false;
}
FString GetEntityShowName(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_PrefabConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.ConfigPtr && local_6.ConfigPtr.IsSet())
        {
            return FString();
        }
    }
    return "";
}
}
