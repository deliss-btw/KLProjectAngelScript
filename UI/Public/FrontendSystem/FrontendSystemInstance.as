

class UFrontendSystemInstancedPageGroup : UEUIBlueprintGroup
{
    UPROPERTY()
    int FrontendSystemInstanceHandle;
    UPROPERTY()
    FEUIWidgetRef MainPage;
    UPROPERTY()
    bool bFrontendSystemWillExit;

    UFrontendSystemInstancedPageGroup()
    {
        return;
    }
    UFUNCTION()
    void OnPageClosed_Implementation(const FEUIWidgetRef &inout PageHandle)
    {
        if ((!(this.bFrontendSystemWillExit) && (PageHandle == this.MainPage)))
        {
            FECSEntity local_6 = ::FASCommonUtils::GetLocalUniquePlayerEntity();
            if (local_6)
            {
                ::FrontendSystem_Internal::ExitSystemByHandle(local_6, this.FrontendSystemInstanceHandle);
            }
        }
        return;
    }
    void OnPageOpened(const FEUIWidgetRef &inout PageHandle)
    {
        if ((!(this.bFrontendSystemWillExit) && !(this.MainPage)))
        {
            this.MainPage = PageHandle;
        }
        return;
    }
}

struct FFrontendSystemContext
{
    UPROPERTY()
    FECSEntity PlayerEntity;
    UPROPERTY()
    UFrontendSystemInstancedPageGroup SystemPageGroup = nullptr;
    UPROPERTY()
    EFrontendSystemState SystemState;


}

struct FFrontendSystemBehaviorContainer
{
    UPROPERTY()
    TArray<UFrontendSystemBehaviorBase> ConstBehaviors;
    UPROPERTY()
    TArray<FInstancedStruct> InstancedBehaviors;

    FFrontendSystemBehaviorContainer()
    {
        return;
    }
    void Add(const UFrontendSystemBehaviorBase Behavior)
    {
        if (Behavior.ShouldCreateInstance())
        {
            FInstancedStruct local_6 = Behavior.CreateInstance();
            if (!(FInstancedStruct::GetMutablePtr(local_6).opCall()))
            {
                return;
            }
            this.InstancedBehaviors.Add(local_6);
            return;
        }
        this.Add(Behavior);
        return;
    }
    void EnterState(const FFrontendSystemContext &inout SystemContext)
    {
        FInstancedStruct local_4;
        for (auto& local_20 : this)
        {
            local_20.OnEnter(SystemContext, local_4);
        }
        for (auto& local_34 : this.InstancedBehaviors)
        {
            TConstRawPtr<FFrontendSystemBehaviorInstance> local_40 = FInstancedStruct::GetPtr(local_34).opCall();
        }
        return;
    }
    void ExitState(const FFrontendSystemContext &inout SystemContext)
    {
        FInstancedStruct local_4;
        for (auto& local_20 : this)
        {
            local_20.OnExit(SystemContext, local_4);
        }
        for (auto& local_34 : this.InstancedBehaviors)
        {
            TConstRawPtr<FFrontendSystemBehaviorInstance> local_40 = FInstancedStruct::GetPtr(local_34).opCall();
        }
        return;
    }
}

struct FFrontendSystemInstance
{
    UPROPERTY()
    int Handle;
    UPROPERTY()
    const UFrontendSystemConfig Config = nullptr;
    UPROPERTY()
    UFrontendSystemInstancedPageGroup SystemPageGroup = nullptr;
    UPROPERTY()
    TMap<EFrontendSystemState, FFrontendSystemBehaviorContainer> Behaviors;


}

