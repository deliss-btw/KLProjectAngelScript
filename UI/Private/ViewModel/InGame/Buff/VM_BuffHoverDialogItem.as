
namespace FVM_BuffHoverDialogItem
{
    const int ModelId = 0;

}
struct FBuffHoverDialogItemData
{
    UPROPERTY()
    FBuffEntityData BuffEntityData;
    UPROPERTY()
    FFPTime OverrideEndTime;
    UPROPERTY()
    TArray<uint> AppendModifiersDataIDs;

    FBuffHoverDialogItemData()
    {
        return;
    }
}

struct FVM_BuffHoverDialogItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FBuffEntityData m_BuffEntityData;
    UPROPERTY()
    FFPTime m_OverrideEndTime;
    UPROPERTY()
    TArray<uint> m_AppendModifiersDataIDs;
    UPROPERTY()
    FMW_CounterDown m_RemainingCounterDown;
    UPROPERTY()
    TArray<FEUIModelContainer> m_BuffAttrs;
    UPROPERTY()
    FEUIModelRef m_VM_StackCount1;
    UPROPERTY()
    FEUIModelRef m_VM_StackCount2;
    UPROPERTY()
    FEUIModelRef m_VM_StackCount3;
    UPROPERTY()
    FEUIModelRef m_VM_StackCount4;
    UPROPERTY()
    FEUIModelRef m_VM_StackCount5;
    UPROPERTY()
    FEUIModelRef m_VM_StackCount6;
    UPROPERTY()
    FEUIModelRef m_VM_StackCount7;
    UPROPERTY()
    FEUIModelRef m_VM_StackCount8;
    UPROPERTY()
    FEUIModelRef m_VM_StackCount9;
    UPROPERTY()
    FEUIModelRef m_VM_StackCount10;

    FVM_BuffHoverDialogItem()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BuffHoverDialogItem' by default constructor.");
        return;
    }
    FVM_BuffHoverDialogItem(const FVM_BuffHoverDialogItem &inout Other)
    {
        this.m_BuffEntityData = Other.m_BuffEntityData;
        this.m_OverrideEndTime = Other.m_OverrideEndTime;
        this.m_AppendModifiersDataIDs = Other.m_AppendModifiersDataIDs;
        this.m_RemainingCounterDown = Other.m_RemainingCounterDown;
        this.m_BuffAttrs = Other.m_BuffAttrs;
        this.m_VM_StackCount1 = Other.m_VM_StackCount1;
        this.m_VM_StackCount2 = Other.m_VM_StackCount2;
        this.m_VM_StackCount3 = Other.m_VM_StackCount3;
        this.m_VM_StackCount4 = Other.m_VM_StackCount4;
        this.m_VM_StackCount5 = Other.m_VM_StackCount5;
        this.m_VM_StackCount6 = Other.m_VM_StackCount6;
        this.m_VM_StackCount7 = Other.m_VM_StackCount7;
        this.m_VM_StackCount8 = Other.m_VM_StackCount8;
        this.m_VM_StackCount9 = Other.m_VM_StackCount9;
        this.m_VM_StackCount10 = Other.m_VM_StackCount10;
        return;
    }
    FVM_BuffHoverDialogItem(const FBuffEntityData &inout InBuffEntityData, const FFPTime &inout InOverrideEndTime, const TArray<uint> &inout InAppendModifiersDataIDs)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetBuffEntityData(InBuffEntityData);
        this.SetOverrideEndTime(InOverrideEndTime);
        this.SetAppendModifiersDataIDs(InAppendModifiersDataIDs);
        return;
    }
    FVM_BuffHoverDialogItem& opAssign(const FVM_BuffHoverDialogItem &inout Other)
    {
        this.m_BuffEntityData = Other.m_BuffEntityData;
        this.m_OverrideEndTime = Other.m_OverrideEndTime;
        this.m_AppendModifiersDataIDs = Other.m_AppendModifiersDataIDs;
        this.m_RemainingCounterDown = Other.m_RemainingCounterDown;
        this.m_BuffAttrs = Other.m_BuffAttrs;
        this.m_VM_StackCount1 = Other.m_VM_StackCount1;
        this.m_VM_StackCount2 = Other.m_VM_StackCount2;
        this.m_VM_StackCount3 = Other.m_VM_StackCount3;
        this.m_VM_StackCount4 = Other.m_VM_StackCount4;
        this.m_VM_StackCount5 = Other.m_VM_StackCount5;
        this.m_VM_StackCount6 = Other.m_VM_StackCount6;
        this.m_VM_StackCount7 = Other.m_VM_StackCount7;
        this.m_VM_StackCount8 = Other.m_VM_StackCount8;
        this.m_VM_StackCount9 = Other.m_VM_StackCount9;
        return Other.m_VM_StackCount10;
    }
    FBuffConfigRef GetBuffConfig() const
    {
        return this.GetBuffEntityData().ConfigRef;
    }
    FText GetBuffName() const
    {
        if (this.GetBuffConfig())
        {
            TDataObjectPtr<FBuffConfig> local_74;
            if (FDataObjectPtr(local_74.opArrow().PresentationConfig))
            {
                TDataObjectPtr<FBuffPresentationConfig> local_122;
                return local_122.opArrow().BuffName;
            }
        }
        return FText();
    }
    FSoftBrush GetBuffIcon() const
    {
        if (this.GetBuffConfig())
        {
            TDataObjectPtr<FBuffConfig> local_74;
            if (FDataObjectPtr(local_74.opArrow().PresentationConfig))
            {
                TDataObjectPtr<FBuffPresentationConfig> local_122;
                return local_122.opArrow().IconBrush;
            }
        }
        return FSoftBrush();
    }
    int GetRemainingTimeIsInfinite() const
    {
        if (this.GetBuffConfig())
        {
            TDataObjectPtr<FBuffConfig> local_74;
            if (local_74.opArrow().BuffDuration <= 0.0f)
            {
                return 1;
            }
            return 0;
        }
        return 1;
    }
    void RefreshRemainingCounterDown()
    {
        FFPTime local_2;
        if (this.GetOverrideEndTime().ToSeconds() > 0.0)
        {
            local_2 = this.GetOverrideEndTime();
        }
        else
        {
            FECSEntity local_14 = FECSEntity(this.GetBuffEntityData().BuffEntityId);
            Get local_18;
            const FC_BuffInstance& local_10 = local_18.opCall();
            if (local_10)
            {
                local_2 = local_10.GetEndTime();
            }
            else
            {
                return;
            }
        }
        FFPTime local_20 = (local_2 - this.GetContext().Time);
        this.GetModify_RemainingCounterDown().SetRemainedTimeWithPrecision(FFPTime(FMath::Max(local_20.ToSeconds(), 0.0)), EMWCounterDownPrecision(0));
        return;
    }
    FTimespan GetRemainingTime() const
    {
        return FTimespan::FromSeconds(this.GetRemainingCounterDown().GetRemainedTime().ToSeconds());
    }
    bool ShowStack() const
    {
        if (this.GetBuffConfig())
        {
            TDataObjectPtr<FBuffConfig> local_74;
            return (local_74.opArrow().GetEffectiveMaxBuffCount() > 1);
        }
        return false;
    }
    int GetMaxStack() const
    {
        if (this.GetBuffConfig())
        {
            TDataObjectPtr<FBuffConfig> local_74;
            return int(local_74.opArrow().MaxBuffCount);
        }
        return 1;
    }
    int GetCurStack() const
    {
        FECSEntity local_6 = FECSEntity(this.GetBuffEntityData().BuffEntityId);
        Get local_10;
        const FC_BuffInstance& local_2 = local_10.opCall();
        if (local_2)
        {
            return local_2.GetStackCount();
        }
        return 0;
    }
    bool GetStack1Show() const
    {
        return (this.GetMaxStack() >= 2);
    }
    bool GetStack2Show() const
    {
        return (this.GetMaxStack() >= 2);
    }
    bool GetStack3Show() const
    {
        return (this.GetMaxStack() >= 3);
    }
    bool GetStack4Show() const
    {
        return (this.GetMaxStack() >= 4);
    }
    bool GetStack5Show() const
    {
        return (this.GetMaxStack() >= 5);
    }
    bool GetStack6Show() const
    {
        return (this.GetMaxStack() >= 6);
    }
    bool GetStack7Show() const
    {
        return (this.GetMaxStack() >= 7);
    }
    bool GetStack8Show() const
    {
        return (this.GetMaxStack() >= 8);
    }
    bool GetStack9Show() const
    {
        return (this.GetMaxStack() >= 9);
    }
    bool GetStack10Show() const
    {
        return (this.GetMaxStack() >= 10);
    }
    bool GetStack6Reached() const
    {
        return (this.GetCurStack() >= 6);
    }
    bool GetStack7Reached() const
    {
        return (this.GetCurStack() >= 7);
    }
    bool GetStack8Reached() const
    {
        return (this.GetCurStack() >= 8);
    }
    bool GetStack9Reached() const
    {
        return (this.GetCurStack() >= 9);
    }
    bool GetStack10Reached() const
    {
        return (this.GetCurStack() >= 10);
    }
    void UpdateContent()
    {
        int local_38 = 0;
        const UAttributeSettingsSettings local_176;
        FText local_268;
        int local_308 = 0;
        Has local_34;
        bool local_29 = !(FECSEntity(this.GetBuffEntityData().BuffEntityId).IsValid()) || !(local_34.opCall());
        if (local_29)
        {
            return;
        }
        int local_67 = local_38.GetStackCount();
        TDataObjectPtr<FBuffConfig> local_66 = TDataObjectPtr<FBuffConfig>(this.GetBuffEntityData().ConfigRef);
        TArray<TDataObjectPtr<FGameplayModifierConfig>> local_80;
        for (auto local_93 : this.GetAppendModifiersDataIDs())
        {
            TDataObjectPtr<FGameplayModifierConfig> local_118 = ::FGameplayModifier::GetByDataId(local_93);
            local_29 = !((local_118 == nullptr));
            if (local_29)
            {
                local_80.Add(local_118);
            }
        }
        TArray<FBuffModifierAttributeDescriptionInfos> local_76 = FGameplayModifierUtils::GetModifierAttributeDescriptionBGameplayModifierConfig(local_80);
        TArray<FBuffModifierAttributeDescriptionInfos> local_72;
        local_72.Append(local_76);
        FDataObjectPtr local_170 = FDataObjectPtr(TDataObjectPtr<FBuffConfig>(this.GetBuffEntityData().ConfigRef).opArrow().PresentationConfig);
        TArray<FBuffHintDescParamItem> local_174;
        GetGameplaySettings<UAttributeSettingsSettings> local_178;
        local_176 = local_178;
        TDataObjectPtr<FBuffPresentationConfig> local_204 = TDataObjectPtr<FBuffPresentationConfig>(local_170);
        local_29 = !local_29;
        if (local_29)
        {
            FBuffHintDescParamItem local_256;
            int local_67_2 = local_38.GetStackCount();
            TDataObjectPtr<FBuffConfig> local_66_2 = TDataObjectPtr<FBuffConfig>(this.GetBuffEntityData().ConfigRef);
            local_268 = FText::FromString(FString());
            local_256.Desc = local_268;
            local_174.Add(local_256);
        }
        for (auto& local_282 : local_72)
        {
            if (local_282.bUseDefaultDescription)
            {
                if (local_176.GetAttributeConfig(local_282.Attribute))
                {
                    FBuffHintDescParamItem local_256;
                    TDataObjectPtr<FAttributeConfig> local_306 = local_176.GetAttributeConfig(local_282.Attribute);
                    if (UICommonUtil::CVar_UI_UseAttributePresentation.GetBool())
                    {
                        local_256.Icon = local_308.Presentation.GetIcon();
                    }
                    else
                    {
                        local_256.Icon = local_308.AttributeIcon;
                    }
                    TArray<FTextArgument> local_356;
                    FDataObjectPtr local_386 = local_176.GetAttributeConfig(local_282.Attribute).opImplConv();
                    Make local_362;
                    local_356.Add(local_362.opImplConv());
                    local_356.Add(FTextArgument(FInstancedStruct::Make(local_282)));
                    local_256.Desc = local_268;
                    if (local_256.Desc.IsEmptyOrWhitespace())
                    {
                        continue;
                    }
                    local_174.Add(local_256);
                }
            }
        }
        this.GetModify_BuffAttrs().Empty(0);
        for (auto& local_414 : local_174)
        {
            local_414;
            Make local_482;
            this.GetModify_BuffAttrs().Add(local_482.opImplConv());
        }
        int local_67_3 = this.GetCurStack();
        int local_497 = this.GetMaxStack();
        this.SetVM_StackCount1(FEUIModelRef());
        int local_67_4 = this.GetCurStack();
        int local_497_2 = this.GetMaxStack();
        this.SetVM_StackCount2(FEUIModelRef());
        int local_498 = this.GetCurStack();
        int local_67_5 = this.GetMaxStack();
        this.SetVM_StackCount3(FEUIModelRef());
        int local_497_3 = this.GetCurStack();
        int local_498_2 = this.GetMaxStack();
        this.SetVM_StackCount4(FEUIModelRef());
        int local_67_6 = this.GetCurStack();
        int local_497_4 = this.GetMaxStack();
        this.SetVM_StackCount5(FEUIModelRef());
        int local_498_3 = this.GetCurStack();
        int local_67_7 = this.GetMaxStack();
        this.SetVM_StackCount6(FEUIModelRef());
        int local_497_5 = this.GetCurStack();
        int local_498_4 = this.GetMaxStack();
        this.SetVM_StackCount7(FEUIModelRef());
        int local_67_8 = this.GetCurStack();
        int local_497_6 = this.GetMaxStack();
        this.SetVM_StackCount8(FEUIModelRef());
        int local_498_5 = this.GetCurStack();
        int local_67_9 = this.GetMaxStack();
        this.SetVM_StackCount9(FEUIModelRef());
        int local_497_7 = this.GetCurStack();
        int local_498_6 = this.GetMaxStack();
        this.SetVM_StackCount10(FEUIModelRef());
        return;
    }
    void OnPlayerMetaBuffChanged(const FC_PlayerMetaBuffList &inout PlayerMetaBuffList)
    {
        this.UpdateContent();
        return;
    }
    void PostConstruct()
    {
        this.UpdateContent();
        return;
    }
    const FBuffEntityData GetBuffEntityData() const property
    {
        const FBuffEntityData __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FBuffEntityData GetModify_BuffEntityData() property
    {
        FBuffEntityData __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetBuffEntityData(const FBuffEntityData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_BuffEntityData = __Value;
        return;
    }
    const FFPTime GetOverrideEndTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FFPTime GetModify_OverrideEndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetOverrideEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_OverrideEndTime = __Value;
        return;
    }
    const TArray<uint> GetAppendModifiersDataIDs() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<uint> GetModify_AppendModifiersDataIDs() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAppendModifiersDataIDs(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AppendModifiersDataIDs = __Value;
        return;
    }
    const FMW_CounterDown GetRemainingCounterDown() const property
    {
        const FMW_CounterDown __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FMW_CounterDown GetModify_RemainingCounterDown() property
    {
        FMW_CounterDown __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetRemainingCounterDown(const FMW_CounterDown &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RemainingCounterDown = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetBuffAttrs() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_BuffAttrs() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetBuffAttrs(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_BuffAttrs = __Value;
        return;
    }
    const FEUIModelRef GetVM_StackCount1() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FEUIModelRef GetModify_VM_StackCount1() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetVM_StackCount1(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_VM_StackCount1 = __Value;
        return;
    }
    const FEUIModelRef GetVM_StackCount2() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FEUIModelRef GetModify_VM_StackCount2() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetVM_StackCount2(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_VM_StackCount2 = __Value;
        return;
    }
    const FEUIModelRef GetVM_StackCount3() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FEUIModelRef GetModify_VM_StackCount3() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetVM_StackCount3(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_VM_StackCount3 = __Value;
        return;
    }
    const FEUIModelRef GetVM_StackCount4() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FEUIModelRef GetModify_VM_StackCount4() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetVM_StackCount4(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_VM_StackCount4 = __Value;
        return;
    }
    const FEUIModelRef GetVM_StackCount5() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FEUIModelRef GetModify_VM_StackCount5() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetVM_StackCount5(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_VM_StackCount5 = __Value;
        return;
    }
    const FEUIModelRef GetVM_StackCount6() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FEUIModelRef GetModify_VM_StackCount6() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetVM_StackCount6(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_VM_StackCount6 = __Value;
        return;
    }
    const FEUIModelRef GetVM_StackCount7() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FEUIModelRef GetModify_VM_StackCount7() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetVM_StackCount7(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_VM_StackCount7 = __Value;
        return;
    }
    const FEUIModelRef GetVM_StackCount8() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FEUIModelRef GetModify_VM_StackCount8() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetVM_StackCount8(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_VM_StackCount8 = __Value;
        return;
    }
    const FEUIModelRef GetVM_StackCount9() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FEUIModelRef GetModify_VM_StackCount9() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetVM_StackCount9(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_VM_StackCount9 = __Value;
        return;
    }
    const FEUIModelRef GetVM_StackCount10() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FEUIModelRef GetModify_VM_StackCount10() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetVM_StackCount10(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_VM_StackCount10 = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BuffHoverDialogItem
{
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    FText BuffName;
    UPROPERTY()
    FSoftBrush BuffIcon;
    UPROPERTY()
    int RemainingTimeIsInfinite;
    UPROPERTY()
    FTimespan RemainingTime;
    UPROPERTY()
    bool ShowStack;
    UPROPERTY()
    int MaxStack;
    UPROPERTY()
    int CurStack;
    UPROPERTY()
    bool Stack1Show;
    UPROPERTY()
    bool Stack2Show;
    UPROPERTY()
    bool Stack3Show;
    UPROPERTY()
    bool Stack4Show;
    UPROPERTY()
    bool Stack5Show;
    UPROPERTY()
    bool Stack6Show;
    UPROPERTY()
    bool Stack7Show;
    UPROPERTY()
    bool Stack8Show;
    UPROPERTY()
    bool Stack9Show;
    UPROPERTY()
    bool Stack10Show;
    UPROPERTY()
    bool Stack6Reached;
    UPROPERTY()
    bool Stack7Reached;
    UPROPERTY()
    bool Stack8Reached;
    UPROPERTY()
    bool Stack9Reached;
    UPROPERTY()
    bool Stack10Reached;
    UPROPERTY()
    TEUIModelRef<FVM_BuffHoverDialogItem> Self;


}

namespace FVM_BuffHoverDialogItem
{
FVM_BuffHoverDialogItem& Create(const UObject ContextObject, const FBuffEntityData &inout BuffEntityData, const FFPTime &inout OverrideEndTime, const TArray<uint> &inout AppendModifiersDataIDs)
{
    return FVM_BuffHoverDialogItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), BuffEntityData, OverrideEndTime, AppendModifiersDataIDs);
}
FVM_BuffHoverDialogItem CreateByManager(const UEUIManagerSubsystem Manager, const FBuffEntityData &inout BuffEntityData, const FFPTime &inout OverrideEndTime, const TArray<uint> &inout AppendModifiersDataIDs)
{
    FVM_BuffHoverDialogItem __r;
    TEUIModelRef<FVM_BuffHoverDialogItem> local_6 = TEUIModelRef<FVM_BuffHoverDialogItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BuffHoverDialogItem::ModelId, 0, BuffEntityData, OverrideEndTime, AppendModifiersDataIDs));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BuffAttrs";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_StackCount1";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_StackCount2";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_StackCount3";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_StackCount4";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_StackCount5";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_StackCount6";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_StackCount7";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_StackCount8";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_StackCount9";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_StackCount10";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BuffConfig";
    local_14.TypeName = "FBuffConfigRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BuffName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BuffIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RemainingTimeIsInfinite";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RemainingTime";
    local_14.TypeName = "FTimespan";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowStack";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MaxStack";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurStack";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack1Show";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack2Show";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack3Show";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack4Show";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack5Show";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack6Show";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack7Show";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack8Show";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack9Show";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack10Show";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack6Reached";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack7Reached";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack8Reached";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack9Reached";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Stack10Reached";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BuffHoverDialogItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BuffHoverDialogItem;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("RemainingCounterDown");
    int local_2_2 = FVM_BuffHoverDialogItem::__IndexOf_RemainingCounterDown();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "RefreshRemainingCounterDown";
    Result.EffectFunctions.Add(local_26);
    FEUIModelMonitorDefine local_36;
    local_36.FunctionName = "__OnPlayerMetaBuffChanged";
    local_36.ComponentType = FC_PlayerMetaBuffList;
    Result.MonitorFunctions.Add(local_36);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BuffHoverDialogItem;
}
void __OnPlayerMetaBuffChanged(FVM_BuffHoverDialogItem &inout Model, const FECSEntity &inout Entity, const FC_PlayerMetaBuffList &inout Component)
{
    Model.OnPlayerMetaBuffChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<FEUIModelContainer> __UIGetter_BuffAttrs(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetBuffAttrs();
}
FEUIModelRef __UIGetter_VM_StackCount1(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetVM_StackCount1();
}
FEUIModelRef __UIGetter_VM_StackCount2(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetVM_StackCount2();
}
FEUIModelRef __UIGetter_VM_StackCount3(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetVM_StackCount3();
}
FEUIModelRef __UIGetter_VM_StackCount4(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetVM_StackCount4();
}
FEUIModelRef __UIGetter_VM_StackCount5(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetVM_StackCount5();
}
FEUIModelRef __UIGetter_VM_StackCount6(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetVM_StackCount6();
}
FEUIModelRef __UIGetter_VM_StackCount7(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetVM_StackCount7();
}
FEUIModelRef __UIGetter_VM_StackCount8(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetVM_StackCount8();
}
FEUIModelRef __UIGetter_VM_StackCount9(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetVM_StackCount9();
}
FEUIModelRef __UIGetter_VM_StackCount10(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetVM_StackCount10();
}
FBuffConfigRef __UIGetter_BuffConfig(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetBuffConfig();
}
FText __UIGetter_BuffName(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetBuffName();
}
FSoftBrush __UIGetter_BuffIcon(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetBuffIcon();
}
int __UIGetter_RemainingTimeIsInfinite(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetRemainingTimeIsInfinite();
}
FTimespan __UIGetter_RemainingTime(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetRemainingTime();
}
bool __UIGetter_ShowStack(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.ShowStack();
}
int __UIGetter_MaxStack(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetMaxStack();
}
int __UIGetter_CurStack(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetCurStack();
}
bool __UIGetter_Stack1Show(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack1Show();
}
bool __UIGetter_Stack2Show(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack2Show();
}
bool __UIGetter_Stack3Show(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack3Show();
}
bool __UIGetter_Stack4Show(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack4Show();
}
bool __UIGetter_Stack5Show(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack5Show();
}
bool __UIGetter_Stack6Show(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack6Show();
}
bool __UIGetter_Stack7Show(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack7Show();
}
bool __UIGetter_Stack8Show(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack8Show();
}
bool __UIGetter_Stack9Show(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack9Show();
}
bool __UIGetter_Stack10Show(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack10Show();
}
bool __UIGetter_Stack6Reached(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack6Reached();
}
bool __UIGetter_Stack7Reached(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack7Reached();
}
bool __UIGetter_Stack8Reached(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack8Reached();
}
bool __UIGetter_Stack9Reached(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack9Reached();
}
bool __UIGetter_Stack10Reached(const FVM_BuffHoverDialogItem &inout Model)
{
    return Model.GetStack10Reached();
}
TEUIModelRef<FVM_BuffHoverDialogItem> __UIGetter_Self(const FVM_BuffHoverDialogItem &inout Model)
{
    return TEUIModelRef<FVM_BuffHoverDialogItem>(Model);
}
int __IndexOf_BuffEntityData()
{
    return 0;
}
int __IndexOf_OverrideEndTime()
{
    return 1;
}
int __IndexOf_AppendModifiersDataIDs()
{
    return 2;
}
int __IndexOf_RemainingCounterDown()
{
    return 3;
}
int __IndexOf_BuffAttrs()
{
    return 4;
}
int __IndexOf_VM_StackCount1()
{
    return 5;
}
int __IndexOf_VM_StackCount2()
{
    return 6;
}
int __IndexOf_VM_StackCount3()
{
    return 7;
}
int __IndexOf_VM_StackCount4()
{
    return 8;
}
int __IndexOf_VM_StackCount5()
{
    return 9;
}
int __IndexOf_VM_StackCount6()
{
    return 10;
}
int __IndexOf_VM_StackCount7()
{
    return 11;
}
int __IndexOf_VM_StackCount8()
{
    return 12;
}
int __IndexOf_VM_StackCount9()
{
    return 13;
}
int __IndexOf_VM_StackCount10()
{
    return 14;
}
}
namespace __GeneratedProperties_FVM_BuffHoverDialogItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
