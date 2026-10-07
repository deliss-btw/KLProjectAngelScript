
const FConsoleVariable CVar_Buff_DebugBuffDataIcon = FConsoleVariable();
namespace FVM_BuffIcon
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ShowHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HideHover = FEUIModelCallbackSignature();

}
struct FBuffModelData
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FBuffEntityData BuffEntityData;
    UPROPERTY()
    TArray<FBuffEntityData> SubBuffEntityData;

    FBuffModelData()
    {
        return;
    }
}

struct FVM_BuffIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    FBuffEntityData m_BuffEntityData;
    UPROPERTY()
    TArray<FBuffEntityData> m_SubBuffEntityData;
    UPROPERTY()
    bool m_bIsPlaceholder;
    UPROPERTY()
    int m_BuffStackCount;
    UPROPERTY()
    UTexture2D m_BuffImage;
    UPROPERTY()
    TEUIModelRef<FVM_CommonAnnularProgressBar> m_IconProgressBar;
    UPROPERTY()
    bool m_StackVisible;
    UPROPERTY()
    FCommonHoverHandle m_HoverHandle;
    UPROPERTY()
    TEUIModelRef<FVM_BuffHoverDialog> m_HoverModel;
    UPROPERTY()
    FFPTime m_EndTime;
    UPROPERTY()
    FFPTime m_DurationTime;
    UPROPERTY()
    FMW_TimeProgress m_BuffTimeProgress;
    UPROPERTY()
    int m_BuffIconTypeSwitch;
    UPROPERTY()
    int m_ResidentBuffIconTypeSwitch;
    UPROPERTY()
    bool m_bMeatBuff;
    UPROPERTY()
    TArray<uint> m_MeatBuffModifiersDataIDs;
    UPROPERTY()
    bool m_bNearEnd;
    UPROPERTY()
    EBuffGoodOrBad m_BuffGoodOrBad;
    UPROPERTY()
    FECSEntity m_BuffEntity;
    UPROPERTY()
    bool m_bCircleProgress;

    FVM_BuffIcon()
    {
        this.m_BuffStackCount = 0;
        this.m_BuffImage = nullptr;
        this.m_StackVisible = false;
        this.m_BuffIconTypeSwitch = 0;
        this.m_ResidentBuffIconTypeSwitch = 0;
        this.m_bMeatBuff = false;
        this.m_bNearEnd = false;
        this.m_bIsPlaceholder = false;
        this.m_BuffGoodOrBad = EBuffGoodOrBad(2);
        this.m_BuffEntity = ENTITY_NULL;
        this.m_bCircleProgress = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BuffIcon' by default constructor.");
        return;
    }
    FVM_BuffIcon(const FVM_BuffIcon &inout Other)
    {
        this.m_BuffStackCount = 0;
        this.m_BuffImage = nullptr;
        this.m_StackVisible = false;
        this.m_BuffIconTypeSwitch = 0;
        this.m_ResidentBuffIconTypeSwitch = 0;
        this.m_bMeatBuff = false;
        this.m_bNearEnd = false;
        this.m_bIsPlaceholder = false;
        this.m_BuffGoodOrBad = EBuffGoodOrBad(2);
        this.m_BuffEntity = ENTITY_NULL;
        this.m_bCircleProgress = false;
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_BuffEntityData = Other.m_BuffEntityData;
        this.m_SubBuffEntityData = Other.m_SubBuffEntityData;
        this.m_bIsPlaceholder = Other.m_bIsPlaceholder;
        this.m_BuffStackCount = int(Other.m_BuffStackCount);
        this.m_BuffImage = Other.m_BuffImage;
        this.m_IconProgressBar = Other.m_IconProgressBar;
        this.m_StackVisible = Other.m_StackVisible;
        this.m_HoverModel = Other.m_HoverModel;
        this.m_EndTime = Other.m_EndTime;
        this.m_DurationTime = Other.m_DurationTime;
        this.m_BuffTimeProgress = Other.m_BuffTimeProgress;
        this.m_BuffIconTypeSwitch = int(Other.m_BuffIconTypeSwitch);
        this.m_ResidentBuffIconTypeSwitch = int(Other.m_ResidentBuffIconTypeSwitch);
        this.m_bMeatBuff = Other.m_bMeatBuff;
        this.m_MeatBuffModifiersDataIDs = Other.m_MeatBuffModifiersDataIDs;
        this.m_bNearEnd = Other.m_bNearEnd;
        this.m_BuffGoodOrBad = Other.m_BuffGoodOrBad;
        this.m_BuffEntity = Other.m_BuffEntity;
        this.m_bCircleProgress = Other.m_bCircleProgress;
        return;
    }
    FVM_BuffIcon(const FECSEntity &inout InTargetEntity, const FBuffEntityData &inout InBuffEntityData, const TArray<FBuffEntityData> &inout InSubBuffEntityData)
    {
        this.m_BuffStackCount = 0;
        this.m_BuffImage = nullptr;
        this.m_StackVisible = false;
        this.m_BuffIconTypeSwitch = 0;
        this.m_ResidentBuffIconTypeSwitch = 0;
        this.m_bMeatBuff = false;
        this.m_bNearEnd = false;
        this.m_bIsPlaceholder = false;
        this.m_BuffGoodOrBad = EBuffGoodOrBad(2);
        this.m_BuffEntity = ENTITY_NULL;
        this.m_bCircleProgress = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTargetEntity(InTargetEntity);
        this.SetBuffEntityData(InBuffEntityData);
        this.SetSubBuffEntityData(InSubBuffEntityData);
        return;
    }
    FVM_BuffIcon opAssign(const FVM_BuffIcon &inout Other)
    {
        FVM_BuffIcon __r;
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_BuffEntityData = Other.m_BuffEntityData;
        this.m_SubBuffEntityData = Other.m_SubBuffEntityData;
        this.m_bIsPlaceholder = Other.m_bIsPlaceholder;
        this.m_BuffStackCount = int(Other.m_BuffStackCount);
        this.m_BuffImage = Other.m_BuffImage;
        this.m_IconProgressBar = Other.m_IconProgressBar;
        this.m_StackVisible = Other.m_StackVisible;
        this.m_HoverModel = Other.m_HoverModel;
        this.m_EndTime = Other.m_EndTime;
        this.m_DurationTime = Other.m_DurationTime;
        this.m_BuffTimeProgress = Other.m_BuffTimeProgress;
        this.m_BuffIconTypeSwitch = int(Other.m_BuffIconTypeSwitch);
        this.m_ResidentBuffIconTypeSwitch = int(Other.m_ResidentBuffIconTypeSwitch);
        this.m_bMeatBuff = Other.m_bMeatBuff;
        this.m_MeatBuffModifiersDataIDs = Other.m_MeatBuffModifiersDataIDs;
        this.m_bNearEnd = Other.m_bNearEnd;
        this.m_BuffGoodOrBad = Other.m_BuffGoodOrBad;
        this.m_BuffEntity = Other.m_BuffEntity;
        this.m_bCircleProgress = Other.m_bCircleProgress;
        return __r;
    }
    void PostConstruct()
    {
        UObject local_126;
        if (!(this.GetBuffEntityData().ConfigRef.IsValid()))
        {
            this.SetbIsPlaceholder(true);
            this.SetStackVisible(false);
            this.SetBuffStackCount(0);
            this.SetbMeatBuff(true);
            this.SetResidentBuffIconTypeSwitch(0);
            this.SetbNearEnd(false);
            FFPTime local_4;
            this.SetIconProgressBar(TEUIModelRef<FVM_CommonAnnularProgressBar>(::FVM_CommonAnnularProgressBar::Create(this.GetContext().Manager, FFPTime(), local_4)));
            return;
        }
        if (FDataObjectPtr(TDataObjectPtr<FBuffConfig>(this.GetBuffEntityData().ConfigRef).opArrow().PresentationConfig))
        {
            TDataObjectPtr<FBuffPresentationConfig> local_80;
            local_126 = local_80.opArrow().IconBrush.LoadBrush().ResourceObject;
            this.SetBuffImage(Cast<UTexture2D>(local_126));
            this.SetBuffGoodOrBad(EBuffGoodOrBad(local_80.opArrow().BuffGoodOrBad));
        }
        if (TDataObjectPtr<FBuffConfig>(this.GetBuffEntityData().ConfigRef).opArrow().GetEffectiveMaxBuffCount() > 1)
        {
            this.SetStackVisible(true);
        }
        else
        {
            this.SetStackVisible(false);
        }
        this.SetBuffStackCount(int(this.GetBuffEntityData().StackCount));
        this.SetbCircleProgress(false);
        switch (int(TDataObjectPtr<FBuffConfig>(this.GetBuffEntityData().ConfigRef).opArrow().ClientPresentationType))
        {
        case 1:
        {
            this.SetbCircleProgress(true);
            this.SetResidentBuffIconTypeSwitch(0);
            break;
        }
        case 2:
        {
            this.SetbCircleProgress(true);
            this.SetResidentBuffIconTypeSwitch(1);
            break;
        }
        case 4:
        {
            this.SetbCircleProgress(false);
            break;
        }
        case 3:
        default:
        {
            this.SetbCircleProgress(false);
        }
        }
        this.SetbMeatBuff(::FMetaBuffUtils::IsMetaBuff(this.GetTargetEntity(), this.GetBuffEntityData().ConfigRef));
        if (this.GetbMeatBuff())
        {
            this.UpdateMeatBuff();
        }
        else
        {
            this.SetBuffEntity(FECSEntity(this.GetBuffEntityData().BuffEntityId));
            this.UpdateNormalBuff();
        }
        this.SetbNearEnd(false);
        return;
    }
    void UpdateMeatBuff()
    {
        bool local_9;
        int local_19 = 0;
        if (!(::FASCommonUtils::GetUniquePlayerEntity(this.GetTargetEntity()).IsValid()))
        {
            local_9 = false;
        }
        else
        {
            Has local_14;
            local_9 = local_14.opCall();
        }
        if (local_9)
        {
            int local_22;
            int local_18;
            int local_16;
            local_16 = 0;
            local_18 = 0;
            for (auto& local_40 : local_22.GetMetaBuffs())
            {
                if (0 == this.GetBuffEntityData().ConfigRef.GetUniqueID())
                {
                    local_16 = local_40.GetStartTime();
                    local_18 = local_19;
                    this.SetMeatBuffModifiersDataIDs(local_40.GetModifiersDataIDs());
                }
            }
            int64 local_50 = FDateTime::UtcNow().ToUnixTimestamp();
            local_19 = (local_16 - local_50);
            local_19 = local_19 + local_18;
            this.SetEndTime(FFPTime((this.GetContext().Time.ToSeconds() + local_19)));
            this.SetDurationTime(FFPTime(local_18));
            this.SetIconProgressBar(TEUIModelRef<FVM_CommonAnnularProgressBar>(::FVM_CommonAnnularProgressBar::Create(this.GetContext().Manager, this.GetEndTime(), FFPTime(local_18))));
        }
        return;
    }
    void UpdateNormalBuff()
    {
        Get local_6;
        const FC_BuffInstance& local_2 = local_6.opCall();
        if (local_2)
        {
            this.SetEndTime(local_2.GetEndTime());
            FFPTime local_10 = FFPTime(local_2.GetDuration().ToSeconds());
            this.SetDurationTime(local_10);
            if (this.GetbCircleProgress())
            {
                this.SetIconProgressBar(TEUIModelRef<FVM_CommonAnnularProgressBar>(::FVM_CommonAnnularProgressBar::Create(this.GetContext().Manager, this.GetEndTime(), this.GetDurationTime())));
                return;
            }
            this.SetIconProgressBar(TEUIModelRef<FVM_CommonAnnularProgressBar>(::FVM_CommonAnnularProgressBar::Create(this.GetContext().Manager, FFPTime(), local_10)));
        }
        return;
    }
    void OnTeammatePlayer1StatesChanged(const FC_PlayerMetaBuffList &inout PlayerStates)
    {
        this.UpdateMeatBuff();
        return;
    }
    void OnTeammatePlayer1StatesChanged(const FC_BuffInstance &inout PlayerStates)
    {
        this.UpdateNormalBuff();
        return;
    }
    void OnQuickSlotChanged(const FC_PlayerMetaBuffList &inout C_PlayerMetaBuffList)
    {
        bool local_1;
        int local_40 = 0;
        if (!(this.GetTargetEntity().IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Has local_6;
            local_1 = local_6.opCall();
        }
        if (local_1)
        {
            int local_14;
            FFPTime local_10;
            FFPTime local_12;
            for (auto& local_32 : local_14.GetMetaBuffs())
            {
                if (0 == this.GetBuffEntityData().ConfigRef.GetUniqueID())
                {
                    local_10 = FFPTime(local_32.GetStartTime());
                    local_12 = local_40;
                }
            }
            this.SetEndTime((local_10 + local_12));
            this.SetDurationTime(local_12);
            TEUIModelRef<FVM_CommonAnnularProgressBar> local_42 = this.GetIconProgressBar();
            this.GetEndTime().SetEndTime();
            TEUIModelRef<FVM_CommonAnnularProgressBar> local_42_2 = this.GetIconProgressBar();
            this.GetDurationTime().SetDuration();
        }
        return;
    }
    void RefreshBuffTimeProgress()
    {
        if (this.GetbIsPlaceholder() || (this.GetDurationTime().ToSeconds() <= 0.0))
        {
            return;
        }
        this.GetModify_BuffTimeProgress().EndAtSmooth(this.GetEndTime(), this.GetDurationTime());
        return;
    }
    void RefreshNearEnd()
    {
        if (this.GetbIsPlaceholder())
        {
            this.SetbNearEnd(false);
            return;
        }
        this.SetbNearEnd(!(this.GetBuffTimeProgress().IsFinished()) && this.GetBuffTimeProgress().IsNearEnd(FFPTime(10)));
        return;
    }
    void BeginDestroy()
    {
        if (this.GetHoverHandle())
        {
            ::CommonPopup::CloseHover(this.GetHoverHandle(), this.GetManager(), true);
            this.SetHoverHandle(FCommonHoverHandle::InvalidHandle);
        }
        return;
    }
    float GetShowProgress() const
    {
        return this.GetBuffTimeProgress().GetRemainingRatio();
    }
    float GetShowUsedProgress() const
    {
        return this.GetBuffTimeProgress().GetProgress();
    }
    bool NeedProgress() const
    {
        if (this.GetSubBuffEntityData().Num() > 0)
        {
            return false;
        }
        return (this.GetDurationTime().ToSeconds() > 0.0);
    }
    bool NeedStackCount() const
    {
        return (this.GetBuffStackCount() > 1);
    }
    bool NeedShowGoodOrBad() const
    {
        return (int(this.GetBuffGoodOrBad()) != 2);
    }
    bool GoodOrBad() const
    {
        return (int(this.GetBuffGoodOrBad()) == 0);
    }
    void ShowHover(const UWidget Widget)
    {
        FCommonHoverHandle local_2;
        if (local_2.opCmp(FCommonHoverHandle::InvalidHandle) == 0)
        {
            if (this.GetbIsPlaceholder() || !(this.GetBuffEntityData().ConfigRef.IsValid()))
            {
                TArray<FBuffHoverDialogItemData> local_10;
                this.SetHoverModel(TEUIModelRef<FVM_BuffHoverDialog>(::FVM_BuffHoverDialog::Create(this.GetContext().Manager, local_10)));
                TEUIModelRef<FVM_BuffHoverDialog> local_12 = this.GetHoverModel();
                1.SetIsEmptyFood();
                TEUIModelRef<FVM_BuffHoverDialog> local_12_2 = this.GetHoverModel();
                local_2 = ::CommonPopup::HoverCustom(Widget, ::UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Dev/UI/UMG/MainHud/UI_BuffHoverDialog.UI_BuffHoverDialog"), FEUIModelContainer(), false, true, ECommonHoverLayout(0), EEUILayoutLayer(0), false);
                this.SetHoverHandle(local_2);
                return;
            }
            if (!(this.GetbMeatBuff()))
            {
                Has local_44;
                if (!(local_44.opCall()))
                {
                    return;
                }
            }
            if (this.GetSubBuffEntityData().Num() > 0)
            {
                if (CVar_Buff_DebugBuffDataIcon.GetBool())
                {
                    XWarning(ELog(16), FString().Append("Buff.BuffIcon Debug List"));
                }
                TArray<FBuffHoverDialogItemData> local_10;
                for (auto& local_66 : this.GetSubBuffEntityData())
                {
                    if (CVar_Buff_DebugBuffDataIcon.GetBool())
                    {
                        XWarning(ELog(16), FString().Append("Buff.BuffIcon Debug Hover ").Append(local_66.ConfigRef.GetBuffName()));
                    }
                    if (this.IsBuffNeedHover(local_66))
                    {
                        FBuffHoverDialogItemData local_102;
                        local_102.BuffEntityData = local_66;
                        local_102.OverrideEndTime = 0;
                        local_10.Add(local_102);
                    }
                }
                if (local_10.Num() > 0)
                {
                    this.SetHoverModel(TEUIModelRef<FVM_BuffHoverDialog>(::FVM_BuffHoverDialog::Create(this.GetContext().Manager, local_10)));
                    TEUIModelRef<FVM_BuffHoverDialog> local_12_3 = this.GetHoverModel();
                    local_2 = ::CommonPopup::HoverCustom(Widget, ::UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Dev/UI/UMG/MainHud/UI_BuffHoverDialog.UI_BuffHoverDialog"), FEUIModelContainer(), false, true, ECommonHoverLayout(0), EEUILayoutLayer(0), false);
                    this.SetHoverHandle(local_2);
                }
                return;
            }
            if (CVar_Buff_DebugBuffDataIcon.GetBool())
            {
                XWarning(ELog(16), FString().Append("Buff.BuffIcon Debug One"));
            }
            if (this.IsBuffNeedHover(this.GetBuffEntityData()))
            {
                if (CVar_Buff_DebugBuffDataIcon.GetBool())
                {
                    XWarning(ELog(16), FString().Append("Buff.BuffIcon Debug Hover ").Append(this.GetBuffEntityData().ConfigRef.GetBuffName()));
                }
                TArray<FBuffHoverDialogItemData> local_10;
                FBuffHoverDialogItemData local_102;
                local_102.BuffEntityData = this.GetBuffEntityData();
                local_102.OverrideEndTime = this.GetEndTime();
                local_102.AppendModifiersDataIDs = this.GetMeatBuffModifiersDataIDs();
                local_10.Add(local_102);
                this.SetHoverModel(TEUIModelRef<FVM_BuffHoverDialog>(::FVM_BuffHoverDialog::Create(this.GetContext().Manager, local_10)));
                TEUIModelRef<FVM_BuffHoverDialog> local_12_4 = this.GetHoverModel();
                local_2 = ::CommonPopup::HoverCustom(Widget, ::UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Dev/UI/UMG/MainHud/UI_BuffHoverDialog.UI_BuffHoverDialog"), FEUIModelContainer(), false, true, ECommonHoverLayout(0), EEUILayoutLayer(0), false);
                this.SetHoverHandle(local_2);
            }
        }
        return;
    }
    void HideHover()
    {
        ::CommonPopup::CloseHover(this.GetHoverHandle(), this.GetManager(), true);
        this.SetHoverHandle(FCommonHoverHandle::InvalidHandle);
        return;
    }
    bool IsBuffNeedHover(const FBuffEntityData &inout Data) const
    {
        if (FDataObjectPtr(TDataObjectPtr<FBuffConfig>(this.GetBuffEntityData().ConfigRef).opArrow().PresentationConfig))
        {
            TDataObjectPtr<FBuffPresentationConfig> local_74;
            return local_74.opArrow().bNeedHover;
        }
        return false;
    }
    void OnMeatBuffStateChange(const FC_PlayerMetaBuffList &inout MeatBuffComponent)
    {
        bool local_1;
        int local_19 = 0;
        if (this.GetbMeatBuff())
        {
            if (!(::FASCommonUtils::GetUniquePlayerEntity(this.GetTargetEntity()).IsValid()))
            {
                local_1 = false;
            }
            else
            {
                Has local_14;
                local_1 = local_14.opCall();
            }
            if (local_1)
            {
                int local_22;
                int local_18;
                int local_16;
                local_16 = 0;
                local_18 = 0;
                for (auto& local_40 : local_22.GetMetaBuffs())
                {
                    if (0 == this.GetBuffEntityData().ConfigRef.GetUniqueID())
                    {
                        local_16 = local_40.GetStartTime();
                        local_18 = local_19;
                    }
                }
                int64 local_50 = FDateTime::UtcNow().ToUnixTimestamp();
                local_19 = (local_16 - local_50);
                local_19 = local_19 + local_18;
                this.SetEndTime(FFPTime((this.GetContext().Time.ToSeconds() + local_19)));
                this.SetDurationTime(FFPTime(local_18));
                this.SetIconProgressBar(TEUIModelRef<FVM_CommonAnnularProgressBar>(::FVM_CommonAnnularProgressBar::Create(this.GetContext().Manager, this.GetEndTime(), FFPTime(local_18))));
            }
        }
        return;
    }
    ESlateVisibility StackVisibleAsSlateVisibility() const
    {
        int local_2;
        if (this.StackVisibleAsBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool StackVisibleAsBool() const
    {
        return this.GetStackVisible() || false;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TargetEntity = __Value;
        return;
    }
    const FBuffEntityData GetBuffEntityData() const property
    {
        const FBuffEntityData __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FBuffEntityData GetModify_BuffEntityData() property
    {
        FBuffEntityData __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetBuffEntityData(const FBuffEntityData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_BuffEntityData = __Value;
        return;
    }
    const TArray<FBuffEntityData> GetSubBuffEntityData() const property
    {
        const TArray<FBuffEntityData> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FBuffEntityData> GetModify_SubBuffEntityData() property
    {
        TArray<FBuffEntityData> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetSubBuffEntityData(const TArray<FBuffEntityData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SubBuffEntityData = __Value;
        return;
    }
    bool GetbIsPlaceholder() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bIsPlaceholder;
    }
    void SetbIsPlaceholder(const bool __Value) property
    {
        if (!(this.m_bIsPlaceholder) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bIsPlaceholder = __Value;
        return;
    }
    int GetBuffStackCount() const property
    {
        this.TrackPropertyRead(4);
        return this.m_BuffStackCount;
    }
    void SetBuffStackCount(const int __Value) property
    {
        if (this.m_BuffStackCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_BuffStackCount = __Value;
        return;
    }
    UTexture2D GetBuffImage() const property
    {
        this.TrackPropertyRead(5);
        return this.m_BuffImage;
    }
    void SetBuffImage(const UTexture2D __Value) property
    {
        if (this.m_BuffImage == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        return;
    }
    TEUIModelRef<FVM_CommonAnnularProgressBar> GetIconProgressBar() const property
    {
        this.TrackPropertyRead(6);
        return this.m_IconProgressBar;
    }
    void SetIconProgressBar(const TEUIModelRef<FVM_CommonAnnularProgressBar> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonAnnularProgressBar> local_2;
        local_2 = this.m_IconProgressBar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_IconProgressBar = __Value;
        return;
    }
    bool GetStackVisible() const property
    {
        this.TrackPropertyRead(7);
        return this.m_StackVisible;
    }
    void SetStackVisible(const bool __Value) property
    {
        if (!(this.m_StackVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_StackVisible = __Value;
        return;
    }
    const FCommonHoverHandle GetHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FCommonHoverHandle GetModify_HoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        return;
    }
    TEUIModelRef<FVM_BuffHoverDialog> GetHoverModel() const property
    {
        this.TrackPropertyRead(9);
        return this.m_HoverModel;
    }
    void SetHoverModel(const TEUIModelRef<FVM_BuffHoverDialog> &inout __Value) property
    {
        TEUIModelRef<FVM_BuffHoverDialog> local_2;
        local_2 = this.m_HoverModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_HoverModel = __Value;
        return;
    }
    FFPTime GetEndTime() const property
    {
        FFPTime __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FFPTime GetModify_EndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_EndTime = __Value;
        return;
    }
    const FFPTime GetDurationTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FFPTime GetModify_DurationTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetDurationTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_DurationTime = __Value;
        return;
    }
    const FMW_TimeProgress GetBuffTimeProgress() const property
    {
        const FMW_TimeProgress __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FMW_TimeProgress GetModify_BuffTimeProgress() property
    {
        FMW_TimeProgress __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetBuffTimeProgress(const FMW_TimeProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_BuffTimeProgress = __Value;
        return;
    }
    int GetBuffIconTypeSwitch() const property
    {
        this.TrackPropertyRead(13);
        return this.m_BuffIconTypeSwitch;
    }
    void SetBuffIconTypeSwitch(const int __Value) property
    {
        if (this.m_BuffIconTypeSwitch == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_BuffIconTypeSwitch = __Value;
        return;
    }
    int GetResidentBuffIconTypeSwitch() const property
    {
        this.TrackPropertyRead(14);
        return this.m_ResidentBuffIconTypeSwitch;
    }
    void SetResidentBuffIconTypeSwitch(const int __Value) property
    {
        if (this.m_ResidentBuffIconTypeSwitch == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_ResidentBuffIconTypeSwitch = __Value;
        return;
    }
    bool GetbMeatBuff() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bMeatBuff;
    }
    void SetbMeatBuff(const bool __Value) property
    {
        if (!(this.m_bMeatBuff) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bMeatBuff = __Value;
        return;
    }
    const TArray<uint> GetMeatBuffModifiersDataIDs() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    TArray<uint> GetModify_MeatBuffModifiersDataIDs() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetMeatBuffModifiersDataIDs(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_MeatBuffModifiersDataIDs = __Value;
        return;
    }
    bool GetbNearEnd() const property
    {
        this.TrackPropertyRead(17);
        return this.m_bNearEnd;
    }
    void SetbNearEnd(const bool __Value) property
    {
        if (!(this.m_bNearEnd) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_bNearEnd = __Value;
        return;
    }
    EBuffGoodOrBad GetBuffGoodOrBad() const property
    {
        this.TrackPropertyRead(18);
        return this.m_BuffGoodOrBad;
    }
    void SetBuffGoodOrBad(const EBuffGoodOrBad __Value) property
    {
        if (int(this.m_BuffGoodOrBad) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_BuffGoodOrBad = __Value;
        return;
    }
    const FECSEntity GetBuffEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    FECSEntity GetModify_BuffEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetBuffEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_BuffEntity = __Value;
        return;
    }
    bool GetbCircleProgress() const property
    {
        this.TrackPropertyRead(20);
        return this.m_bCircleProgress;
    }
    void SetbCircleProgress(const bool __Value) property
    {
        if (!(this.m_bCircleProgress) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_bCircleProgress = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BuffIcon
{
    UPROPERTY()
    float ShowProgress;
    UPROPERTY()
    float ShowUsedProgress;
    UPROPERTY()
    bool NeedProgress;
    UPROPERTY()
    bool NeedStackCount;
    UPROPERTY()
    bool NeedShowGoodOrBad;
    UPROPERTY()
    bool GoodOrBad;
    UPROPERTY()
    TEUIModelRef<FVM_BuffIcon> Self;


}

namespace FVM_BuffIcon
{
FVM_BuffIcon& Create(const UObject ContextObject, const FECSEntity &inout TargetEntity, const FBuffEntityData &inout BuffEntityData, const TArray<FBuffEntityData> &inout SubBuffEntityData)
{
    return FVM_BuffIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), TargetEntity, BuffEntityData, SubBuffEntityData);
}
FVM_BuffIcon CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout TargetEntity, const FBuffEntityData &inout BuffEntityData, const TArray<FBuffEntityData> &inout SubBuffEntityData)
{
    FVM_BuffIcon __r;
    TEUIModelRef<FVM_BuffIcon> local_6 = TEUIModelRef<FVM_BuffIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BuffIcon::ModelId, 0, TargetEntity, BuffEntityData, SubBuffEntityData));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bIsPlaceholder";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BuffStackCount";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BuffImage";
    local_14.TypeName = "UTexture2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconProgressBar";
    local_14.TypeName = "TEUIModelRef<FVM_CommonAnnularProgressBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "StackVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BuffIconTypeSwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ResidentBuffIconTypeSwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bNearEnd";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowProgress";
    local_14.TypeName = "float64";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowUsedProgress";
    local_14.TypeName = "float64";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NeedProgress";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NeedStackCount";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NeedShowGoodOrBad";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GoodOrBad";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BuffIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BuffIcon;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("BuffTimeProgress");
    int local_2_2 = FVM_BuffIcon::__IndexOf_BuffTimeProgress();
    Result.WatcherProperties.Add(local_19);
    FEUIModelMonitorDefine local_32;
    local_32.FunctionName = "__OnTeammatePlayer1StatesChanged";
    local_32.ComponentType = FC_PlayerMetaBuffList;
    Result.MonitorFunctions.Add(local_32);
    local_32.FunctionName = "__OnTeammatePlayer1StatesChanged";
    local_32.ComponentType = FC_BuffInstance;
    local_32.MonitorPropertyName = FName("BuffEntity");
    int local_2_3 = FVM_BuffIcon::__IndexOf_BuffEntity();
    Result.MonitorFunctions.Add(local_32);
    local_32.FunctionName = "__OnQuickSlotChanged";
    local_32.ComponentType = FC_PlayerMetaBuffList;
    Result.MonitorFunctions.Add(local_32);
    FEUIModelEffectDefine local_38;
    local_38.FunctionName = "RefreshBuffTimeProgress";
    Result.EffectFunctions.Add(local_38);
    local_38.FunctionName = "RefreshNearEnd";
    Result.EffectFunctions.Add(local_38);
    local_32.FunctionName = "__OnMeatBuffStateChange";
    local_32.ComponentType = FC_PlayerMetaBuffList;
    Result.MonitorFunctions.Add(local_32);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BuffIcon;
}
void __OnTeammatePlayer1StatesChanged(FVM_BuffIcon &inout Model, const FECSEntity &inout Entity, const FC_PlayerMetaBuffList &inout Component)
{
    Model.OnTeammatePlayer1StatesChanged(Component);
    return;
}
void __OnTeammatePlayer1StatesChanged(FVM_BuffIcon &inout Model, const FECSEntity &inout Entity, const FC_BuffInstance &inout Component)
{
    Model.OnTeammatePlayer1StatesChanged(Component);
    return;
}
void __OnQuickSlotChanged(FVM_BuffIcon &inout Model, const FECSEntity &inout Entity, const FC_PlayerMetaBuffList &inout Component)
{
    Model.OnQuickSlotChanged(Component);
    return;
}
void __OnMeatBuffStateChange(FVM_BuffIcon &inout Model, const FECSEntity &inout Entity, const FC_PlayerMetaBuffList &inout Component)
{
    Model.OnMeatBuffStateChange(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
bool __UIGetter_bIsPlaceholder(const FVM_BuffIcon &inout Model)
{
    return Model.GetbIsPlaceholder();
}
int __UIGetter_BuffStackCount(const FVM_BuffIcon &inout Model)
{
    return Model.GetBuffStackCount();
}
UTexture2D __UIGetter_BuffImage(const FVM_BuffIcon &inout Model)
{
    return Model.GetBuffImage();
}
TEUIModelRef<FVM_CommonAnnularProgressBar> __UIGetter_IconProgressBar(const FVM_BuffIcon &inout Model)
{
    return Model.GetIconProgressBar();
}
bool __UIGetter_StackVisible(const FVM_BuffIcon &inout Model)
{
    return Model.GetStackVisible();
}
int __UIGetter_BuffIconTypeSwitch(const FVM_BuffIcon &inout Model)
{
    return Model.GetBuffIconTypeSwitch();
}
int __UIGetter_ResidentBuffIconTypeSwitch(const FVM_BuffIcon &inout Model)
{
    return Model.GetResidentBuffIconTypeSwitch();
}
bool __UIGetter_bNearEnd(const FVM_BuffIcon &inout Model)
{
    return Model.GetbNearEnd();
}
float __UIGetter_ShowProgress(const FVM_BuffIcon &inout Model)
{
    return Model.GetShowProgress();
}
float __UIGetter_ShowUsedProgress(const FVM_BuffIcon &inout Model)
{
    return Model.GetShowUsedProgress();
}
bool __UIGetter_NeedProgress(const FVM_BuffIcon &inout Model)
{
    return Model.NeedProgress();
}
bool __UIGetter_NeedStackCount(const FVM_BuffIcon &inout Model)
{
    return Model.NeedStackCount();
}
bool __UIGetter_NeedShowGoodOrBad(const FVM_BuffIcon &inout Model)
{
    return Model.NeedShowGoodOrBad();
}
bool __UIGetter_GoodOrBad(const FVM_BuffIcon &inout Model)
{
    return Model.GoodOrBad();
}
TEUIModelRef<FVM_BuffIcon> __UIGetter_Self(const FVM_BuffIcon &inout Model)
{
    return TEUIModelRef<FVM_BuffIcon>(Model);
}
int __IndexOf_TargetEntity()
{
    return 0;
}
int __IndexOf_BuffEntityData()
{
    return 1;
}
int __IndexOf_SubBuffEntityData()
{
    return 2;
}
int __IndexOf_bIsPlaceholder()
{
    return 3;
}
int __IndexOf_BuffStackCount()
{
    return 4;
}
int __IndexOf_BuffImage()
{
    return 5;
}
int __IndexOf_IconProgressBar()
{
    return 6;
}
int __IndexOf_StackVisible()
{
    return 7;
}
int __IndexOf_HoverHandle()
{
    return 8;
}
int __IndexOf_HoverModel()
{
    return 9;
}
int __IndexOf_EndTime()
{
    return 10;
}
int __IndexOf_DurationTime()
{
    return 11;
}
int __IndexOf_BuffTimeProgress()
{
    return 12;
}
int __IndexOf_BuffIconTypeSwitch()
{
    return 13;
}
int __IndexOf_ResidentBuffIconTypeSwitch()
{
    return 14;
}
int __IndexOf_bMeatBuff()
{
    return 15;
}
int __IndexOf_MeatBuffModifiersDataIDs()
{
    return 16;
}
int __IndexOf_bNearEnd()
{
    return 17;
}
int __IndexOf_BuffGoodOrBad()
{
    return 18;
}
int __IndexOf_BuffEntity()
{
    return 19;
}
int __IndexOf_bCircleProgress()
{
    return 20;
}
}
namespace __GeneratedProperties_FVM_BuffIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
