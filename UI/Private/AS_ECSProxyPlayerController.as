
enum EEnterFrontendSystemActionTriggerAgain
{
    DoNothing,
    Exit,
    EnterAgain,
}


struct FSystemOpenPageAction
{
    UPROPERTY()
    ETriggerEvent TriggerEvent = ETriggerEvent(1);
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PageWidget;
    UPROPERTY()
    bool bCloseWhenTriggerAgain;
    UPROPERTY()
    FEUIWidgetRef PageHandle;
    UPROPERTY()
    float LastTriggerTime = -1.0;


}

struct FEnterFrontendSystemAction
{
    UPROPERTY()
    ETriggerEvent TriggerEvent = ETriggerEvent(1);
    UPROPERTY()
    UFrontendSystemConfig FrontendSystem = nullptr;
    UPROPERTY()
    EEnterFrontendSystemActionTriggerAgain TriggerAgain;
    UPROPERTY()
    float LastTriggerTime = -1.0;


}

struct FDefaultOpenPage
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PageWidget;

    FDefaultOpenPage()
    {
        return;
    }
}

class AAS_ECSProxyPlayerController : AAS_ECSPlayerController
{
    UPROPERTY()
    TArray<FGameplayTag> DefaultOpenWidgets;
    UPROPERTY()
    TMap<UInputAction, FEnterFrontendSystemAction> FrontendSystems;
    UPROPERTY()
    TMap<UInputAction, FSystemOpenPageAction> SystemPages;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> UI_MotionPage_WidgetBPClass;
    UPROPERTY()
    FEUIWidgetRef UI_MotionPageHandle;
    UPROPERTY()
    UWidget_HeadBubblePanel UI_HeadBubblePanel;
    UPROPERTY()
    UWidget_DebugDisplayPanel UI_DebugDisplayPanel;
    int IndicatorIconsHideCounter = 0;
    FVector2D MoveAxisValue;
    float32 ScaleAxisValue;
    UPROPERTY()
    TMap<UInputAction, TDataObjectPtr<FMenuConfig>> CachedInputActionToMenu;
    UPROPERTY()
    float32 ActionTriggerCooldownSeconds = 0.25f;
    UPROPERTY()
    float LastSocialActionTriggerTime = -1.0;


    UFUNCTION()
    void BeginPlay_Implementation()
    {
        int local_33 = 0;
        UInputAction local_98;
        APXECSPlayerController local_154;
        UClass local_188;
        if (System::IsServer(__GetWorldContext()) || (int(this.GetLocalRole()) < 2))
        {
            return;
        }
        UEnhancedInputComponent local_12 = Cast<UEnhancedInputComponent>(this.GetComponentByClass(UEnhancedInputComponent));
        if (local_12 != nullptr)
        {
            for (auto& local_30 : this.FrontendSystems)
            {
                local_12.BindAction(local_30.GetKey(), ETriggerEvent(local_33), this, FName("OnTriggerEnterSystemAction"));
            }
            for (auto& local_56 : this.SystemPages)
            {
                local_12.BindAction(local_56.GetKey(), ETriggerEvent(local_33), this, FName("OnTriggerOpenPageAction"));
            }
            TDataObjectIterator<FMenuConfig> local_72;
            for (; local_72; )
            {
                local_98 = local_72.GetDataPtr().opArrow().EntryAction.EnhancedAction;
                if (local_98 != nullptr)
                {
                    local_72.GetDataPtr();
                    UInputAction local_122;
                    this.CachedInputActionToMenu.Add(local_98, local_122);
                    local_12.BindAction(local_98, ETriggerEvent(1), this, n"OnTriggerOpenMenuAction");
                }
                local_72.opPreInc();
            }
        }
        this.UI_HeadBubblePanel = Cast<UWidget_HeadBubblePanel>((Cast<UWidget_HeadBubblePanel>(FEUIWidget::AddWidget(this.GetLocalPlayer(), GameplayTags::UI_Type_HUD_HeadBubble).RequireWidget())));
        this.ShowHeadBubble.BindUFunction(this.UI_HeadBubblePanel, n"ShowHeadBubble");
        this.ShowCustomWheelOption.BindUFunction(this.UI_HeadBubblePanel, n"ShowCustomWheelOption");
        this.SetIndicatorIconsVisible.BindUFunction(this, n"SetIndicatorIconsVisible");
        this.GameModeStateChanged.BindUFunction(this, n"OnGameModeStateChanged");
        for (auto& local_144 : this.DefaultOpenWidgets)
        {
            FEUIWidget::AddWidget(this.GetLocalPlayer(), local_144);
        }
        UAS_GameModeSettingsPVX local_152 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if (local_152 != nullptr)
        {
            FEUIWidget::AddWidget(this.GetLocalPlayer(), GameplayTags::UI_Type_HUD_PVXMain);
        }
        if (local_154 != nullptr)
        {
            TArray<FString> local_160 = ::UGameClientConnectionSubsystem::Get().GetCachedGmList();
            for (auto& local_178 : local_160)
            {
                local_154.RegisterDynamicGmCommand(local_178);
            }
        }
        bool local_179 = false;
        UAS_GameModeSettingsPVX local_184 = (Cast<UAS_GameModeSettingsPVX>(::GameModeSettings::GetGameModeSettings(this)));
        if (local_184 != nullptr)
        {
            local_179 = true;
        }
        if (!(local_179))
        {
            TSubclassOf<UUserWidget> local_186 = TSubclassOf<UUserWidget>(::GameModeSettings::GetGameModeSettings(this).EntryUIClass);
            if (local_186.IsValid())
            {
                UClass local_190 = UEUIUserWidget;
                if (local_188.IsChildOf(local_190))
                {
                    FEUIWidget::AddWidgetByClass(this.GetLocalPlayer(), TSoftClassPtr<UEUIUserWidget>(local_186));
                }
                else
                {
                    XWarning(ELog(16), FString().Append("EntryUIClass ").Append(local_190.ToString()).Append(" config in game mode ").Append(::GameModeSettings::GetGameModeSettings(this).ToString()).Append(" is not a child of UEUIUserWidget, add to viewport directly"));
                    WidgetBlueprint::CreateWidget(__GetWorldContext(), local_186, this).AddToViewport(0);
                }
            }
        }
        this.OnGameModeStateChanged();
        return;
    }
    UFUNCTION()
    void OnGameModeStateChanged()
    {
        int local_14 = 0;
        int local_20 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        if ((int(local_20.GetGameModeType())) == 2 && (int(local_14.GetStageType()) == 2))
        {
            FEUIWidget::AddWidget(this.GetLocalPlayer(), GameplayTags::UI_Type_HUD_PVPModeTDM);
        }
        return;
    }
    UFUNCTION()
    void OnTriggerEnterSystemAction(const FInputActionValue &inout ActionValue, const float32 ElapsedTime, const float32 TriggeredTime, const UInputAction SourceAction)
    {
        FEnterFrontendSystemAction local_8;
        if (!(this.FrontendSystems.Find(SourceAction, local_8)))
        {
            return;
        }
        if (!(this.TryConsumeActionTriggerCooldown(local_8.LastTriggerTime)))
        {
            return;
        }
        this.FrontendSystems[SourceAction] = local_8;
        UFrontendSystemConfig local_12 = local_8.FrontendSystem;
        if (int(local_8.TriggerAgain) != 2 && ::FrontendSystemUtil::IsSystemOpen(this.GetPlayerEntity(), local_12))
        {
            if (int(local_8.TriggerAgain) == 1)
            {
                ::FrontendSystemUtil::ExitSystem(this.GetPlayerEntity(), local_12);
            }
            return;
        }
        ::FrontendSystemUtil::EnterSystem(this.GetPlayerEntity(), local_12);
        return;
    }
    UFUNCTION()
    void OnTriggerOpenPageAction(const FInputActionValue &inout ActionValue, const float32 ElapsedTime, const float32 TriggeredTime, const UInputAction SourceAction)
    {
        FSystemOpenPageAction local_18;
        if (!(this.SystemPages.Find(SourceAction, local_18)))
        {
            return;
        }
        if (!(this.TryConsumeActionTriggerCooldown(local_18.LastTriggerTime)))
        {
            return;
        }
        if (!(local_18.PageHandle))
        {
            FEUIWidgetRef local_24 = FEUIWidget::FindWidgetByClass(this.GetLocalPlayer(), local_18.PageWidget);
            if (local_24)
            {
                local_18.PageHandle = local_24;
            }
        }
        if (local_18.PageHandle.IsLayoutLayerWidget())
        {
            if (local_18.bCloseWhenTriggerAgain)
            {
                FEUIWidget::RemoveWidget(local_18.PageHandle);
            }
            return;
        }
        local_18.PageHandle = FEUIWidget::AddWidgetByClass(this.GetLocalPlayer(), local_18.PageWidget);
        return;
    }
    UFUNCTION()
    void OnTriggerOpenMenuAction(const FInputActionValue &inout ActionValue, const float32 ElapsedTime, const float32 TriggeredTime, const UInputAction SourceAction)
    {
        TDataObjectPtr<FMenuConfig> local_24;
        if (!(this.CachedInputActionToMenu.Find(SourceAction, local_24)))
        {
            return;
        }
        if (!(!(local_24)))
        {
            FEUIWidgetRef local_30;
            ULocalPlayer local_28 = this.GetLocalPlayer();
            if (local_30)
            {
                FEUIWidget::RemoveWidget(local_30);
            }
            else
            {
                ULocalPlayer local_34 = this.GetLocalPlayer();
            }
        }
        return;
    }
    bool TryConsumeActionTriggerCooldown(float &inout LastTriggerTime)
    {
        if (this.ActionTriggerCooldownSeconds <= 0.0f)
        {
            return true;
        }
        float local_10 = this.GetWorld().GetRealTimeSeconds();
        if ((LastTriggerTime >= 0.0 && (((local_10 - LastTriggerTime) < this.ActionTriggerCooldownSeconds))))
        {
            return false;
        }
        LastTriggerTime = local_10;
        return true;
    }
    UFUNCTION()
    void InputTriggerSocial()
    {
        if (!(this.TryConsumeActionTriggerCooldown(this.LastSocialActionTriggerTime)))
        {
            return;
        }
        if (!(this.UI_MotionPageHandle.IsValid()))
        {
            this.UI_MotionPageHandle = FEUIWidget::FindWidgetByClass(this.GetLocalPlayer(), this.UI_MotionPage_WidgetBPClass);
        }
        if (this.UI_MotionPageHandle.IsLayoutLayerWidget())
        {
            FEUIWidget::RemoveWidget(this.UI_MotionPageHandle);
            ::FASCommonUtils::GetLocalPlayerProxy();
            Modify local_18;
            FC_SelectSocialInteractionInfo& local_20 = local_18.opCall();
            if (local_20)
            {
                local_20.InteractTarget = ENTITY_NULL;
            }
            return;
        }
        this.UI_MotionPageHandle = FEUIWidget::AddWidgetByClass(this.GetLocalPlayer(), this.UI_MotionPage_WidgetBPClass);
        return;
    }
    UFUNCTION()
    void InputTriggerMark()
    {
        ::MarkUtil::RequestFastMarkFromUEPlayerController(this);
        return;
    }
    UFUNCTION()
    void SetIndicatorIconsVisible(const bool bVisible)
    {
        if (bVisible)
        {
            --this.IndicatorIconsHideCounter;
            return;
        }
        ++this.IndicatorIconsHideCounter;
        return;
    }
    UFUNCTION()
    void InputTriggerLeaveTeam()
    {
        if (!(::FTeamUtils::IsSingleTeamWorld()))
        {
            ::FSocialTeamUtils::ClientSendLeaveTeam(this.GetPlayerEntity());
        }
        return;
    }
    UFUNCTION()
    void SetMoveAxisValue(const FVector2D &inout InMoveAxisValue)
    {
        this.MoveAxisValue = InMoveAxisValue;
        return;
    }
    UFUNCTION()
    void SetScaleAxisValue(const float32 InScaleAxisValue)
    {
        this.ScaleAxisValue = InScaleAxisValue;
        return;
    }
}

