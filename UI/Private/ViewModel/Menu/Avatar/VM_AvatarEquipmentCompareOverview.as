
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
        int local_1 = 0;
        int local_115 = 0;
        TEUIModelRef<FM_Trait> local_154;
        TEUIModelRef<FM_Trait> local_156;
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
            local_72;
            TEUIModelRef<FM_Equipment> local_76 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(GetGuid());
            local_54.Append(GetEquipmentTraits());
        }
        TMap<TDataObjectPtr<FTraitConfig>, int> local_98;
        for (auto& local_112 : local_54)
        {
            local_112;
            int local_114 = local_98.FindOrAdd(GetTraitConfig());
            local_1 = GetTraitLevel();
            local_115 = int(local_114);
            local_115 = local_115 + local_1;
            local_114 = local_115;
        }
        TMap<TDataObjectPtr<FTraitConfig>, int> local_136;
        TEUIModelRef<FVM_EquipmentInfo> local_138 = this.GetCurSlotEquipmentInfo();
        for (auto& local_152 : GetEquipmentTraits())
        {
            local_152;
            local_154.GetTrait();
            local_1 = GetTraitLevel();
            local_156.GetTrait();
            local_136.Add(GetTraitConfig(), local_1);
        }
        TMap<TDataObjectPtr<FTraitConfig>, int> local_176;
        TEUIModelRef<FVM_EquipmentInfo> local_138_2 = this.GetCompareEquipmentInfo();
        for (auto& local_152 : GetEquipmentTraits())
        {
            local_152;
            local_154.GetTrait();
            local_115 = GetTraitLevel();
            local_156.GetTrait();
            local_176.Add(GetTraitConfig(), local_115);
        }
        TMap<TDataObjectPtr<FTraitConfig>, int> local_196;
        for (auto& local_214 : local_176)
        {
            local_215 = 0;
            if (local_136.Find(local_214.GetKey(), local_216))
            {
                local_215 = local_1 - local_216;
            }
            else
            {
                local_215 = local_1;
            }
            local_196.Add(local_214.GetKey(), local_215);
        }
        for (auto& local_214_2 : local_136)
        {
            if (!(local_176.Contains(local_214_2.GetKey())))
            {
                local_1 = 0 - local_115;
                local_196.Add(local_214_2.GetKey(), local_1);
            }
        }
        for (auto& local_214_3 : local_98)
        {
            local_154 = TEUIModelRef<FM_Trait>(::FM_Trait::Create(this.GetContext().Manager, local_214_3.GetKey(), local_115));
            if (local_196.Contains(local_214_3.GetKey()))
            {
                local_1 = local_196[local_214_3.GetKey()];
                local_115 = local_115 + local_1;
                local_220.SetCompareTrait(local_115);
            }
            this.GetModify_CompareItemList().Add(TEUIModelRef<FVM_AvatarEquipmentCompareItem>(local_220));
        }
        for (auto& local_214_4 : local_196)
        {
            if (!(local_98.Contains(local_214_4.GetKey())))
            {
                local_154 = TEUIModelRef<FM_Trait>(::FM_Trait::Create(this.GetContext().Manager, local_214_4.GetKey(), 0));
                local_220.SetCompareTrait(local_1);
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
FVM_AvatarEquipmentCompareOverview CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout CurrentAvatarCfg, const TEUIModelRef<FVM_EquipmentInfo> &inout CurSlotEquipmentInfo, const TEUIModelRef<FVM_EquipmentInfo> &inout CompareEquipmentInfo)
{
    FVM_AvatarEquipmentCompareOverview __r;
    TEUIModelRef<FVM_AvatarEquipmentCompareOverview> local_6 = TEUIModelRef<FVM_AvatarEquipmentCompareOverview>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarEquipmentCompareOverview::ModelId, 0, CurrentAvatarCfg, CurSlotEquipmentInfo, CompareEquipmentInfo));
    return __r;
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
    UScriptStruct local_2;
    return local_2;
}
}
