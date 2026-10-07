
enum EFrontendSystemPageGroupType
{
    System,
    Shared,
    Static,
}


class UFrontendSystemBehavior_OpenPage : UFrontendSystemBehaviorBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PageWidget;
    UPROPERTY()
    EFrontendSystemPageGroupType PageGroupType;
    UPROPERTY()
    TSubclassOf<UObject> SharedPageGroup;
    UPROPERTY()
    bool bOpenInNewGroup;

    UFrontendSystemBehavior_OpenPage()
    {
        super();
        return;
    }
    bool ShouldCreateInstance() const
    {
        return true;
    }
    FInstancedStruct CreateInstance() const
    {
        return FInstancedStruct(FFrontendSystemBehaviorInstance_OpenPage);
    }
    void OnEnter(const FFrontendSystemContext &inout Context, FInstancedStruct &inout BehaviorInstance) const
    {
        UObject local_10;
        int local_22 = 0;
        int local_30 = 0;
        if (this.PageWidget.IsNull())
        {
            XError(ELog(52), FString().Append("Page widget not set in ").Append(this));
            return;
        }
        int local_12 = int(this.PageGroupType);
        if (local_12 <= 0)
        {
            if (local_12 != 0)
            {
            }
            else
            {
                local_10 = Context.SystemPageGroup;
            }
        }
        XError(ELog(52), FString().Append("Not Support Page Group Type").Append(this.PageGroupType));
        TRawPtr<FFrontendSystemBehaviorInstance_OpenPage> local_20 = FInstancedStruct::GetMutablePtr(BehaviorInstance).opCall();
        FECSWorldPtr local_24 = ECS::GetECSWorld();
        local_22.Page = FEUIWidget::Legacy_AddGroupWidgetByClass(local_30.UEPlayerController.GetLocalPlayer(), this.PageWidget, local_10);
        UFrontendSystemInstancedPageGroup local_38 = (Cast<UFrontendSystemInstancedPageGroup>(local_10));
        if (local_38 != nullptr)
        {
            local_38.OnPageOpened(local_22.Page);
        }
        return;
    }
    void OnExit(const FFrontendSystemContext &inout Context, FInstancedStruct &inout BehaviorInstance) const
    {
        int local_8 = 0;
        TConstRawPtr<FFrontendSystemBehaviorInstance_OpenPage> local_6 = FInstancedStruct::GetPtr(BehaviorInstance).opCall();
        FEUIWidget::RemoveWidget(local_8.Page);
        return;
    }
    void TestFunction(const FSoftClassPath &inout Path) const
    {
        return;
    }
}

struct FFrontendSystemBehaviorInstance_OpenPage : FFrontendSystemBehaviorInstance
{
    FFrontendSystemBehaviorInstance _base_FFrontendSystemBehaviorInstance;
    UPROPERTY()
    FEUIWidgetRef Page;

    FFrontendSystemBehaviorInstance_OpenPage()
    {
        super();
        return;
    }
}

