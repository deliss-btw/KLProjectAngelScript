
namespace FVM_Cook
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClickPushFood = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnClickCancelReadyFood = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnClickReady = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnClickEsc = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnComfirmExit = FEUIModelCallbackSignature();

}
struct FVM_Cook : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ItemData>> m_CurrentCategoryItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CookCostItem>> m_CurrentDisplayItems;
    UPROPERTY()
    TArray<FEUIModelContainer> m_AllCookCostFoodItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_Image>> m_CategoryImages;
    UPROPERTY()
    TEUIModelRef<FMS_PlayerInventory> m_PlayerInventory;
    UPROPERTY()
    TEUIModelRef<FVM_CookCostItem> m_LastHoveredItem;
    UPROPERTY()
    TEUIModelRef<FVM_CookCostItem> m_LastSelectedItem;
    UPROPERTY()
    TEUIModelRef<FVM_WaitCookItem> m_ChooseReadyFood;
    UPROPERTY()
    TEUIModelRef<FVM_Item> m_CurSelectedItem;
    UPROPERTY()
    TEUIModelRef<FVM_Item> m_CurReadyItem;
    UPROPERTY()
    TEUIModelRef<FVM_CookReady> m_CookReady;
    UPROPERTY()
    int m_CurCategoryTagIndex;
    UPROPERTY()
    TArray<FGameplayTag> m_CategoryTags;
    UPROPERTY()
    FECSEntity m_CookPropEntity;
    UPROPERTY()
    bool m_bClosed;
    UPROPERTY()
    bool m_bReady;
    UPROPERTY()
    bool m_bCanReady;
    UPROPERTY()
    ESlateVisibility m_CookTipVisibility;
    UPROPERTY()
    ESlateVisibility m_ReadyFoodTipVisibility;
    UPROPERTY()
    ESlateVisibility m_ReadyFoodPropBtnVisibility;

    FVM_Cook()
    {
        this.m_CurCategoryTagIndex = 0;
        this.m_bClosed = false;
        this.m_bReady = false;
        this.m_bCanReady = false;
        this.m_CookTipVisibility = ESlateVisibility(1);
        this.m_ReadyFoodTipVisibility = ESlateVisibility(1);
        this.m_ReadyFoodPropBtnVisibility = ESlateVisibility(1);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Cook(const FVM_Cook &inout Other)
    {
        this.m_CurCategoryTagIndex = 0;
        this.m_bClosed = false;
        this.m_bReady = false;
        this.m_bCanReady = false;
        this.m_CookTipVisibility = ESlateVisibility(1);
        this.m_ReadyFoodTipVisibility = ESlateVisibility(1);
        this.m_ReadyFoodPropBtnVisibility = ESlateVisibility(1);
        this.m_CurrentCategoryItems = Other.m_CurrentCategoryItems;
        this.m_CurrentDisplayItems = Other.m_CurrentDisplayItems;
        this.m_AllCookCostFoodItems = Other.m_AllCookCostFoodItems;
        this.m_CategoryImages = Other.m_CategoryImages;
        this.m_PlayerInventory = Other.m_PlayerInventory;
        this.m_LastHoveredItem = Other.m_LastHoveredItem;
        this.m_LastSelectedItem = Other.m_LastSelectedItem;
        this.m_ChooseReadyFood = Other.m_ChooseReadyFood;
        this.m_CurSelectedItem = Other.m_CurSelectedItem;
        this.m_CurReadyItem = Other.m_CurReadyItem;
        this.m_CookReady = Other.m_CookReady;
        this.m_CurCategoryTagIndex = int(Other.m_CurCategoryTagIndex);
        this.m_CategoryTags = Other.m_CategoryTags;
        this.m_CookPropEntity = Other.m_CookPropEntity;
        this.m_bClosed = Other.m_bClosed;
        this.m_bReady = Other.m_bReady;
        this.m_bCanReady = Other.m_bCanReady;
        this.m_CookTipVisibility = Other.m_CookTipVisibility;
        this.m_ReadyFoodTipVisibility = Other.m_ReadyFoodTipVisibility;
        this.m_ReadyFoodPropBtnVisibility = Other.m_ReadyFoodPropBtnVisibility;
        return;
    }
    FVM_Cook opAssign(const FVM_Cook &inout Other)
    {
        FVM_Cook __r;
        this.m_CurrentCategoryItems = Other.m_CurrentCategoryItems;
        this.m_CurrentDisplayItems = Other.m_CurrentDisplayItems;
        this.m_AllCookCostFoodItems = Other.m_AllCookCostFoodItems;
        this.m_CategoryImages = Other.m_CategoryImages;
        this.m_PlayerInventory = Other.m_PlayerInventory;
        this.m_LastHoveredItem = Other.m_LastHoveredItem;
        this.m_LastSelectedItem = Other.m_LastSelectedItem;
        this.m_ChooseReadyFood = Other.m_ChooseReadyFood;
        this.m_CurSelectedItem = Other.m_CurSelectedItem;
        this.m_CurReadyItem = Other.m_CurReadyItem;
        this.m_CookReady = Other.m_CookReady;
        this.m_CurCategoryTagIndex = int(Other.m_CurCategoryTagIndex);
        this.m_CategoryTags = Other.m_CategoryTags;
        this.m_CookPropEntity = Other.m_CookPropEntity;
        this.m_bClosed = Other.m_bClosed;
        this.m_bReady = Other.m_bReady;
        this.m_bCanReady = Other.m_bCanReady;
        this.m_CookTipVisibility = Other.m_CookTipVisibility;
        this.m_ReadyFoodTipVisibility = Other.m_ReadyFoodTipVisibility;
        this.m_ReadyFoodPropBtnVisibility = Other.m_ReadyFoodPropBtnVisibility;
        return __r;
    }
    void PostConstruct()
    {
        this.SetbClosed(false);
        FECSEntity local_6 = this.GetContext().GetLocalPlayerPawn();
        Has local_10;
        bool local_1 = local_10.opCall();
        if (local_1)
        {
            FECSEntity local_6_2 = this.GetContext().GetLocalPlayerPawn();
            Get local_14;
            this.SetCookPropEntity(local_14.opCall().GetTargetEntity());
        }
        this.SetPlayerInventory(TEUIModelRef<FMS_PlayerInventory>(::FMS_PlayerInventory::Get(this.GetContext().Manager)));
        this.GetModify_CategoryTags().Add(GameplayTags::ItemCategory_Material_Cook);
        this.GetModify_CategoryTags().Add(GameplayTags::ItemCategory_Material_Cook_Animal);
        this.GetModify_CategoryTags().Add(GameplayTags::ItemCategory_Material_Cook_Sea);
        this.GetModify_CategoryTags().Add(GameplayTags::ItemCategory_Material_Cook_Vegetables);
        this.GetModify_CategoryTags().Add(GameplayTags::ItemCategory_Material_Cook_Condiment);
        this.SetCurCategoryTagIndex(0);
        this.GetModify_CategoryImages().Empty(0);
        int local_18 = 0;
        for (; local_18 < this.GetCategoryTags().Num(); ++local_18)
        {
            if (::CookSettings::Get().CookMainCategoryIcons.Num() > local_18)
            {
                TEUIModelRef<FVM_Image> local_24 = TEUIModelRef<FVM_Image>(::FVM_Image::Create(this.GetContext().Manager, ::CookSettings::Get().CookMainCategoryIcons[]));
                this.GetModify_CategoryImages().Add(local_24);
                continue;
            }
            FSoftBrush local_68;
            TEUIModelRef<FVM_Image> local_24_2 = TEUIModelRef<FVM_Image>(::FVM_Image::Create(this.GetContext().Manager, local_68));
            this.GetModify_CategoryImages().Add(local_24_2);
        }
        this.SetCookReady(TEUIModelRef<FVM_CookReady>(::FVM_CookReady::Create(this.GetContext().Manager)));
        this.RefreshItems();
        FECSEntity local_6_3 = this.GetContext().GetLocalPlayerPawn();
        bool local_1_2 = local_10.opCall();
        if (local_1_2)
        {
            Get local_74;
            this.OnCookPropChanged(local_74.opCall());
            TEUIModelRef<FVM_CookReady> local_70 = this.GetCookReady();
            this.GetCookPropEntity().SetCookPropEntity();
            TEUIModelRef<FVM_CookReady> local_70_2 = this.GetCookReady();
            local_74.opCall().OnCookPropChanged();
        }
        return;
    }
    void InvalidAllCookCostFoodItems()
    {
        int local_22 = 0;
        int local_28 = 0;
        int local_2 = this.GetAllCookCostFoodItems().Num();
        for (; local_2 < 4; )
        {
            FEUIModelContainer local_18;
            FM_ItemData& local_20 = ::FM_ItemData::Create(this.GetContext().Manager);
            TEUIModelRef<FM_ItemData> local_24 = TEUIModelRef<FM_ItemData>(local_20);
            local_18.AddModel(FEUIModelRef(local_22), false);
            TEUIModelWeakRef<FVM_Cook> local_30 = TEUIModelWeakRef<FVM_Cook>(this);
            TEUIModelRef<FM_ItemData> local_24_2 = TEUIModelRef<FM_ItemData>(local_20);
            local_18.AddModel(FEUIModelRef(local_28), false);
            this.GetModify_AllCookCostFoodItems().Add(local_18);
            ++local_2;
        }
        return;
    }
    bool bCookReadyButtonEnaled() const
    {
        return this.GetbCanReady();
    }
    ESlateVisibility GetNotReadyWindowVisibility() const
    {
        int local_2;
        if (!(this.GetbReady()))
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 2;
        }
        return ESlateVisibility(local_2);
    }
    void OnCookPropChanged(const FC_CookProp &inout CookProp)
    {
        int local_52 = 0;
        int local_58 = 0;
        if (!(CookProp))
        {
            this.SetbCanReady(false);
            this.GetModify_AllCookCostFoodItems().Empty(0);
            this.InvalidAllCookCostFoodItems();
            return;
        }
        if ((int(CookProp.GetCookState())) == 2)
        {
            this.SetbReady(true);
        }
        else
        {
            this.SetbReady(false);
        }
        this.SetbCanReady(CookProp.FoodCostReadyToCook());
        int local_5 = 0;
        this.GetModify_AllCookCostFoodItems().Empty(0);
        for (auto& local_20 : CookProp.GetCookPlayerDatas())
        {
            for (auto& local_34 : local_20.GetCookCostItems())
            {
                FEUIModelContainer local_48;
                FM_ItemData& local_50 = ::FM_ItemData::Create(this.GetContext().Manager);
                local_50.SetConfig(local_34.GetCookCostItem());
                local_50.SetNum(1);
                TEUIModelRef<FM_ItemData> local_54 = TEUIModelRef<FM_ItemData>(local_50);
                local_48.AddModel(FEUIModelRef(local_52), false);
                TEUIModelWeakRef<FVM_Cook> local_60 = TEUIModelWeakRef<FVM_Cook>(this);
                TEUIModelRef<FM_ItemData> local_54_2 = TEUIModelRef<FM_ItemData>(local_50);
                local_58.SetOwner(local_20.GetPlayerEntity());
                local_58.SetCookPropEntity(this.GetCookPropEntity());
                local_58.SetPushTime(local_34.GetPushTime());
                local_48.AddModel(FEUIModelRef(local_58), false);
                this.GetModify_AllCookCostFoodItems().Add(local_48);
            }
        }
        this.InvalidAllCookCostFoodItems();
        return;
    }
    void Tick()
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSEntity local_4_2 = this.GetContext().GetLocalPlayerPawn();
        Get local_14;
        this.SetCookPropEntity(local_14.opCall().GetTargetEntity());
        TEUIModelRef<FVM_CookReady> local_16 = this.GetCookReady();
        this.GetCookPropEntity().SetCookPropEntity();
        return;
    }
    void OnPlayerInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.RefreshItems();
        return;
    }
    void OnHoveredItemChanged()
    {
        this.DisposeCookTip();
        return;
    }
    void OnSelectedItemChanged()
    {
        this.DisposeCookTip();
        return;
    }
    void OnHoverReadyFoodChanged()
    {
        int local_9;
        if (!(this.GetChooseReadyFood().IsNull()))
        {
            TEUIModelRef<FM_ItemData> local_6;
            TEUIModelRef<FVM_WaitCookItem> local_2 = this.GetChooseReadyFood();
            local_6.GetItem();
            this.SetCurReadyItem(TEUIModelRef<FVM_Item>(::FVM_Item::Create(this.GetContext().Manager, local_6)));
            this.SetReadyFoodTipVisibility(ESlateVisibility(0));
            TEUIModelRef<FVM_WaitCookItem> local_2_2 = this.GetChooseReadyFood();
            if ((FECSEntity(GetOwner()) == this.GetContext().GetLocalPlayerPawn()))
            {
                local_9 = 0;
            }
            else
            {
                local_9 = 1;
            }
            this.SetReadyFoodPropBtnVisibility(ESlateVisibility(local_9));
            return;
        }
        this.SetCurReadyItem(TEUIModelRef<FVM_Item>(nullptr));
        this.SetReadyFoodTipVisibility(ESlateVisibility(1));
        this.SetReadyFoodPropBtnVisibility(ESlateVisibility(1));
        return;
    }
    void OnClickPushFood()
    {
        FFPTime local_10 = FFPTime(-1);
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        FECSEntity local_4_2 = this.GetContext().GetLocalPlayerPawn();
        FCE_PushCostFood local_14;
        Get local_18;
        local_14.CookPropEntity = local_18.opCall().GetTargetEntity();
        if (this.GetCurSelectedItem().IsValid())
        {
            TEUIModelRef<FVM_Item> local_20 = this.GetCurSelectedItem();
            local_14.FoodItem = GetItemConfig();
            TEUIModelRef<FVM_Item> local_20_2 = this.GetCurSelectedItem();
            local_14.ClientItemNum = GetNum();
        }
        return;
    }
    void OnClickCancelReadyFood()
    {
        int local_14 = 0;
        FFPTime local_10 = FFPTime(-1);
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        FECSEntity local_4_2 = this.GetContext().GetLocalPlayerPawn();
        Get local_18;
        local_14.CookPropEntity = local_18.opCall().GetTargetEntity();
        if (this.GetCurReadyItem().IsValid())
        {
            TEUIModelRef<FVM_Item> local_20 = this.GetCurReadyItem();
            local_14.FoodItem = GetItemConfig();
        }
        return;
    }
    void OnClickReady()
    {
        int local_30 = 0;
        Get local_6;
        const FC_CookProp& local_2 = local_6.opCall();
        if (local_2)
        {
            if (!(local_2.FoodCostReadyToCook()))
            {
                FCommonTipsParam local_16;
                ::CommonPopup::Tips(NSLOCTEXT("Cook", "Cook_Tips_NeedFourIngredients", "йЈџжќђжњЄж”ѕж»Ў"), local_16);
                return;
            }
        }
        FFPTime local_26 = FFPTime(-1);
        FECSEntity local_20 = this.GetContext().GetLocalPlayerPawn();
        FECSEntity local_20_2 = this.GetContext().GetLocalPlayerPawn();
        Get local_34;
        local_30.CookPropEntity = local_34.opCall().GetTargetEntity();
        return;
    }
    void OnReceivedCookFinisehd(const FCE_CookFinisehd &inout Event)
    {
        if ((!((FECSEntity(Event.Sender) == this.GetContext().GetLocalPlayerPawn()))))
        {
            return;
        }
        if (!(Event.bSuccess))
        {
            FCommonTipsParam local_18;
            ::CommonPopup::Tips(NSLOCTEXT("Cook", "Cook_CookFailed", "еЃљйҐ­е¤±иґҐ !"), local_18);
            Remove local_22;
            local_22.opCall();
            this.SetbClosed(true);
        }
        return;
    }
    void OnSelectCategory(const int Index)
    {
        if (Index >= 0 && (Index < this.GetCategoryTags().Num()))
        {
            this.SetCurCategoryTagIndex(Index);
            this.RefreshItems();
        }
        return;
    }
    void OnClickEsc()
    {
        Has local_4;
        Get local_10;
        if (local_4.opCall() && (int(local_10.opCall().GetCookState()) != 0))
        {
            FCommonTipsParam local_22;
            ::CommonPopup::Tips(NSLOCTEXT("Cook", "Cook_Tips_CannotExit", "еЂ’и®Ўж—¶дё­ж— жі•йЂЂе‡є"), local_22);
            return;
        }
        FDialogModelCallback local_48;
        local_48.Bind(this, FVM_Cook::OnComfirmExit);
        FText local_18 = NSLOCTEXT("Cook", "CookESCCancle", "иї”е›ћ");
        FText local_52 = NSLOCTEXT("Cook", "CookESCConfirm", "зЎ®и®¤");
        FDialogCallback local_84 = FDialogCallback(local_48);
        FText local_88 = NSLOCTEXT("Cook", "CookESCMessage", "жЇеђ¦зЎ®и®¤йЂЂе‡єзѓ№йҐЄ?");
        FText local_92 = NSLOCTEXT("Cook", "CookESCTitle", "жЏђз¤є");
        FCommonDialogParam local_94;
        ::CommonPopup::Dialog_Decision(local_92, local_88, local_84, local_52, local_18, local_94);
        return;
    }
    bool OnComfirmExit(const FCommonDialogAnswer &inout Answer)
    {
        int local_16 = 0;
        if (int(Answer.AnswerType) == 1)
        {
            FFPTime local_14 = FFPTime(-1);
            FECSEntity local_8 = this.GetContext().GetLocalPlayerPawn();
            local_16.CookPropEntity = this.GetCookPropEntity();
            Remove local_20;
            local_20.opCall();
            this.SetbClosed(true);
        }
        return true;
    }
    ESlateVisibility GetCookTipVisibilityVM() const
    {
        return this.GetCookTipVisibility();
    }
    ESlateVisibility GetReadyFoodTipVisibilityVM() const
    {
        return this.GetReadyFoodTipVisibility();
    }
    ESlateVisibility GetReadyFoodPropBtnVisibilityVM() const
    {
        return this.GetReadyFoodPropBtnVisibility();
    }
    ESlateVisibility GetReadyButtonVisibility() const
    {
        int local_31;
        Get local_6;
        const FC_CookProp& local_2 = local_6.opCall();
        if (local_2)
        {
            for (auto& local_22 : local_2.GetCookPlayerDatas())
            {
                if ((FECSEntity(local_22.GetPlayerEntity()) == this.GetContext().GetLocalPlayerPawn()))
                {
                    if (local_22.GetbPlayerReady())
                    {
                        local_31 = 1;
                    }
                    else
                    {
                        local_31 = 0;
                    }
                    return ESlateVisibility(local_31);
                }
            }
        }
        return ESlateVisibility(1);
    }
    ESlateVisibility GetReadyTextInfoVisibility() const
    {
        int local_32;
        bool local_1 = false;
        Get local_8;
        const FC_CookProp& local_4 = local_8.opCall();
        if (local_4)
        {
            for (auto& local_22 : local_4.GetCookPlayerDatas())
            {
                if ((FECSEntity(local_22.GetPlayerEntity()) == this.GetContext().GetLocalPlayerPawn()) && local_22.GetbPlayerReady())
                {
                    local_1 = true;
                }
            }
        }
        if (local_1)
        {
            local_32 = 0;
        }
        else
        {
            local_32 = 1;
        }
        return ESlateVisibility(local_32);
    }
    int GetReadySwitch() const
    {
        Get local_6;
        const FC_CookProp& local_2 = local_6.opCall();
        if (local_2)
        {
            if (local_2.AllBeReady())
            {
                return 1;
            }
        }
        return 0;
    }
    FText GetReadyTextInfo() const
    {
        int local_1 = 0;
        int local_3 = 0;
        Get local_10;
        const FC_CookProp& local_6 = local_10.opCall();
        if (local_6)
        {
            for (auto& local_26 : local_6.GetCookPlayerDatas())
            {
                if (local_26.GetPlayerEntity().IsValid())
                {
                    local_3 = local_3 + 1;
                    if (local_26.GetbPlayerReady())
                    {
                        local_1 = local_1 + 1;
                    }
                }
            }
        }
        return FText::Format(NSLOCTEXT("Cook", "Cook_ReadyTextInfo", "з­‰еѕ…е…¶д»–дєєе‡†е¤‡{0}/{1}"), local_1, local_3);
    }
    TEUIModelRef<FVM_Image> GetCurCategory() const
    {
        return this.GetCategoryImages()[this.GetCurCategoryTagIndex()];
    }
    void DisposeCookTip()
    {
        TEUIModelRef<FVM_CookCostItem> local_2 = TEUIModelRef<FVM_CookCostItem>(nullptr);
        if (!(this.GetLastHoveredItem().IsNull()))
        {
            local_2 = this.GetLastHoveredItem();
        }
        else
        {
            if (!(this.GetLastSelectedItem().IsNull()))
            {
                local_2 = this.GetLastSelectedItem();
            }
        }
        if (!(local_2.IsNull()))
        {
            TEUIModelRef<FM_ItemData> local_8;
            local_8.GetItem();
            this.SetCurSelectedItem(TEUIModelRef<FVM_Item>(::FVM_Item::Create(this.GetContext().Manager, local_8)));
            this.SetCookTipVisibility(ESlateVisibility(0));
        }
        else
        {
            this.SetCurSelectedItem(TEUIModelRef<FVM_Item>(nullptr));
            this.SetCookTipVisibility(ESlateVisibility(1));
        }
        return;
    }
    void RefreshItems()
    {
        this.GetModify_CurrentCategoryItems().Empty(0);
        int local_1 = this.GetCurCategoryTagIndex();
        TEUIModelRef<FMS_PlayerInventory> local_4 = this.GetPlayerInventory();
        TArray<TEUIModelRef<FM_ItemData>> local_8;
        local_8.GetAllItemsByCategory(this.GetCategoryTags()[local_1]);
        for (auto local_24 : local_8)
        {
            this.GetModify_CurrentCategoryItems().Add(local_24);
        }
        this.GetModify_CurrentDisplayItems().Empty(0);
        TArray<TEUIModelRef<FM_ItemData>> local_30 = this.GetCurrentCategoryItems();
        for (auto local_24 : local_30)
        {
            TEUIModelRef<FVM_CookCostItem> local_46 = TEUIModelRef<FVM_CookCostItem>(::FVM_CookCostItem::Create(this.GetContext().Manager, local_24, (TEUIModelWeakRef<FVM_Cook>(this))));
            this.GetModify_CurrentDisplayItems().Add(local_46);
        }
        for (auto& local_62 : this.GetModify_CurrentDisplayItems())
        {
            local_62;
            SetPushReadyItemNum();
        }
        return;
    }
    const TArray<TEUIModelRef<FM_ItemData>> GetCurrentCategoryItems() const property
    {
        const TArray<TEUIModelRef<FM_ItemData>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FM_ItemData>> GetModify_CurrentCategoryItems() property
    {
        TArray<TEUIModelRef<FM_ItemData>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCurrentCategoryItems(const TArray<TEUIModelRef<FM_ItemData>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentCategoryItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CookCostItem>> GetCurrentDisplayItems() const property
    {
        const TArray<TEUIModelRef<FVM_CookCostItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CookCostItem>> GetModify_CurrentDisplayItems() property
    {
        TArray<TEUIModelRef<FVM_CookCostItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCurrentDisplayItems(const TArray<TEUIModelRef<FVM_CookCostItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentDisplayItems = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetAllCookCostFoodItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_AllCookCostFoodItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAllCookCostFoodItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AllCookCostFoodItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_Image>> GetCategoryImages() const property
    {
        const TArray<TEUIModelRef<FVM_Image>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_Image>> GetModify_CategoryImages() property
    {
        TArray<TEUIModelRef<FVM_Image>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCategoryImages(const TArray<TEUIModelRef<FVM_Image>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CategoryImages = __Value;
        return;
    }
    TEUIModelRef<FMS_PlayerInventory> GetPlayerInventory() const property
    {
        this.TrackPropertyRead(4);
        return this.m_PlayerInventory;
    }
    void SetPlayerInventory(const TEUIModelRef<FMS_PlayerInventory> &inout __Value) property
    {
        TEUIModelRef<FMS_PlayerInventory> local_2;
        local_2 = this.m_PlayerInventory;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PlayerInventory = __Value;
        return;
    }
    TEUIModelRef<FVM_CookCostItem> GetLastHoveredItem() const property
    {
        this.TrackPropertyRead(5);
        return this.m_LastHoveredItem;
    }
    void SetLastHoveredItem(const TEUIModelRef<FVM_CookCostItem> &inout __Value) property
    {
        TEUIModelRef<FVM_CookCostItem> local_2;
        local_2 = this.m_LastHoveredItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_LastHoveredItem = __Value;
        return;
    }
    TEUIModelRef<FVM_CookCostItem> GetLastSelectedItem() const property
    {
        this.TrackPropertyRead(6);
        return this.m_LastSelectedItem;
    }
    void SetLastSelectedItem(const TEUIModelRef<FVM_CookCostItem> &inout __Value) property
    {
        TEUIModelRef<FVM_CookCostItem> local_2;
        local_2 = this.m_LastSelectedItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_LastSelectedItem = __Value;
        return;
    }
    TEUIModelRef<FVM_WaitCookItem> GetChooseReadyFood() const property
    {
        this.TrackPropertyRead(7);
        return this.m_ChooseReadyFood;
    }
    void SetChooseReadyFood(const TEUIModelRef<FVM_WaitCookItem> &inout __Value) property
    {
        TEUIModelRef<FVM_WaitCookItem> local_2;
        local_2 = this.m_ChooseReadyFood;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ChooseReadyFood = __Value;
        return;
    }
    TEUIModelRef<FVM_Item> GetCurSelectedItem() const property
    {
        this.TrackPropertyRead(8);
        return this.m_CurSelectedItem;
    }
    void SetCurSelectedItem(const TEUIModelRef<FVM_Item> &inout __Value) property
    {
        TEUIModelRef<FVM_Item> local_2;
        local_2 = this.m_CurSelectedItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CurSelectedItem = __Value;
        return;
    }
    TEUIModelRef<FVM_Item> GetCurReadyItem() const property
    {
        this.TrackPropertyRead(9);
        return this.m_CurReadyItem;
    }
    void SetCurReadyItem(const TEUIModelRef<FVM_Item> &inout __Value) property
    {
        TEUIModelRef<FVM_Item> local_2;
        local_2 = this.m_CurReadyItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_CurReadyItem = __Value;
        return;
    }
    TEUIModelRef<FVM_CookReady> GetCookReady() const property
    {
        this.TrackPropertyRead(10);
        return this.m_CookReady;
    }
    void SetCookReady(const TEUIModelRef<FVM_CookReady> &inout __Value) property
    {
        TEUIModelRef<FVM_CookReady> local_2;
        local_2 = this.m_CookReady;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_CookReady = __Value;
        return;
    }
    int GetCurCategoryTagIndex() const property
    {
        this.TrackPropertyRead(11);
        return this.m_CurCategoryTagIndex;
    }
    void SetCurCategoryTagIndex(const int __Value) property
    {
        if (this.m_CurCategoryTagIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_CurCategoryTagIndex = __Value;
        return;
    }
    const TArray<FGameplayTag> GetCategoryTags() const property
    {
        const TArray<FGameplayTag> __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    TArray<FGameplayTag> GetModify_CategoryTags() property
    {
        TArray<FGameplayTag> __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetCategoryTags(const TArray<FGameplayTag> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_CategoryTags = __Value;
        return;
    }
    const FECSEntity GetCookPropEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FECSEntity GetModify_CookPropEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetCookPropEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_CookPropEntity = __Value;
        return;
    }
    bool GetbClosed() const property
    {
        this.TrackPropertyRead(14);
        return this.m_bClosed;
    }
    void SetbClosed(const bool __Value) property
    {
        if (!(this.m_bClosed) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_bClosed = __Value;
        return;
    }
    bool GetbReady() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bReady;
    }
    void SetbReady(const bool __Value) property
    {
        if (!(this.m_bReady) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bReady = __Value;
        return;
    }
    bool GetbCanReady() const property
    {
        this.TrackPropertyRead(16);
        return this.m_bCanReady;
    }
    void SetbCanReady(const bool __Value) property
    {
        if (!(this.m_bCanReady) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_bCanReady = __Value;
        return;
    }
    ESlateVisibility GetCookTipVisibility() const property
    {
        this.TrackPropertyRead(17);
        return this.m_CookTipVisibility;
    }
    void SetCookTipVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_CookTipVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_CookTipVisibility = __Value;
        return;
    }
    ESlateVisibility GetReadyFoodTipVisibility() const property
    {
        this.TrackPropertyRead(18);
        return this.m_ReadyFoodTipVisibility;
    }
    void SetReadyFoodTipVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_ReadyFoodTipVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_ReadyFoodTipVisibility = __Value;
        return;
    }
    ESlateVisibility GetReadyFoodPropBtnVisibility() const property
    {
        this.TrackPropertyRead(19);
        return this.m_ReadyFoodPropBtnVisibility;
    }
    void SetReadyFoodPropBtnVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_ReadyFoodPropBtnVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_ReadyFoodPropBtnVisibility = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_InGame_Cook_VM_Cook_157
{
    __Lambda_UI_Private_ViewModel_InGame_Cook_VM_Cook_157()
    {
        return;
    }
    bool opCall(const FEUIModelContainer &inout A, const FEUIModelContainer &inout B)
    {
        return (FFPTime(FEUIModelContainer::GetModel(A).opCall().GetPushTime()).opCmp(FEUIModelContainer::GetModel(B).opCall().GetPushTime()) <= 0);
    }
}

struct __Lambda_UI_Private_ViewModel_InGame_Cook_VM_Cook_430
{
    __Lambda_UI_Private_ViewModel_InGame_Cook_VM_Cook_430()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FVM_CookCostItem> &inout A, const TEUIModelRef<FVM_CookCostItem> &inout B)
    {
        TEUIModelRef<FM_ItemData> local_4;
        local_4.GetItem();
        EItemRarity local_5;
        EItemRarity local_1 = local_5;
        local_4.GetItem();
        EItemRarity local_6 = local_5;
        if (int(local_1) == int(local_6))
        {
            local_4.GetItem();
            TDataObjectPtr<FItemConfig> local_34 = GetConfig();
            local_4.GetItem();
            if ((local_34 == GetConfig().opImplConv()))
            {
                local_4.GetItem();
                int local_7 = GetNum();
                TEUIModelRef<FM_ItemData> local_108;
                local_108.GetItem();
                return (local_7 > GetNum());
            }
        }
        return (int(local_1) > int(local_6));
    }
}

struct __GeneratedProperties_FVM_Cook
{
    UPROPERTY()
    bool bCookReadyButtonEnaled;
    UPROPERTY()
    ESlateVisibility NotReadyWindowVisibility;
    UPROPERTY()
    ESlateVisibility CookTipVisibilityVM;
    UPROPERTY()
    ESlateVisibility ReadyFoodTipVisibilityVM;
    UPROPERTY()
    ESlateVisibility ReadyFoodPropBtnVisibilityVM;
    UPROPERTY()
    ESlateVisibility ReadyButtonVisibility;
    UPROPERTY()
    ESlateVisibility ReadyTextInfoVisibility;
    UPROPERTY()
    int ReadySwitch;
    UPROPERTY()
    FText ReadyTextInfo;
    UPROPERTY()
    TEUIModelRef<FVM_Image> CurCategory;
    UPROPERTY()
    TEUIModelRef<FVM_Cook> Self;


}

namespace FVM_Cook
{
FVM_Cook& Create(const UObject ContextObject)
{
    return FVM_Cook::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Cook CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Cook __r;
    TEUIModelRef<FVM_Cook> local_6 = TEUIModelRef<FVM_Cook>(EUIInternal::MakeModelWithManager(Manager, FVM_Cook::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrentDisplayItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CookCostItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AllCookCostFoodItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CategoryImages";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_Image>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurSelectedItem";
    local_14.TypeName = "TEUIModelRef<FVM_Item>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurReadyItem";
    local_14.TypeName = "TEUIModelRef<FVM_Item>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CookReady";
    local_14.TypeName = "TEUIModelRef<FVM_CookReady>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCookReadyButtonEnaled";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NotReadyWindowVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CookTipVisibilityVM";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReadyFoodTipVisibilityVM";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReadyFoodPropBtnVisibilityVM";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReadyButtonVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReadyTextInfoVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReadySwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReadyTextInfo";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurCategory";
    local_14.TypeName = "TEUIModelRef<FVM_Image>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Cook>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Cook;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnCookPropChanged";
    local_26.ComponentType = FC_CookProp;
    local_26.MonitorPropertyName = FName("CookPropEntity");
    int local_2_2 = FVM_Cook::__IndexOf_CookPropEntity();
    Result.MonitorFunctions.Add(local_26);
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelMsgHandleDefine local_40;
    local_40.FunctionName = "__OnPlayerInventoryChanged";
    local_40.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_40.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_40);
    FEUIModelDirtyDefine local_52;
    local_52.FunctionName = "__OnHoveredItemChanged";
    local_52.DirtyFlags.Set(FVM_Cook::__IndexOf_LastHoveredItem());
    Result.DirtyFunctions.Add(local_52);
    local_52.FunctionName = "__OnSelectedItemChanged";
    local_52.DirtyFlags.Set(FVM_Cook::__IndexOf_LastSelectedItem());
    Result.DirtyFunctions.Add(local_52);
    local_52.FunctionName = "__OnHoverReadyFoodChanged";
    local_52.DirtyFlags.Set(FVM_Cook::__IndexOf_ChooseReadyFood());
    Result.DirtyFunctions.Add(local_52);
    FEUIModelEventDefine local_58;
    local_58.FunctionName = "__OnReceivedCookFinisehd";
    local_58.EventType = FCE_CookFinisehd;
    Result.EventFunctions.Add(local_58);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Cook;
}
void __OnCookPropChanged(FVM_Cook &inout Model, const FECSEntity &inout Entity, const FC_CookProp &inout Component)
{
    Model.OnCookPropChanged(Component);
    return;
}
void __Tick(FVM_Cook &inout Model)
{
    Model.Tick();
    return;
}
void __OnPlayerInventoryChanged(FVM_Cook &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnPlayerInventoryChanged(Message);
    return;
}
void __OnHoveredItemChanged(FVM_Cook &inout Model)
{
    Model.OnHoveredItemChanged();
    return;
}
void __OnSelectedItemChanged(FVM_Cook &inout Model)
{
    Model.OnSelectedItemChanged();
    return;
}
void __OnHoverReadyFoodChanged(FVM_Cook &inout Model)
{
    Model.OnHoverReadyFoodChanged();
    return;
}
void __OnReceivedCookFinisehd(FVM_Cook &inout Model, const FCE_CookFinisehd &inout Event)
{
    Model.OnReceivedCookFinisehd(Event);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<TEUIModelRef<FVM_CookCostItem>> __UIGetter_CurrentDisplayItems(const FVM_Cook &inout Model)
{
    return Model.GetCurrentDisplayItems();
}
TArray<FEUIModelContainer> __UIGetter_AllCookCostFoodItems(const FVM_Cook &inout Model)
{
    return Model.GetAllCookCostFoodItems();
}
TArray<TEUIModelRef<FVM_Image>> __UIGetter_CategoryImages(const FVM_Cook &inout Model)
{
    return Model.GetCategoryImages();
}
TEUIModelRef<FVM_Item> __UIGetter_CurSelectedItem(const FVM_Cook &inout Model)
{
    return Model.GetCurSelectedItem();
}
TEUIModelRef<FVM_Item> __UIGetter_CurReadyItem(const FVM_Cook &inout Model)
{
    return Model.GetCurReadyItem();
}
TEUIModelRef<FVM_CookReady> __UIGetter_CookReady(const FVM_Cook &inout Model)
{
    return Model.GetCookReady();
}
bool __UIGetter_bCookReadyButtonEnaled(const FVM_Cook &inout Model)
{
    return Model.bCookReadyButtonEnaled();
}
ESlateVisibility __UIGetter_NotReadyWindowVisibility(const FVM_Cook &inout Model)
{
    return Model.GetNotReadyWindowVisibility();
}
ESlateVisibility __UIGetter_CookTipVisibilityVM(const FVM_Cook &inout Model)
{
    return Model.GetCookTipVisibilityVM();
}
ESlateVisibility __UIGetter_ReadyFoodTipVisibilityVM(const FVM_Cook &inout Model)
{
    return Model.GetReadyFoodTipVisibilityVM();
}
ESlateVisibility __UIGetter_ReadyFoodPropBtnVisibilityVM(const FVM_Cook &inout Model)
{
    return Model.GetReadyFoodPropBtnVisibilityVM();
}
ESlateVisibility __UIGetter_ReadyButtonVisibility(const FVM_Cook &inout Model)
{
    return Model.GetReadyButtonVisibility();
}
ESlateVisibility __UIGetter_ReadyTextInfoVisibility(const FVM_Cook &inout Model)
{
    return Model.GetReadyTextInfoVisibility();
}
int __UIGetter_ReadySwitch(const FVM_Cook &inout Model)
{
    return Model.GetReadySwitch();
}
FText __UIGetter_ReadyTextInfo(const FVM_Cook &inout Model)
{
    return Model.GetReadyTextInfo();
}
TEUIModelRef<FVM_Image> __UIGetter_CurCategory(const FVM_Cook &inout Model)
{
    return Model.GetCurCategory();
}
TEUIModelRef<FVM_Cook> __UIGetter_Self(const FVM_Cook &inout Model)
{
    return TEUIModelRef<FVM_Cook>(Model);
}
int __IndexOf_CurrentCategoryItems()
{
    return 0;
}
int __IndexOf_CurrentDisplayItems()
{
    return 1;
}
int __IndexOf_AllCookCostFoodItems()
{
    return 2;
}
int __IndexOf_CategoryImages()
{
    return 3;
}
int __IndexOf_PlayerInventory()
{
    return 4;
}
int __IndexOf_LastHoveredItem()
{
    return 5;
}
int __IndexOf_LastSelectedItem()
{
    return 6;
}
int __IndexOf_ChooseReadyFood()
{
    return 7;
}
int __IndexOf_CurSelectedItem()
{
    return 8;
}
int __IndexOf_CurReadyItem()
{
    return 9;
}
int __IndexOf_CookReady()
{
    return 10;
}
int __IndexOf_CurCategoryTagIndex()
{
    return 11;
}
int __IndexOf_CategoryTags()
{
    return 12;
}
int __IndexOf_CookPropEntity()
{
    return 13;
}
int __IndexOf_bClosed()
{
    return 14;
}
int __IndexOf_bReady()
{
    return 15;
}
int __IndexOf_bCanReady()
{
    return 16;
}
int __IndexOf_CookTipVisibility()
{
    return 17;
}
int __IndexOf_ReadyFoodTipVisibility()
{
    return 18;
}
int __IndexOf_ReadyFoodPropBtnVisibility()
{
    return 19;
}
}
namespace __GeneratedProperties_FVM_Cook
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
