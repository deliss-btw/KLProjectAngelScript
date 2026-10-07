
namespace FVM_CommissionFinishResurltItem
{
    const int ModelId = 0;

}
struct FCommissionFinishResurltItemParam
{
    UPROPERTY()
    FText ResurltContent;
    UPROPERTY()
    int ResurltNum;
    UPROPERTY()
    int ResurltScore;


}

struct FVM_CommissionFinishResurltItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_ResurltContent;
    UPROPERTY()
    int m_ResurltNum;
    UPROPERTY()
    int m_ResurltScore;

    FVM_CommissionFinishResurltItem()
    {
        this.m_ResurltNum = 0;
        this.m_ResurltScore = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionFinishResurltItem' by default constructor.");
        return;
    }
    FVM_CommissionFinishResurltItem(const FVM_CommissionFinishResurltItem &inout Other)
    {
        this.m_ResurltNum = 0;
        this.m_ResurltScore = 0;
        this.m_ResurltContent = Other.m_ResurltContent;
        this.m_ResurltNum = int(Other.m_ResurltNum);
        this.m_ResurltScore = int(Other.m_ResurltScore);
        return;
    }
    FVM_CommissionFinishResurltItem(const FText &inout InResurltContent, const int InResurltNum, const int InResurltScore)
    {
        this.m_ResurltNum = 0;
        this.m_ResurltScore = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetResurltContent(InResurltContent);
        this.SetResurltNum(InResurltNum);
        this.SetResurltScore(InResurltScore);
        return;
    }
    FVM_CommissionFinishResurltItem opAssign(const FVM_CommissionFinishResurltItem &inout Other)
    {
        FVM_CommissionFinishResurltItem __r;
        this.m_ResurltContent = Other.m_ResurltContent;
        this.m_ResurltNum = int(Other.m_ResurltNum);
        this.m_ResurltScore = int(Other.m_ResurltScore);
        return __r;
    }
    bool GetHasNum() const
    {
        return (this.GetResurltNum() > 1);
    }
    const FText GetResurltContent() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_ResurltContent() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetResurltContent(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ResurltContent = __Value;
        return;
    }
    int GetResurltNum() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ResurltNum;
    }
    void SetResurltNum(const int __Value) property
    {
        if (this.m_ResurltNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ResurltNum = __Value;
        return;
    }
    int GetResurltScore() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ResurltScore;
    }
    void SetResurltScore(const int __Value) property
    {
        if (this.m_ResurltScore == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ResurltScore = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionFinishResurltItem
{
    UPROPERTY()
    bool HasNum;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionFinishResurltItem> Self;


}

namespace FVM_CommissionFinishResurltItem
{
FVM_CommissionFinishResurltItem& Create(const UObject ContextObject, const FText &inout ResurltContent, const int ResurltNum, const int ResurltScore)
{
    return FVM_CommissionFinishResurltItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), ResurltContent, ResurltNum, ResurltScore);
}
FVM_CommissionFinishResurltItem CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout ResurltContent, const int ResurltNum, const int ResurltScore)
{
    FVM_CommissionFinishResurltItem __r;
    TEUIModelRef<FVM_CommissionFinishResurltItem> local_6 = TEUIModelRef<FVM_CommissionFinishResurltItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionFinishResurltItem::ModelId, 0, ResurltContent, ResurltNum, ResurltScore));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ResurltContent";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ResurltNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ResurltScore";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasNum";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionFinishResurltItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionFinishResurltItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionFinishResurltItem;
}
FText __UIGetter_ResurltContent(const FVM_CommissionFinishResurltItem &inout Model)
{
    return Model.GetResurltContent();
}
int __UIGetter_ResurltNum(const FVM_CommissionFinishResurltItem &inout Model)
{
    return Model.GetResurltNum();
}
int __UIGetter_ResurltScore(const FVM_CommissionFinishResurltItem &inout Model)
{
    return Model.GetResurltScore();
}
bool __UIGetter_HasNum(const FVM_CommissionFinishResurltItem &inout Model)
{
    return Model.GetHasNum();
}
TEUIModelRef<FVM_CommissionFinishResurltItem> __UIGetter_Self(const FVM_CommissionFinishResurltItem &inout Model)
{
    return TEUIModelRef<FVM_CommissionFinishResurltItem>(Model);
}
int __IndexOf_ResurltContent()
{
    return 0;
}
int __IndexOf_ResurltNum()
{
    return 1;
}
int __IndexOf_ResurltScore()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CommissionFinishResurltItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
