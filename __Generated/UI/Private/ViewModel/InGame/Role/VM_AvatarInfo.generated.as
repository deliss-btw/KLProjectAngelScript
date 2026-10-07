

struct FOnHoverCommonChanged : FEUIModelDelegate
{
    FEUIModelDelegate _base_FEUIModelDelegate;

    FOnHoverCommonChanged()
    {
        FEUIModelDelegate local_26 = FEUIModelDelegate("bool", "bool");
        return;
    }
    bool Execute(const bool Arg0) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().Execute(Arg0);
    }
    bool ExecuteIfBound(const bool Arg0, bool &inout OutResult) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().ExecuteIfBound(Arg0, OutResult);
    }
}

namespace __FVM_AvatarInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarInfo> __ModelContainer_Require_FVM_AvatarInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarInfoExtend_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarInfoExtend> __ModelContainer_Require_FVM_AvatarInfoExtend(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarInfoExtend>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarInfoExtend(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarInfoExtend>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarInfoExtend>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarInfoExtend>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarSpecialtyInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarSpecialtyInfo> __ModelContainer_Require_FVM_AvatarSpecialtyInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarSpecialtyInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarSpecialtyInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarSpecialtyInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarSpecialtyInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarSpecialtyInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarDetailInfo_SkillSelect_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> __ModelContainer_Require_FVM_AvatarDetailInfo_SkillSelect(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarDetailInfo_SkillSelect(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarDetailSkillSelect_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarDetailSkillSelect> __ModelContainer_Require_FVM_AvatarDetailSkillSelect(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarDetailSkillSelect>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarDetailSkillSelect(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarDetailSkillSelect>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarDetailSkillSelect>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarDetailSkillSelect>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarDetailPopInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarDetailPopInfo> __ModelContainer_Require_FVM_AvatarDetailPopInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarDetailPopInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarDetailPopInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarDetailPopInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarDetailPopInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarDetailPopInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarDetailInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarDetailInfo> __ModelContainer_Require_FVM_AvatarDetailInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarDetailInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarDetailInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarDetailInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarDetailInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarDetailInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVMS_PlayerOwnedAvatarInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> __ModelContainer_Require_FVMS_PlayerOwnedAvatarInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_PlayerOwnedAvatarInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
