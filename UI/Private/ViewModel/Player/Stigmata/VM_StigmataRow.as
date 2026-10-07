
namespace FVM_StigmataRow
{
    const int ModelId = 0;

}
struct FVM_StigmataRow : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_StigmataLevel;
    UPROPERTY()
    TEUIModelRef<FM_LocalPlayerLevel> m_PlayerLevel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_StigmataItem>> m_LeftItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_StigmataItem>> m_RightItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_StigmataItem>> m_FakeItems;
    UPROPERTY()
    int m_NextRowLevel;
    UPROPERTY()
    bool m_bHasNextRow;

    FVM_StigmataRow()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_StigmataRow(const FVM_StigmataRow &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_StigmataRow(const int InStigmataLevel)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_StigmataRow opAssign(const FVM_StigmataRow &inout Other)
    {
        FVM_StigmataRow __r;
        this.m_StigmataLevel = int(Other.m_StigmataLevel);
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_LeftItems = Other.m_LeftItems;
        this.m_RightItems = Other.m_RightItems;
        this.m_FakeItems = Other.m_FakeItems;
        this.m_NextRowLevel = int(Other.m_NextRowLevel);
        this.m_bHasNextRow = Other.m_bHasNextRow;
        return __r;
    }
    void PostConstruct()
    {
        this.SetPlayerLevel(TEUIModelRef<FM_LocalPlayerLevel>(::FM_LocalPlayerLevel::Get(this.GetContext().Manager)));
        this.RebuildItems();
        this.RefreshNextRow();
        return;
    }
    void RefreshNextRow()
    {
        const UPlayerInfoSettings local_2;
        GetGameplaySettings<UPlayerInfoSettings> local_4;
        local_2 = local_4;
        TArray<int> local_10 = local_2.GetStigmataLevels();
        int local_15 = 0;
        for (; local_15 < local_10.Num(); ++local_15)
        {
            if (local_10[local_15] == this.GetStigmataLevel())
            {
                if (local_15 < (local_10.Num() - 1))
                {
                    this.SetNextRowLevel(local_10[local_15 + 1]);
                    this.SetbHasNextRow(true);
                }
                else
                {
                    this.SetNextRowLevel(INDEX_NONE);
                    this.SetbHasNextRow(false);
                }
                return;
            }
        }
        this.SetNextRowLevel(INDEX_NONE);
        this.SetbHasNextRow(false);
        return;
    }
    FText GetStigmataLevelText() const
    {
        FNumberFormattingOptions local_6;
        return FText::AsNumber(this.GetStigmataLevel(), local_6);
    }
    bool GetIsLevelReached() const
    {
        return (this.GetPlayerLevel().opArrow().GetLevel() >= this.GetStigmataLevel());
    }
    int GetReachStatus() const
    {
        const UPlayerInfoSettings local_8;
        if (this.GetPlayerLevel().opArrow().GetLevel() < this.GetStigmataLevel())
        {
            return 2;
        }
        GetGameplaySettings<UPlayerInfoSettings> local_10;
        local_8 = local_10;
        int local_19 = local_8.GetStigmataLevels().Num() - 1;
        for (; local_19 >= 0; --local_19)
        {
            if (local_8.GetStigmataLevels()[local_19] <= this.GetPlayerLevel().opArrow().GetLevel())
            {
                return local_8.GetStigmataLevels()[local_19] == this.GetStigmataLevel() ? 1 : 0;
            }
        }
        return 0;
    }
    void OnStigmataDataRefresh(const FMsg_StigmataDataRefresh &inout Msg)
    {
        return;
    }
    void OnLevelRefresh(const FMsg_LocalPlayerLevelRefresh &inout Msg)
    {
        return;
    }
    void RebuildItems()
    {
        const UPlayerInfoSettings local_4;
        this.GetModify_LeftItems().Empty(0);
        this.GetModify_RightItems().Empty(0);
        this.GetModify_FakeItems().Empty(0);
        GetGameplaySettings<UPlayerInfoSettings> local_6;
        local_4 = local_6;
        TArray<TDataObjectPtr<FStigmataConfig>> local_16 = local_4.GetHasCostStigmataConfigsForLevel(this.GetStigmataLevel());
        int local_19 = FMath::IntegerDivisionTrunc(local_16.Num(), 2);
        int local_20 = 0;
        for (; local_20 < local_16.Num(); ++local_20)
        {
            int local_22 = this.GetStigmataLevel();
            FVM_StigmataItem& local_26 = ::FVM_StigmataItem::Create(this.GetContext().Manager, ::NumericUtils::AsInt32(local_16[local_20].opArrow().DataId), false, local_22, false);
            if (local_20 < local_19)
            {
                this.GetModify_LeftItems().Add(TEUIModelRef<FVM_StigmataItem>(local_26));
                continue;
            }
            this.GetModify_RightItems().Add(TEUIModelRef<FVM_StigmataItem>(local_26));
        }
        int local_22_2 = local_4.GetFakeStigmataPointNum(this.GetStigmataLevel());
        int local_20_2 = 0;
        for (; local_20_2 < local_22_2; )
        {
            this.GetModify_FakeItems().Add(TEUIModelRef<FVM_StigmataItem>(::FVM_StigmataItem::Create(this.GetContext().Manager, (-(((this.GetStigmataLevel() * 100) + local_20_2) + 1)), true, this.GetStigmataLevel(), false)));
            ++local_20_2;
        }
        return;
    }
    int GetStigmataLevel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_StigmataLevel;
    }
    void SetStigmataLevel(const int __Value) property
    {
        if (this.m_StigmataLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_StigmataLevel = __Value;
        return;
    }
    TEUIModelRef<FM_LocalPlayerLevel> GetPlayerLevel() const property
    {
        this.TrackPropertyRead(1);
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
        this.MarkPropertyDirty(1);
        this.m_PlayerLevel = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_StigmataItem>> GetLeftItems() const property
    {
        const TArray<TEUIModelRef<FVM_StigmataItem>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_StigmataItem>> GetModify_LeftItems() property
    {
        TArray<TEUIModelRef<FVM_StigmataItem>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetLeftItems(const TArray<TEUIModelRef<FVM_StigmataItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LeftItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_StigmataItem>> GetRightItems() const property
    {
        const TArray<TEUIModelRef<FVM_StigmataItem>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_StigmataItem>> GetModify_RightItems() property
    {
        TArray<TEUIModelRef<FVM_StigmataItem>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetRightItems(const TArray<TEUIModelRef<FVM_StigmataItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RightItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_StigmataItem>> GetFakeItems() const property
    {
        const TArray<TEUIModelRef<FVM_StigmataItem>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_StigmataItem>> GetModify_FakeItems() property
    {
        TArray<TEUIModelRef<FVM_StigmataItem>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetFakeItems(const TArray<TEUIModelRef<FVM_StigmataItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_FakeItems = __Value;
        return;
    }
    int GetNextRowLevel() const property
    {
        this.TrackPropertyRead(5);
        return this.m_NextRowLevel;
    }
    void SetNextRowLevel(const int __Value) property
    {
        if (this.m_NextRowLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_NextRowLevel = __Value;
        return;
    }
    bool GetbHasNextRow() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bHasNextRow;
    }
    void SetbHasNextRow(const bool __Value) property
    {
        if (!(this.m_bHasNextRow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bHasNextRow = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_StigmataRow
{
    UPROPERTY()
    FText StigmataLevelText;
    UPROPERTY()
    bool IsLevelReached;
    UPROPERTY()
    int ReachStatus;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataRow> Self;


}

namespace FVM_StigmataRow
{
FVM_StigmataRow& Create(const UObject ContextObject, const int StigmataLevel)
{
    return FVM_StigmataRow::CreateByManager(EUIInternal::GetContextManager(ContextObject), StigmataLevel);
}
FVM_StigmataRow CreateByManager(const UEUIManagerSubsystem Manager, const int StigmataLevel)
{
    FVM_StigmataRow __r;
    TEUIModelRef<FVM_StigmataRow> local_6 = TEUIModelRef<FVM_StigmataRow>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_StigmataRow::ModelId, 0, StigmataLevel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "LeftItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_StigmataItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_StigmataItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FakeItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_StigmataItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NextRowLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasNextRow";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "StigmataLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsLevelReached";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReachStatus";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataRow>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_StigmataRow;
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
    return FVM_StigmataRow;
}
void __OnStigmataDataRefresh(FVM_StigmataRow &inout Model, const FMsg_StigmataDataRefresh &inout Message)
{
    Model.OnStigmataDataRefresh(Message);
    return;
}
void __OnLevelRefresh(FVM_StigmataRow &inout Model, const FMsg_LocalPlayerLevelRefresh &inout Message)
{
    Model.OnLevelRefresh(Message);
    return;
}
TArray<TEUIModelRef<FVM_StigmataItem>> __UIGetter_LeftItems(const FVM_StigmataRow &inout Model)
{
    return Model.GetLeftItems();
}
TArray<TEUIModelRef<FVM_StigmataItem>> __UIGetter_RightItems(const FVM_StigmataRow &inout Model)
{
    return Model.GetRightItems();
}
TArray<TEUIModelRef<FVM_StigmataItem>> __UIGetter_FakeItems(const FVM_StigmataRow &inout Model)
{
    return Model.GetFakeItems();
}
int __UIGetter_NextRowLevel(const FVM_StigmataRow &inout Model)
{
    return Model.GetNextRowLevel();
}
bool __UIGetter_bHasNextRow(const FVM_StigmataRow &inout Model)
{
    return Model.GetbHasNextRow();
}
FText __UIGetter_StigmataLevelText(const FVM_StigmataRow &inout Model)
{
    return Model.GetStigmataLevelText();
}
bool __UIGetter_IsLevelReached(const FVM_StigmataRow &inout Model)
{
    return Model.GetIsLevelReached();
}
int __UIGetter_ReachStatus(const FVM_StigmataRow &inout Model)
{
    return Model.GetReachStatus();
}
TEUIModelRef<FVM_StigmataRow> __UIGetter_Self(const FVM_StigmataRow &inout Model)
{
    return TEUIModelRef<FVM_StigmataRow>(Model);
}
int __IndexOf_StigmataLevel()
{
    return 0;
}
int __IndexOf_PlayerLevel()
{
    return 1;
}
int __IndexOf_LeftItems()
{
    return 2;
}
int __IndexOf_RightItems()
{
    return 3;
}
int __IndexOf_FakeItems()
{
    return 4;
}
int __IndexOf_NextRowLevel()
{
    return 5;
}
int __IndexOf_bHasNextRow()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_StigmataRow
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
