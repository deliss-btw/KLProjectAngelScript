
namespace FVM_GuideTargetIcon
{
    const int ModelId = 0;
}
namespace FVM_GuideTargetMinimapIcon
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature RemoveGuideTarget = FEUIModelCallbackSignature();

}
struct FVM_GuideTargetIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_IconIndex;

    FVM_GuideTargetIcon()
    {
        this.m_IconIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_GuideTargetIcon' by default constructor.");
        return;
    }
    FVM_GuideTargetIcon(const FVM_GuideTargetIcon &inout Other)
    {
        this.m_IconIndex = 0;
        this.m_IconIndex = int(Other.m_IconIndex);
        return;
    }
    FVM_GuideTargetIcon(const int InIconIndex)
    {
        this.m_IconIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIconIndex(InIconIndex);
        return;
    }
    FVM_GuideTargetIcon opAssign(const FVM_GuideTargetIcon &inout Other)
    {
        FVM_GuideTargetIcon __r;
        this.m_IconIndex = int(Other.m_IconIndex);
        return __r;
    }
    int GetIconIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_IconIndex;
    }
    void SetIconIndex(const int __Value) property
    {
        if (this.m_IconIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_IconIndex = __Value;
        return;
    }
}

struct FVM_GuideTargetMinimapIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_Creater;
    UPROPERTY()
    FEUIModelRef m_Icon;

    FVM_GuideTargetMinimapIcon()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_GuideTargetMinimapIcon' by default constructor.");
        return;
    }
    FVM_GuideTargetMinimapIcon(const FVM_GuideTargetMinimapIcon &inout Other)
    {
        this.m_Creater = Other.m_Creater;
        this.m_Icon = Other.m_Icon;
        return;
    }
    FVM_GuideTargetMinimapIcon(const FECSEntity &inout InCreater)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCreater(InCreater);
        return;
    }
    FVM_GuideTargetMinimapIcon& opAssign(const FVM_GuideTargetMinimapIcon &inout Other)
    {
        this.m_Creater = Other.m_Creater;
        return Other.m_Icon;
    }
    void PostConstruct()
    {
        if ((this.GetContext().GetLocalPlayer() == this.GetCreater()))
        {
        }
        else
        {
        }
        this.SetIcon(FEUIModelRef());
        return;
    }
    void RemoveGuideTarget()
    {
        if ((this.GetContext().GetLocalPlayer() == this.GetCreater()))
        {
            ::FGuidingPathUtils::RequestGuidingPathCancel(this.GetContext().GetLocalPlayer());
        }
        return;
    }
    const FECSEntity GetCreater() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_Creater() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCreater(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Creater = __Value;
        return;
    }
    FEUIModelRef GetIcon() const property
    {
        FEUIModelRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelRef GetModify_Icon() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetIcon(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Icon = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_GuideTargetIcon
{
    UPROPERTY()
    TEUIModelRef<FVM_GuideTargetIcon> Self;

    __GeneratedProperties_FVM_GuideTargetIcon()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_GuideTargetMinimapIcon
{
    UPROPERTY()
    TEUIModelRef<FVM_GuideTargetMinimapIcon> Self;

    __GeneratedProperties_FVM_GuideTargetMinimapIcon()
    {
        return;
    }
}

namespace FVM_GuideTargetIcon
{
FVM_GuideTargetIcon& Create(const UObject ContextObject, const int IconIndex)
{
    return FVM_GuideTargetIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), IconIndex);
}
FVM_GuideTargetIcon CreateByManager(const UEUIManagerSubsystem Manager, const int IconIndex)
{
    FVM_GuideTargetIcon __r;
    TEUIModelRef<FVM_GuideTargetIcon> local_6 = TEUIModelRef<FVM_GuideTargetIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_GuideTargetIcon::ModelId, 0, IconIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_GuideTargetIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_GuideTargetIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_GuideTargetIcon;
}
TEUIModelRef<FVM_GuideTargetIcon> __UIGetter_Self(const FVM_GuideTargetIcon &inout Model)
{
    return TEUIModelRef<FVM_GuideTargetIcon>(Model);
}
int __IndexOf_IconIndex()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_GuideTargetIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_GuideTargetMinimapIcon
{
FVM_GuideTargetMinimapIcon& Create(const UObject ContextObject, const FECSEntity &inout Creater)
{
    return FVM_GuideTargetMinimapIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), Creater);
}
FVM_GuideTargetMinimapIcon CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout Creater)
{
    FVM_GuideTargetMinimapIcon __r;
    TEUIModelRef<FVM_GuideTargetMinimapIcon> local_6 = TEUIModelRef<FVM_GuideTargetMinimapIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_GuideTargetMinimapIcon::ModelId, 0, Creater));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_GuideTargetMinimapIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_GuideTargetMinimapIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_GuideTargetMinimapIcon;
}
FEUIModelRef __UIGetter_Icon(const FVM_GuideTargetMinimapIcon &inout Model)
{
    return Model.GetIcon();
}
TEUIModelRef<FVM_GuideTargetMinimapIcon> __UIGetter_Self(const FVM_GuideTargetMinimapIcon &inout Model)
{
    return TEUIModelRef<FVM_GuideTargetMinimapIcon>(Model);
}
int __IndexOf_Creater()
{
    return 0;
}
int __IndexOf_Icon()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_GuideTargetMinimapIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
