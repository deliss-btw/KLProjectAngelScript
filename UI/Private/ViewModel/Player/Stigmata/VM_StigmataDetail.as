
namespace FVM_StigmataDetail
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature GotoBreakthrough = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoOverView = FEUIModelCallbackSignature();

}
struct FVM_StigmataDetail : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_LocalPlayerLevel> m_PlayerLevel;
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerLevelInfo> m_PlayerLevelInfo;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_StigmataRow>> m_TreeRows;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataRow> m_NextLockedRow;
    UPROPERTY()
    bool m_bHasNextLockedRow;
    UPROPERTY()
    bool m_bReadyBreakthrough;
    UPROPERTY()
    bool m_bHasBreakthroughAvailable;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataGifts> m_StigmataGifts;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AttributeValueItem>> m_LevelAttributeGains;
    UPROPERTY()
    FEUIModelRef m_LevelAttributeGainsHoverTips;

    FVM_StigmataDetail()
    {
        this.m_bHasNextLockedRow = false;
        this.m_bReadyBreakthrough = false;
        this.m_bHasBreakthroughAvailable = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_StigmataDetail(const FVM_StigmataDetail &inout Other)
    {
        this.m_bHasNextLockedRow = false;
        this.m_bReadyBreakthrough = false;
        this.m_bHasBreakthroughAvailable = true;
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_PlayerLevelInfo = Other.m_PlayerLevelInfo;
        this.m_TreeRows = Other.m_TreeRows;
        this.m_NextLockedRow = Other.m_NextLockedRow;
        this.m_bHasNextLockedRow = Other.m_bHasNextLockedRow;
        this.m_bReadyBreakthrough = Other.m_bReadyBreakthrough;
        this.m_bHasBreakthroughAvailable = Other.m_bHasBreakthroughAvailable;
        this.m_StigmataGifts = Other.m_StigmataGifts;
        this.m_LevelAttributeGains = Other.m_LevelAttributeGains;
        this.m_LevelAttributeGainsHoverTips = Other.m_LevelAttributeGainsHoverTips;
        return;
    }
    FVM_StigmataDetail& opAssign(const FVM_StigmataDetail &inout Other)
    {
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_PlayerLevelInfo = Other.m_PlayerLevelInfo;
        this.m_TreeRows = Other.m_TreeRows;
        this.m_NextLockedRow = Other.m_NextLockedRow;
        this.m_bHasNextLockedRow = Other.m_bHasNextLockedRow;
        this.m_bReadyBreakthrough = Other.m_bReadyBreakthrough;
        this.m_bHasBreakthroughAvailable = Other.m_bHasBreakthroughAvailable;
        this.m_StigmataGifts = Other.m_StigmataGifts;
        this.m_LevelAttributeGains = Other.m_LevelAttributeGains;
        return Other.m_LevelAttributeGainsHoverTips;
    }
    void PostConstruct()
    {
        this.SetPlayerLevel(TEUIModelRef<FM_LocalPlayerLevel>(::FM_LocalPlayerLevel::Get(this.GetContext().Manager)));
        this.SetPlayerLevelInfo(TEUIModelRef<FVMS_PlayerLevelInfo>(::FVMS_PlayerLevelInfo::Get(this.GetContext().Manager)));
        this.SetStigmataGifts(TEUIModelRef<FVM_StigmataGifts>(::FVM_StigmataGifts::Create(this.GetContext().Manager)));
        NSLOCTEXT("StigmataLevelAttributeGainsHint", "и§’и‰Із­‰зє§жЏђеЌ‡гЂЃзїјз—•иѓЅеЉ›и§Јй”ЃиЋ·еЏ–зљ„е±ћжЂ§еЏЇеЇ№е…ЁйѓЁе‡єж€и§’и‰Із”џж•€");
        NSLOCTEXT("StigmataLevelAttributeGainsHintTitle", "е±ћжЂ§ж”¶з›ЉиЇґжЋ");
        this.SetLevelAttributeGainsHoverTips(FEUIModelRef());
        this.RebuildTree();
        this.RefreshLevelAttributeGains();
        return;
    }
    void GotoBreakthrough()
    {
        ::CommonPopup::CloseAllHover();
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_BreakThrough);
        return;
    }
    void GotoOverView()
    {
        ::CommonPopup::CloseAllHover();
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_StigmataOverview);
        return;
    }
    void OnLevelRefresh(const FMsg_LocalPlayerLevelRefresh &inout Msg)
    {
        this.RebuildTree();
        this.RefreshLevelAttributeGains();
        return;
    }
    FText GetUnlockPercentText() const
    {
        if (this.GetStigmataGifts())
        {
            TEUIModelRef<FVM_StigmataGifts> local_2 = this.GetStigmataGifts();
            return GetUnlockPercentText();
        }
        return FText();
    }
    float32 GetUnlockPercent() const
    {
        if (this.GetStigmataGifts())
        {
            TEUIModelRef<FVM_StigmataGifts> local_2 = this.GetStigmataGifts();
            return GetUnlockPercent();
        }
        return 0.0f;
    }
    void OnStigmataDataRefresh(const FMsg_StigmataDataRefresh &inout Msg)
    {
        this.RefreshLevelAttributeGains();
        return;
    }
    void RebuildTree()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RefreshLevelAttributeGains()
    {
        const UPlayerInfoSettings local_8;
        this.GetModify_LevelAttributeGains().Empty(0);
        if (!(this.GetPlayerLevel()))
        {
            return;
        }
        GetGameplaySettings<UPlayerInfoSettings> local_10;
        local_8 = local_10;
        TDataObjectPtr<FGameAttributeGrowByLevelConfig> local_36 = local_8.GetAttributeGrowthAtLevel(this.GetPlayerLevel().opArrow().GetLevel());
        if (!(local_36))
        {
            return;
        }
        float32 local_61 = local_36.opArrow().HPMax;
        if (local_61 != 0.0f)
        {
            this.GetModify_LevelAttributeGains().Add(TEUIModelRef<FVM_AttributeValueItem>(::FVM_AttributeValueItem::Create(this.GetContext().Manager, Attribute::HPMax, local_36.opArrow().HPMax)));
        }
        float32 local_62_2 = local_36.opArrow().StaminaMax;
        if (local_62_2 != 0.0f)
        {
            this.GetModify_LevelAttributeGains().Add(TEUIModelRef<FVM_AttributeValueItem>(::FVM_AttributeValueItem::Create(this.GetContext().Manager, Attribute::StaminaMax, local_36.opArrow().StaminaMax)));
        }
        return;
    }
    TEUIModelRef<FM_LocalPlayerLevel> GetPlayerLevel() const property
    {
        this.TrackPropertyRead(0);
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
        this.MarkPropertyDirty(0);
        this.m_PlayerLevel = __Value;
        return;
    }
    TEUIModelRef<FVMS_PlayerLevelInfo> GetPlayerLevelInfo() const property
    {
        this.TrackPropertyRead(1);
        return this.m_PlayerLevelInfo;
    }
    void SetPlayerLevelInfo(const TEUIModelRef<FVMS_PlayerLevelInfo> &inout __Value) property
    {
        TEUIModelRef<FVMS_PlayerLevelInfo> local_2;
        local_2 = this.m_PlayerLevelInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PlayerLevelInfo = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_StigmataRow>> GetTreeRows() const property
    {
        const TArray<TEUIModelRef<FVM_StigmataRow>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_StigmataRow>> GetModify_TreeRows() property
    {
        TArray<TEUIModelRef<FVM_StigmataRow>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTreeRows(const TArray<TEUIModelRef<FVM_StigmataRow>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TreeRows = __Value;
        return;
    }
    TEUIModelRef<FVM_StigmataRow> GetNextLockedRow() const property
    {
        this.TrackPropertyRead(3);
        return this.m_NextLockedRow;
    }
    void SetNextLockedRow(const TEUIModelRef<FVM_StigmataRow> &inout __Value) property
    {
        TEUIModelRef<FVM_StigmataRow> local_2;
        local_2 = this.m_NextLockedRow;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_NextLockedRow = __Value;
        return;
    }
    bool GetbHasNextLockedRow() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bHasNextLockedRow;
    }
    void SetbHasNextLockedRow(const bool __Value) property
    {
        if (!(this.m_bHasNextLockedRow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bHasNextLockedRow = __Value;
        return;
    }
    bool GetbReadyBreakthrough() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bReadyBreakthrough;
    }
    void SetbReadyBreakthrough(const bool __Value) property
    {
        if (!(this.m_bReadyBreakthrough) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bReadyBreakthrough = __Value;
        return;
    }
    bool GetbHasBreakthroughAvailable() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bHasBreakthroughAvailable;
    }
    void SetbHasBreakthroughAvailable(const bool __Value) property
    {
        if (!(this.m_bHasBreakthroughAvailable) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bHasBreakthroughAvailable = __Value;
        return;
    }
    TEUIModelRef<FVM_StigmataGifts> GetStigmataGifts() const property
    {
        this.TrackPropertyRead(7);
        return this.m_StigmataGifts;
    }
    void SetStigmataGifts(const TEUIModelRef<FVM_StigmataGifts> &inout __Value) property
    {
        TEUIModelRef<FVM_StigmataGifts> local_2;
        local_2 = this.m_StigmataGifts;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_StigmataGifts = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AttributeValueItem>> GetLevelAttributeGains() const property
    {
        const TArray<TEUIModelRef<FVM_AttributeValueItem>> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AttributeValueItem>> GetModify_LevelAttributeGains() property
    {
        TArray<TEUIModelRef<FVM_AttributeValueItem>> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetLevelAttributeGains(const TArray<TEUIModelRef<FVM_AttributeValueItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_LevelAttributeGains = __Value;
        return;
    }
    const FEUIModelRef GetLevelAttributeGainsHoverTips() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FEUIModelRef GetModify_LevelAttributeGainsHoverTips() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetLevelAttributeGainsHoverTips(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_LevelAttributeGainsHoverTips = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_StigmataDetail
{
    UPROPERTY()
    FText UnlockPercentText;
    UPROPERTY()
    float32 UnlockPercent;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataDetail> Self;


}

namespace FVM_StigmataDetail
{
FVM_StigmataDetail& Create(const UObject ContextObject)
{
    return FVM_StigmataDetail::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_StigmataDetail CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_StigmataDetail __r;
    TEUIModelRef<FVM_StigmataDetail> local_6 = TEUIModelRef<FVM_StigmataDetail>(EUIInternal::MakeModelWithManager(Manager, FVM_StigmataDetail::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PlayerLevelInfo";
    local_14.TypeName = "TEUIModelRef<FVMS_PlayerLevelInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TreeRows";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_StigmataRow>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NextLockedRow";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataRow>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasNextLockedRow";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bReadyBreakthrough";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasBreakthroughAvailable";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "StigmataGifts";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataGifts>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LevelAttributeGains";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AttributeValueItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LevelAttributeGainsHoverTips";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UnlockPercentText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UnlockPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_StigmataDetail;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnLevelRefresh";
    local_26.MessageTypeName = "Msg_LocalPlayerLevelRefresh";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnStigmataDataRefresh";
    local_26.MessageTypeName = "Msg_StigmataDataRefresh";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_StigmataDetail;
}
void __OnLevelRefresh(FVM_StigmataDetail &inout Model, const FMsg_LocalPlayerLevelRefresh &inout Message)
{
    Model.OnLevelRefresh(Message);
    return;
}
void __OnStigmataDataRefresh(FVM_StigmataDetail &inout Model, const FMsg_StigmataDataRefresh &inout Message)
{
    Model.OnStigmataDataRefresh(Message);
    return;
}
TEUIModelRef<FVMS_PlayerLevelInfo> __UIGetter_PlayerLevelInfo(const FVM_StigmataDetail &inout Model)
{
    return Model.GetPlayerLevelInfo();
}
TArray<TEUIModelRef<FVM_StigmataRow>> __UIGetter_TreeRows(const FVM_StigmataDetail &inout Model)
{
    return Model.GetTreeRows();
}
TEUIModelRef<FVM_StigmataRow> __UIGetter_NextLockedRow(const FVM_StigmataDetail &inout Model)
{
    return Model.GetNextLockedRow();
}
bool __UIGetter_bHasNextLockedRow(const FVM_StigmataDetail &inout Model)
{
    return Model.GetbHasNextLockedRow();
}
bool __UIGetter_bReadyBreakthrough(const FVM_StigmataDetail &inout Model)
{
    return Model.GetbReadyBreakthrough();
}
bool __UIGetter_bHasBreakthroughAvailable(const FVM_StigmataDetail &inout Model)
{
    return Model.GetbHasBreakthroughAvailable();
}
TEUIModelRef<FVM_StigmataGifts> __UIGetter_StigmataGifts(const FVM_StigmataDetail &inout Model)
{
    return Model.GetStigmataGifts();
}
TArray<TEUIModelRef<FVM_AttributeValueItem>> __UIGetter_LevelAttributeGains(const FVM_StigmataDetail &inout Model)
{
    return Model.GetLevelAttributeGains();
}
FEUIModelRef __UIGetter_LevelAttributeGainsHoverTips(const FVM_StigmataDetail &inout Model)
{
    return Model.GetLevelAttributeGainsHoverTips();
}
FText __UIGetter_UnlockPercentText(const FVM_StigmataDetail &inout Model)
{
    return Model.GetUnlockPercentText();
}
float32 __UIGetter_UnlockPercent(const FVM_StigmataDetail &inout Model)
{
    return Model.GetUnlockPercent();
}
TEUIModelRef<FVM_StigmataDetail> __UIGetter_Self(const FVM_StigmataDetail &inout Model)
{
    return TEUIModelRef<FVM_StigmataDetail>(Model);
}
int __IndexOf_PlayerLevel()
{
    return 0;
}
int __IndexOf_PlayerLevelInfo()
{
    return 1;
}
int __IndexOf_TreeRows()
{
    return 2;
}
int __IndexOf_NextLockedRow()
{
    return 3;
}
int __IndexOf_bHasNextLockedRow()
{
    return 4;
}
int __IndexOf_bReadyBreakthrough()
{
    return 5;
}
int __IndexOf_bHasBreakthroughAvailable()
{
    return 6;
}
int __IndexOf_StigmataGifts()
{
    return 7;
}
int __IndexOf_LevelAttributeGains()
{
    return 8;
}
int __IndexOf_LevelAttributeGainsHoverTips()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_StigmataDetail
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
