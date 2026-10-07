
namespace FVM_Execute_QTEDir
{
    const int ModelId = 0;

}
struct FVM_Execute_QTEDir : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_QTE_Progress;
    UPROPERTY()
    FText m_HintText;
    UPROPERTY()
    FECSEntity m_PawnEntity;
    UPROPERTY()
    FECSEntity m_PlayerEntity;
    UPROPERTY()
    int m_TeamMemberNum;
    UPROPERTY()
    float32 m_SuccTimes;

    FVM_Execute_QTEDir()
    {
        this.m_QTE_Progress = 0.0f;
        this.m_TeamMemberNum = 1;
        this.m_SuccTimes = 2.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Execute_QTEDir(const FVM_Execute_QTEDir &inout Other)
    {
        this.m_QTE_Progress = 0.0f;
        this.m_TeamMemberNum = 1;
        this.m_SuccTimes = 2.0f;
        this.m_QTE_Progress = Other.m_QTE_Progress;
        this.m_HintText = Other.m_HintText;
        this.m_PawnEntity = Other.m_PawnEntity;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_TeamMemberNum = int(Other.m_TeamMemberNum);
        this.m_SuccTimes = Other.m_SuccTimes;
        return;
    }
    FVM_Execute_QTEDir opAssign(const FVM_Execute_QTEDir &inout Other)
    {
        FVM_Execute_QTEDir __r;
        this.m_QTE_Progress = Other.m_QTE_Progress;
        this.m_HintText = Other.m_HintText;
        this.m_PawnEntity = Other.m_PawnEntity;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_TeamMemberNum = int(Other.m_TeamMemberNum);
        this.m_SuccTimes = Other.m_SuccTimes;
        return __r;
    }
    void PostConstruct()
    {
        this.SetPawnEntity(::FASCommonUtils::GetLocalPlayerPawnEntity());
        this.SetPlayerEntity(::FASCommonUtils::GetUniquePlayerEntity(this.GetPawnEntity()));
        return;
    }
    void Tick()
    {
        int local_14 = 0;
        Get local_4;
        const FC_PlayerInTeam& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GetTeamEntity().IsValid())
            {
                this.SetTeamMemberNum(local_14.GetMembers().Num());
            }
        }
        if (this.GetTeamMemberNum() == 1)
        {
            FNameHandle_EntityBBVarInt local_26;
            this.SetHintText(NSLOCTEXT("ExecuteQTESoloHint", "жЊЃз»­еЋ‹е€¶з›®ж ‡пјЃ"));
            local_26;
            this.SetQTE_Progress(FMath::Clamp((this.GetPawnEntity().GetBB_Int(local_26) / this.GetSuccTimes()), 0.0f, 1.0f));
            return;
        }
        this.SetHintText(NSLOCTEXT("ExecuteQTETeamHint", "й›†з»“йџеЏ‹ж”»е‡»з›®ж ‡е¤ґйѓЁпјЊе°ЅеЏЇиѓЅйЂ ж€ђдј¤е®іпјЃ"));
        FNameHandle_EntityBBVarEntity local_34;
        local_34;
        FECSEntity local_38 = this.GetPawnEntity().GetBB_Entity(local_34);
        if (local_38.IsValid())
        {
            FNameHandle_EntityBBVarFloat local_48;
            local_48;
            float32 local_29 = local_38.GetBB_Float(local_48);
            local_48;
            float32 local_43 = local_38.GetBB_Float(local_48);
            if (local_43 > 0.0f)
            {
                this.SetQTE_Progress(FMath::Clamp(local_29 / local_43, 0.0f, 1.0f));
            }
            else
            {
                this.SetQTE_Progress(0.0f);
            }
        }
        return;
    }
    const float32 GetQTE_Progress() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_QTE_Progress() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetQTE_Progress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_QTE_Progress = __Value;
        return;
    }
    const FText GetHintText() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_HintText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetHintText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HintText = __Value;
        return;
    }
    FECSEntity GetPawnEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FECSEntity GetModify_PawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PawnEntity = __Value;
        return;
    }
    FECSEntity GetPlayerEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FECSEntity GetModify_PlayerEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPlayerEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PlayerEntity = __Value;
        return;
    }
    int GetTeamMemberNum() const property
    {
        this.TrackPropertyRead(4);
        return this.m_TeamMemberNum;
    }
    void SetTeamMemberNum(const int __Value) property
    {
        if (this.m_TeamMemberNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TeamMemberNum = __Value;
        return;
    }
    const float32 GetSuccTimes() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_SuccTimes() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetSuccTimes(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SuccTimes = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Execute_QTEDir
{
    UPROPERTY()
    TEUIModelRef<FVM_Execute_QTEDir> Self;

    __GeneratedProperties_FVM_Execute_QTEDir()
    {
        return;
    }
}

namespace FVM_Execute_QTEDir
{
FVM_Execute_QTEDir& Create(const UObject ContextObject)
{
    return FVM_Execute_QTEDir::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Execute_QTEDir CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Execute_QTEDir __r;
    TEUIModelRef<FVM_Execute_QTEDir> local_6 = TEUIModelRef<FVM_Execute_QTEDir>(EUIInternal::MakeModelWithManager(Manager, FVM_Execute_QTEDir::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "QTE_Progress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HintText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Execute_QTEDir>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Execute_QTEDir;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Execute_QTEDir;
}
void __Tick(FVM_Execute_QTEDir &inout Model)
{
    Model.Tick();
    return;
}
float32 __UIGetter_QTE_Progress(const FVM_Execute_QTEDir &inout Model)
{
    return Model.GetQTE_Progress();
}
FText __UIGetter_HintText(const FVM_Execute_QTEDir &inout Model)
{
    return Model.GetHintText();
}
TEUIModelRef<FVM_Execute_QTEDir> __UIGetter_Self(const FVM_Execute_QTEDir &inout Model)
{
    return TEUIModelRef<FVM_Execute_QTEDir>(Model);
}
int __IndexOf_QTE_Progress()
{
    return 0;
}
int __IndexOf_HintText()
{
    return 1;
}
int __IndexOf_PawnEntity()
{
    return 2;
}
int __IndexOf_PlayerEntity()
{
    return 3;
}
int __IndexOf_TeamMemberNum()
{
    return 4;
}
int __IndexOf_SuccTimes()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_Execute_QTEDir
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
