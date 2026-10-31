struct FSyncFloatValueVariant
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EValueVariantMode m_ValueMode;
    UPROPERTY()
    float32 m_ConstValue;
    UPROPERTY()
    FValueVariantTwoTurnPointCurve m_TwoTurnPointValueCurve;
    UPROPERTY()
    TSoftObjectPtr<UCurveFloat> m_CustomValueCurve;

    FSyncFloatValueVariant()
    {
        FSubDirtyFlags8 local_1;
        this.__DirtyFlags = local_1;
        this.m_ValueMode = EValueVariantMode(0);
        this.m_ConstValue = 0.0f;
        return;
    }
    FSyncFloatValueVariant(const FSyncFloatValueVariant &inout Other)
    {
        FSubDirtyFlags8 local_3;
        this.__DirtyFlags = local_3;
        this.m_ValueMode = EValueVariantMode(0);
        this.m_ConstValue = 0.0f;
        this.m_ValueMode = Other.m_ValueMode;
        this.m_ConstValue = Other.m_ConstValue;
        this.m_TwoTurnPointValueCurve = Other.m_TwoTurnPointValueCurve;
        this.m_CustomValueCurve = Other.m_CustomValueCurve;
        return;
    }
    FSyncFloatValueVariant(const float32 Value)
    {
        FSubDirtyFlags8 local_2;
        this.__DirtyFlags = local_2;
        this.m_ValueMode = EValueVariantMode(0);
        this.m_ConstValue = 0.0f;
        this.SetValueMode(EValueVariantMode(0));
        this.SetConstValue(Value);
        return;
    }
    FSyncFloatValueVariant opAssign(const FSyncFloatValueVariant &inout Other)
    {
        FSyncFloatValueVariant __r;
        this.SetValueMode(Other.GetValueMode());
        this.SetConstValue(Other.GetConstValue());
        this.SetTwoTurnPointValueCurve(Other.GetTwoTurnPointValueCurve());
        this.SetCustomValueCurve(Other.GetCustomValueCurve());
        return __r;
    }
    float32 GetValue(const float32 SampleTime) const
    {
        if (int(this.GetValueMode()) == 0)
        {
            return this.GetConstValue();
        }
        if (int(this.GetValueMode()) == 1)
        {
            if (SampleTime <= this.GetTwoTurnPointValueCurve().GetTurnStartTime())
            {
                return this.GetTwoTurnPointValueCurve().GetValueBeforeTurn();
            }
            if (SampleTime >= this.GetTwoTurnPointValueCurve().GetTurnEndTime())
            {
                return this.GetTwoTurnPointValueCurve().GetValueAfterTurn();
            }
            return this.GetTwoTurnPointValueCurve().GetValueBeforeTurn() + ((this.GetTwoTurnPointValueCurve().GetValueAfterTurn() - this.GetTwoTurnPointValueCurve().GetValueBeforeTurn()) * FMathUtils::InverseLerpUnclamed(SampleTime, this.GetTwoTurnPointValueCurve().GetTurnStartTime(), this.GetTwoTurnPointValueCurve().GetTurnEndTime()));
        }
        if ((int(this.GetValueMode())) == 2)
        {
            return this.GetCustomValueCurve().Get().GetFloatValue(SampleTime);
        }
        return 0.0f;
    }
    EValueVariantMode GetValueMode() const property
    {
        return this.m_ValueMode;
    }
    void SetValueMode(const EValueVariantMode __Value) property
    {
        if (int(this.m_ValueMode) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ValueMode = __Value;
        return;
    }
    float32 GetConstValue() const property
    {
        return this.m_ConstValue;
    }
    void SetConstValue(const float32 __Value) property
    {
        if (this.m_ConstValue == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ConstValue = __Value;
        return;
    }
    const FValueVariantTwoTurnPointCurve GetTwoTurnPointValueCurve() const property
    {
        const FValueVariantTwoTurnPointCurve __r;
        return __r;
    }
    FValueVariantTwoTurnPointCurve GetTwoTurnPointValueCurve() property
    {
        FValueVariantTwoTurnPointCurve __r;
        return __r;
    }
    void SetTwoTurnPointValueCurve(const FValueVariantTwoTurnPointCurve &inout __Value) property
    {
        this.m_TwoTurnPointValueCurve = __Value;
        return;
    }
    const TSoftObjectPtr<UCurveFloat> GetCustomValueCurve() const property
    {
        const TSoftObjectPtr<UCurveFloat> __r;
        return __r;
    }
    TSoftObjectPtr<UCurveFloat> GetModify_CustomValueCurve() property
    {
        TSoftObjectPtr<UCurveFloat> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetCustomValueCurve(const TSoftObjectPtr<UCurveFloat> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_CustomValueCurve = __Value;
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FSyncFloatValueVariant &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FSyncFloatValueVariant &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FSyncFloatValueVariant
{
int __IndexOf_ValueMode()
{
    return 0;
}
int __IndexOf_ConstValue()
{
    return 1;
}
int __IndexOf_TwoTurnPointValueCurve()
{
    return 2;
}
int __IndexOf_CustomValueCurve()
{
    return 6;
}
}
