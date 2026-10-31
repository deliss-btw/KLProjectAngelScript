enum EFashionSlotMainTab
{
    Cloth,
    Mount,
}

enum EFashionSlotSubTab
{
    Major,
    Deco,
}

struct FFashionSubTabTextConfig
{
    UPROPERTY()
    TMap<EFashionSlotSubTab, FText> SubTabTextMap;

    FFashionSubTabTextConfig()
    {
        return;
    }
}

struct FFashionSlotConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FSoftBrush SlotIcon;
    UPROPERTY()
    FText SlotName;
    UPROPERTY()
    EFashionSlotMainTab MainTab = EFashionSlotMainTab(0);
    UPROPERTY()
    EFashionSlotSubTab SubTab = EFashionSlotSubTab(0);
    UPROPERTY()
    int Priority = 0;
    UPROPERTY()
    bool bAllowUnequip = true;
    UPROPERTY()
    FDataObjectPtr m_ShowcaseConfig;

    const TDataObjectPtr<FUIShowcaseConfig> GetShowcaseConfig() const property
    {
        const TDataObjectPtr<FUIShowcaseConfig> __r;
        return __r;
    }
    void SetShowcaseConfig(const TDataObjectPtr<FUIShowcaseConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FUIShowcaseConfig>> local_2;
        this.m_ShowcaseConfig = local_2;
        return;
    }
}

class UFashionSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<EFashionSlotType, TDataObjectPtr<FFashionSlotConfig>> SlotConfigMap;
    UPROPERTY()
    FText SystemName;
    UPROPERTY()
    TMap<EFashionSlotMainTab, FText> MainTabTextMap;
    UPROPERTY()
    TMap<EFashionSlotMainTab, FFashionSubTabTextConfig> SubTabTextMap;
    UPROPERTY()
    FText ReturnConfirmTitle;
    UPROPERTY()
    FText ReturnConfirmMessage;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> NewUnlockLargeHint;

    UFashionSettings()
    {
        return;
    }
}

namespace FashionSettings
{
FSoftBrush GetSlotIcon(const EFashionSlotType SlotType)
{
    TRawPtr<TDataObjectPtr<FFashionSlotConfig>> local_6 = FashionSettings::Get().SlotConfigMap.Find(SlotType);
    if (local_6)
    {
        TDataObjectPtr<FFashionSlotConfig> local_32 = local_6.Get();
        if (local_32.IsSet())
        {
            return local_32.Get().SlotIcon;
        }
    }
    return FSoftBrush();
}
FText GetFashionSlotName(const EFashionSlotType SlotType)
{
    TRawPtr<TDataObjectPtr<FFashionSlotConfig>> local_6 = FashionSettings::Get().SlotConfigMap.Find(SlotType);
    if (local_6)
    {
        TDataObjectPtr<FFashionSlotConfig> local_32 = local_6.Get();
        if (local_32.IsSet())
        {
            return local_32.Get().SlotName;
        }
    }
    return FText();
}
TDataObjectPtr<FFashionSlotConfig> GetSlotConfig(const EFashionSlotType SlotType)
{
    TRawPtr<TDataObjectPtr<FFashionSlotConfig>> local_6 = FashionSettings::Get().SlotConfigMap.Find(SlotType);
    if (local_6)
    {
        return local_6.Get();
    }
    return TDataObjectPtr<FFashionSlotConfig>();
}
FText GetSystemName()
{
    FText local_4 = FText(FashionSettings::Get().SystemName);
    if (!(local_4.IsEmpty()))
    {
        return local_4;
    }
    return NSLOCTEXT("FashionSettings", "FashionSettings_DefaultSystemName", "自定义外观");
}
FText GetMainTabText(const EFashionSlotMainTab MainTab)
{
    FText local_4;
    FText __return;
    if (FashionSettings::Get().MainTabTextMap.Find(MainTab, local_4) && !(local_4.IsEmpty()))
    {
        return local_4;
    }
    int local_9 = int(MainTab);
    if (local_9 <= 1)
    {
        if (local_9 != 0)
        {
            if (local_9 != 1)
            {
            }
            else
            {
                __return = NSLOCTEXT("FashionSettings", "FashionSettings_DefaultMainTab_Mount", "坐骑");
            }
        }
    }
    __return = NSLOCTEXT("FashionSettings", "FashionSettings_DefaultMainTab_Cloth", "时装");
    return __return;
}
FText GetSubTabText(const EFashionSlotMainTab MainTab, const EFashionSlotSubTab SubTab)
{
    bool local_27;
    FFashionSubTabTextConfig local_20;
    FText __return;
    FText local_24;
    if (!(FashionSettings::Get().SubTabTextMap.Find(MainTab, local_20)))
    {
        local_27 = false;
    }
    else
    {
        local_27 = local_20.SubTabTextMap.Find(SubTab, local_24);
    }
    local_27 = local_27 && !(local_24.IsEmpty());
    if (local_27)
    {
        return local_24;
    }
    int local_29 = int(SubTab);
    if (local_29 <= 1)
    {
        if (local_29 != 0)
        {
            if (local_29 != 1)
            {
            }
            else
            {
                __return = NSLOCTEXT("FashionSettings", "FashionSettings_DefaultSubTab_Deco", "配饰");
            }
        }
    }
    __return = NSLOCTEXT("FashionSettings", "FashionSettings_DefaultSubTab_Major", "主体");
    return __return;
}
TDataObjectPtr<FMessageHintConfig> GetNewUnlockLargeHint()
{
    UFashionSettings local_2 = FashionSettings::Get();
    return local_2.NewUnlockLargeHint;
}
FText GetReturnConfirmTitle()
{
    FText local_4 = FText(FashionSettings::Get().ReturnConfirmTitle);
    if (!(local_4.IsEmpty()))
    {
        return local_4;
    }
    return NSLOCTEXT("FashionSettings", "FashionSettings_DefaultReturnConfirmTitle", "保存当前外观？");
}
FText GetReturnConfirmMessage()
{
    FText local_4 = FText(FashionSettings::Get().ReturnConfirmMessage);
    if (!(local_4.IsEmpty()))
    {
        return local_4;
    }
    return NSLOCTEXT("FashionSettings", "FashionSettings_DefaultReturnConfirmMessage", "当前预览的外观尚未替换，返回前是否替换为当前外观？");
}
}
