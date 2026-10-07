
namespace FVM_CookReadyHeadAvatar
{
    const int ModelId = 0;
}
namespace FVM_CookReady
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClickReady = FEUIModelCallbackSignature();

}
struct FVM_CookReadyHeadAvatar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_PlayerEntity;
    UPROPERTY()
    bool m_bReady;

    FVM_CookReadyHeadAvatar()
    {
        this.m_bReady = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CookReadyHeadAvatar(const FVM_CookReadyHeadAvatar &inout Other)
    {
        this.m_bReady = false;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_bReady = Other.m_bReady;
        return;
    }
    FVM_CookReadyHeadAvatar opAssign(const FVM_CookReadyHeadAvatar &inout Other)
    {
        FVM_CookReadyHeadAvatar __r;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_bReady = Other.m_bReady;
        return __r;
    }
    ESlateVisibility GetHeadVisibility() const
    {
        int local_2;
        if (this.GetPlayerEntity().IsValid())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetReadyVisibility() const
    {
        int local_2;
        if (this.GetbReady())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetMyself() const
    {
        int local_12;
        if ((FECSEntity(this.GetPlayerEntity()) == this.GetContext().GetLocalPlayerPawn()))
        {
            local_12 = 0;
        }
        else
        {
            local_12 = 2;
        }
        return ESlateVisibility(local_12);
    }
    int GetMyselfSwitch() const
    {
        return (FECSEntity(this.GetPlayerEntity()) == this.GetContext().GetLocalPlayerPawn()) ? 1 : 0;
    }
    FSoftBrush GetOwnerIcon() const
    {
        FSoftBrush __return;
        if (!(this.GetPlayerEntity().IsValid()))
        {
            return FSoftBrush();
        }
        if (::GetAvatarConfig(this.GetPlayerEntity()))
        {
        }
        else
        {
            __return = FSoftBrush();
        }
        return __return;
    }
    FECSEntity GetPlayerEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_PlayerEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPlayerEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerEntity = __Value;
        return;
    }
    bool GetbReady() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bReady;
    }
    void SetbReady(const bool __Value) property
    {
        if (!(this.m_bReady) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bReady = __Value;
        return;
    }
}

struct FVM_CookReady : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CookReadyHeadAvatar>> m_CurrentHeadAvatars;
    UPROPERTY()
    FECSEntity m_CookPropEntity;
    UPROPERTY()
    bool m_bReady;
    UPROPERTY()
    bool m_bShow;

    FVM_CookReady()
    {
        this.m_bReady = false;
        this.m_bShow = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CookReady(const FVM_CookReady &inout Other)
    {
        this.m_bReady = false;
        this.m_bShow = true;
        this.m_CurrentHeadAvatars = Other.m_CurrentHeadAvatars;
        this.m_CookPropEntity = Other.m_CookPropEntity;
        this.m_bReady = Other.m_bReady;
        this.m_bShow = Other.m_bShow;
        return;
    }
    FVM_CookReady opAssign(const FVM_CookReady &inout Other)
    {
        FVM_CookReady __r;
        this.m_CurrentHeadAvatars = Other.m_CurrentHeadAvatars;
        this.m_CookPropEntity = Other.m_CookPropEntity;
        this.m_bReady = Other.m_bReady;
        this.m_bShow = Other.m_bShow;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    ESlateVisibility GetReadyWindowVisibility() const
    {
        int local_2;
        if (this.GetbShow())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    int GetReadyAnimSwitch() const
    {
        return this.GetbReady() ? 1 : 0;
    }
    void InvalidAllHeadAvatars()
    {
        int local_13;
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            Get local_12;
            local_13 = local_12.opCall().MaxCookerCount;
        }
        else
        {
            local_13 = 4;
        }
        int local_14 = this.GetCurrentHeadAvatars().Num();
        for (; local_14 < local_13; )
        {
            FVM_CookReadyHeadAvatar& local_18 = ::FVM_CookReadyHeadAvatar::Create(this.GetContext().Manager);
            local_18.SetPlayerEntity(ENTITY_NULL);
            local_18.SetbReady(false);
            this.GetModify_CurrentHeadAvatars().Add(TEUIModelRef<FVM_CookReadyHeadAvatar>(local_18));
            ++local_14;
        }
        return;
    }
    void OnCookPropChanged(const FC_CookProp &inout CookProp)
    {
        if (!(CookProp))
        {
            this.SetbReady(false);
            this.GetModify_CurrentHeadAvatars().Empty(0);
            return;
        }
        this.GetModify_CurrentHeadAvatars().Empty(0);
        for (auto& local_16 : CookProp.GetCookPlayerDatas())
        {
            if (!(local_16.GetPlayerEntity().IsValid()))
            {
                continue;
            }
            FVM_CookReadyHeadAvatar& local_18 = ::FVM_CookReadyHeadAvatar::Create(this.GetContext().Manager);
            local_18.SetPlayerEntity(local_16.GetPlayerEntity());
            local_18.SetbReady(local_16.GetbPlayerReady());
            this.GetModify_CurrentHeadAvatars().Add(TEUIModelRef<FVM_CookReadyHeadAvatar>(local_18));
        }
        this.SetbShow(true);
        if ((int(CookProp.GetCookState())) == 2)
        {
            this.SetbShow(false);
        }
        if ((int(CookProp.GetCookState())) == 1)
        {
            this.SetbReady(true);
            return;
        }
        this.SetbReady(false);
        return;
    }
    void OnClickReady()
    {
        return;
    }
    const TArray<TEUIModelRef<FVM_CookReadyHeadAvatar>> GetCurrentHeadAvatars() const property
    {
        const TArray<TEUIModelRef<FVM_CookReadyHeadAvatar>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CookReadyHeadAvatar>> GetModify_CurrentHeadAvatars() property
    {
        TArray<TEUIModelRef<FVM_CookReadyHeadAvatar>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCurrentHeadAvatars(const TArray<TEUIModelRef<FVM_CookReadyHeadAvatar>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentHeadAvatars = __Value;
        return;
    }
    const FECSEntity GetCookPropEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FECSEntity GetModify_CookPropEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCookPropEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CookPropEntity = __Value;
        return;
    }
    bool GetbReady() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bReady;
    }
    void SetbReady(const bool __Value) property
    {
        if (!(this.m_bReady) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bReady = __Value;
        return;
    }
    bool GetbShow() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bShow;
    }
    void SetbShow(const bool __Value) property
    {
        if (!(this.m_bShow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bShow = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CookReadyHeadAvatar
{
    UPROPERTY()
    ESlateVisibility HeadVisibility;
    UPROPERTY()
    ESlateVisibility ReadyVisibility;
    UPROPERTY()
    ESlateVisibility Myself;
    UPROPERTY()
    int MyselfSwitch;
    UPROPERTY()
    FSoftBrush OwnerIcon;
    UPROPERTY()
    TEUIModelRef<FVM_CookReadyHeadAvatar> Self;


}

struct __GeneratedProperties_FVM_CookReady
{
    UPROPERTY()
    ESlateVisibility ReadyWindowVisibility;
    UPROPERTY()
    int ReadyAnimSwitch;
    UPROPERTY()
    TEUIModelRef<FVM_CookReady> Self;


}

namespace FVM_CookReadyHeadAvatar
{
FVM_CookReadyHeadAvatar& Create(const UObject ContextObject)
{
    return FVM_CookReadyHeadAvatar::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CookReadyHeadAvatar CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CookReadyHeadAvatar __r;
    TEUIModelRef<FVM_CookReadyHeadAvatar> local_6 = TEUIModelRef<FVM_CookReadyHeadAvatar>(EUIInternal::MakeModelWithManager(Manager, FVM_CookReadyHeadAvatar::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "HeadVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReadyVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Myself";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MyselfSwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OwnerIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CookReadyHeadAvatar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CookReadyHeadAvatar;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CookReadyHeadAvatar;
}
ESlateVisibility __UIGetter_HeadVisibility(const FVM_CookReadyHeadAvatar &inout Model)
{
    return Model.GetHeadVisibility();
}
ESlateVisibility __UIGetter_ReadyVisibility(const FVM_CookReadyHeadAvatar &inout Model)
{
    return Model.GetReadyVisibility();
}
ESlateVisibility __UIGetter_Myself(const FVM_CookReadyHeadAvatar &inout Model)
{
    return Model.GetMyself();
}
int __UIGetter_MyselfSwitch(const FVM_CookReadyHeadAvatar &inout Model)
{
    return Model.GetMyselfSwitch();
}
FSoftBrush __UIGetter_OwnerIcon(const FVM_CookReadyHeadAvatar &inout Model)
{
    return Model.GetOwnerIcon();
}
TEUIModelRef<FVM_CookReadyHeadAvatar> __UIGetter_Self(const FVM_CookReadyHeadAvatar &inout Model)
{
    return TEUIModelRef<FVM_CookReadyHeadAvatar>(Model);
}
int __IndexOf_PlayerEntity()
{
    return 0;
}
int __IndexOf_bReady()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CookReadyHeadAvatar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CookReady
{
FVM_CookReady& Create(const UObject ContextObject)
{
    return FVM_CookReady::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CookReady CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CookReady __r;
    TEUIModelRef<FVM_CookReady> local_6 = TEUIModelRef<FVM_CookReady>(EUIInternal::MakeModelWithManager(Manager, FVM_CookReady::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrentHeadAvatars";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CookReadyHeadAvatar>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReadyWindowVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReadyAnimSwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CookReady>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CookReady;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnCookPropChanged";
    local_26.ComponentType = FC_CookProp;
    local_26.MonitorPropertyName = FName("CookPropEntity");
    int local_2_2 = FVM_CookReady::__IndexOf_CookPropEntity();
    Result.MonitorFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CookReady;
}
void __OnCookPropChanged(FVM_CookReady &inout Model, const FECSEntity &inout Entity, const FC_CookProp &inout Component)
{
    Model.OnCookPropChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<TEUIModelRef<FVM_CookReadyHeadAvatar>> __UIGetter_CurrentHeadAvatars(const FVM_CookReady &inout Model)
{
    return Model.GetCurrentHeadAvatars();
}
ESlateVisibility __UIGetter_ReadyWindowVisibility(const FVM_CookReady &inout Model)
{
    return Model.GetReadyWindowVisibility();
}
int __UIGetter_ReadyAnimSwitch(const FVM_CookReady &inout Model)
{
    return Model.GetReadyAnimSwitch();
}
TEUIModelRef<FVM_CookReady> __UIGetter_Self(const FVM_CookReady &inout Model)
{
    return TEUIModelRef<FVM_CookReady>(Model);
}
int __IndexOf_CurrentHeadAvatars()
{
    return 0;
}
int __IndexOf_CookPropEntity()
{
    return 1;
}
int __IndexOf_bReady()
{
    return 2;
}
int __IndexOf_bShow()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_CookReady
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
