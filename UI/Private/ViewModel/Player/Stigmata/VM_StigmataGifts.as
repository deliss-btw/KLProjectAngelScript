
namespace FVM_StigmataGifts
{
    const int ModelId = 0;

}
struct FVM_StigmataGifts : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_LocalPlayerLevel> m_PlayerLevel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_StigmataItem>> m_GiftItems;
    UPROPERTY()
    FText m_NextBreakthroughName;
    UPROPERTY()
    FText m_NextBreakthroughLevel;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataItem> m_GiftSlot0;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataItem> m_GiftSlot1;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataItem> m_GiftSlot2;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataItem> m_GiftSlot3;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataItem> m_GiftSlot4;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataItem> m_GiftSlot5;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataItem> m_GiftSlot6;
    UPROPERTY()
    TEUIModelRef<FVM_StigmataItem> m_GiftSlot7;
    UPROPERTY()
    FText m_UnlockPercentText;
    UPROPERTY()
    float32 m_UnlockPercent;

    FVM_StigmataGifts()
    {
        this.m_UnlockPercent = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_StigmataGifts(const FVM_StigmataGifts &inout Other)
    {
        this.m_UnlockPercent = 0.0f;
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_GiftItems = Other.m_GiftItems;
        this.m_NextBreakthroughName = Other.m_NextBreakthroughName;
        this.m_NextBreakthroughLevel = Other.m_NextBreakthroughLevel;
        this.m_GiftSlot0 = Other.m_GiftSlot0;
        this.m_GiftSlot1 = Other.m_GiftSlot1;
        this.m_GiftSlot2 = Other.m_GiftSlot2;
        this.m_GiftSlot3 = Other.m_GiftSlot3;
        this.m_GiftSlot4 = Other.m_GiftSlot4;
        this.m_GiftSlot5 = Other.m_GiftSlot5;
        this.m_GiftSlot6 = Other.m_GiftSlot6;
        this.m_GiftSlot7 = Other.m_GiftSlot7;
        this.m_UnlockPercentText = Other.m_UnlockPercentText;
        this.m_UnlockPercent = Other.m_UnlockPercent;
        return;
    }
    FVM_StigmataGifts opAssign(const FVM_StigmataGifts &inout Other)
    {
        FVM_StigmataGifts __r;
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_GiftItems = Other.m_GiftItems;
        this.m_NextBreakthroughName = Other.m_NextBreakthroughName;
        this.m_NextBreakthroughLevel = Other.m_NextBreakthroughLevel;
        this.m_GiftSlot0 = Other.m_GiftSlot0;
        this.m_GiftSlot1 = Other.m_GiftSlot1;
        this.m_GiftSlot2 = Other.m_GiftSlot2;
        this.m_GiftSlot3 = Other.m_GiftSlot3;
        this.m_GiftSlot4 = Other.m_GiftSlot4;
        this.m_GiftSlot5 = Other.m_GiftSlot5;
        this.m_GiftSlot6 = Other.m_GiftSlot6;
        this.m_GiftSlot7 = Other.m_GiftSlot7;
        this.m_UnlockPercentText = Other.m_UnlockPercentText;
        this.m_UnlockPercent = Other.m_UnlockPercent;
        return __r;
    }
    void PostConstruct()
    {
        this.SetPlayerLevel(TEUIModelRef<FM_LocalPlayerLevel>(::FM_LocalPlayerLevel::Get(this.GetContext().Manager)));
        this.RebuildGiftItems();
        this.RefreshHintTexts();
        this.RefreshUnlockPercent();
        return;
    }
    void OnLevelRefresh(const FMsg_LocalPlayerLevelRefresh &inout Msg)
    {
        this.RefreshHintTexts();
        this.RefreshUnlockPercent();
        return;
    }
    void OnStigmataDataRefresh(const FMsg_StigmataDataRefresh &inout Msg)
    {
        this.RefreshUnlockPercent();
        return;
    }
    void RebuildGiftItems()
    {
        const UPlayerInfoSettings local_4;
        this.GetModify_GiftItems().Empty(0);
        GetGameplaySettings<UPlayerInfoSettings> local_6;
        local_4 = local_6;
        TArray<TDataObjectPtr<FStigmataConfig>> local_16 = local_4.GetAllNoCostStigmataConfigs();
        int local_17 = 0;
        for (; local_17 < local_16.Num(); )
        {
            int local_18 = ::NumericUtils::AsInt32(local_16[local_17].opArrow().DataId);
            this.GetModify_GiftItems().Add(TEUIModelRef<FVM_StigmataItem>(::FVM_StigmataItem::Create(this.GetContext().Manager, local_18, false, 0, false)));
            ++local_17;
        }
        this.AssignSlots();
        return;
    }
    void AssignSlots()
    {
        TEUIModelRef<FVM_StigmataItem> local_6;
        if (this.GetGiftItems().IsValidIndex(0))
        {
            local_6 = this.GetGiftItems()[0];
        }
        else
        {
            local_6 = TEUIModelRef<FVM_StigmataItem>();
        }
        this.SetGiftSlot0(local_6);
        TEUIModelRef<FVM_StigmataItem> local_4;
        if (this.GetGiftItems().IsValidIndex(1))
        {
            local_4 = this.GetGiftItems()[1];
        }
        else
        {
            local_4 = TEUIModelRef<FVM_StigmataItem>();
        }
        this.SetGiftSlot1(local_4);
        if (this.GetGiftItems().IsValidIndex(2))
        {
            local_6 = this.GetGiftItems()[2];
        }
        else
        {
            local_6 = TEUIModelRef<FVM_StigmataItem>();
        }
        this.SetGiftSlot2(local_6);
        if (this.GetGiftItems().IsValidIndex(3))
        {
            local_4 = this.GetGiftItems()[3];
        }
        else
        {
            local_4 = TEUIModelRef<FVM_StigmataItem>();
        }
        this.SetGiftSlot3(local_4);
        if (this.GetGiftItems().IsValidIndex(4))
        {
            local_6 = this.GetGiftItems()[4];
        }
        else
        {
            local_6 = TEUIModelRef<FVM_StigmataItem>();
        }
        this.SetGiftSlot4(local_6);
        if (this.GetGiftItems().IsValidIndex(5))
        {
            local_4 = this.GetGiftItems()[5];
        }
        else
        {
            local_4 = TEUIModelRef<FVM_StigmataItem>();
        }
        this.SetGiftSlot5(local_4);
        if (this.GetGiftItems().IsValidIndex(6))
        {
            local_6 = this.GetGiftItems()[6];
        }
        else
        {
            local_6 = TEUIModelRef<FVM_StigmataItem>();
        }
        this.SetGiftSlot6(local_6);
        if (this.GetGiftItems().IsValidIndex(7))
        {
            local_4 = this.GetGiftItems()[7];
        }
        else
        {
            local_4 = local_6;
        }
        this.SetGiftSlot7(local_4);
        return;
    }
    void RefreshHintTexts()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RefreshUnlockPercent()
    {
        int local_2 = this.GetGiftItems().Num();
        int local_3 = 0;
        float32 local_4 = 0.0f;
        if (local_2 > 0)
        {
            int local_7 = 0;
            for (auto& local_22 : this.GetGiftItems())
            {
                local_22;
                if (GetIsUnlocked())
                {
                    ++local_7;
                }
            }
            local_4 = local_7 / local_2;
            local_3 = FMath::FloorToInt(local_4 * 100.0f);
        }
        this.SetUnlockPercentText(FText::Format(NSLOCTEXT("UnlockPercentFmt", "зїјз—•е®Њж•ґеє¦пјљ{0}%"), local_3));
        this.SetUnlockPercent((FMath::TruncToFloat(local_4 * 100.0f)) / 100.0f);
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
    const TArray<TEUIModelRef<FVM_StigmataItem>> GetGiftItems() const property
    {
        const TArray<TEUIModelRef<FVM_StigmataItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_StigmataItem>> GetModify_GiftItems() property
    {
        TArray<TEUIModelRef<FVM_StigmataItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetGiftItems(const TArray<TEUIModelRef<FVM_StigmataItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_GiftItems = __Value;
        return;
    }
    const FText GetNextBreakthroughName() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_NextBreakthroughName() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetNextBreakthroughName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_NextBreakthroughName = __Value;
        return;
    }
    const FText GetNextBreakthroughLevel() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_NextBreakthroughLevel() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetNextBreakthroughLevel(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_NextBreakthroughLevel = __Value;
        return;
    }
    TEUIModelRef<FVM_StigmataItem> GetGiftSlot0() const property
    {
        this.TrackPropertyRead(4);
        return this.m_GiftSlot0;
    }
    void SetGiftSlot0(const TEUIModelRef<FVM_StigmataItem> &inout __Value) property
    {
        TEUIModelRef<FVM_StigmataItem> local_2;
        local_2 = this.m_GiftSlot0;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_GiftSlot0 = __Value;
        return;
    }
    TEUIModelRef<FVM_StigmataItem> GetGiftSlot1() const property
    {
        this.TrackPropertyRead(5);
        return this.m_GiftSlot1;
    }
    void SetGiftSlot1(const TEUIModelRef<FVM_StigmataItem> &inout __Value) property
    {
        TEUIModelRef<FVM_StigmataItem> local_2;
        local_2 = this.m_GiftSlot1;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_GiftSlot1 = __Value;
        return;
    }
    TEUIModelRef<FVM_StigmataItem> GetGiftSlot2() const property
    {
        this.TrackPropertyRead(6);
        return this.m_GiftSlot2;
    }
    void SetGiftSlot2(const TEUIModelRef<FVM_StigmataItem> &inout __Value) property
    {
        TEUIModelRef<FVM_StigmataItem> local_2;
        local_2 = this.m_GiftSlot2;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_GiftSlot2 = __Value;
        return;
    }
    TEUIModelRef<FVM_StigmataItem> GetGiftSlot3() const property
    {
        this.TrackPropertyRead(7);
        return this.m_GiftSlot3;
    }
    void SetGiftSlot3(const TEUIModelRef<FVM_StigmataItem> &inout __Value) property
    {
        TEUIModelRef<FVM_StigmataItem> local_2;
        local_2 = this.m_GiftSlot3;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_GiftSlot3 = __Value;
        return;
    }
    TEUIModelRef<FVM_StigmataItem> GetGiftSlot4() const property
    {
        this.TrackPropertyRead(8);
        return this.m_GiftSlot4;
    }
    void SetGiftSlot4(const TEUIModelRef<FVM_StigmataItem> &inout __Value) property
    {
        TEUIModelRef<FVM_StigmataItem> local_2;
        local_2 = this.m_GiftSlot4;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_GiftSlot4 = __Value;
        return;
    }
    TEUIModelRef<FVM_StigmataItem> GetGiftSlot5() const property
    {
        this.TrackPropertyRead(9);
        return this.m_GiftSlot5;
    }
    void SetGiftSlot5(const TEUIModelRef<FVM_StigmataItem> &inout __Value) property
    {
        TEUIModelRef<FVM_StigmataItem> local_2;
        local_2 = this.m_GiftSlot5;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_GiftSlot5 = __Value;
        return;
    }
    TEUIModelRef<FVM_StigmataItem> GetGiftSlot6() const property
    {
        this.TrackPropertyRead(10);
        return this.m_GiftSlot6;
    }
    void SetGiftSlot6(const TEUIModelRef<FVM_StigmataItem> &inout __Value) property
    {
        TEUIModelRef<FVM_StigmataItem> local_2;
        local_2 = this.m_GiftSlot6;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_GiftSlot6 = __Value;
        return;
    }
    TEUIModelRef<FVM_StigmataItem> GetGiftSlot7() const property
    {
        this.TrackPropertyRead(11);
        return this.m_GiftSlot7;
    }
    void SetGiftSlot7(const TEUIModelRef<FVM_StigmataItem> &inout __Value) property
    {
        TEUIModelRef<FVM_StigmataItem> local_2;
        local_2 = this.m_GiftSlot7;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_GiftSlot7 = __Value;
        return;
    }
    FText GetUnlockPercentText() const property
    {
        FText __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FText GetModify_UnlockPercentText() property
    {
        FText __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetUnlockPercentText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_UnlockPercentText = __Value;
        return;
    }
    float32 GetUnlockPercent() const property
    {
        float32 __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    float32 GetModify_UnlockPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetUnlockPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_UnlockPercent = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_StigmataGifts
{
    UPROPERTY()
    TEUIModelRef<FVM_StigmataGifts> Self;

    __GeneratedProperties_FVM_StigmataGifts()
    {
        return;
    }
}

namespace FVM_StigmataGifts
{
FVM_StigmataGifts& Create(const UObject ContextObject)
{
    return FVM_StigmataGifts::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_StigmataGifts CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_StigmataGifts __r;
    TEUIModelRef<FVM_StigmataGifts> local_6 = TEUIModelRef<FVM_StigmataGifts>(EUIInternal::MakeModelWithManager(Manager, FVM_StigmataGifts::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "NextBreakthroughName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NextBreakthroughLevel";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GiftSlot0";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GiftSlot1";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GiftSlot2";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GiftSlot3";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GiftSlot4";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GiftSlot5";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GiftSlot6";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GiftSlot7";
    local_14.TypeName = "TEUIModelRef<FVM_StigmataItem>";
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
    local_14.TypeName = "TEUIModelRef<FVM_StigmataGifts>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_StigmataGifts;
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
    return FVM_StigmataGifts;
}
void __OnLevelRefresh(FVM_StigmataGifts &inout Model, const FMsg_LocalPlayerLevelRefresh &inout Message)
{
    Model.OnLevelRefresh(Message);
    return;
}
void __OnStigmataDataRefresh(FVM_StigmataGifts &inout Model, const FMsg_StigmataDataRefresh &inout Message)
{
    Model.OnStigmataDataRefresh(Message);
    return;
}
FText __UIGetter_NextBreakthroughName(const FVM_StigmataGifts &inout Model)
{
    return Model.GetNextBreakthroughName();
}
FText __UIGetter_NextBreakthroughLevel(const FVM_StigmataGifts &inout Model)
{
    return Model.GetNextBreakthroughLevel();
}
TEUIModelRef<FVM_StigmataItem> __UIGetter_GiftSlot0(const FVM_StigmataGifts &inout Model)
{
    return Model.GetGiftSlot0();
}
TEUIModelRef<FVM_StigmataItem> __UIGetter_GiftSlot1(const FVM_StigmataGifts &inout Model)
{
    return Model.GetGiftSlot1();
}
TEUIModelRef<FVM_StigmataItem> __UIGetter_GiftSlot2(const FVM_StigmataGifts &inout Model)
{
    return Model.GetGiftSlot2();
}
TEUIModelRef<FVM_StigmataItem> __UIGetter_GiftSlot3(const FVM_StigmataGifts &inout Model)
{
    return Model.GetGiftSlot3();
}
TEUIModelRef<FVM_StigmataItem> __UIGetter_GiftSlot4(const FVM_StigmataGifts &inout Model)
{
    return Model.GetGiftSlot4();
}
TEUIModelRef<FVM_StigmataItem> __UIGetter_GiftSlot5(const FVM_StigmataGifts &inout Model)
{
    return Model.GetGiftSlot5();
}
TEUIModelRef<FVM_StigmataItem> __UIGetter_GiftSlot6(const FVM_StigmataGifts &inout Model)
{
    return Model.GetGiftSlot6();
}
TEUIModelRef<FVM_StigmataItem> __UIGetter_GiftSlot7(const FVM_StigmataGifts &inout Model)
{
    return Model.GetGiftSlot7();
}
FText __UIGetter_UnlockPercentText(const FVM_StigmataGifts &inout Model)
{
    return Model.GetUnlockPercentText();
}
float32 __UIGetter_UnlockPercent(const FVM_StigmataGifts &inout Model)
{
    return Model.GetUnlockPercent();
}
TEUIModelRef<FVM_StigmataGifts> __UIGetter_Self(const FVM_StigmataGifts &inout Model)
{
    return TEUIModelRef<FVM_StigmataGifts>(Model);
}
int __IndexOf_PlayerLevel()
{
    return 0;
}
int __IndexOf_GiftItems()
{
    return 1;
}
int __IndexOf_NextBreakthroughName()
{
    return 2;
}
int __IndexOf_NextBreakthroughLevel()
{
    return 3;
}
int __IndexOf_GiftSlot0()
{
    return 4;
}
int __IndexOf_GiftSlot1()
{
    return 5;
}
int __IndexOf_GiftSlot2()
{
    return 6;
}
int __IndexOf_GiftSlot3()
{
    return 7;
}
int __IndexOf_GiftSlot4()
{
    return 8;
}
int __IndexOf_GiftSlot5()
{
    return 9;
}
int __IndexOf_GiftSlot6()
{
    return 10;
}
int __IndexOf_GiftSlot7()
{
    return 11;
}
int __IndexOf_UnlockPercentText()
{
    return 12;
}
int __IndexOf_UnlockPercent()
{
    return 13;
}
}
namespace __GeneratedProperties_FVM_StigmataGifts
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
