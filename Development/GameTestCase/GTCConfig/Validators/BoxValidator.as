
enum EGTCRangeValidType
{
    Inside,
    InsideOrOn,
    Outside,
    OutsideOrOn,
    JustOn,
}


struct FGTCBoxValidator
{
    UPROPERTY()
    bool bOnlyCheckXY;
    UPROPERTY()
    EGTCRangeValidType ValidateType;
    UPROPERTY()
    FVector Min;
    UPROPERTY()
    FVector Max;
    UPROPERTY()
    FBox Box;


    bool Validate(const FVector &inout Vector)
    {
        bool local_5;
        bool local_7;
        bool local_8;
        this.Box.Min = this.Min;
        this.Box.Max = this.Max;
        switch (int(this.ValidateType))
        {
        case 0:
        {
            if (this.bOnlyCheckXY)
            {
                local_7 = this.Box.IsInsideXY(Vector);
            }
            else
            {
                local_7 = this.Box.IsInside(Vector);
            }
            return local_7;
        }
        case 1:
        {
            if (this.bOnlyCheckXY)
            {
                local_5 = this.Box.IsInsideOrOnXY(Vector);
            }
            else
            {
                local_5 = this.Box.IsInsideOrOn(Vector);
            }
            return local_5;
        }
        case 2:
        {
            if (this.bOnlyCheckXY)
            {
                local_7 = this.Box.IsInsideOrOnXY(Vector);
            }
            else
            {
                local_7 = this.Box.IsInsideOrOn(Vector);
            }
            local_7 = !local_7;
            return local_7;
        }
        case 3:
        {
            if (this.bOnlyCheckXY)
            {
                local_5 = this.Box.IsInsideXY(Vector);
            }
            else
            {
                local_5 = this.Box.IsInside(Vector);
            }
            local_5 = !local_5;
            return local_5;
        }
        case 4:
        {
            if (this.bOnlyCheckXY)
            {
                local_8 = this.Box.IsInsideOrOnXY(Vector) && !(this.Box.IsInsideXY(Vector));
            }
            else
            {
                local_8 = this.Box.IsInsideOrOn(Vector) && !(this.Box.IsInside(Vector));
            }
            return local_8;
        }
        }
        return false;
    }
}

