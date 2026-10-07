
namespace FVM_TalentUpgradeFormulaTree
{
    const int ModelId = 0;

}
struct FVM_TalentUpgradeFormulaTree : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FVM_TalentEditPage> m_TalentEditVM;
    UPROPERTY()
    TEUIModelWeakRef<FM_TalentTree> m_TreeM;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    float32 m_WidthOverride;
    UPROPERTY()
    TArray<TEUIModelWeakRef<FM_TalentNode>> m_NodeList;
    UPROPERTY()
    ETalentTreeBranchType m_BranchType;
    UPROPERTY()
    bool m_bLastList;
    UPROPERTY()
    TEUIModelRef<FVM_TalentDivisionTypeIcon> m_DivisionTypeIconVM;
    UPROPERTY()
    TMap<TEUIModelWeakRef<FM_TalentNode>, TEUIModelWeakRef<FVM_TalentUpgradeNode>> m_ItemNodeMap;

    FVM_TalentUpgradeFormulaTree()
    {
        this.m_Index = 0;
        this.m_WidthOverride = 0.0f;
        this.m_BranchType = ETalentTreeBranchType(0);
        this.m_bLastList = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TalentUpgradeFormulaTree' by default constructor.");
        return;
    }
    FVM_TalentUpgradeFormulaTree(const FVM_TalentUpgradeFormulaTree &inout Other)
    {
        this.m_Index = 0;
        this.m_WidthOverride = 0.0f;
        this.m_BranchType = ETalentTreeBranchType(0);
        this.m_bLastList = false;
        this.m_TalentEditVM = Other.m_TalentEditVM;
        this.m_TreeM = Other.m_TreeM;
        this.m_Index = int(Other.m_Index);
        this.m_WidthOverride = Other.m_WidthOverride;
        this.m_NodeList = Other.m_NodeList;
        this.m_BranchType = Other.m_BranchType;
        this.m_bLastList = Other.m_bLastList;
        this.m_DivisionTypeIconVM = Other.m_DivisionTypeIconVM;
        this.m_ItemNodeMap = Other.m_ItemNodeMap;
        return;
    }
    FVM_TalentUpgradeFormulaTree(const TEUIModelWeakRef<FVM_TalentEditPage> &inout InTalentEditVM, const TEUIModelWeakRef<FM_TalentTree> &inout InTreeM, const int InIndex, const float32 InWidthOverride)
    {
        this.m_Index = 0;
        this.m_WidthOverride = 0.0f;
        this.m_BranchType = ETalentTreeBranchType(0);
        this.m_bLastList = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTalentEditVM(InTalentEditVM);
        this.SetTreeM(InTreeM);
        this.SetIndex(InIndex);
        this.SetWidthOverride(InWidthOverride);
        return;
    }
    FVM_TalentUpgradeFormulaTree& opAssign(const FVM_TalentUpgradeFormulaTree &inout Other)
    {
        this.m_TalentEditVM = Other.m_TalentEditVM;
        this.m_TreeM = Other.m_TreeM;
        this.m_Index = int(Other.m_Index);
        this.m_WidthOverride = Other.m_WidthOverride;
        this.m_NodeList = Other.m_NodeList;
        this.m_BranchType = Other.m_BranchType;
        this.m_bLastList = Other.m_bLastList;
        this.m_DivisionTypeIconVM = Other.m_DivisionTypeIconVM;
        return Other.m_ItemNodeMap;
    }
    bool bFoundationTree() const
    {
        if (this.GetTreeM().IsValid())
        {
            TEUIModelWeakRef<FM_TalentTree> local_2 = this.GetTreeM();
            return GetTalentBaseData().IsSet();
        }
        return false;
    }
    bool bNotFoundationTree() const
    {
        return !(this.bFoundationTree());
    }
    FText GetTreeName() const
    {
        FText __return;
        if (this.GetTreeM().IsValid())
        {
            TEUIModelWeakRef<FM_TalentTree> local_2 = this.GetTreeM();
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    FSoftBrush GetTreeImage() const
    {
        FSoftBrush __return;
        if (this.GetTreeM().IsValid())
        {
            TEUIModelWeakRef<FM_TalentTree> local_2 = this.GetTreeM();
        }
        else
        {
            __return = FSoftBrush();
        }
        return __return;
    }
    bool GetTalentIsEquipped() const
    {
        int local_33 = 0;
        bool local_3 = this.GetTreeM().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_TalentTree> local_2 = this.GetTreeM();
            local_3 = GetAvatar().IsSet();
        }
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_TalentTree> local_2_2 = this.GetTreeM();
            local_3 = GetTalentBaseData().IsSet();
        }
        if (local_3)
        {
            FAvatarEquippedTalentInfo local_32;
            TEUIModelWeakRef<FM_TalentTree> local_2_3 = this.GetTreeM();
            if (::FMS_Talent::Get(this.GetContext().Manager).GetAvatarEquippedTalentInfo(local_33, local_32))
            {
                local_33 = int(local_32.FoundationId);
                TEUIModelWeakRef<FM_TalentTree> local_2_4 = this.GetTreeM();
                if (local_33 == 0)
                {
                    return true;
                }
            }
        }
        return false;
    }
    int GetTalentBaseActiveState() const
    {
        if (this.GetTalentIsEquipped())
        {
            return 0;
        }
        if (this.GetTalentIsUnlocked())
        {
            return 1;
        }
        if (this.bFoundationTree())
        {
            return 2;
        }
        return 3;
    }
    int GetTalentDivision() const
    {
        ETalentDivision local_7 = ETalentDivision(0);
        TEUIModelWeakRef<FM_TalentTree> local_2 = this.GetTreeM();
        bool local_3 = !(local_2.IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelWeakRef<FM_TalentTree> local_2_2 = this.GetTreeM();
            local_3 = !(GetTalentBaseData().IsSet());
        }
        if (local_3)
        {
            return 3;
        }
        TEUIModelWeakRef<FM_TalentTree> local_2_3 = this.GetTreeM();
        switch (int(local_7))
        {
        case 1:
        {
            return 0;
        }
        case 2:
        {
            return 1;
        }
        case 3:
        {
            return 2;
        }
        default:
        {
        }
        }
        return 3;
    }
    bool GetTalentIsNormal() const
    {
        if (this.GetTreeM().IsValid())
        {
            TEUIModelWeakRef<FM_TalentTree> local_2 = this.GetTreeM();
            return IsFoundationTreeAnyTalentNormal();
        }
        return false;
    }
    bool GetTalentIsUnlocked() const
    {
        if (this.GetTreeM().IsValid())
        {
            TEUIModelWeakRef<FM_TalentTree> local_2 = this.GetTreeM();
            return IsFoundationTreeAnyTalentUnlocked();
        }
        return false;
    }
    bool GetTalentIsUnlockedAndNoNormal() const
    {
        if (this.GetTalentIsNormal())
        {
            return false;
        }
        return this.GetTalentIsUnlocked();
    }
    bool GetTalentIsUnlockedOrNormal() const
    {
        if (this.GetTalentIsNormal() || this.GetTalentIsUnlocked())
        {
            return false;
        }
        return false;
    }
    bool GetTalentIsLocked() const
    {
        return !(this.GetTalentIsUnlocked());
    }
    bool GetShowRightLine() const
    {
        return !(this.GetbLastList());
    }
    void PostConstruct()
    {
        int local_5 = 0;
        TEUIModelWeakRef<FM_TalentTree> local_2 = this.GetTreeM();
        if (local_2.IsValid())
        {
            int local_4;
            local_4 = 0;
            TEUIModelWeakRef<FM_TalentTree> local_2_2 = this.GetTreeM();
            if (GetAvatar().IsSet())
            {
                FAvatarEquippedTalentInfo local_34;
                TEUIModelWeakRef<FM_TalentTree> local_2_3 = this.GetTreeM();
                if (::FMS_Talent::Get(this.GetContext().Manager).GetAvatarEquippedTalentInfo(local_5, local_34))
                {
                    local_5 = int(local_34.FoundationId);
                    local_4 = local_5;
                }
            }
            TEUIModelWeakRef<FM_TalentTree> local_2_4 = this.GetTreeM();
            for (auto& local_48 : GetNodeList())
            {
                if ((int(GetTalentType())) == 6)
                {
                    TDataObjectPtr<FTalentConfig> local_100;
                    local_100.GetConfig(0);
                    if (!(local_100) || !(GetFoundationTalent().IsSet()) || (local_5 != local_4))
                    {
                        continue;
                    }
                }
                this.GetModify_NodeList().Add(local_48);
            }
            TEUIModelWeakRef<FM_TalentTree> local_2_5 = this.GetTreeM();
            this.SetBranchType(GetBranchType());
        }
        TEUIModelWeakRef<FM_TalentTree> local_2_6 = this.GetTreeM();
        bool local_101 = local_2_6.IsValid();
        if (!(local_101))
        {
            local_101 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_TalentTree> local_2_7 = this.GetTreeM();
            local_101 = GetTalentBaseData().IsSet();
        }
        if (local_101)
        {
            TEUIModelWeakRef<FM_TalentTree> local_2_8 = this.GetTreeM();
            this.SetDivisionTypeIconVM(TEUIModelRef<FVM_TalentDivisionTypeIcon>(::FVM_TalentDivisionTypeIcon::Create(this.GetContext().Manager)));
        }
        return;
    }
    TEUIModelWeakRef<FVM_TalentEditPage> GetTalentEditVM() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TalentEditVM;
    }
    void SetTalentEditVM(const TEUIModelWeakRef<FVM_TalentEditPage> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_TalentEditPage> local_2;
        local_2 = this.m_TalentEditVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TalentEditVM = __Value;
        return;
    }
    TEUIModelWeakRef<FM_TalentTree> GetTreeM() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TreeM;
    }
    void SetTreeM(const TEUIModelWeakRef<FM_TalentTree> &inout __Value) property
    {
        TEUIModelWeakRef<FM_TalentTree> local_2;
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
    const TArray<TEUIModelWeakRef<FM_TalentNode>> GetNodeList() const property
    {
        const TArray<TEUIModelWeakRef<FM_TalentNode>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelWeakRef<FM_TalentNode>> GetModify_NodeList() property
    {
        TArray<TEUIModelWeakRef<FM_TalentNode>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetNodeList(const TArray<TEUIModelWeakRef<FM_TalentNode>> &inout __Value) property
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
    ETalentTreeBranchType GetBranchType() const property
    {
        this.TrackPropertyRead(5);
        return this.m_BranchType;
    }
    void SetBranchType(const ETalentTreeBranchType __Value) property
    {
        if (int(this.m_BranchType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_BranchType = __Value;
        return;
    }
    bool GetbLastList() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bLastList;
    }
    void SetbLastList(const bool __Value) property
    {
        if (!(this.m_bLastList) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bLastList = __Value;
        return;
    }
    TEUIModelRef<FVM_TalentDivisionTypeIcon> GetDivisionTypeIconVM() const property
    {
        this.TrackPropertyRead(7);
        return this.m_DivisionTypeIconVM;
    }
    void SetDivisionTypeIconVM(const TEUIModelRef<FVM_TalentDivisionTypeIcon> &inout __Value) property
    {
        TEUIModelRef<FVM_TalentDivisionTypeIcon> local_2;
        local_2 = this.m_DivisionTypeIconVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_DivisionTypeIconVM = __Value;
        return;
    }
    const TMap<TEUIModelWeakRef<FM_TalentNode>, TEUIModelWeakRef<FVM_TalentUpgradeNode>> GetItemNodeMap() const property
    {
        const TMap<TEUIModelWeakRef<FM_TalentNode>, TEUIModelWeakRef<FVM_TalentUpgradeNode>> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TMap<TEUIModelWeakRef<FM_TalentNode>, TEUIModelWeakRef<FVM_TalentUpgradeNode>> GetModify_ItemNodeMap() property
    {
        TMap<TEUIModelWeakRef<FM_TalentNode>, TEUIModelWeakRef<FVM_TalentUpgradeNode>> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetItemNodeMap(const TMap<TEUIModelWeakRef<FM_TalentNode>, TEUIModelWeakRef<FVM_TalentUpgradeNode>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_ItemNodeMap = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TalentUpgradeFormulaTree
{
    UPROPERTY()
    bool bFoundationTree;
    UPROPERTY()
    bool bNotFoundationTree;
    UPROPERTY()
    FText TreeName;
    UPROPERTY()
    FSoftBrush TreeImage;
    UPROPERTY()
    bool TalentIsEquipped;
    UPROPERTY()
    int TalentBaseActiveState;
    UPROPERTY()
    int TalentDivision;
    UPROPERTY()
    bool TalentIsNormal;
    UPROPERTY()
    bool TalentIsUnlocked;
    UPROPERTY()
    bool TalentIsUnlockedAndNoNormal;
    UPROPERTY()
    bool TalentIsUnlockedOrNormal;
    UPROPERTY()
    bool TalentIsLocked;
    UPROPERTY()
    bool ShowRightLine;
    UPROPERTY()
    TEUIModelRef<FVM_TalentUpgradeFormulaTree> Self;


}

namespace FVM_TalentUpgradeFormulaTree
{
FVM_TalentUpgradeFormulaTree& Create(const UObject ContextObject, const TEUIModelWeakRef<FVM_TalentEditPage> &inout TalentEditVM, const TEUIModelWeakRef<FM_TalentTree> &inout TreeM, const int Index, const float32 WidthOverride)
{
    return FVM_TalentUpgradeFormulaTree::CreateByManager(EUIInternal::GetContextManager(ContextObject), TalentEditVM, TreeM, Index, WidthOverride);
}
FVM_TalentUpgradeFormulaTree CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FVM_TalentEditPage> &inout TalentEditVM, const TEUIModelWeakRef<FM_TalentTree> &inout TreeM, const int Index, const float32 WidthOverride)
{
    FVM_TalentUpgradeFormulaTree __r;
    TEUIModelRef<FVM_TalentUpgradeFormulaTree> local_6 = TEUIModelRef<FVM_TalentUpgradeFormulaTree>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentUpgradeFormulaTree::ModelId, 0, TalentEditVM, TreeM, Index, WidthOverride));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TreeM";
    local_14.TypeName = "TEUIModelWeakRef<FM_TalentTree>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WidthOverride";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DivisionTypeIconVM";
    local_14.TypeName = "TEUIModelRef<FVM_TalentDivisionTypeIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bFoundationTree";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bNotFoundationTree";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TreeName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TreeImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentIsEquipped";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentBaseActiveState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentDivision";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentIsNormal";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentIsUnlocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentIsUnlockedAndNoNormal";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentIsUnlockedOrNormal";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentIsLocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowRightLine";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TalentUpgradeFormulaTree>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TalentUpgradeFormulaTree;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentUpgradeFormulaTree;
}
TEUIModelWeakRef<FM_TalentTree> __UIGetter_TreeM(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetTreeM();
}
float32 __UIGetter_WidthOverride(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetWidthOverride();
}
TEUIModelRef<FVM_TalentDivisionTypeIcon> __UIGetter_DivisionTypeIconVM(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetDivisionTypeIconVM();
}
bool __UIGetter_bFoundationTree(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.bFoundationTree();
}
bool __UIGetter_bNotFoundationTree(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.bNotFoundationTree();
}
FText __UIGetter_TreeName(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetTreeName();
}
FSoftBrush __UIGetter_TreeImage(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetTreeImage();
}
bool __UIGetter_TalentIsEquipped(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetTalentIsEquipped();
}
int __UIGetter_TalentBaseActiveState(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetTalentBaseActiveState();
}
int __UIGetter_TalentDivision(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetTalentDivision();
}
bool __UIGetter_TalentIsNormal(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetTalentIsNormal();
}
bool __UIGetter_TalentIsUnlocked(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetTalentIsUnlocked();
}
bool __UIGetter_TalentIsUnlockedAndNoNormal(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetTalentIsUnlockedAndNoNormal();
}
bool __UIGetter_TalentIsUnlockedOrNormal(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetTalentIsUnlockedOrNormal();
}
bool __UIGetter_TalentIsLocked(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetTalentIsLocked();
}
bool __UIGetter_ShowRightLine(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return Model.GetShowRightLine();
}
TEUIModelRef<FVM_TalentUpgradeFormulaTree> __UIGetter_Self(const FVM_TalentUpgradeFormulaTree &inout Model)
{
    return TEUIModelRef<FVM_TalentUpgradeFormulaTree>(Model);
}
int __IndexOf_TalentEditVM()
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
int __IndexOf_bLastList()
{
    return 6;
}
int __IndexOf_DivisionTypeIconVM()
{
    return 7;
}
int __IndexOf_ItemNodeMap()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_TalentUpgradeFormulaTree
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
