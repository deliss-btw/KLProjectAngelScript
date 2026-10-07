
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
    if (FashionSettings::Get().SlotConfigMap.Find(SlotType))
    {
        TDataObjectPtr<FFashionSlotConfig> local_56;
        if (local_56.IsSet())
        {
        }
        else
        {
        }
    }
    return FSoftBrush();
}
FText GetFashionSlotName(const EFashionSlotType SlotType)
{
    if (FashionSettings::Get().SlotConfigMap.Find(SlotType))
    {
        TDataObjectPtr<FFashionSlotConfig> local_56;
        if (local_56.IsSet())
        {
        }
        else
        {
        }
    }
    return FText();
}
TDataObjectPtr<FFashionSlotConfig> GetSlotConfig(const EFashionSlotType SlotType)
{
    if (FashionSettings::Get().SlotConfigMap.Find(SlotType))
    {
        return TDataObjectPtr<FFashionSlotConfig>();
    }
    return local_32;
}
FText GetSystemName()
{
    FText local_4 = FText(FashionSettings::Get().SystemName);
    if (!(local_4.IsEmpty()))
    {
        return local_4;
    }
    return NSLOCTEXT("FashionSettings", "FashionSettings_DefaultSystemName", "и‡Єе®љд№‰е¤–и§‚");
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
                __return = NSLOCTEXT("FashionSettings", "FashionSettings_DefaultMainTab_Mount", "еќђйЄ‘");
            }
        }
    }
    __return = NSLOCTEXT("FashionSettings", "FashionSettings_DefaultMainTab_Cloth", "ж—¶иЈ…");
    return __return;
}
FText GetSubTabText(const EFashionSlotMainTab MainTab, const EFashionSlotSubTab SubTab)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FText __r; return __r;
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
    return NSLOCTEXT("FashionSettings", "FashionSettings_DefaultReturnConfirmTitle", "дїќе­еЅ“е‰Ќе¤–и§‚пјџ");
}
FText GetReturnConfirmMessage()
{
    FText local_4 = FText(FashionSettings::Get().ReturnConfirmMessage);
    if (!(local_4.IsEmpty()))
    {
        return local_4;
    }
    return NSLOCTEXT("FashionSettings", "FashionSettings_DefaultReturnConfirmMessage", "еЅ“е‰Ќйў„и§€зљ„е¤–и§‚е°љжњЄж›їжЌўпјЊиї”е›ће‰ЌжЇеђ¦ж›їжЌўдёєеЅ“е‰Ќе¤–и§‚пјџ");
}
}
