
namespace FVM_StigmataItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ConsumeRedDot = FEUIModelCallbackSignature();

}
struct FVM_StigmataItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_StigmataId;
    UPROPERTY()
    bool m_bIsFake;
    UPROPERTY()
    int m_OwnerStigmataLevel;
    UPROPERTY()
    TDataObjectPtr<FStigmataConfig> m_Config;
    UPROPERTY()
    TEUIModelRef<FM_LocalPlayerLevel> m_PlayerLevel;
    UPROPERTY()
    float32 m_RenderOpacity;
    UPROPERTY()
    bool m_bForceFullOpacity;
    UPROPERTY()
    TEUIModelRef<FVM_TitleAndDescAndStatus> m_HoverTips;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> m_UnmetConditionList;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotItem;

    FVM_StigmataItem()
    {
        this.m_StigmataId = 0;
        this.m_OwnerStigmataLevel = 0;
        this.m_bIsFake = false;
        this.m_RenderOpacity = 1.0f;
        this.m_bForceFullOpacity = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_StigmataItem' by default constructor.");
        return;
    }
    FVM_StigmataItem(const FVM_StigmataItem &inout Other)
    {
        this.m_StigmataId = 0;
        this.m_OwnerStigmataLevel = 0;
        this.m_bIsFake = false;
        this.m_RenderOpacity = 1.0f;
        this.m_bForceFullOpacity = false;
        this.m_StigmataId = int(Other.m_StigmataId);
        this.m_bIsFake = Other.m_bIsFake;
        this.m_OwnerStigmataLevel = int(Other.m_OwnerStigmataLevel);
        this.m_Config = Other.m_Config;
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_RenderOpacity = Other.m_RenderOpacity;
        this.m_bForceFullOpacity = Other.m_bForceFullOpacity;
        this.m_HoverTips = Other.m_HoverTips;
        this.m_UnmetConditionList = Other.m_UnmetConditionList;
        this.m_RedDotItem = Other.m_RedDotItem;
        return;
    }
    FVM_StigmataItem(const int InStigmataId, const bool InbIsFake, const int InOwnerStigmataLevel, const bool InbForceFullOpacity)
    {
        this.m_StigmataId = 0;
        this.m_OwnerStigmataLevel = 0;
        this.m_bIsFake = false;
        this.m_RenderOpacity = 1.0f;
        this.m_bForceFullOpacity = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetStigmataId(InStigmataId);
        this.SetbIsFake(InbIsFake);
        this.SetOwnerStigmataLevel(InOwnerStigmataLevel);
        this.SetbForceFullOpacity(InbForceFullOpacity);
        return;
    }
    FVM_StigmataItem& opAssign(const FVM_StigmataItem &inout Other)
    {
        this.m_StigmataId = int(Other.m_StigmataId);
        this.m_bIsFake = Other.m_bIsFake;
        this.m_OwnerStigmataLevel = int(Other.m_OwnerStigmataLevel);
        this.m_Config = Other.m_Config;
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_RenderOpacity = Other.m_RenderOpacity;
        this.m_bForceFullOpacity = Other.m_bForceFullOpacity;
        this.m_HoverTips = Other.m_HoverTips;
        this.m_UnmetConditionList = Other.m_UnmetConditionList;
        return Other.m_RedDotItem;
    }
    void PostConstruct()
    {
        this.SetPlayerLevel(TEUIModelRef<FM_LocalPlayerLevel>(::FM_LocalPlayerLevel::Get(this.GetContext().Manager)));
        if (!(this.GetbIsFake()))
        {
            int local_4 = this.GetStigmataId();
            GetDataObjectByGSDataId<FStigmataConfig> local_28;
            this.SetConfig(local_28.opImplConv());
            if (this.GetConfig().IsSet())
            {
                const FStigmataConfig& local_54;
                this.SetHoverTips(TEUIModelRef<FVM_TitleAndDescAndStatus>(::FVM_TitleAndDescAndStatus::Create(this.GetContext().Manager, local_54.Name, local_54.Instructions)));
                if (local_54.UnlockCost.Num() == 0)
                {
                    this.SetRedDotItem(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Stigmata_NewStigmata, this.GetStigmataId()))));
                }
            }
            else
            {
                FText local_70;
                this.SetHoverTips(TEUIModelRef<FVM_TitleAndDescAndStatus>(::FVM_TitleAndDescAndStatus::Create(this.GetContext().Manager, FText(), local_70)));
            }
        }
        else
        {
            this.SetHoverTips(TEUIModelRef<FVM_TitleAndDescAndStatus>(::FVM_TitleAndDescAndStatus::Create(this.GetContext().Manager, NSLOCTEXT("FakeHoverTitle", "зїјз—•иѓЅеЉ›з‚№"), NSLOCTEXT("FakeHoverDesc", "еЉџиѓЅе°љжњЄејЂж”ѕж•¬иЇ·жњџеѕ…"))));
        }
        this.BuildUnmetConditions();
        this.RefreshHoverTips();
        return;
    }
    void ConsumeRedDot()
    {
        if (this.GetbIsFake() || !(this.GetRedDotItem().IsValid()))
        {
            return;
        }
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(GameplayTags::RedDotSystem_Stigmata_NewStigmata, this.GetStigmataId());
        return;
    }
    FText GetName() const
    {
        if (this.GetbIsFake())
        {
            return FText();
        }
        return this.GetConfig().opArrow().Name;
    }
    FSoftBrush GetIcon() const
    {
        if (this.GetbIsFake())
        {
            return FSoftBrush();
        }
        return this.GetConfig().opArrow().NodeIcon;
    }
    FText GetInstructions() const
    {
        if (this.GetbIsFake())
        {
            return FText();
        }
        return this.GetConfig().opArrow().Instructions;
    }
    FText GetHoverTipsDesc() const
    {
        if (this.GetHoverTips())
        {
            return this.GetHoverTips().opArrow().GetDesc();
        }
        return FText();
    }
    bool GetHoverTipsDone() const
    {
        if (this.GetHoverTips())
        {
            return this.GetHoverTips().opArrow().GetbDone();
        }
        return false;
    }
    bool GetIsUnlocked() const
    {
        if (this.GetbIsFake())
        {
            return false;
        }
        return this.GetPlayerLevel().opArrow().IsStigmataUnlocked(this.GetStigmataId());
    }
    bool GetIsFake() const
    {
        return this.GetbIsFake();
    }
    bool GetIsWithinCurrentBreakthroughRange() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    bool GetHasCost() const
    {
        if (this.GetbIsFake())
        {
            return false;
        }
        return (this.GetConfig().opArrow().UnlockCost.Num() > 0);
    }
    void OnStigmataDataRefresh(const FMsg_StigmataDataRefresh &inout Msg)
    {
        this.BuildUnmetConditions();
        this.RefreshHoverTips();
        return;
    }
    void OnLevelRefresh(const FMsg_LocalPlayerLevelRefresh &inout Msg)
    {
        this.BuildUnmetConditions();
        this.RefreshHoverTips();
        return;
    }
    void BuildUnmetConditions()
    {
        int local_22 = 0;
        this.GetModify_UnmetConditionList().Empty(0);
        if (this.GetbIsFake())
        {
            return;
        }
        int local_4 = this.GetConfig().opArrow().RoleLevel;
        int local_3 = local_4;
        if (!((this.GetPlayerLevel().opArrow().GetLevel() >= local_3)))
        {
            FText::Format(NSLOCTEXT("StigmataLevelCondDesc", "{0}/{1}"), this.GetPlayerLevel().opArrow().GetLevel(), local_3);
            FText::Format(NSLOCTEXT("StigmataLevelCondTitle", "и§’и‰Із­‰зє§иѕѕе€°{0}зє§"), local_3);
            local_22.SetbDone(false);
            this.GetModify_UnmetConditionList().Add(TEUIModelRef<FVM_TitleAndDescAndStatus>(local_22));
        }
        return;
    }
    void RefreshHoverTips()
    {
        float32 local_3;
        bool local_2 = this.GetIsUnlocked();
        if (this.GetbForceFullOpacity() || local_2)
        {
            local_3 = 1.0f;
        }
        else
        {
            local_3 = 0.4f;
        }
        this.SetRenderOpacity(local_3);
        if (this.GetHoverTips())
        {
            this.GetHoverTips().opArrow().SetbDone(!(local_2));
        }
        return;
    }
    int GetStigmataId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_StigmataId;
    }
    void SetStigmataId(const int __Value) property
    {
        if (this.m_StigmataId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_StigmataId = __Value;
        return;
    }
    bool GetbIsFake() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsFake;
    }
    void SetbIsFake(const bool __Value) property
    {
        if (!(this.m_bIsFake) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsFake = __Value;
        return;
    }
    int GetOwnerStigmataLevel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_OwnerStigmataLevel;
    }
    void SetOwnerStigmataLevel(const int __Value) property
    {
        if (this.m_OwnerStigmataLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_OwnerStigmataLevel = __Value;
        return;
    }
    TDataObjectPtr<FStigmataConfig> GetConfig() const property
    {
        TDataObjectPtr<FStigmataConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FStigmataConfig> GetModify_Config() property
    {
        TDataObjectPtr<FStigmataConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FStigmataConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Config = __Value;
        return;
    }
    TEUIModelRef<FM_LocalPlayerLevel> GetPlayerLevel() const property
    {
        this.TrackPropertyRead(4);
        return this.m_PlayerLevel;
    }
    void SetPlayerLevel(const TEUIModelRef<FM_LocalPlayerLevel> &inout __Value) property
    {
        TEUIModelRef<FM_LocalPlayerLevel> local_2;
        local_2 = this.m_PlayerLevel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PlayerLevel = __Value;
        return;
    }
    float32 GetRenderOpacity() const property
    {
        float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_RenderOpacity() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetRenderOpacity(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_RenderOpacity = __Value;
        return;
    }
    bool GetbForceFullOpacity() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bForceFullOpacity;
    }
    void SetbForceFullOpacity(const bool __Value) property
    {
        if (!(this.m_bForceFullOpacity) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bForceFullOpacity = __Value;
        return;
    }
    TEUIModelRef<FVM_TitleAndDescAndStatus> GetHoverTips() const property
    {
        this.TrackPropertyRead(7);
        return this.m_HoverTips;
    }
    void SetHoverTips(const TEUIModelRef<FVM_TitleAndDescAndStatus> &inout __Value) property
    {
        TEUIModelRef<FVM_TitleAndDescAndStatus> local_2;
        local_2 = this.m_HoverTips;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_HoverTips = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> GetUnmetConditionList() const property
    {
        const TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> GetModify_UnmetConditionList() property
    {
        TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetUnmetConditionList(const TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_UnmetConditionList = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotItem() const property
    {
        this.TrackPropertyRead(9);
        return this.m_RedDotItem;
    }
    void SetRedDotItem(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_RedDotItem = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_StigmataItem
{
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FText Instructions;
    UPROPERTY()
    FText HoverTipsDesc;
    UPROPERTY()
    bool HoverTipsDone;
    UPROPERTY()
    bool IsUnlocked;
    UPROPERTY()
    bool IsFake;
    UPROPERTY()
    bool IsWithinCurrentBreakthroughRange;
    UPROPERTY()
    bool HasCost;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataItem> Self;


}

namespace FVM_StigmataItem
{
FVM_StigmataItem& Create(const UObject ContextObject, const int StigmataId, const bool bIsFake, const int OwnerStigmataLevel, const bool bForceFullOpacity)
{
    return FVM_StigmataItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), StigmataId, bIsFake, OwnerStigmataLevel, bForceFullOpacity);
}
FVM_StigmataItem CreateByManager(const UEUIManagerSubsystem Manager, const int StigmataId, const bool bIsFake, const int OwnerStigmataLevel, const bool bForceFullOpacity)
{
    FVM_StigmataItem __r;
    TEUIModelRef<FVM_StigmataItem> local_6 = TEUIModelRef<FVM_StigmataItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_StigmataItem::ModelId, 0, StigmataId, bIsFake, OwnerStigmataLevel, bForceFullOpacity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RenderOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverTips";
    local_14.TypeName = "TEUIModelRef<FVM_TitleAndDescAndStatus>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UnmetConditionList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDotItem";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Name";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Instructions";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverTipsDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverTipsDone";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnlocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsFake";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsWithinCurrentBreakthroughRange";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasCost";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_StigmataItem;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnStigmataDataRefresh";
    local_26.MessageTypeName = "Msg_StigmataDataRefresh";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnLevelRefresh";
    local_26.MessageTypeName = "Msg_LocalPlayerLevelRefresh";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_StigmataItem;
}
void __OnStigmataDataRefresh(FVM_StigmataItem &inout Model, const FMsg_StigmataDataRefresh &inout Message)
{
    Model.OnStigmataDataRefresh(Message);
    return;
}
void __OnLevelRefresh(FVM_StigmataItem &inout Model, const FMsg_LocalPlayerLevelRefresh &inout Message)
{
    Model.OnLevelRefresh(Message);
    return;
}
float32 __UIGetter_RenderOpacity(const FVM_StigmataItem &inout Model)
{
    return Model.GetRenderOpacity();
}
TEUIModelRef<FVM_TitleAndDescAndStatus> __UIGetter_HoverTips(const FVM_StigmataItem &inout Model)
{
    return Model.GetHoverTips();
}
TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __UIGetter_UnmetConditionList(const FVM_StigmataItem &inout Model)
{
    return Model.GetUnmetConditionList();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotItem(const FVM_StigmataItem &inout Model)
{
    return Model.GetRedDotItem();
}
FText __UIGetter_Name(const FVM_StigmataItem &inout Model)
{
    return Model.GetName();
}
FSoftBrush __UIGetter_Icon(const FVM_StigmataItem &inout Model)
{
    return Model.GetIcon();
}
FText __UIGetter_Instructions(const FVM_StigmataItem &inout Model)
{
    return Model.GetInstructions();
}
FText __UIGetter_HoverTipsDesc(const FVM_StigmataItem &inout Model)
{
    return Model.GetHoverTipsDesc();
}
bool __UIGetter_HoverTipsDone(const FVM_StigmataItem &inout Model)
{
    return Model.GetHoverTipsDone();
}
bool __UIGetter_IsUnlocked(const FVM_StigmataItem &inout Model)
{
    return Model.GetIsUnlocked();
}
bool __UIGetter_IsFake(const FVM_StigmataItem &inout Model)
{
    return Model.GetIsFake();
}
bool __UIGetter_IsWithinCurrentBreakthroughRange(const FVM_StigmataItem &inout Model)
{
    return Model.GetIsWithinCurrentBreakthroughRange();
}
bool __UIGetter_HasCost(const FVM_StigmataItem &inout Model)
{
    return Model.GetHasCost();
}
TEUIModelRef<FVM_StigmataItem> __UIGetter_Self(const FVM_StigmataItem &inout Model)
{
    return TEUIModelRef<FVM_StigmataItem>(Model);
}
int __IndexOf_StigmataId()
{
    return 0;
}
int __IndexOf_bIsFake()
{
    return 1;
}
int __IndexOf_OwnerStigmataLevel()
{
    return 2;
}
int __IndexOf_Config()
{
    return 3;
}
int __IndexOf_PlayerLevel()
{
    return 4;
}
int __IndexOf_RenderOpacity()
{
    return 5;
}
int __IndexOf_bForceFullOpacity()
{
    return 6;
}
int __IndexOf_HoverTips()
{
    return 7;
}
int __IndexOf_UnmetConditionList()
{
    return 8;
}
int __IndexOf_RedDotItem()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_StigmataItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
