
namespace FVM_ItemRarity
{
    const int ModelId = 0;

}
struct FVM_ItemRarity : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EItemRarity m_Rarity;
    UPROPERTY()
    TDataObjectPtr<FItemRarityConfig> m_RarityConfig;

    FVM_ItemRarity()
    {
        this.m_Rarity = EItemRarity(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemRarity' by default constructor.");
        return;
    }
    FVM_ItemRarity(const FVM_ItemRarity &inout Other)
    {
        this.m_Rarity = EItemRarity(0);
        this.m_Rarity = Other.m_Rarity;
        this.m_RarityConfig = Other.m_RarityConfig;
        return;
    }
    FVM_ItemRarity(const EItemRarity InRarity)
    {
        this.m_Rarity = EItemRarity(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetRarity(EItemRarity(InRarity));
        return;
    }
    FVM_ItemRarity& opAssign(const FVM_ItemRarity &inout Other)
    {
        this.m_Rarity = Other.m_Rarity;
        return Other.m_RarityConfig;
    }
    void PostConstruct()
    {
        int local_3 = int(this.GetRarity());
        this.SetRarityConfig(::UGlobalItemSettings::Get().GetRarityConfig());
        return;
    }
    int GetRarityIndex() const
    {
        return int(this.GetRarity());
    }
    EItemRarity GetRarity() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Rarity;
    }
    void SetRarity(const EItemRarity __Value) property
    {
        if (int(this.m_Rarity) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Rarity = __Value;
        return;
    }
    const TDataObjectPtr<FItemRarityConfig> GetRarityConfig() const property
    {
        const TDataObjectPtr<FItemRarityConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FItemRarityConfig> GetModify_RarityConfig() property
    {
        TDataObjectPtr<FItemRarityConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetRarityConfig(const TDataObjectPtr<FItemRarityConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RarityConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ItemRarity
{
    UPROPERTY()
    int RarityIndex;
    UPROPERTY()
    TEUIModelRef<FVM_ItemRarity> Self;


}

namespace FVM_ItemRarity
{
FVM_ItemRarity& Create(const UObject ContextObject, const EItemRarity Rarity)
{
    return FVM_ItemRarity::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ItemRarity CreateByManager(const UEUIManagerSubsystem Manager, const EItemRarity Rarity)
{
    FVM_ItemRarity __r;
    TEUIModelRef<FVM_ItemRarity> local_6 = TEUIModelRef<FVM_ItemRarity>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemRarity::ModelId, 0, Rarity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RarityConfig";
    local_14.TypeName = "TDataObjectPtr<FItemRarityConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RarityIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemRarity>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemRarity;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemRarity;
}
TDataObjectPtr<FItemRarityConfig> __UIGetter_RarityConfig(const FVM_ItemRarity &inout Model)
{
    return Model.GetRarityConfig();
}
int __UIGetter_RarityIndex(const FVM_ItemRarity &inout Model)
{
    return Model.GetRarityIndex();
}
TEUIModelRef<FVM_ItemRarity> __UIGetter_Self(const FVM_ItemRarity &inout Model)
{
    return TEUIModelRef<FVM_ItemRarity>(Model);
}
int __IndexOf_Rarity()
{
    return 0;
}
int __IndexOf_RarityConfig()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_ItemRarity
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
