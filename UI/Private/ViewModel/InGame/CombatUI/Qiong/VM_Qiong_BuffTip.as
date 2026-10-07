
namespace FVM_Qiong_BuffTip
{
    const int ModelId = 0;

}
struct FVM_Qiong_BuffTip : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_FromEntity;
    UPROPERTY()
    FECSEntity m_AttachEntity;
    UPROPERTY()
    FBuffConfigRef m_BuffConfig;
    UPROPERTY()
    FVector m_Offset;

    FVM_Qiong_BuffTip()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_Qiong_BuffTip' by default constructor.");
        return;
    }
    FVM_Qiong_BuffTip(const FVM_Qiong_BuffTip &inout Other)
    {
        this.m_FromEntity = Other.m_FromEntity;
        this.m_AttachEntity = Other.m_AttachEntity;
        this.m_BuffConfig = Other.m_BuffConfig;
        this.m_Offset = Other.m_Offset;
        return;
    }
    FVM_Qiong_BuffTip(const FECSEntity &inout InFromEntity, const FECSEntity &inout InAttachEntity, const FBuffConfigRef &inout InBuffConfig, const FVector &inout InOffset)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetFromEntity(InFromEntity);
        this.SetAttachEntity(InAttachEntity);
        this.SetBuffConfig(InBuffConfig);
        this.SetOffset(InOffset);
        return;
    }
    FVM_Qiong_BuffTip& opAssign(const FVM_Qiong_BuffTip &inout Other)
    {
        this.m_FromEntity = Other.m_FromEntity;
        this.m_AttachEntity = Other.m_AttachEntity;
        this.m_BuffConfig = Other.m_BuffConfig;
        return Other.m_Offset;
    }
    int GetTextInfoVM() const
    {
        return FBuffUtils::GetBuffStackNum(this.GetAttachEntity(), this.GetBuffConfig(), ECS::GetContextTime());
    }
    ESlateVisibility GetVisiblityVM() const
    {
        bool local_1;
        if (!(this.GetFromEntity().IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Has local_6;
            local_1 = local_6.opCall();
        }
        if (local_1)
        {
            return ESlateVisibility(1);
        }
        if (FBuffUtils::GetBuffStackNum(this.GetAttachEntity(), this.GetBuffConfig(), ECS::GetContextTime()) == 0)
        {
            return ESlateVisibility(1);
        }
        return ESlateVisibility(0);
    }
    const FECSEntity GetFromEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_FromEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetFromEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_FromEntity = __Value;
        return;
    }
    const FECSEntity GetAttachEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FECSEntity GetModify_AttachEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAttachEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AttachEntity = __Value;
        return;
    }
    FBuffConfigRef GetBuffConfig() const property
    {
        FBuffConfigRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FBuffConfigRef GetModify_BuffConfig() property
    {
        FBuffConfigRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetBuffConfig(const FBuffConfigRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_BuffConfig = __Value;
        return;
    }
    const FVector GetOffset() const property
    {
        const FVector __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FVector GetModify_Offset() property
    {
        FVector __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Offset = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Qiong_BuffTip
{
    UPROPERTY()
    int TextInfoVM;
    UPROPERTY()
    ESlateVisibility VisiblityVM;
    UPROPERTY()
    TEUIModelRef<FVM_Qiong_BuffTip> Self;


}

namespace FVM_Qiong_BuffTip
{
FVM_Qiong_BuffTip& Create(const UObject ContextObject, const FECSEntity &inout FromEntity, const FECSEntity &inout AttachEntity, const FBuffConfigRef &inout BuffConfig, const FVector &inout Offset)
{
    return FVM_Qiong_BuffTip::CreateByManager(EUIInternal::GetContextManager(ContextObject), FromEntity, AttachEntity, BuffConfig, Offset);
}
FVM_Qiong_BuffTip CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout FromEntity, const FECSEntity &inout AttachEntity, const FBuffConfigRef &inout BuffConfig, const FVector &inout Offset)
{
    FVM_Qiong_BuffTip __r;
    TEUIModelRef<FVM_Qiong_BuffTip> local_6 = TEUIModelRef<FVM_Qiong_BuffTip>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Qiong_BuffTip::ModelId, 0, FromEntity, AttachEntity, BuffConfig, Offset));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TextInfoVM";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VisiblityVM";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Qiong_BuffTip>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Qiong_BuffTip;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Qiong_BuffTip;
}
int __UIGetter_TextInfoVM(const FVM_Qiong_BuffTip &inout Model)
{
    return Model.GetTextInfoVM();
}
ESlateVisibility __UIGetter_VisiblityVM(const FVM_Qiong_BuffTip &inout Model)
{
    return Model.GetVisiblityVM();
}
TEUIModelRef<FVM_Qiong_BuffTip> __UIGetter_Self(const FVM_Qiong_BuffTip &inout Model)
{
    return TEUIModelRef<FVM_Qiong_BuffTip>(Model);
}
int __IndexOf_FromEntity()
{
    return 0;
}
int __IndexOf_AttachEntity()
{
    return 1;
}
int __IndexOf_BuffConfig()
{
    return 2;
}
int __IndexOf_Offset()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_Qiong_BuffTip
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
