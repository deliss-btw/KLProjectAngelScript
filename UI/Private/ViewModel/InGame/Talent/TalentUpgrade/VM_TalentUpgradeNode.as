
namespace FVM_TalentUpgradeNode
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnChoiceNodeChangedBtn = FEUIModelCallbackSignature();

}
struct FVM_TalentUpgradeNode : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TalentUpgradeItem>> m_ChoiceNodeList;
    UPROPERTY()
    bool m_bIsChoice;

    FVM_TalentUpgradeNode()
    {
        this.m_bIsChoice = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TalentUpgradeNode' by default constructor.");
        return;
    }
    FVM_TalentUpgradeNode(const FVM_TalentUpgradeNode &inout Other)
    {
        this.m_bIsChoice = false;
        this.m_ChoiceNodeList = Other.m_ChoiceNodeList;
        this.m_bIsChoice = Other.m_bIsChoice;
        return;
    }
    FVM_TalentUpgradeNode(const TArray<TEUIModelRef<FVM_TalentUpgradeItem>> &inout InChoiceNodeList)
    {
        this.m_bIsChoice = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetChoiceNodeList(InChoiceNodeList);
        return;
    }
    FVM_TalentUpgradeNode opAssign(const FVM_TalentUpgradeNode &inout Other)
    {
        FVM_TalentUpgradeNode __r;
        this.m_ChoiceNodeList = Other.m_ChoiceNodeList;
        this.m_bIsChoice = Other.m_bIsChoice;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    void OnChoiceNodeChangedBtn()
    {
        if (this.GetChoiceNodeList().Num() > 0)
        {
            int local_4 = 0;
            for (; local_4 < this.GetChoiceNodeList().Num(); ++local_4)
            {
                if (this.GetChoiceNodeList()[local_4] && !(GetIsEquippedChoice()))
                {
                    FMsg_TalentSetEquipChoiceTalent local_8;
                    FEUIModelRef local_14 = FEUIModelRef(this);
                    FEUIMessageBus::Publish(EUIMessageBus);
                    TEUIModelWeakRef<FM_TalentNode> local_16 = this.GetChoiceNodeList()[local_4].opArrow().GetNode();
                    TEUIModelWeakRef<FM_TalentNode> local_18;
                    local_8.TalentNode = local_18;
                    local_8.NewChoice = this.GetChoiceNodeList()[local_4].opArrow().GetChoiceIndex();
                    break;
                }
            }
        }
        return;
    }
    const TArray<TEUIModelRef<FVM_TalentUpgradeItem>> GetChoiceNodeList() const property
    {
        const TArray<TEUIModelRef<FVM_TalentUpgradeItem>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TalentUpgradeItem>> GetModify_ChoiceNodeList() property
    {
        TArray<TEUIModelRef<FVM_TalentUpgradeItem>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetChoiceNodeList(const TArray<TEUIModelRef<FVM_TalentUpgradeItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ChoiceNodeList = __Value;
        return;
    }
    bool GetbIsChoice() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsChoice;
    }
    void SetbIsChoice(const bool __Value) property
    {
        if (!(this.m_bIsChoice) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsChoice = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TalentUpgradeNode
{
    UPROPERTY()
    TEUIModelRef<FVM_TalentUpgradeNode> Self;

    __GeneratedProperties_FVM_TalentUpgradeNode()
    {
        return;
    }
}

namespace FVM_TalentUpgradeNode
{
FVM_TalentUpgradeNode& Create(const UObject ContextObject, const TArray<TEUIModelRef<FVM_TalentUpgradeItem>> &inout ChoiceNodeList)
{
    return FVM_TalentUpgradeNode::CreateByManager(EUIInternal::GetContextManager(ContextObject), ChoiceNodeList);
}
FVM_TalentUpgradeNode CreateByManager(const UEUIManagerSubsystem Manager, const TArray<TEUIModelRef<FVM_TalentUpgradeItem>> &inout ChoiceNodeList)
{
    FVM_TalentUpgradeNode __r;
    TEUIModelRef<FVM_TalentUpgradeNode> local_6 = TEUIModelRef<FVM_TalentUpgradeNode>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentUpgradeNode::ModelId, 0, ChoiceNodeList));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ChoiceNodeList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TalentUpgradeItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsChoice";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TalentUpgradeNode>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TalentUpgradeNode;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentUpgradeNode;
}
TArray<TEUIModelRef<FVM_TalentUpgradeItem>> __UIGetter_ChoiceNodeList(const FVM_TalentUpgradeNode &inout Model)
{
    return Model.GetChoiceNodeList();
}
bool __UIGetter_bIsChoice(const FVM_TalentUpgradeNode &inout Model)
{
    return Model.GetbIsChoice();
}
TEUIModelRef<FVM_TalentUpgradeNode> __UIGetter_Self(const FVM_TalentUpgradeNode &inout Model)
{
    return TEUIModelRef<FVM_TalentUpgradeNode>(Model);
}
int __IndexOf_ChoiceNodeList()
{
    return 0;
}
int __IndexOf_bIsChoice()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TalentUpgradeNode
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
