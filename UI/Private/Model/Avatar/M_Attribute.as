
namespace FM_Attribute
{
    const int ModelId = 0;

}
struct FM_Attribute : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    FGameAttributeRef m_Attribute;
    UPROPERTY()
    EAttributeDisplayType m_DisplayType;
    UPROPERTY()
    float32 m_Value;
    UPROPERTY()
    TDataObjectPtr<FAttributeConfig> m_AttributeConfig;

    FM_Attribute()
    {
        this.m_DisplayType = EAttributeDisplayType(0);
        this.m_Value = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_Attribute' by default constructor.");
        return;
    }
    FM_Attribute(const FM_Attribute &inout Other)
    {
        this.m_DisplayType = EAttributeDisplayType(0);
        this.m_Value = 0.0f;
        this.m_Attribute = Other.m_Attribute;
        this.m_DisplayType = Other.m_DisplayType;
        this.m_Value = Other.m_Value;
        this.m_AttributeConfig = Other.m_AttributeConfig;
        return;
    }
    FM_Attribute(const FGameAttributeRef &inout InAttribute, const EAttributeDisplayType InDisplayType, const float32 InValue)
    {
        this.m_DisplayType = EAttributeDisplayType(0);
        this.m_Value = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAttribute(InAttribute);
        this.SetDisplayType(EAttributeDisplayType(InDisplayType));
        this.SetValue(InValue);
        return;
    }
    FM_Attribute& opAssign(const FM_Attribute &inout Other)
    {
        this.m_Attribute = Other.m_Attribute;
        this.m_DisplayType = Other.m_DisplayType;
        this.m_Value = Other.m_Value;
        return Other.m_AttributeConfig;
    }
    FText GetAttributeDisplayName() const
    {
        const UAvatarBuildSettings local_4;
        FText __return;
        if (this.GetAttributeConfig().IsSet())
        {
        }
        else
        {
            GetGameplaySettings<UAvatarBuildSettings> local_6;
            local_4 = local_6;
            FText local_12;
            if (local_4.AttributeDisplayNames.Find(this.GetAttribute(), local_12))
            {
                return local_12;
            }
            __return = FText::FromString(this.GetAttribute().ToString());
        }
        return __return;
    }
    FText GetAttributeDescription() const
    {
        FText __return;
        if (this.GetAttributeConfig().IsSet())
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    FText GetAttributeValueText() const
    {
        FNumberFormattingOptions local_6;
        float32 local_18 = 0.0f;
        FText __return;
        local_6.SetMaximumFractionalDigits(1).SetMinimumFractionalDigits(0);
        EAttributeDisplayType local_16 = this.GetDisplayType();
        EAttributeDisplayType local_15 = local_16;
        if (this.GetAttributeConfig().IsSet())
        {
            local_15 = local_16;
        }
        int local_13 = int(local_15);
        FText local_22;
        if (local_13 <= 1)
        {
            if (local_13 != 0)
            {
                if (local_13 != 1)
                {
                }
            }
            else
            {
                __return = FText::AsNumber(local_18, local_6);
                local_18 = local_18 * 100.0f;
                local_22 = FText::AsNumber(local_18, local_6);
                __return = FText::Format(FText::AsCultureInvariant("{0}%"), local_22);
            }
        }
        return local_22;
    }
    FSoftBrush GetAttributeIcon() const
    {
        FSoftBrush __return;
        if (this.GetAttributeConfig().IsSet())
        {
        }
        else
        {
            __return = FSoftBrush();
        }
        return __return;
    }
    FGameAttributeRef GetAttribute() const property
    {
        FGameAttributeRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FGameAttributeRef GetModify_Attribute() property
    {
        FGameAttributeRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAttribute(const FGameAttributeRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Attribute = __Value;
        return;
    }
    EAttributeDisplayType GetDisplayType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_DisplayType;
    }
    void SetDisplayType(const EAttributeDisplayType __Value) property
    {
        if (int(this.m_DisplayType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DisplayType = __Value;
        return;
    }
    float32 GetValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_Value() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Value = __Value;
        return;
    }
    TDataObjectPtr<FAttributeConfig> GetAttributeConfig() const property
    {
        TDataObjectPtr<FAttributeConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FAttributeConfig> GetModify_AttributeConfig() property
    {
        TDataObjectPtr<FAttributeConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAttributeConfig(const TDataObjectPtr<FAttributeConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AttributeConfig = __Value;
        return;
    }
}

namespace FM_Attribute
{
FM_Attribute& Create(const UObject ContextObject, const FGameAttributeRef &inout Attribute, const EAttributeDisplayType DisplayType, const float32 Value)
{
    return FM_Attribute::CreateByManager(EUIInternal::GetContextManager(ContextObject), Attribute, Value);
}
FM_Attribute CreateByManager(const UEUIManagerSubsystem Manager, const FGameAttributeRef &inout Attribute, const EAttributeDisplayType DisplayType, const float32 Value)
{
    FM_Attribute __r;
    TEUIModelRef<FM_Attribute> local_6 = TEUIModelRef<FM_Attribute>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_Attribute::ModelId, 0, Attribute, DisplayType, Value));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_Attribute;
}
int __IndexOf_Attribute()
{
    return 0;
}
int __IndexOf_DisplayType()
{
    return 1;
}
int __IndexOf_Value()
{
    return 2;
}
int __IndexOf_AttributeConfig()
{
    return 3;
}
}
