
namespace FVM_DialogueOptionItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectOption = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnComfirmed = FEUIModelCallbackSignature();

}
struct FVM_DialogueOptionItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FDialogueOptionInfo m_OptionInfo;
    UPROPERTY()
    FSlateBrush m_EmptyIcon;

    FVM_DialogueOptionItem()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_DialogueOptionItem' by default constructor.");
        return;
    }
    FVM_DialogueOptionItem(const FVM_DialogueOptionItem &inout Other)
    {
        this.m_OptionInfo = Other.m_OptionInfo;
        this.m_EmptyIcon = Other.m_EmptyIcon;
        return;
    }
    FVM_DialogueOptionItem(const FDialogueOptionInfo &inout InOptionInfo)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetOptionInfo(InOptionInfo);
        return;
    }
    FVM_DialogueOptionItem& opAssign(const FVM_DialogueOptionItem &inout Other)
    {
        this.m_OptionInfo = Other.m_OptionInfo;
        return Other.m_EmptyIcon;
    }
    void PostConstruct()
    {
        this.SetEmptyIcon(FSlateBrush());
        return;
    }
    FText GetOptionText() const
    {
        return this.GetOptionInfo().GetOptionText();
    }
    FSlateBrush GetOptionIcon() const
    {
        if (this.GetOptionInfo().GetOptionStyle().IsSet())
        {
            return FSlateBrush();
        }
        else
        {
            return this.GetEmptyIcon();
        }
    }
    void SelectOption()
    {
        FFPTime local_10 = FFPTime(-1);
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        FCE_DialogueOptionSelectClient local_14;
        local_14.OptionNodeId = this.GetOptionInfo().GetOptionNodeId();
        local_14.AttachedDialogueConfig = this.GetOptionInfo().GetAttachedDialogueConfig();
        return;
    }
    void OnSelected()
    {
        bool local_50 = false;
        if (this.GetOptionInfo().GetOptionStyle().IsSet() && local_50)
        {
            FDialogModelCallback local_76;
            local_76.Bind(this, FVM_DialogueOptionItem::OnComfirmed);
            FDialogCallback local_108 = FDialogCallback(local_76);
            return;
        }
        this.SelectOption();
        return;
    }
    bool OnComfirmed(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            this.SelectOption();
        }
        return true;
    }
    const FDialogueOptionInfo GetOptionInfo() const property
    {
        const FDialogueOptionInfo __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FDialogueOptionInfo GetModify_OptionInfo() property
    {
        FDialogueOptionInfo __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetOptionInfo(const FDialogueOptionInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OptionInfo = __Value;
        return;
    }
    const FSlateBrush GetEmptyIcon() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSlateBrush GetModify_EmptyIcon() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEmptyIcon(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EmptyIcon = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_DialogueOptionItem
{
    UPROPERTY()
    FText OptionText;
    UPROPERTY()
    FSlateBrush OptionIcon;
    UPROPERTY()
    TEUIModelRef<FVM_DialogueOptionItem> Self;

    __GeneratedProperties_FVM_DialogueOptionItem()
    {
        return;
    }
}

namespace FVM_DialogueOptionItem
{
FVM_DialogueOptionItem& Create(const UObject ContextObject, const FDialogueOptionInfo &inout OptionInfo)
{
    return FVM_DialogueOptionItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), OptionInfo);
}
FVM_DialogueOptionItem CreateByManager(const UEUIManagerSubsystem Manager, const FDialogueOptionInfo &inout OptionInfo)
{
    FVM_DialogueOptionItem __r;
    TEUIModelRef<FVM_DialogueOptionItem> local_6 = TEUIModelRef<FVM_DialogueOptionItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_DialogueOptionItem::ModelId, 0, OptionInfo));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "OptionText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OptionIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_DialogueOptionItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_DialogueOptionItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_DialogueOptionItem;
}
FText __UIGetter_OptionText(const FVM_DialogueOptionItem &inout Model)
{
    return Model.GetOptionText();
}
FSlateBrush __UIGetter_OptionIcon(const FVM_DialogueOptionItem &inout Model)
{
    return Model.GetOptionIcon();
}
TEUIModelRef<FVM_DialogueOptionItem> __UIGetter_Self(const FVM_DialogueOptionItem &inout Model)
{
    return TEUIModelRef<FVM_DialogueOptionItem>(Model);
}
int __IndexOf_OptionInfo()
{
    return 0;
}
int __IndexOf_EmptyIcon()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_DialogueOptionItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
