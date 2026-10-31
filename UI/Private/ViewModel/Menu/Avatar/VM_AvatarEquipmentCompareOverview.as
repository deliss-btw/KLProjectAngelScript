namespace FVM_AvatarEquipmentCompareOverview
{
    const int ModelId = 0;

}
struct FVM_AvatarEquipmentCompareOverview : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_CurrentAvatarCfg;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_CurSlotEquipmentInfo;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_CompareEquipmentInfo;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarEquipmentCompareItem>> m_CompareItemList;

    FVM_AvatarEquipmentCompareOverview()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarEquipmentCompareOverview' by default constructor.");
        return;
    }
    FVM_AvatarEquipmentCompareOverview(const FVM_AvatarEquipmentCompareOverview &inout Other)
    {
        this.m_CurrentAvatarCfg = Other.m_CurrentAvatarCfg;
        this.m_CurSlotEquipmentInfo = Other.m_CurSlotEquipmentInfo;
        this.m_CompareEquipmentInfo = Other.m_CompareEquipmentInfo;
        this.m_CompareItemList = Other.m_CompareItemList;
        return;
    }
    FVM_AvatarEquipmentCompareOverview(const TDataObjectPtr<FAvatarPrefabConfig> &inout InCurrentAvatarCfg, const TEUIModelRef<FVM_EquipmentInfo> &inout InCurSlotEquipmentInfo, const TEUIModelRef<FVM_EquipmentInfo> &inout InCompareEquipmentInfo)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCurrentAvatarCfg(InCurrentAvatarCfg);
        this.SetCurSlotEquipmentInfo(InCurSlotEquipmentInfo);
        this.SetCompareEquipmentInfo(InCompareEquipmentInfo);
        return;
    }
    FVM_AvatarEquipmentCompareOverview& opAssign(const FVM_AvatarEquipmentCompareOverview &inout Other)
    {
        this.m_CurrentAvatarCfg = Other.m_CurrentAvatarCfg;
        this.m_CurSlotEquipmentInfo = Other.m_CurSlotEquipmentInfo;
        this.m_CompareEquipmentInfo = Other.m_CompareEquipmentInfo;
        return Other.m_CompareItemList;
    }
    void PostConstruct()
    {
        int local_215;
        int local_216;
        int local_220 = 0;
        this.GetModify_CompareItemList().Reset(0);
        TMap<EEquipSlotType, FDSAvatarEquipmentInfo> local_22;
        FECSEntity local_26 = this.GetContext().GetLocalPlayer();
        Get local_30;
        const FC_DSPlayerAvatarInfo& local_32 = local_30.opCall();
        if (local_32)
        {
            for (auto& local_48 : local_32.GetAvatarList())
            {
                if (local_48.GetAvatarId() == this.GetCurrentAvatarCfg().opArrow().DataId)
                {
                    local_22 = local_48.GetEquipmentInfos();
                    break;
                }
            }
        }
        TArray<TEUIModelRef<FM_Trait>> local_54;
        for (auto& local_72 : local_22)
        {
            local_54.Append(::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(local_72.GetValue().GetGuid()).Get().GetEquipmentTraits());
        }
        TMap<TDataObjectPtr<FTraitConfig>, int> local_98;
        for (auto& local_112 : local_54)
        {
            int local_114 = local_98.FindOrAdd(local_112.Get().GetTraitConfig());
            int local_1 = local_112.Get().GetTraitLevel();
            local_114 = (int(local_114) + local_1);
        }
        TMap<TDataObjectPtr<FTraitConfig>, int> local_136;
        for (auto& local_152 : this.GetCurSlotEquipmentInfo().Get().GetEquipmentTraits())
        {
            int local_1_2 = local_152.Get().GetTrait().Get().GetTraitLevel();
            local_136.Add(local_152.Get().GetTrait().Get().GetTraitConfig(), local_1_2);
        }
        TMap<TDataObjectPtr<FTraitConfig>, int> local_176;
        for (auto& local_152 : this.GetCompareEquipmentInfo().Get().GetEquipmentTraits())
        {
            local_176.Add(local_152.Get().GetTrait().Get().GetTraitConfig(), local_152.Get().GetTrait().Get().GetTraitLevel());
        }
        TMap<TDataObjectPtr<FTraitConfig>, int> local_196;
        for (auto& local_214 : local_176)
        {
            local_215 = 0;
            if (local_136.Find(local_214.GetKey(), local_216))
            {
                int local_1_3 = local_214.GetValue();
                local_215 = local_1_3 - local_216;
            }
            else
            {
                local_215 = local_214.GetValue();
            }
            local_196.Add(local_214.GetKey(), local_215);
        }
        for (auto& local_214_2 : local_136)
        {
            if (!(local_176.Contains(local_214_2.GetKey())))
            {
                int local_1_4 = 0 - local_214_2.GetValue();
                local_196.Add(local_214_2.GetKey(), local_1_4);
            }
        }
        for (auto& local_214_3 : local_98)
        {
            TEUIModelRef<FM_Trait> local_154 = TEUIModelRef<FM_Trait>(::FM_Trait::Create(this.GetContext().Manager, local_214_3.GetKey(), local_214_3.GetValue()));
            if (local_196.Contains(local_214_3.GetKey()))
            {
                local_220.SetCompareTrait((local_214_3.GetValue() + local_196[local_214_3.GetKey()]));
            }
            this.GetModify_CompareItemList().Add(TEUIModelRef<FVM_AvatarEquipmentCompareItem>(local_220));
        }
        for (auto& local_214_4 : local_196)
        {
            if (!(local_98.Contains(local_214_4.GetKey())))
            {
                TEUIModelRef<FM_Trait> local_154_2 = TEUIModelRef<FM_Trait>(::FM_Trait::Create(this.GetContext().Manager, local_214_4.GetKey(), 0));
                int local_1_6 = local_214_4.GetValue();
                local_220.SetCompareTrait(local_1_6);
                this.GetModify_CompareItemList().Add(TEUIModelRef<FVM_AvatarEquipmentCompareItem>(local_220));
            }
        }
        return;
    }
    const TDataObjectPtr<FAvatarPrefabConfig> GetCurrentAvatarCfg() const property
    {
        const TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_CurrentAvatarCfg() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCurrentAvatarCfg(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentAvatarCfg = __Value;
        return;
    }
    TEUIModelRef<FVM_EquipmentInfo> GetCurSlotEquipmentInfo() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurSlotEquipmentInfo;
    }
    void SetCurSlotEquipmentInfo(const TEUIModelRef<FVM_EquipmentInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        local_2 = this.m_CurSlotEquipmentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurSlotEquipmentInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_EquipmentInfo> GetCompareEquipmentInfo() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CompareEquipmentInfo;
    }
    void SetCompareEquipmentInfo(const TEUIModelRef<FVM_EquipmentInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        local_2 = this.m_CompareEquipmentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CompareEquipmentInfo = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarEquipmentCompareItem>> GetCompareItemList() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarEquipmentCompareItem>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarEquipmentCompareItem>> GetModify_CompareItemList() property
    {
        TArray<TEUIModelRef<FVM_AvatarEquipmentCompareItem>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCompareItemList(const TArray<TEUIModelRef<FVM_AvatarEquipmentCompareItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CompareItemList = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarEquipmentCompareOverview
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentCompareOverview> Self;

    __GeneratedProperties_FVM_AvatarEquipmentCompareOverview()
    {
        return;
    }
}

namespace FVM_AvatarEquipmentCompareOverview
{
FVM_AvatarEquipmentCompareOverview& Create(const UObject ContextObject, const TDataObjectPtr<FAvatarPrefabConfig> &inout CurrentAvatarCfg, const TEUIModelRef<FVM_EquipmentInfo> &inout CurSlotEquipmentInfo, const TEUIModelRef<FVM_EquipmentInfo> &inout CompareEquipmentInfo)
{
    return FVM_AvatarEquipmentCompareOverview::CreateByManager(EUIInternal::GetContextManager(ContextObject), CurrentAvatarCfg, CurSlotEquipmentInfo, CompareEquipmentInfo);
}
FVM_AvatarEquipmentCompareOverview& CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout CurrentAvatarCfg, const TEUIModelRef<FVM_EquipmentInfo> &inout CurSlotEquipmentInfo, const TEUIModelRef<FVM_EquipmentInfo> &inout CompareEquipmentInfo)
{
    return TEUIModelRef<FVM_AvatarEquipmentCompareOverview>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarEquipmentCompareOverview::ModelId, 0, CurrentAvatarCfg, CurSlotEquipmentInfo, CompareEquipmentInfo)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CompareItemList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AvatarEquipmentCompareItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentCompareOverview>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarEquipmentCompareOverview;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarEquipmentCompareOverview;
}
TArray<TEUIModelRef<FVM_AvatarEquipmentCompareItem>> __UIGetter_CompareItemList(const FVM_AvatarEquipmentCompareOverview &inout Model)
{
    return Model.GetCompareItemList();
}
TEUIModelRef<FVM_AvatarEquipmentCompareOverview> __UIGetter_Self(const FVM_AvatarEquipmentCompareOverview &inout Model)
{
    return TEUIModelRef<FVM_AvatarEquipmentCompareOverview>(Model);
}
int __IndexOf_CurrentAvatarCfg()
{
    return 0;
}
int __IndexOf_CurSlotEquipmentInfo()
{
    return 1;
}
int __IndexOf_CompareEquipmentInfo()
{
    return 2;
}
int __IndexOf_CompareItemList()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_AvatarEquipmentCompareOverview
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_AvatarEquipmentCompareOverview.Get();
}
}
