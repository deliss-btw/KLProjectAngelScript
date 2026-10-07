
namespace FVM_ForgeWeaponFormulaTree
{
    const int ModelId = 0;

}
struct FVM_ForgeWeaponFormulaTree : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FVM_WeaponForge> m_WeaponForgeVM;
    UPROPERTY()
    TEUIModelWeakRef<FM_ForgeTree> m_TreeM;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    float32 m_WidthOverride;
    UPROPERTY()
    TArray<TEUIModelWeakRef<FM_ForgeNode>> m_NodeList;
    UPROPERTY()
    EForgeTreeBranchType m_BranchType;
    UPROPERTY()
    TMap<TEUIModelWeakRef<FM_ForgeNode>, TEUIModelWeakRef<FVM_ForgeWeaponItem>> m_ItemNodeMap;

    FVM_ForgeWeaponFormulaTree()
    {
        this.m_Index = 0;
        this.m_WidthOverride = 0.0f;
        this.m_BranchType = EForgeTreeBranchType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ForgeWeaponFormulaTree' by default constructor.");
        return;
    }
    FVM_ForgeWeaponFormulaTree(const FVM_ForgeWeaponFormulaTree &inout Other)
    {
        this.m_Index = 0;
        this.m_WidthOverride = 0.0f;
        this.m_BranchType = EForgeTreeBranchType(0);
        this.m_WeaponForgeVM = Other.m_WeaponForgeVM;
        this.m_TreeM = Other.m_TreeM;
        this.m_Index = int(Other.m_Index);
        this.m_WidthOverride = Other.m_WidthOverride;
        this.m_NodeList = Other.m_NodeList;
        this.m_BranchType = Other.m_BranchType;
        this.m_ItemNodeMap = Other.m_ItemNodeMap;
        return;
    }
    FVM_ForgeWeaponFormulaTree(const TEUIModelWeakRef<FVM_WeaponForge> &inout InWeaponForgeVM, const TEUIModelWeakRef<FM_ForgeTree> &inout InTreeM, const int InIndex, const float32 InWidthOverride)
    {
        this.m_Index = 0;
        this.m_WidthOverride = 0.0f;
        this.m_BranchType = EForgeTreeBranchType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetWeaponForgeVM(InWeaponForgeVM);
        this.SetTreeM(InTreeM);
        this.SetIndex(InIndex);
        this.SetWidthOverride(InWidthOverride);
        return;
    }
    FVM_ForgeWeaponFormulaTree& opAssign(const FVM_ForgeWeaponFormulaTree &inout Other)
    {
        this.m_WeaponForgeVM = Other.m_WeaponForgeVM;
        this.m_TreeM = Other.m_TreeM;
        this.m_Index = int(Other.m_Index);
        this.m_WidthOverride = Other.m_WidthOverride;
        this.m_NodeList = Other.m_NodeList;
        this.m_BranchType = Other.m_BranchType;
        return Other.m_ItemNodeMap;
    }
    void PostConstruct()
    {
        if (this.GetTreeM().IsValid())
        {
            TEUIModelWeakRef<FM_ForgeTree> local_2 = this.GetTreeM();
            this.GetModify_NodeList().Append(GetNodeList());
            TEUIModelWeakRef<FM_ForgeTree> local_2_2 = this.GetTreeM();
            this.SetBranchType(GetBranchType());
        }
        return;
    }
    int GetActiveIndexBG() const
    {
        return (this.GetIndex() % 2);
    }
    TEUIModelWeakRef<FVM_WeaponForge> GetWeaponForgeVM() const property
    {
        this.TrackPropertyRead(0);
        return this.m_WeaponForgeVM;
    }
    void SetWeaponForgeVM(const TEUIModelWeakRef<FVM_WeaponForge> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_WeaponForge> local_2;
        local_2 = this.m_WeaponForgeVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_WeaponForgeVM = __Value;
        return;
    }
    TEUIModelWeakRef<FM_ForgeTree> GetTreeM() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TreeM;
    }
    void SetTreeM(const TEUIModelWeakRef<FM_ForgeTree> &inout __Value) property
    {
        TEUIModelWeakRef<FM_ForgeTree> local_2;
        local_2 = this.m_TreeM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TreeM = __Value;
        return;
    }
    int GetIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Index;
    }
    void SetIndex(const int __Value) property
    {
        if (this.m_Index == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Index = __Value;
        return;
    }
    float32 GetWidthOverride() const property
    {
        float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_WidthOverride() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetWidthOverride(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_WidthOverride = __Value;
        return;
    }
    const TArray<TEUIModelWeakRef<FM_ForgeNode>> GetNodeList() const property
    {
        const TArray<TEUIModelWeakRef<FM_ForgeNode>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelWeakRef<FM_ForgeNode>> GetModify_NodeList() property
    {
        TArray<TEUIModelWeakRef<FM_ForgeNode>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetNodeList(const TArray<TEUIModelWeakRef<FM_ForgeNode>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_NodeList = __Value;
        return;
    }
    EForgeTreeBranchType GetBranchType() const property
    {
        this.TrackPropertyRead(5);
        return this.m_BranchType;
    }
    void SetBranchType(const EForgeTreeBranchType __Value) property
    {
        if (int(this.m_BranchType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_BranchType = __Value;
        return;
    }
    const TMap<TEUIModelWeakRef<FM_ForgeNode>, TEUIModelWeakRef<FVM_ForgeWeaponItem>> GetItemNodeMap() const property
    {
        const TMap<TEUIModelWeakRef<FM_ForgeNode>, TEUIModelWeakRef<FVM_ForgeWeaponItem>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TMap<TEUIModelWeakRef<FM_ForgeNode>, TEUIModelWeakRef<FVM_ForgeWeaponItem>> GetModify_ItemNodeMap() property
    {
        TMap<TEUIModelWeakRef<FM_ForgeNode>, TEUIModelWeakRef<FVM_ForgeWeaponItem>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetItemNodeMap(const TMap<TEUIModelWeakRef<FM_ForgeNode>, TEUIModelWeakRef<FVM_ForgeWeaponItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ItemNodeMap = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ForgeWeaponFormulaTree
{
    UPROPERTY()
    int ActiveIndexBG;
    UPROPERTY()
    TEUIModelRef<FVM_ForgeWeaponFormulaTree> Self;


}

namespace FVM_ForgeWeaponFormulaTree
{
FVM_ForgeWeaponFormulaTree& Create(const UObject ContextObject, const TEUIModelWeakRef<FVM_WeaponForge> &inout WeaponForgeVM, const TEUIModelWeakRef<FM_ForgeTree> &inout TreeM, const int Index, const float32 WidthOverride)
{
    return FVM_ForgeWeaponFormulaTree::CreateByManager(EUIInternal::GetContextManager(ContextObject), WeaponForgeVM, TreeM, Index, WidthOverride);
}
FVM_ForgeWeaponFormulaTree CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FVM_WeaponForge> &inout WeaponForgeVM, const TEUIModelWeakRef<FM_ForgeTree> &inout TreeM, const int Index, const float32 WidthOverride)
{
    FVM_ForgeWeaponFormulaTree __r;
    TEUIModelRef<FVM_ForgeWeaponFormulaTree> local_6 = TEUIModelRef<FVM_ForgeWeaponFormulaTree>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ForgeWeaponFormulaTree::ModelId, 0, WeaponForgeVM, TreeM, Index, WidthOverride));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "WidthOverride";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActiveIndexBG";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ForgeWeaponFormulaTree>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ForgeWeaponFormulaTree;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ForgeWeaponFormulaTree;
}
float32 __UIGetter_WidthOverride(const FVM_ForgeWeaponFormulaTree &inout Model)
{
    return Model.GetWidthOverride();
}
int __UIGetter_ActiveIndexBG(const FVM_ForgeWeaponFormulaTree &inout Model)
{
    return Model.GetActiveIndexBG();
}
TEUIModelRef<FVM_ForgeWeaponFormulaTree> __UIGetter_Self(const FVM_ForgeWeaponFormulaTree &inout Model)
{
    return TEUIModelRef<FVM_ForgeWeaponFormulaTree>(Model);
}
int __IndexOf_WeaponForgeVM()
{
    return 0;
}
int __IndexOf_TreeM()
{
    return 1;
}
int __IndexOf_Index()
{
    return 2;
}
int __IndexOf_WidthOverride()
{
    return 3;
}
int __IndexOf_NodeList()
{
    return 4;
}
int __IndexOf_BranchType()
{
    return 5;
}
int __IndexOf_ItemNodeMap()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_ForgeWeaponFormulaTree
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
