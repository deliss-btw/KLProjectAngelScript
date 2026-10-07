
namespace UWidget_SwordSkillResource
{
    const int ViewID = 0;
}
namespace UWidget_SwordSkillResourceItem
{
    const int ViewID = 0;
}
namespace UWidget_SwordSkillResourcePoint
{
    const int ViewID = 0;
}
namespace UWidget_WizardSkillResource
{
    const int ViewID = 0;
}
namespace UWidget_WizardSkillResourceStarItem
{
    const int ViewID = 0;
}
namespace UWidget_GramherSkillResource
{
    const int ViewID = 0;
}
namespace UWidget_GramherSkillResourceItem
{
    const int ViewID = 0;
}
namespace UWidget_SuiXiSkillResource
{
    const int ViewID = 0;
}
namespace UWidget_QiongSkillResourceItem
{
    const int ViewID = 0;
}
namespace UWidget_QiongSkillResource
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_SwordSkillResource : UEUIUserWidget
{
    UPROPERTY()
    UWidget_SkillResAnimCache AnimCache;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SwordSkillResource> SkillResource;
    UPROPERTY()
    UWidgetAnimation Anim_Charging;
    UPROPERTY()
    UWidgetAnimation Anim_Charging_Out;
    UPROPERTY()
    UWidgetAnimation Anim_Charging2;
    UPROPERTY()
    UWidgetAnimation Anim_Charging3;
    UPROPERTY()
    UWidgetAnimation Anim_Charging2_3_Out;
    FEUIModelWeakRef __SkillResource;
    UPROPERTY()
    FGetEUIModelRef SkillResourceDelegate;

    UWidget_SwordSkillResource()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.AnimCache == nullptr)
        {
            this.AnimCache = Cast<UWidget_SkillResAnimCache>(NewObject(this, UWidget_SkillResAnimCache, NAME_None, false));
            this.AnimCache.Init(this);
        }
        return;
    }
    UFUNCTION()
    void HandleActualVisibleStateChanged_Implementation(const bool bVisible)
    {
        this.AnimCache.OnOwnerVisibilityChanged(bVisible);
        return;
    }
    UFUNCTION()
    void OnSuperSwitchChanged(const int SuperSwitch)
    {
        if (SuperSwitch == 1)
        {
            this.AnimCache.Play(this.Anim_Charging);
            this.AnimCache.Stop(this.Anim_Charging_Out);
            return;
        }
        this.AnimCache.Play(this.Anim_Charging_Out);
        this.AnimCache.Stop(this.Anim_Charging);
        return;
    }
    UFUNCTION()
    void OnSecondSlotFullChanged(const bool bFull)
    {
        bool local_4;
        if (GetFoundationIndex() != 2)
        {
            return;
        }
        local_4 = GetbLastSecondSlotFull();
        if ((!(local_4) && bFull))
        {
            this.AnimCache.Play(this.Anim_Charging2);
            return;
        }
        if (local_4 && !(bFull))
        {
            this.AnimCache.Play(this.Anim_Charging2_3_Out);
            return;
        }
        if (!(local_4) && !(bFull))
        {
            this.StopAnimation(this.Anim_Charging2);
            this.PlayAnimation(this.Anim_Charging2_3_Out, this.Anim_Charging2_3_Out.GetEndTime(), 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        return;
    }
    UFUNCTION()
    void OnFourthSlotFullChanged(const bool bFull)
    {
        bool local_4;
        if (GetFoundationIndex() != 2)
        {
            return;
        }
        local_4 = GetbLastFourthSlotFull();
        if ((!(local_4) && bFull))
        {
            this.AnimCache.Play(this.Anim_Charging3);
            return;
        }
        if (local_4 && !(bFull))
        {
            this.AnimCache.Play(this.Anim_Charging2);
            return;
        }
        if (!(local_4) && !(bFull))
        {
            this.StopAnimation(this.Anim_Charging2);
            this.StopAnimation(this.Anim_Charging3);
        }
        return;
    }
    UFUNCTION()
    TEUIModelRef<FVM_SwordSkillResourcePoint> SkillResource_ResourcePoint() const
    {
        FVM_SwordSkillResource& local_2;
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_10;
        if (local_2)
        {
            local_10 = local_2.GetResourcePoint();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_SwordSkillResourcePoint>();
        }
        return local_10;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> SkillResource_CurrentResourceItems() const
    {
        FVM_SwordSkillResource& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCurrentResourceItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_SwordSkillResource& local_6;
        TEUIModelRef<FVM_SwordSkillResource> local_2 = this.SkillResource.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SwordSkillResource::__IndexOf_SuperSwitch());
                }
                if (local_6)
                {
                    this.OnSuperSwitchChanged(local_6.GetSuperSwitch());
                }
                break;
            }
            case 1:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SwordSkillResource::__IndexOf_bSecondSlotFull());
                }
                if (local_6)
                {
                    this.OnSecondSlotFullChanged(local_6.GetbSecondSlotFull());
                }
                break;
            }
            case 2:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SwordSkillResource::__IndexOf_bFourthSlotFull());
                }
                if (local_6)
                {
                    this.OnFourthSlotFullChanged(local_6.GetbFourthSlotFull());
                }
            }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnSuperSwitchChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnSecondSlotFullChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnFourthSlotFullChanged");
            }
            return;
        }
        this.__SkillResource = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillResource.Initialize(this, FName("VM_SwordSkillResource"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillResourceDelegate.IsBound())
        {
            this.SkillResource.SetRef(this.SkillResourceDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_SwordSkillResourceItem : UEUIUserWidget
{
    UPROPERTY()
    UWidget_SkillResAnimCache AnimCache;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SwordSkillResourceItem> ResourceItem;
    UPROPERTY()
    UWidgetAnimation Anim_FullyCharged;
    UPROPERTY()
    UWidgetAnimation Anim_Consume;
    FEUIModelWeakRef __ResourceItem;
    UPROPERTY()
    FGetEUIModelRef ResourceItemDelegate;

    UWidget_SwordSkillResourceItem()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.AnimCache == nullptr)
        {
            this.AnimCache = Cast<UWidget_SkillResAnimCache>(NewObject(this, UWidget_SkillResAnimCache, NAME_None, false));
            this.AnimCache.Init(this);
        }
        return;
    }
    UFUNCTION()
    void HandleActualVisibleStateChanged_Implementation(const bool bVisible)
    {
        this.AnimCache.OnOwnerVisibilityChanged(bVisible);
        return;
    }
    UFUNCTION()
    void OnItemPercentChanged(const float32 Percent)
    {
        float32 local_1 = GetLastPercent();
        if (((local_1 < 1.0f && (Percent >= 1.0f))) || (local_1 == Percent && (Percent >= 1.0f)))
        {
            this.AnimCache.Play(this.Anim_FullyCharged);
            return;
        }
        if (((local_1 >= 1.0f && (Percent < 1.0f))) || (local_1 == Percent && (Percent < 1.0f)))
        {
            this.AnimCache.Stop(this.Anim_FullyCharged);
            this.AnimCache.Play(this.Anim_Consume);
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_SwordSkillResourceItem& local_6;
        TEUIModelRef<FVM_SwordSkillResourceItem> local_2 = this.ResourceItem.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.ResourceItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_SwordSkillResourceItem::__IndexOf_Percent());
                    }
                    if (local_6)
                    {
                        this.OnItemPercentChanged(local_6.GetPercent());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnItemPercentChanged");
            }
            return;
        }
        this.__ResourceItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ResourceItem.Initialize(this, FName("VM_SwordSkillResourceItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ResourceItemDelegate.IsBound())
        {
            this.ResourceItem.SetRef(this.ResourceItemDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_SwordSkillResourcePoint : UEUIUserWidget
{
    UPROPERTY()
    UWidget_SkillResAnimCache AnimCache;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SwordSkillResourcePoint> ResourcePoint;
    UPROPERTY()
    UWidgetAnimation Anim_Consume;
    FEUIModelWeakRef __ResourcePoint;
    UPROPERTY()
    FGetEUIModelRef ResourcePointDelegate;

    UWidget_SwordSkillResourcePoint()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.AnimCache == nullptr)
        {
            this.AnimCache = Cast<UWidget_SkillResAnimCache>(NewObject(this, UWidget_SkillResAnimCache, NAME_None, false));
            this.AnimCache.Init(this);
        }
        return;
    }
    UFUNCTION()
    void HandleActualVisibleStateChanged_Implementation(const bool bVisible)
    {
        this.AnimCache.OnOwnerVisibilityChanged(bVisible);
        return;
    }
    UFUNCTION()
    void OnPointPercentChanged(const float32 ResourcePointPercent)
    {
        bool local_4;
        float32 local_1 = GetLastResourcePointPercent();
        float32 local_3 = GetConsumeAnimChangeThreshold();
        local_4 = GetbInverseAnimPlay();
        if (!(local_4) && (((local_1 - ResourcePointPercent) > local_3)))
        {
            this.AnimCache.Play(this.Anim_Consume);
            return;
        }
        if (local_4 && (((local_1 - ResourcePointPercent) < local_3)))
        {
            this.AnimCache.Play(this.Anim_Consume);
        }
        return;
    }
    UFUNCTION()
    void OnPointVisibleChanged(const bool bVisible)
    {
        int local_1;
        if (bVisible)
        {
            int local_2;
            local_2 = 4;
            local_1 = local_2;
        }
        else
        {
            int local_2;
            local_2 = 2;
            local_1 = local_2;
        }
        this.SetVisibility(ESlateVisibility(local_1));
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_SwordSkillResourcePoint& local_6;
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_2 = this.ResourcePoint.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.ResourcePoint.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_SwordSkillResourcePoint::__IndexOf_ResourcePointPercent());
                    }
                    if (local_6)
                    {
                        this.OnPointPercentChanged(local_6.GetResourcePointPercent());
                    }
                    this.ResourcePoint.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_SwordSkillResourcePoint::__IndexOf_bPointVisible());
                    }
                    if (local_6)
                    {
                        this.OnPointVisibleChanged(local_6.GetbPointVisible());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnPointPercentChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnPointVisibleChanged");
            }
            return;
        }
        this.__ResourcePoint = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ResourcePoint.Initialize(this, FName("VM_SwordSkillResourcePoint"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ResourcePointDelegate.IsBound())
        {
            this.ResourcePoint.SetRef(this.ResourcePointDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_WizardSkillResource : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WizardSkillResource> SkillResource;
    UPROPERTY()
    FGetEUIModelRef SkillResourceDelegate;

    UWidget_WizardSkillResource()
    {
        return;
    }
    UFUNCTION()
    TEUIModelRef<FVM_SwordSkillResourcePoint> SkillResource_ResourcePointer() const
    {
        FVM_WizardSkillResource& local_2;
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_10;
        if (local_2)
        {
            local_10 = local_2.GetResourcePointer();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_SwordSkillResourcePoint>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_WizardSkillResourceStarItem> SkillResource_Star0() const
    {
        FVM_WizardSkillResource& local_2;
        TEUIModelRef<FVM_WizardSkillResourceStarItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetStar0();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_WizardSkillResourceStarItem>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_WizardSkillResourceStarItem> SkillResource_Star1() const
    {
        FVM_WizardSkillResource& local_2;
        TEUIModelRef<FVM_WizardSkillResourceStarItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetStar1();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_WizardSkillResourceStarItem>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_WizardSkillResourceStarItem> SkillResource_Star2() const
    {
        FVM_WizardSkillResource& local_2;
        TEUIModelRef<FVM_WizardSkillResourceStarItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetStar2();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_WizardSkillResourceStarItem>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_WizardSkillResourceStarItem> SkillResource_Star3() const
    {
        FVM_WizardSkillResource& local_2;
        TEUIModelRef<FVM_WizardSkillResourceStarItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetStar3();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_WizardSkillResourceStarItem>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_WizardSkillResourceStarItem> SkillResource_Star4() const
    {
        FVM_WizardSkillResource& local_2;
        TEUIModelRef<FVM_WizardSkillResourceStarItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetStar4();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_WizardSkillResourceStarItem>();
        }
        return local_10;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillResource.Initialize(this, FName("VM_WizardSkillResource"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillResourceDelegate.IsBound())
        {
            this.SkillResource.SetRef(this.SkillResourceDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_WizardSkillResourceStarItem : UEUIUserWidget
{
    UPROPERTY()
    UWidget_SkillResAnimCache AnimCache;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WizardSkillResourceStarItem> ResourceItem;
    UPROPERTY()
    UWidgetAnimation Anim_Release;
    UPROPERTY()
    UWidgetAnimation Anim_Release_Free;
    UPROPERTY()
    UWidgetAnimation Anim_Release_Free_out;
    FEUIModelWeakRef __ResourceItem;
    UPROPERTY()
    FGetEUIModelRef ResourceItemDelegate;

    UWidget_WizardSkillResourceStarItem()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.AnimCache == nullptr)
        {
            this.AnimCache = Cast<UWidget_SkillResAnimCache>(NewObject(this, UWidget_SkillResAnimCache, NAME_None, false));
            this.AnimCache.Init(this);
        }
        return;
    }
    UFUNCTION()
    void HandleActualVisibleStateChanged_Implementation(const bool bVisible)
    {
        this.AnimCache.OnOwnerVisibilityChanged(bVisible);
        return;
    }
    UFUNCTION()
    void OnMagicUseCountChanged(const int MagicUseCount)
    {
        int local_1;
        int local_3;
        int local_4;
        local_1 = GetMaxMagicUseCount();
        local_3 = GetIndex();
        local_4 = GetLastFrameMagicUseCount();
        if ((MagicUseCount == 0 && (local_4 == 0)))
        {
            return;
        }
        if (local_1 == MagicUseCount)
        {
            this.AnimCache.Play(this.Anim_Release_Free);
        }
        if ((MagicUseCount > local_4 && (local_3 == local_4)))
        {
            this.AnimCache.Play(this.Anim_Release);
            return;
        }
        if (MagicUseCount < local_4)
        {
            this.AnimCache.Play(this.Anim_Release_Free_out);
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_WizardSkillResourceStarItem& local_6;
        TEUIModelRef<FVM_WizardSkillResourceStarItem> local_2 = this.ResourceItem.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.ResourceItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_WizardSkillResourceStarItem::__IndexOf_MagicUseCount());
                    }
                    if (local_6)
                    {
                        this.OnMagicUseCountChanged(local_6.GetMagicUseCount());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnMagicUseCountChanged");
            }
            return;
        }
        this.__ResourceItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ResourceItem.Initialize(this, FName("VM_WizardSkillResourceStarItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ResourceItemDelegate.IsBound())
        {
            this.ResourceItem.SetRef(this.ResourceItemDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_GramherSkillResource : UEUIUserWidget
{
    UPROPERTY()
    UWidget_SkillResAnimCache AnimCache;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_GramherSkillResource> SkillResource;
    UPROPERTY()
    UWidgetAnimation Anim_FullyCharged;
    UPROPERTY()
    UWidgetAnimation Anim_ChargeAvailable;
    UPROPERTY()
    UWidgetAnimation Anim_Charging;
    UPROPERTY()
    UWidgetAnimation Anim_FullyCharged_Genre2;
    FEUIModelWeakRef __SkillResource;
    UPROPERTY()
    FGetEUIModelRef SkillResourceDelegate;

    UWidget_GramherSkillResource()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.AnimCache == nullptr)
        {
            this.AnimCache = Cast<UWidget_SkillResAnimCache>(NewObject(this, UWidget_SkillResAnimCache, NAME_None, false));
            this.AnimCache.Init(this);
        }
        return;
    }
    UFUNCTION()
    void HandleActualVisibleStateChanged_Implementation(const bool bVisible)
    {
        this.AnimCache.OnOwnerVisibilityChanged(bVisible);
        return;
    }
    UFUNCTION()
    void OnAnyItemFilled(const int Count)
    {
        if (Count > 0)
        {
            this.AnimCache.Play(this.Anim_FullyCharged);
        }
        return;
    }
    UFUNCTION()
    void OnAllReachLimitChanged(const bool bAllReach)
    {
        if (bAllReach)
        {
            this.AnimCache.Play(this.Anim_ChargeAvailable);
        }
        return;
    }
    UFUNCTION()
    void OnAnyReachLimitChanged(const bool bAnyReach)
    {
        if (!(bAnyReach))
        {
            this.PlayAnimation(this.Anim_ChargeAvailable, this.Anim_ChargeAvailable.GetEndTime(), 1, EUMGSequencePlayMode(1), 1.0f, false);
            this.AnimCache.Stop(this.Anim_ChargeAvailable);
        }
        return;
    }
    UFUNCTION()
    void OnChargeStateChanged(const int NewChargeState)
    {
        int local_4;
        if (GetFoundationIndex() == 2)
        {
            return;
        }
        local_4 = GetLastChargeState();
        if ((local_4 == 0 && (NewChargeState == 1)))
        {
            this.AnimCache.Play(this.Anim_Charging);
        }
        return;
    }
    UFUNCTION()
    void OnCustomSkillEnergy2Changed(const float32 CurCustomSkillEnergy2)
    {
        if (CurCustomSkillEnergy2 == GetMaxCustomSkillEnergy2())
        {
            this.AnimCache.Play(this.Anim_FullyCharged_Genre2);
        }
        return;
    }
    UFUNCTION()
    TEUIModelRef<FVM_SwordSkillResourcePoint> SkillResource_ResourcePointer() const
    {
        FVM_GramherSkillResource& local_2;
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_10;
        if (local_2)
        {
            local_10 = local_2.GetResourcePointer();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_SwordSkillResourcePoint>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_SwordSkillResourcePoint> SkillResource_ResourcePointerFoundationIndex_2() const
    {
        FVM_GramherSkillResource& local_2;
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_10;
        if (local_2)
        {
            local_10 = local_2.GetResourcePointerFoundationIndex_2();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_SwordSkillResourcePoint>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_GramherSkillResourceItem> SkillResource_Item0() const
    {
        FVM_GramherSkillResource& local_2;
        TEUIModelRef<FVM_GramherSkillResourceItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetItem0();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_GramherSkillResourceItem>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_GramherSkillResourceItem> SkillResource_Item1() const
    {
        FVM_GramherSkillResource& local_2;
        TEUIModelRef<FVM_GramherSkillResourceItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetItem1();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_GramherSkillResourceItem>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_GramherSkillResourceItem> SkillResource_Item2() const
    {
        FVM_GramherSkillResource& local_2;
        TEUIModelRef<FVM_GramherSkillResourceItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetItem2();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_GramherSkillResourceItem>();
        }
        return local_10;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_GramherSkillResource& local_6;
        TEUIModelRef<FVM_GramherSkillResource> local_2 = this.SkillResource.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_GramherSkillResource::__IndexOf_ItemFillEventCount());
                }
                if (local_6)
                {
                    this.OnAnyItemFilled(local_6.GetItemFillEventCount());
                }
                break;
            }
            case 1:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_GramherSkillResource::__IndexOf_bAllReachLimit());
                }
                if (local_6)
                {
                    this.OnAllReachLimitChanged(local_6.GetbAllReachLimit());
                }
                break;
            }
            case 2:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_GramherSkillResource::__IndexOf_bAnyReachLimit());
                }
                if (local_6)
                {
                    this.OnAnyReachLimitChanged(local_6.GetbAnyReachLimit());
                }
                break;
            }
            case 3:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_GramherSkillResource::__IndexOf_ChargeState());
                }
                if (local_6)
                {
                    this.OnChargeStateChanged(local_6.GetChargeState());
                }
                break;
            }
            case 4:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_GramherSkillResource::__IndexOf_CurCustomSkillEnergy2());
                }
                if (local_6)
                {
                    this.OnCustomSkillEnergy2Changed(local_6.GetCurCustomSkillEnergy2());
                }
            }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnAnyItemFilled");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnAllReachLimitChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnAnyReachLimitChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnChargeStateChanged");
            }
            if (It.IsDirty(4))
            {
                XError(ELog(17), "Remaining observed model change: OnCustomSkillEnergy2Changed");
            }
            return;
        }
        this.__SkillResource = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillResource.Initialize(this, FName("VM_GramherSkillResource"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillResourceDelegate.IsBound())
        {
            this.SkillResource.SetRef(this.SkillResourceDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_GramherSkillResourceItem : UEUIUserWidget
{
    UPROPERTY()
    UWidget_SkillResAnimCache AnimCache;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_GramherSkillResourceItem> ResourceItem;
    UPROPERTY()
    UWidgetAnimation Anim_Charging;
    UPROPERTY()
    UWidgetAnimation Anim_FullyCharged01;
    UPROPERTY()
    UWidgetAnimation Anim_FullyCharged02;
    UPROPERTY()
    UWidgetAnimation Anim_FullyCharged03;
    FEUIModelWeakRef __ResourceItem;
    UPROPERTY()
    FGetEUIModelRef ResourceItemDelegate;

    UWidget_GramherSkillResourceItem()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.AnimCache == nullptr)
        {
            this.AnimCache = Cast<UWidget_SkillResAnimCache>(NewObject(this, UWidget_SkillResAnimCache, NAME_None, false));
            this.AnimCache.Init(this);
        }
        return;
    }
    UFUNCTION()
    void HandleActualVisibleStateChanged_Implementation(const bool bVisible)
    {
        if (this.AnimCache != nullptr)
        {
            this.AnimCache.OnOwnerVisibilityChanged(bVisible);
        }
        return;
    }
    UFUNCTION()
    void OnItemReachLimitChanged(const bool bReach)
    {
        bool local_1;
        bool local_2;
        bool local_4;
        local_1 = GetbLastReachLimit();
        if ((local_1 && !(bReach)))
        {
            local_4 = true;
        }
        else
        {
            local_2 = !(bReach);
            local_4 = !(local_1);
            local_2 = local_2 == local_4 && !(bReach);
            local_4 = local_2;
        }
        if (local_4)
        {
            this.AnimCache.Stop(this.Anim_FullyCharged01);
            this.AnimCache.Stop(this.Anim_FullyCharged02);
            this.AnimCache.Stop(this.Anim_FullyCharged03);
            this.AnimCache.Play(this.Anim_Charging);
            return;
        }
        if (!(local_1) && bReach)
        {
            UWidgetAnimation local_6 = this.GetFullyChargedAnimForIndex(GetIndex());
            if (local_6 != nullptr)
            {
                this.AnimCache.Play(local_6);
            }
        }
        return;
    }
    UWidgetAnimation GetFullyChargedAnimForIndex(const int Index) const
    {
        switch (Index)
        {
        case 0:
        {
            return this.Anim_FullyCharged01;
        }
        case 1:
        {
            return this.Anim_FullyCharged02;
        }
        case 2:
        {
            return this.Anim_FullyCharged03;
        }
        default:
        {
        }
        }
        return nullptr;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_GramherSkillResourceItem& local_6;
        TEUIModelRef<FVM_GramherSkillResourceItem> local_2 = this.ResourceItem.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.ResourceItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_GramherSkillResourceItem::__IndexOf_bReachLimit());
                    }
                    if (local_6)
                    {
                        this.OnItemReachLimitChanged(local_6.GetbReachLimit());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnItemReachLimitChanged");
            }
            return;
        }
        this.__ResourceItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ResourceItem.Initialize(this, FName("VM_GramherSkillResourceItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ResourceItemDelegate.IsBound())
        {
            this.ResourceItem.SetRef(this.ResourceItemDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_SuiXiSkillResource : UEUIUserWidget
{
    UPROPERTY()
    UWidget_SkillResAnimCache AnimCache;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SuiXiSkillResource> SkillResource;
    UPROPERTY()
    UWidgetAnimation Anim_FullyCharged_L;
    UPROPERTY()
    UWidgetAnimation Anim_FullyCharged_R;
    UPROPERTY()
    UWidgetAnimation Anim_Charging;
    UPROPERTY()
    UWidgetAnimation Anim_ChargeAvailable;
    UPROPERTY()
    UWidgetAnimation Anim_ChargeRelease;
    UPROPERTY()
    UWidgetAnimation Anim_Arrow;
    UPROPERTY()
    UWidgetAnimation Anim_Arrow_Out;
    FEUIModelWeakRef __SkillResource;
    UPROPERTY()
    FGetEUIModelRef SkillResourceDelegate;

    UWidget_SuiXiSkillResource()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.AnimCache == nullptr)
        {
            this.AnimCache = Cast<UWidget_SkillResAnimCache>(NewObject(this, UWidget_SkillResAnimCache, NAME_None, false));
            this.AnimCache.Init(this);
        }
        return;
    }
    UFUNCTION()
    void HandleActualVisibleStateChanged_Implementation(const bool bVisible)
    {
        this.AnimCache.OnOwnerVisibilityChanged(bVisible);
        return;
    }
    UFUNCTION()
    void OnLeftBarPercentChanged(const float32 Percent)
    {
        if (GetLastLeftBarPercent() < 1.0f && (Percent >= 1.0f))
        {
            this.AnimCache.Play(this.Anim_FullyCharged_L);
        }
        return;
    }
    UFUNCTION()
    void OnRightBarPercentChanged(const float32 Percent)
    {
        if (GetLastRightBarPercent() < 1.0f && (Percent >= 1.0f))
        {
            this.AnimCache.Play(this.Anim_FullyCharged_R);
        }
        return;
    }
    UFUNCTION()
    void OnChargeNumChanged(const int NewChargeNum)
    {
        if (NewChargeNum == 3)
        {
            this.AnimCache.Play(this.Anim_ChargeAvailable);
        }
        else
        {
            this.AnimCache.Stop(this.Anim_ChargeAvailable);
        }
        if (NewChargeNum == 0)
        {
            this.AnimCache.Play(this.Anim_ChargeRelease);
        }
        return;
    }
    UFUNCTION()
    void OnChargeEnergySpeedChargeChanged(const float32 NewSpeed)
    {
        float32 local_1 = GetLastChargeEnergySpeed_Charge();
        if ((local_1 != 0.0f && (NewSpeed == 0.0f)))
        {
            this.AnimCache.Play(this.Anim_Charging);
        }
        return;
    }
    UFUNCTION()
    void OnShowArrowChanged(const bool bShow)
    {
        if (bShow)
        {
            this.AnimCache.Play(this.Anim_Arrow);
            return;
        }
        this.AnimCache.Play(this.Anim_Arrow_Out);
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_SuiXiSkillResource& local_6;
        TEUIModelRef<FVM_SuiXiSkillResource> local_2 = this.SkillResource.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SuiXiSkillResource::__IndexOf_LeftBarPercent());
                }
                if (local_6)
                {
                    this.OnLeftBarPercentChanged(local_6.GetLeftBarPercent());
                }
                break;
            }
            case 1:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SuiXiSkillResource::__IndexOf_RightBarPercent());
                }
                if (local_6)
                {
                    this.OnRightBarPercentChanged(local_6.GetRightBarPercent());
                }
                break;
            }
            case 2:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SuiXiSkillResource::__IndexOf_ChargeNum());
                }
                if (local_6)
                {
                    this.OnChargeNumChanged(local_6.GetChargeNum());
                }
                break;
            }
            case 3:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SuiXiSkillResource::__IndexOf_ChargeEnergySpeed_Charge());
                }
                if (local_6)
                {
                    this.OnChargeEnergySpeedChargeChanged(local_6.GetChargeEnergySpeed_Charge());
                }
                break;
            }
            case 4:
            {
                this.SkillResource.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SuiXiSkillResource::__IndexOf_ShowArrow());
                }
                if (local_6)
                {
                    this.OnShowArrowChanged(local_6.GetShowArrow());
                }
            }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnLeftBarPercentChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnRightBarPercentChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnChargeNumChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnChargeEnergySpeedChargeChanged");
            }
            if (It.IsDirty(4))
            {
                XError(ELog(17), "Remaining observed model change: OnShowArrowChanged");
            }
            return;
        }
        this.__SkillResource = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillResource.Initialize(this, FName("VM_SuiXiSkillResource"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillResourceDelegate.IsBound())
        {
            this.SkillResource.SetRef(this.SkillResourceDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_QiongSkillResourceItem : UEUIUserWidget
{
    UPROPERTY()
    UWidget_SkillResAnimCache AnimCache;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_QiongSkillResourceItem> ResourceItem;
    UPROPERTY()
    UWidgetAnimation Anim_FullyCharged;
    UPROPERTY()
    UWidgetAnimation Anim_FullyCharged_Reverse;
    UPROPERTY()
    UWidgetAnimation Anim_FullyCharged_Out;
    FEUIModelWeakRef __ResourceItem;
    UPROPERTY()
    FGetEUIModelRef ResourceItemDelegate;

    UWidget_QiongSkillResourceItem()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.AnimCache == nullptr)
        {
            this.AnimCache = Cast<UWidget_SkillResAnimCache>(NewObject(this, UWidget_SkillResAnimCache, NAME_None, false));
            this.AnimCache.Init(this);
        }
        return;
    }
    UFUNCTION()
    void HandleActualVisibleStateChanged_Implementation(const bool bVisible)
    {
        this.AnimCache.OnOwnerVisibilityChanged(bVisible);
        return;
    }
    UFUNCTION()
    void OnItemPercentChanged(const float32 Percent)
    {
        float32 local_1 = GetLastPercent();
        if (((local_1 < 1.0f && (Percent >= 1.0f))) || (local_1 == Percent && (Percent >= 1.0f)))
        {
            if (GetbReverseItem())
            {
                this.AnimCache.Play(this.Anim_FullyCharged_Reverse);
            }
            else
            {
                this.AnimCache.Play(this.Anim_FullyCharged);
            }
            return;
        }
        if (local_1 >= 1.0f && (Percent < 1.0f))
        {
            this.AnimCache.Stop(this.Anim_FullyCharged);
            this.AnimCache.Stop(this.Anim_FullyCharged_Reverse);
            this.AnimCache.Play(this.Anim_FullyCharged_Out);
        }
        return;
    }
    UFUNCTION()
    void OnStopAllAnimChanged(const bool bStop)
    {
        if (bStop)
        {
            this.AnimCache.Stop(this.Anim_FullyCharged);
            this.AnimCache.Stop(this.Anim_FullyCharged_Reverse);
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_QiongSkillResourceItem& local_6;
        TEUIModelRef<FVM_QiongSkillResourceItem> local_2 = this.ResourceItem.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.ResourceItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_QiongSkillResourceItem::__IndexOf_Percent());
                    }
                    if (local_6)
                    {
                        this.OnItemPercentChanged(local_6.GetPercent());
                    }
                    this.ResourceItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_QiongSkillResourceItem::__IndexOf_bStopAllAnim());
                    }
                    if (local_6)
                    {
                        this.OnStopAllAnimChanged(local_6.GetbStopAllAnim());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnItemPercentChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnStopAllAnimChanged");
            }
            return;
        }
        this.__ResourceItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ResourceItem.Initialize(this, FName("VM_QiongSkillResourceItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ResourceItemDelegate.IsBound())
        {
            this.ResourceItem.SetRef(this.ResourceItemDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_QiongSkillResource : UEUIUserWidget
{
    UPROPERTY()
    UWidget_SkillResAnimCache AnimCache;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_QiongSkillResource> SkillResource;
    UPROPERTY()
    UWidgetAnimation Anim_FullyCharged;
    UPROPERTY()
    UWidgetAnimation Anim_Charging01;
    UPROPERTY()
    UWidgetAnimation Anim_Charging02;
    UPROPERTY()
    UWidgetAnimation Anim_Charging_Out;
    FEUIModelWeakRef __SkillResource;
    UPROPERTY()
    FGetEUIModelRef SkillResourceDelegate;

    UWidget_QiongSkillResource()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.AnimCache == nullptr)
        {
            this.AnimCache = Cast<UWidget_SkillResAnimCache>(NewObject(this, UWidget_SkillResAnimCache, NAME_None, false));
            this.AnimCache.Init(this);
        }
        return;
    }
    UFUNCTION()
    void HandleActualVisibleStateChanged_Implementation(const bool bVisible)
    {
        this.AnimCache.OnOwnerVisibilityChanged(bVisible);
        return;
    }
    UFUNCTION()
    void OnChargeEnhanceCountChanged(const int NewCount)
    {
        int local_1;
        local_1 = GetLastChargeEnhanceCount();
        if (NewCount == local_1)
        {
            return;
        }
        if (NewCount == 0)
        {
            this.AnimCache.Play(this.Anim_Charging_Out);
            return;
        }
        if (NewCount == 1)
        {
            this.AnimCache.Play(this.Anim_Charging01);
            return;
        }
        if (NewCount == 2)
        {
            this.AnimCache.Play(this.Anim_Charging02);
        }
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> SkillResource_LeftResourceItems() const
    {
        FVM_QiongSkillResource& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetLeftResourceItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> SkillResource_RightResourceItems() const
    {
        FVM_QiongSkillResource& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetRightResourceItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TEUIModelRef<FVM_SwordSkillResourcePoint> SkillResource_LeftResourcePointer() const
    {
        FVM_QiongSkillResource& local_2;
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_10;
        if (local_2)
        {
            local_10 = local_2.GetLeftResourcePointer();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_SwordSkillResourcePoint>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_SwordSkillResourcePoint> SkillResource_RightResourcePointer() const
    {
        FVM_QiongSkillResource& local_2;
        TEUIModelRef<FVM_SwordSkillResourcePoint> local_10;
        if (local_2)
        {
            local_10 = local_2.GetRightResourcePointer();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_SwordSkillResourcePoint>();
        }
        return local_10;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_QiongSkillResource& local_6;
        TEUIModelRef<FVM_QiongSkillResource> local_2 = this.SkillResource.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.SkillResource.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_QiongSkillResource::__IndexOf_ChargeEnhanceCount());
                    }
                    if (local_6)
                    {
                        this.OnChargeEnhanceCountChanged(local_6.GetChargeEnhanceCount());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnChargeEnhanceCountChanged");
            }
            return;
        }
        this.__SkillResource = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillResource.Initialize(this, FName("VM_QiongSkillResource"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillResourceDelegate.IsBound())
        {
            this.SkillResource.SetRef(this.SkillResourceDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SwordSkillResource
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSuperSwitchChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSecondSlotFullChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnFourthSlotFullChanged"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
namespace UWidget_SwordSkillResourceItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnItemPercentChanged"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
namespace UWidget_SwordSkillResourcePoint
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnPointPercentChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnPointVisibleChanged"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
namespace UWidget_WizardSkillResource
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
namespace UWidget_WizardSkillResourceStarItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnMagicUseCountChanged"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
namespace UWidget_GramherSkillResource
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAnyItemFilled"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAllReachLimitChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAnyReachLimitChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnChargeStateChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCustomSkillEnergy2Changed"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
namespace UWidget_GramherSkillResourceItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnItemReachLimitChanged"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
namespace UWidget_SuiXiSkillResource
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnLeftBarPercentChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnRightBarPercentChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnChargeNumChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnChargeEnergySpeedChargeChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnShowArrowChanged"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
namespace UWidget_QiongSkillResourceItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnItemPercentChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnStopAllAnimChanged"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
namespace UWidget_QiongSkillResource
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnChargeEnhanceCountChanged"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
