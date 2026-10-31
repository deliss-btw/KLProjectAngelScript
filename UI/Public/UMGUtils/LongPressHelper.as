struct FLongPressHelper
{
    UPROPERTY()
    FFPTime StartPressTime;
    UPROPERTY()
    FFPTime LastTriggerTime;
    UPROPERTY()
    bool bIsPressed = false;
    UPROPERTY()
    FFPTime TriggerInterval = FFPTime(0.1);
    UPROPERTY()
    FFPTime TriggerStartTime = FFPTime(0.5);

    FLongPressHelper(const FFPTime &inout InTriggerInterval, const FFPTime &inout InTriggerStartTime = FFPTime(0.5f))
    {
        this.TriggerInterval = InTriggerInterval;
        this.TriggerStartTime = InTriggerStartTime;
        return;
    }
    void BeginPress(const FFPTime &inout InCurrentTime)
    {
        this.bIsPressed = true;
        this.LastTriggerTime = 0;
        this.StartPressTime = InCurrentTime;
        return;
    }
    void Reset()
    {
        this.bIsPressed = false;
        this.LastTriggerTime = 0;
        this.StartPressTime = 0;
        return;
    }
    void SkipElapsedTo(const FFPTime &inout InCurrentTime)
    {
        if (!(this.bIsPressed))
        {
            return;
        }
        if ((InCurrentTime - this.StartPressTime).opCmp(this.TriggerStartTime) >= 0)
        {
            this.LastTriggerTime = InCurrentTime;
        }
        return;
    }
    bool Evaluate(const FFPTime &inout InCurrentTime)
    {
        if (!(this.bIsPressed))
        {
            return false;
        }
        FFPTime local_4 = (InCurrentTime - this.StartPressTime);
        if (local_4.opCmp(this.TriggerStartTime) < 0)
        {
            return false;
        }
        FFPTime local_4_2 = (InCurrentTime - this.LastTriggerTime);
        if (local_4_2.opCmp(this.TriggerInterval) > 0)
        {
            if ((this.LastTriggerTime == 0.0))
            {
                this.LastTriggerTime = (this.StartPressTime + this.TriggerStartTime);
            }
            else
            {
                this.LastTriggerTime += this.TriggerInterval;
            }
            return true;
        }
        return false;
    }
    bool IsPressed() const
    {
        return this.bIsPressed;
    }
}

