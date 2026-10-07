
namespace FVM_PlayerMinimapIcon
{
    const int ModelId = 0;

}
struct FVM_PlayerMinimapIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    float32 m_RotationAngle;
    UPROPERTY()
    FLinearColor m_IconColor;

    FVM_PlayerMinimapIcon()
    {
        this.m_RotationAngle = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PlayerMinimapIcon' by default constructor.");
        return;
    }
    FVM_PlayerMinimapIcon(const FVM_PlayerMinimapIcon &inout Other)
    {
        this.m_RotationAngle = 0.0f;
        this.m_Spot = Other.m_Spot;
        this.m_RotationAngle = Other.m_RotationAngle;
        this.m_IconColor = Other.m_IconColor;
        return;
    }
    FVM_PlayerMinimapIcon(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        this.m_RotationAngle = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_PlayerMinimapIcon& opAssign(const FVM_PlayerMinimapIcon &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_RotationAngle = Other.m_RotationAngle;
        return Other.m_IconColor;
    }
    FWidgetTransform GetRenderTransform() const
    {
        int local_15 = int(this.GetRotationAngle());
        return FWidgetTransform();
    }
    bool IsSelfIcon() const
    {
        if (this.GetSpot())
        {
            TEUIModelRef<FM_Player> local_6 = ::GetPlayer(this.GetSpot().opArrow());
            if (local_6)
            {
                return local_6.opArrow().IsLocalPlayer();
            }
        }
        return false;
    }
    bool IsTeammateIcon() const
    {
        TEUIModelRef<FM_Spot> local_2 = this.GetSpot();
        if (local_2)
        {
            TEUIModelRef<FM_Spot> local_2_2 = this.GetSpot();
            TEUIModelRef<FM_Player> local_6 = ::GetPlayer(local_2_2.opArrow());
            if (local_6)
            {
                if (local_6.opArrow().IsLocalPlayer())
                {
                    return false;
                }
                return ::FMS_LocalPlayerTeamData::Get(this.GetContext().Manager).IsAnyTeamMember(local_6);
            }
        }
        return false;
    }
    TEUIModelRef<FM_TeamMember> GetTeamMember() const
    {
        FMS_LocalPlayerTeamData& local_2 = ::FMS_LocalPlayerTeamData::Get(this.GetContext().Manager);
        TEUIModelRef<FM_TeamMember> local_10 = local_2.GetTeamMember(::GetPlayer(this.GetSpot().opArrow()), ETeamType(2));
        if (local_10)
        {
            return local_10;
        }
        TEUIModelRef<FM_TeamMember> local_12 = local_2.GetTeamMember(::GetPlayer(this.GetSpot().opArrow()), ETeamType(1));
        if (local_12)
        {
            return local_12;
        }
        return local_10;
    }
    TEUIModelRef<FVM_Index> GetTeamMemberIndex() const
    {
        TEUIModelRef<FM_TeamMember> local_2 = this.GetTeamMember();
        if (local_2)
        {
            return TEUIModelRef<FVM_Index>(::FVM_Index::Create(this.GetContext().Manager, local_2.opArrow().GetMemberIndex()));
        }
        return TEUIModelRef<FVM_Index>();
    }
    int GetDisplayStyleIndex() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    void PostConstruct()
    {
        FSpotViewAdapter local_10;
        TDataObjectPtr<FMinimapIconConfig> local_34 = ::GetMinimapIconConfig(this.GetSpot().opArrow(), local_10);
        if (local_34)
        {
            TDataObjectPtr<FMinimapIconConfig_Player> local_84 = TDataObjectPtr<FMinimapIconConfig_Player>(local_34.opImplConv());
        }
        return;
    }
    void Tick()
    {
        if (!(this.GetSpot()))
        {
            return;
        }
        this.SetRotation(this.GetSpot().opArrow().GetTransform().GetRotator().Quaternion());
        return;
    }
    void SetRotation(const FQuat4f &inout Rotation)
    {
        float32 local_4;
        FVector3f local_3;
        Rotation.ToAxisAndAngle(local_3, local_4);
        this.SetRotationAngle((FMath::RadiansToDegrees(local_4) * FMath::Sign(local_3.Z)) + 90.0f);
        return;
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Spot = __Value;
        return;
    }
    const float32 GetRotationAngle() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_RotationAngle() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetRotationAngle(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RotationAngle = __Value;
        return;
    }
    FLinearColor GetIconColor() const property
    {
        FLinearColor __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FLinearColor GetModify_IconColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetIconColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_IconColor = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PlayerMinimapIcon
{
    UPROPERTY()
    FWidgetTransform RenderTransform;
    UPROPERTY()
    bool IsSelfIcon;
    UPROPERTY()
    bool IsTeammateIcon;
    UPROPERTY()
    TEUIModelRef<FM_TeamMember> TeamMember;
    UPROPERTY()
    TEUIModelRef<FVM_Index> TeamMemberIndex;
    UPROPERTY()
    int DisplayStyleIndex;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerMinimapIcon> Self;


}

namespace FVM_PlayerMinimapIcon
{
FVM_PlayerMinimapIcon& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_PlayerMinimapIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_PlayerMinimapIcon CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_PlayerMinimapIcon __r;
    TEUIModelRef<FVM_PlayerMinimapIcon> local_6 = TEUIModelRef<FVM_PlayerMinimapIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PlayerMinimapIcon::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RotationAngle";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RenderTransform";
    local_14.TypeName = "FWidgetTransform";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelfIcon";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsTeammateIcon";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeamMember";
    local_14.TypeName = "TEUIModelRef<FM_TeamMember>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeamMemberIndex";
    local_14.TypeName = "TEUIModelRef<FVM_Index>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayStyleIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerMinimapIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayerMinimapIcon;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayerMinimapIcon;
}
void __Tick(FVM_PlayerMinimapIcon &inout Model)
{
    Model.Tick();
    return;
}
float32 __UIGetter_RotationAngle(const FVM_PlayerMinimapIcon &inout Model)
{
    return Model.GetRotationAngle();
}
FLinearColor __UIGetter_IconColor(const FVM_PlayerMinimapIcon &inout Model)
{
    return Model.GetIconColor();
}
FWidgetTransform __UIGetter_RenderTransform(const FVM_PlayerMinimapIcon &inout Model)
{
    return Model.GetRenderTransform();
}
bool __UIGetter_IsSelfIcon(const FVM_PlayerMinimapIcon &inout Model)
{
    return Model.IsSelfIcon();
}
bool __UIGetter_IsTeammateIcon(const FVM_PlayerMinimapIcon &inout Model)
{
    return Model.IsTeammateIcon();
}
TEUIModelRef<FM_TeamMember> __UIGetter_TeamMember(const FVM_PlayerMinimapIcon &inout Model)
{
    return Model.GetTeamMember();
}
TEUIModelRef<FVM_Index> __UIGetter_TeamMemberIndex(const FVM_PlayerMinimapIcon &inout Model)
{
    return Model.GetTeamMemberIndex();
}
int __UIGetter_DisplayStyleIndex(const FVM_PlayerMinimapIcon &inout Model)
{
    return Model.GetDisplayStyleIndex();
}
TEUIModelRef<FVM_PlayerMinimapIcon> __UIGetter_Self(const FVM_PlayerMinimapIcon &inout Model)
{
    return TEUIModelRef<FVM_PlayerMinimapIcon>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_RotationAngle()
{
    return 1;
}
int __IndexOf_IconColor()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_PlayerMinimapIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
