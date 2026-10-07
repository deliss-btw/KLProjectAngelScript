
namespace FVMS_SideHint
{
    const int ModelId = 0;

}
struct FVMS_SideHint : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TArray<FEUIModelRef> m_SideHintArray;
    UPROPERTY()
    TArray<FEUIModelRef> m_ImportantSideHintArray;
    UPROPERTY()
    TArray<float32> m_SideHintEndTimeArray;
    UPROPERTY()
    TArray<float32> m_ImportantSideHintEndTimeArray;
    UPROPERTY()
    int m_MaxSideHintNum;
    UPROPERTY()
    int m_MaxImportantSideHintNum;

    FVMS_SideHint()
    {
        this.m_MaxSideHintNum = 6;
        this.m_MaxImportantSideHintNum = 2;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SideHint(const FVMS_SideHint &inout Other)
    {
        this.m_MaxSideHintNum = 6;
        this.m_MaxImportantSideHintNum = 2;
        this.m_SideHintArray = Other.m_SideHintArray;
        this.m_ImportantSideHintArray = Other.m_ImportantSideHintArray;
        this.m_SideHintEndTimeArray = Other.m_SideHintEndTimeArray;
        this.m_ImportantSideHintEndTimeArray = Other.m_ImportantSideHintEndTimeArray;
        this.m_MaxSideHintNum = int(Other.m_MaxSideHintNum);
        this.m_MaxImportantSideHintNum = int(Other.m_MaxImportantSideHintNum);
        return;
    }
    FVMS_SideHint opAssign(const FVMS_SideHint &inout Other)
    {
        FVMS_SideHint __r;
        this.m_SideHintArray = Other.m_SideHintArray;
        this.m_ImportantSideHintArray = Other.m_ImportantSideHintArray;
        this.m_SideHintEndTimeArray = Other.m_SideHintEndTimeArray;
        this.m_ImportantSideHintEndTimeArray = Other.m_ImportantSideHintEndTimeArray;
        this.m_MaxSideHintNum = int(Other.m_MaxSideHintNum);
        this.m_MaxImportantSideHintNum = int(Other.m_MaxImportantSideHintNum);
        return __r;
    }
    void Tick()
    {
        FFPTime local_2 = FFPTime(this.GetContext().Time);
        int local_3 = 0;
        for (; local_3 < this.GetSideHintEndTimeArray().Num(); ++local_3)
        {
            if (float32(local_2.ToSeconds()) > this.GetSideHintEndTimeArray()[local_3])
            {
                this.GetModify_SideHintArray().RemoveAt(local_3);
                this.GetModify_SideHintEndTimeArray().RemoveAt(local_3);
            }
        }
        int local_3_2 = 0;
        for (; local_3_2 < this.GetImportantSideHintEndTimeArray().Num(); ++local_3_2)
        {
            if (float32(local_2.ToSeconds()) > this.GetImportantSideHintEndTimeArray()[local_3_2])
            {
                this.GetModify_ImportantSideHintArray().RemoveAt(local_3_2);
                this.GetModify_ImportantSideHintEndTimeArray().RemoveAt(local_3_2);
            }
        }
        return;
    }
    void AddSideHintItem(const FSideHintConfig &inout SideHintConfig, const float32 ShowHintTime, const FECSEntity &inout ShowEntity, const FECSEntity &inout CustomEntity_1, const FECSEntity &inout CustomEntity_2, const FString &inout CustomContent_1)
    {
        bool local_3;
        int local_72 = 0;
        FVM_SideHintItem& local_2 = ::FVM_SideHintItem::Create(this.GetContext().Manager);
        local_2.SetbShowHint(true);
        local_2.SetHintTitle(SideHintConfig.Title);
        local_2.SetIcon(SideHintConfig.Icon);
        TArray<FText> local_8;
        for (auto& local_22 : SideHintConfig.CombineText)
        {
            if (int(local_22.CombinedTextType) == 0)
            {
                local_8.Add(local_22.Text);
                continue;
            }
            if (int(local_22.CombinedTextType) == 2)
            {
                local_8.Add(FText::FromString(CustomContent_1));
                continue;
            }
            if (int(local_22.CombinedTextType) == 1)
            {
                FString local_34;
                FECSEntity local_38;
                switch (int(local_22.CombineTextEntitySelector))
                {
                case 0:
                {
                    local_38 = ShowEntity;
                    break;
                }
                case 1:
                {
                    local_38 = CustomEntity_1;
                    break;
                }
                case 2:
                {
                    local_38 = CustomEntity_2;
                    break;
                }
                }
                if ((!((local_38 == ENTITY_NULL))))
                {
                    Get local_44;
                    const FC_WeatherEffect& local_46 = local_44.opCall();
                    if (local_46)
                    {
                        FText local_50;
                        if (local_46.GetWeatherConfig().IsSet())
                        {
                        }
                        local_8.Add(local_50);
                    }
                    else
                    {
                        int local_24 = int(::GetPrefabType(local_38));
                        if (local_24 <= 2)
                        {
                            if (local_24 != 2)
                            {
                            }
                            else
                            {
                                local_34 = "<BossName>";
                            }
                        }
                        local_34 = "<Default>";
                        if (int(::GetPrefabType(local_38)) == 1)
                        {
                            local_3 = true;
                        }
                        else
                        {
                            Get local_56;
                            local_3 = local_56.opCall();
                        }
                        if (local_3)
                        {
                            ::FASCommonUtils::GetUniquePlayerEntity(local_38);
                            if (local_72)
                            {
                                local_34 = (FString("<PlayerName>") + local_72.GetNickName());
                            }
                        }
                        else
                        {
                            ::GetPrefabConfigPtr(local_38);
                        }
                        local_34 += "</>";
                        local_8.Add(FText::FromString(local_34));
                    }
                }
            }
        }
        FText local_112 = FText::Join(FText::FromString(" "), local_8);
        local_2.SetHintText(local_112);
        this.SetupTimmer(local_2, SideHintConfig.HUDSideHintType, ShowHintTime);
        return;
    }
    void AddSideHintItemNew(const EHUDSideHintType SideHintType, const FText &inout Title, const FText &inout Content, const UTexture2D Icon, const float32 ShowHintTime)
    {
        FVM_SideHintItem& local_2 = ::FVM_SideHintItem::Create(this.GetContext().Manager);
        local_2.SetbShowHint(true);
        local_2.SetHintTitle(Title);
        local_2.SetIcon(Icon);
        local_2.SetHintText(Content);
        this.SetupTimmer(local_2, EHUDSideHintType(SideHintType), ShowHintTime);
        return;
    }
    void SetupTimmer(const FVM_SideHintItem &inout SideHintItem, const EHUDSideHintType SideHintType, const float32 ShowHintTime)
    {
        FEUIModelRef local_6;
        if (int(SideHintType) == 0)
        {
            this.GetModify_SideHintArray().Add(local_6);
            this.GetModify_SideHintEndTimeArray().Add((float32(ECS::GetECSWorld().GetLocalTime().Time.ToSeconds()) + ShowHintTime));
            if (this.GetSideHintArray().Num() > this.GetMaxSideHintNum())
            {
                this.GetModify_SideHintArray().RemoveAt(0);
                this.GetModify_SideHintEndTimeArray().RemoveAt(0);
            }
            return;
        }
        this.GetModify_ImportantSideHintArray().Add(local_6);
        this.GetModify_ImportantSideHintEndTimeArray().Add((float32(ECS::GetECSWorld().GetLocalTime().Time.ToSeconds()) + ShowHintTime));
        if (this.GetImportantSideHintArray().Num() > this.GetMaxImportantSideHintNum())
        {
            this.GetModify_ImportantSideHintArray().RemoveAt(0);
            this.GetModify_ImportantSideHintEndTimeArray().RemoveAt(0);
        }
        return;
    }
    const TArray<FEUIModelRef> GetSideHintArray() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_SideHintArray() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSideHintArray(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SideHintArray = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetImportantSideHintArray() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_ImportantSideHintArray() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetImportantSideHintArray(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ImportantSideHintArray = __Value;
        return;
    }
    const TArray<float32> GetSideHintEndTimeArray() const property
    {
        const TArray<float32> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<float32> GetModify_SideHintEndTimeArray() property
    {
        TArray<float32> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetSideHintEndTimeArray(const TArray<float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SideHintEndTimeArray = __Value;
        return;
    }
    const TArray<float32> GetImportantSideHintEndTimeArray() const property
    {
        const TArray<float32> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<float32> GetModify_ImportantSideHintEndTimeArray() property
    {
        TArray<float32> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetImportantSideHintEndTimeArray(const TArray<float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ImportantSideHintEndTimeArray = __Value;
        return;
    }
    int GetMaxSideHintNum() const property
    {
        this.TrackPropertyRead(4);
        return this.m_MaxSideHintNum;
    }
    void SetMaxSideHintNum(const int __Value) property
    {
        if (this.m_MaxSideHintNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_MaxSideHintNum = __Value;
        return;
    }
    int GetMaxImportantSideHintNum() const property
    {
        this.TrackPropertyRead(5);
        return this.m_MaxImportantSideHintNum;
    }
    void SetMaxImportantSideHintNum(const int __Value) property
    {
        if (this.m_MaxImportantSideHintNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_MaxImportantSideHintNum = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_SideHint
{
    UPROPERTY()
    TEUIModelRef<FVMS_SideHint> Self;

    __GeneratedProperties_FVMS_SideHint()
    {
        return;
    }
}

namespace FVMS_SideHint
{
FVMS_SideHint& Get(const UObject ContextObject)
{
    return FVMS_SideHint::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SideHint GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SideHint __r;
    TEUIModelRef<FVMS_SideHint> local_6 = TEUIModelRef<FVMS_SideHint>(EUIInternal::MakeModelWithManager(Manager, FVMS_SideHint::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SideHintArray";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ImportantSideHintArray";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_SideHint>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SideHint;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SideHint;
}
void __Tick(FVMS_SideHint &inout Model)
{
    Model.Tick();
    return;
}
TArray<FEUIModelRef> __UIGetter_SideHintArray(const FVMS_SideHint &inout Model)
{
    return Model.GetSideHintArray();
}
TArray<FEUIModelRef> __UIGetter_ImportantSideHintArray(const FVMS_SideHint &inout Model)
{
    return Model.GetImportantSideHintArray();
}
TEUIModelRef<FVMS_SideHint> __UIGetter_Self(const FVMS_SideHint &inout Model)
{
    return TEUIModelRef<FVMS_SideHint>(Model);
}
int __IndexOf_SideHintArray()
{
    return 0;
}
int __IndexOf_ImportantSideHintArray()
{
    return 1;
}
int __IndexOf_SideHintEndTimeArray()
{
    return 2;
}
int __IndexOf_ImportantSideHintEndTimeArray()
{
    return 3;
}
int __IndexOf_MaxSideHintNum()
{
    return 4;
}
int __IndexOf_MaxImportantSideHintNum()
{
    return 5;
}
}
namespace __GeneratedProperties_FVMS_SideHint
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
