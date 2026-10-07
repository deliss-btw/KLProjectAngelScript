

struct FBeShakeBodyInfo
{
    UPROPERTY()
    float32 BeHitShakeTime;
    UPROPERTY()
    float32 BeHitShakeRatio;
    UPROPERTY()
    float32 BeHitAngle;
    UPROPERTY()
    float32 BeHitShakeDuration;
    UPROPERTY()
    FFPTime BeHitShakeStartTime;
    UPROPERTY()
    FName BeHitShakeBoneName;
    UPROPERTY()
    EHitShakeBodyType BeHitShakeBodyType;
    UPROPERTY()
    float32 BeHitShakeScale;


}

struct FAnimFloatStack
{
    UPROPERTY()
    TInlineArray<float32, auto> Value;

    FAnimFloatStack()
    {
        return;
    }
    void Push(const float32 InValue)
    {
        this.Add(InValue);
        return;
    }
    void Pop()
    {
        int local_2 = this.Num();
        if (local_2 >= 1)
        {
            this.SetNum(local_2 - 1);
        }
        return;
    }
    float32 Top(const float32 DefaultValue = 0.f) const
    {
        float32 local_4;
        if (!(this.IsEmpty()))
        {
            local_4 = this[(this.Num() - 1)];
        }
        else
        {
            local_4 = DefaultValue;
        }
        return local_4;
    }
    bool IsEmpty() const
    {
        return (this.Num() == 0);
    }
}

