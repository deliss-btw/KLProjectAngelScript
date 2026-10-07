
namespace FVM_BuffHoverDialog
{
    const int ModelId = 0;

}
struct FVM_BuffHoverDialog : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<FBuffHoverDialogItemData> m_BuffRowList;
    UPROPERTY()
    TArray<FEUIModelContainer> m_BuffModels;
    UPROPERTY()
    int m_IsEmptyFood;

    FVM_BuffHoverDialog()
    {
        this.m_IsEmptyFood = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BuffHoverDialog' by default constructor.");
        return;
    }
    FVM_BuffHoverDialog(const FVM_BuffHoverDialog &inout Other)
    {
        this.m_IsEmptyFood = 0;
        this.m_BuffRowList = Other.m_BuffRowList;
        this.m_BuffModels = Other.m_BuffModels;
        this.m_IsEmptyFood = int(Other.m_IsEmptyFood);
        return;
    }
    FVM_BuffHoverDialog(const TArray<FBuffHoverDialogItemData> &inout InBuffRowList)
    {
        this.m_IsEmptyFood = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetBuffRowList(InBuffRowList);
        return;
    }
    FVM_BuffHoverDialog opAssign(const FVM_BuffHoverDialog &inout Other)
    {
        FVM_BuffHoverDialog __r;
        this.m_BuffRowList = Other.m_BuffRowList;
        this.m_BuffModels = Other.m_BuffModels;
        this.m_IsEmptyFood = int(Other.m_IsEmptyFood);
        return __r;
    }
    void PostConstruct()
    {
        this.GetModify_BuffModels().Empty(0);
        for (auto& local_18 : this.GetBuffRowList())
        {
            MakeCached local_32 = FEUIModelContainer::MakeCached(local_18);
            this.GetModify_BuffModels().Add(local_32.opImplConv());
        }
        return;
    }
    const TArray<FBuffHoverDialogItemData> GetBuffRowList() const property
    {
        const TArray<FBuffHoverDialogItemData> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FBuffHoverDialogItemData> GetModify_BuffRowList() property
    {
        TArray<FBuffHoverDialogItemData> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetBuffRowList(const TArray<FBuffHoverDialogItemData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_BuffRowList = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetBuffModels() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_BuffModels() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetBuffModels(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_BuffModels = __Value;
        return;
    }
    int GetIsEmptyFood() const property
    {
        this.TrackPropertyRead(2);
        return this.m_IsEmptyFood;
    }
    void SetIsEmptyFood(const int __Value) property
    {
        if (this.m_IsEmptyFood == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_IsEmptyFood = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BuffHoverDialog
{
    UPROPERTY()
    TEUIModelRef<FVM_BuffHoverDialog> Self;

    __GeneratedProperties_FVM_BuffHoverDialog()
    {
        return;
    }
}

namespace FVM_BuffHoverDialog
{
FVM_BuffHoverDialog& Create(const UObject ContextObject, const TArray<FBuffHoverDialogItemData> &inout BuffRowList)
{
    return FVM_BuffHoverDialog::CreateByManager(EUIInternal::GetContextManager(ContextObject), BuffRowList);
}
FVM_BuffHoverDialog CreateByManager(const UEUIManagerSubsystem Manager, const TArray<FBuffHoverDialogItemData> &inout BuffRowList)
{
    FVM_BuffHoverDialog __r;
    TEUIModelRef<FVM_BuffHoverDialog> local_6 = TEUIModelRef<FVM_BuffHoverDialog>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BuffHoverDialog::ModelId, 0, BuffRowList));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BuffModels";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEmptyFood";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BuffHoverDialog>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BuffHoverDialog;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BuffHoverDialog;
}
TArray<FEUIModelContainer> __UIGetter_BuffModels(const FVM_BuffHoverDialog &inout Model)
{
    return Model.GetBuffModels();
}
int __UIGetter_IsEmptyFood(const FVM_BuffHoverDialog &inout Model)
{
    return Model.GetIsEmptyFood();
}
TEUIModelRef<FVM_BuffHoverDialog> __UIGetter_Self(const FVM_BuffHoverDialog &inout Model)
{
    return TEUIModelRef<FVM_BuffHoverDialog>(Model);
}
int __IndexOf_BuffRowList()
{
    return 0;
}
int __IndexOf_BuffModels()
{
    return 1;
}
int __IndexOf_IsEmptyFood()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_BuffHoverDialog
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
