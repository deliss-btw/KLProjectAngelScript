

struct FDisplayItemFashionRuntimeState
{
    UPROPERTY()
    bool bUnlocked = true;
    UPROPERTY()
    bool bEquippedOnCurrentTarget = false;
    UPROPERTY()
    bool bEquippedOnOtherTarget = false;
    UPROPERTY()
    bool bSelected = false;
    UPROPERTY()
    bool bEnableMask = false;
    UPROPERTY()
    int MaskType = 0;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> RedDotVM;


}

namespace DisplayItemAdapter_Fashion
{
bool TryResolveDisplayIconForBody(const FFashionDisplayIconByBody &inout IconByBody, const EBodyType BodyType, FSoftBrush &inout OutIcon)
{
    if (IconByBody.Find(BodyType, OutIcon))
    {
        return true;
    }
    if (!(int(BodyType) == 0) && IconByBody.Find(EBodyType(0), OutIcon))
    {
        return true;
    }
    OutIcon = FSoftBrush();
    return false;
}
FSoftBrush ResolveDisplayIcon(const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const EBodyType BodyType, const EDisplayItemIconType IconType)
{
    bool local_1 = !(FashionConfig);
    if (local_1)
    {
        return FSoftBrush();
    }
    local_1 = !local_1;
    if (local_1)
    {
        return FSoftBrush();
    }
    FSoftBrush local_112;
    FFashionDisplayIconByBody local_68;
    DisplayItemAdapter_Fashion::TryResolveDisplayIconForBody(local_68, EBodyType(BodyType), local_112);
    return local_112;
}
EItemRarity ConvertFashionRarity(const EFashionRarity FashionRarity)
{
    switch (int(FashionRarity))
    {
    case 4:
    {
        return EItemRarity(4);
    }
    case 3:
    {
        return EItemRarity(3);
    }
    case 2:
    {
        return EItemRarity(2);
    }
    case 1:
    {
        return EItemRarity(1);
    }
    case 0:
    default:
    {
    }
    }
    return EItemRarity(0);
}
TEUIModelRef<FM_DisplayItemData> MakeDisplayData(const UObject ContextObject, const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const EBodyType BodyType = EBodyType::All)
{
    int local_5 = 0;
    int local_53 = 0;
    FM_DisplayItemData& local_2 = FM_DisplayItemData::Create(ContextObject);
    local_2.SetSourceType(EDisplayItemSourceType(2));
    if (FashionConfig)
    {
        local_2.SetSourceId(local_5);
        local_2.SetItemImage(DisplayItemAdapter_Fashion::ResolveDisplayIcon(FashionConfig, EBodyType(BodyType), EDisplayItemIconType(0)));
        local_2.SetItemImageHigh(DisplayItemAdapter_Fashion::ResolveDisplayIcon(FashionConfig, EBodyType(BodyType), EDisplayItemIconType(1)));
        int local_54 = local_53;
        local_2.SetRarityValue(local_54);
        int local_81 = int(DisplayItemAdapter_Fashion::ConvertFashionRarity(EFashionRarity(local_53)));
        if (UGlobalItemSettings::Get().GetRarityConfig().IsSet())
        {
        }
        local_2.SetSortPriority(local_54);
    }
    return TEUIModelRef<FM_DisplayItemData>(local_2);
}
bool IsUnlocked(const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const FMS_FashionModel &inout FashionModel)
{
    int local_3 = 0;
    bool local_4 = false;
    if (!(FashionConfig))
    {
        return false;
    }
    local_4 = local_4 || FashionModel.GetUnlockedFashionIDList().Contains(local_3);
    return local_4;
}
bool IsFashionDecoSlot(const EFashionSlotType SlotType)
{
    return (int(SlotType) == 101 || (int(SlotType) == 102) || (int(SlotType) == 103) || (int(SlotType) == 104) || (int(SlotType) == 105) || (int(SlotType) == 106) || (int(SlotType) == 107) || (int(SlotType) == 108));
}
bool IsEquippedByAvatarFashion(const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const FAvatarFashion &inout AvatarFashion)
{
    int local_3 = 0;
    int local_4 = 0;
    if (!(FashionConfig))
    {
        return false;
    }
    int local_2 = local_3;
    switch (local_4)
    {
    case 1:
    {
        local_3 = int(AvatarFashion.HairID);
        return (local_3 == local_2);
    }
    case 2:
    {
        local_3 = int(AvatarFashion.TopID);
        return (local_3 == local_2);
    }
    case 3:
    {
        local_3 = int(AvatarFashion.BottomID);
        return (local_3 == local_2);
    }
    case 4:
    {
        local_3 = int(AvatarFashion.SuitID);
        return (local_3 == local_2);
    }
    case 5:
    {
        local_3 = int(AvatarFashion.BathrobeTopID);
        return (local_3 == local_2);
    }
    case 6:
    {
        local_3 = int(AvatarFashion.BathrobeBottomID);
        return (local_3 == local_2);
    }
    default:
    {
        if (!(DisplayItemAdapter_Fashion::IsFashionDecoSlot(EFashionSlotType(local_4))))
        {
            return false;
        }
        for (auto& local_20 : AvatarFashion.Decos)
        {
            if (int(local_20.FashionID) == local_2)
            {
                return true;
            }
        }
    }
    }
    return false;
}
bool IsEquippedOnAvatar(const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const FMS_FashionModel &inout FashionModel, const uint AvatarId)
{
    FAvatarFashion local_16;
    if ((!(FashionConfig) || (AvatarId == 0)))
    {
        return false;
    }
    if (!(FashionModel.GetAvatarFashionMap().Find(AvatarId, local_16)))
    {
        return false;
    }
    return DisplayItemAdapter_Fashion::IsEquippedByAvatarFashion(FashionConfig, local_16);
}
bool IsEquippedOnPlayer(const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const FMS_FashionModel &inout FashionModel)
{
    int local_3 = 0;
    int local_4 = 0;
    if (!(FashionConfig))
    {
        return false;
    }
    int local_2 = local_3;
    int local_5 = local_4;
    if (local_5 <= -54)
    {
        if (local_5 != -55)
        {
            if (local_5 != -54)
            {
            }
        }
        else
        {
            local_3 = FashionModel.GetMountID();
            return (local_3 == local_2);
        }
    }
    return false;
}
FDisplayItemFashionRuntimeState MakeRuntimeState(const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const FMS_FashionModel &inout FashionModel, const uint AvatarId = 0)
{
    FDisplayItemFashionRuntimeState local_6;
    FDisplayItemFashionRuntimeState __r;
    local_6.bUnlocked = DisplayItemAdapter_Fashion::IsUnlocked(FashionConfig, FashionModel);
    local_6.bEquippedOnCurrentTarget = DisplayItemAdapter_Fashion::IsEquippedOnPlayer(FashionConfig, FashionModel) || DisplayItemAdapter_Fashion::IsEquippedOnAvatar(FashionConfig, FashionModel, AvatarId);
    local_6.bEnableMask = !(local_6.bUnlocked);
    local_6.MaskType = local_6.bUnlocked ? 0 : 1;
    return __r;
}
void ApplyRuntimeState(const FVM_DisplayItem &inout DisplayItemVM, const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const FDisplayItemFashionRuntimeState &inout RuntimeState)
{
    int local_79 = 0;
    if (!(FashionConfig))
    {
        DisplayItemUtility::SetMask(DisplayItemVM, true, 1);
        DisplayItemUtility::SetEquipMarkState(DisplayItemVM, 4);
        DisplayItemUtility::SetCustomSelection(DisplayItemVM, false);
        DisplayItemUtility::SetGradeImage(DisplayItemVM, FSoftBrush());
        DisplayItemUtility::SetRedDotVM(DisplayItemVM, TEUIModelRef<FVM_RedDot>());
        return;
    }
    DisplayItemUtility::SetMask(DisplayItemVM, RuntimeState.bEnableMask, int(RuntimeState.MaskType));
    DisplayItemUtility::SetEquipStateByFlags(DisplayItemVM, RuntimeState.bEquippedOnCurrentTarget, RuntimeState.bEquippedOnOtherTarget);
    DisplayItemUtility::SetCustomSelection(DisplayItemVM, RuntimeState.bSelected);
    int local_80 = int(DisplayItemAdapter_Fashion::ConvertFashionRarity(EFashionRarity(local_79)));
    TDataObjectPtr<FItemRarityConfig> local_104 = UGlobalItemSettings::Get().GetRarityConfig();
    FSoftBrush local_148;
    if (local_104.IsSet())
    {
    }
    else
    {
        local_148 = FSoftBrush();
    }
    DisplayItemUtility::SetGradeImage(DisplayItemVM, local_148);
    DisplayItemUtility::SetRedDotVM(DisplayItemVM, RuntimeState.RedDotVM);
    return;
}
void ApplyRuntimeState(const FVM_DisplayItem &inout DisplayItemVM, const TDataObjectPtr<FFashionConfig> &inout FashionConfig)
{
    FDisplayItemFashionRuntimeState local_6;
    DisplayItemAdapter_Fashion::ApplyRuntimeState(DisplayItemVM, FashionConfig, local_6);
    return;
}
TEUIModelRef<FVM_DisplayItem> CreateDisplayItem(const UObject ContextObject, const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const FDisplayItemFashionRuntimeState &inout RuntimeState, const EItemDisplayScenario Scenario = EItemDisplayScenario::AvatarWardrobe, const EBodyType BodyType = EBodyType::All)
{
    TEUIModelRef<FM_DisplayItemData> local_2 = DisplayItemAdapter_Fashion::MakeDisplayData(ContextObject, FashionConfig, EBodyType(BodyType));
    TEUIModelRef<FVM_DisplayItem> local_8 = TEUIModelRef<FVM_DisplayItem>(FVM_DisplayItem::Create(ContextObject, local_2, EItemDisplayScenario(Scenario)));
    return local_8;
}
TEUIModelRef<FVM_DisplayItem> CreateDisplayItem(const UObject ContextObject, const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const EItemDisplayScenario Scenario = EItemDisplayScenario::AvatarWardrobe, const EBodyType BodyType = EBodyType::All)
{
    FDisplayItemFashionRuntimeState local_6;
    return DisplayItemAdapter_Fashion::CreateDisplayItem(ContextObject, FashionConfig, local_6, EItemDisplayScenario(Scenario), EBodyType(BodyType));
}
}
