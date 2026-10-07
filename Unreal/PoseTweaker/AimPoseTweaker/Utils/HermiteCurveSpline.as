

struct FHermiteCoeff
{
    UPROPERTY()
    float P0 = 0.0;
    UPROPERTY()
    float P1 = 0.0;
    UPROPERTY()
    float T0 = 0.0;
    UPROPERTY()
    float T1 = 0.0;

    FHermiteCoeff(const float T)
    {
        float local_4 = T * T;
        float local_2 = T * local_4;
        this.P0 = (((2.0 * local_2) - (3.0 * local_4)) + 1.0);
        this.T0 = ((local_2 - (2.0 * local_4)) + T);
        this.P1 = ((-2.0 * local_2) + (3.0 * local_4));
        this.T1 = (local_2 - local_4);
        return;
    }
}

struct FCurveParamValue
{
    UPROPERTY()
    float Param;
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    FVector Tangent;
    UPROPERTY()
    FVector UnitNormal;

    FCurveParamValue(const float T, const FVector &inout Loc)
    {
        this.Param = T;
        this.Location = Loc;
        return;
    }
    FTransform MakeTransform() const
    {
        FVector local_14 = this.Tangent.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_6 = this.UnitNormal.CrossProduct(local_14);
        return FTransform(local_14, local_6, this.UnitNormal, this.Location);
    }
    void LerpBy(const FCurveParamValue &inout V1, const FCurveParamValue &inout V2, const float Alpha)
    {
        this.Param = FMath::Lerp(V1.Param, V2.Param, Alpha);
        this.Location = FMath::Lerp(V1.Location, V2.Location, Alpha);
        int64 local_10 = 4576918229304087675;
        if (FMath::IsNearlyEqual(Alpha, 0.0, 0.01))
        {
            this = V1;
            return;
        }
        if (FMath::IsNearlyEqual(Alpha, 1.0, 0.01))
        {
            this = V2;
            return;
        }
        float local_2 = V1.Tangent.Size();
        float local_12 = V2.Tangent.Size();
        FVector local_30 = (V1.Tangent / local_2);
        FVector local_24 = (V2.Tangent / local_12);
        FQuat local_60 = FQuat::Slerp(FQuat::Identity, FQuat::FindBetweenNormals(local_30, local_24), Alpha);
        this.Tangent = (local_60.RotateVector(local_30) * (FMath::Lerp(local_2, local_12, Alpha)));
        this.UnitNormal = local_60.RotateVector(V1.UnitNormal);
        return;
    }
}

struct FLegendreGaussCoefficient
{
    UPROPERTY()
    float32 Abscissa;
    UPROPERTY()
    float32 Weight;

    FLegendreGaussCoefficient(const float32 A, const float32 W)
    {
        this.Abscissa = A;
        this.Weight = W;
        return;
    }
}

struct FHermiteCurveSpline
{
    UPROPERTY()
    float InterpStep;
    UPROPERTY()
    TArray<FCurveParamValue> CurvePts;
    UPROPERTY()
    TArray<float> LengthRatios;

    FHermiteCurveSpline(const FVector &inout P0, const FVector &inout P1, const FVector &inout T0, const FVector &inout T1, const FVector &inout N0, const float Step, const float DesiredLength = -1)
    {
        this.BuildSpline(P0, P1, T0, T1, N0, Step, DesiredLength);
        return;
    }
    FHermiteCurveSpline(const FTransform &inout Xform0, const FTransform &inout Xform1, const float TangentScale0, const float TangentScale1, const float Step, const float DesiredLength = -1)
    {
        FVector local_38 = (Xform0.GetRotation().GetAxisX() * TangentScale0);
        FVector local_12 = (Xform1.GetRotation().GetAxisX() * TangentScale1);
        this.BuildSpline(FVector(Xform0.GetLocation()), FVector(Xform1.GetLocation()), local_38, local_12, Xform0.GetRotation().GetAxisZ(), Step, DesiredLength);
        return;
    }
    void BuildSpline(const FVector &inout P0, const FVector &inout P1, const FVector &inout T0, const FVector &inout T1, const FVector &inout N0, const float Step, const float DesiredLength)
    {
        this.InterpStep = Step;
        FVector local_6 = T0;
        FVector local_12 = T1;
        if (DesiredLength > 0.0)
        {
            float local_18 = 1.0;
            local_6 = (T0 * local_18);
            local_12 = (T1 * local_18);
        }
        this.CurvePts.Empty(0);
        float local_18_2 = 0.0;
        while (local_18_2 < 1.0)
        {
            FHermiteCoeff local_34 = FHermiteCoeff(local_18_2);
            FVector local_24 = (P0 * local_34.P0);
            FVector local_40 = (local_6 * local_34.T0);
            local_40 = (P1 * local_34.P1);
            local_24 = ((local_24 + local_40) + local_40);
            local_40 = (local_12 * local_34.T1);
            this.CurvePts.Add(FCurveParamValue(local_18_2, (local_24 + local_40)));
            local_18_2 = local_18_2 + Step;
        }
        float local_70 = this.CurvePts.Last(0).Param;
        if (!(FMath::IsNearlyEqual(local_70, 1.0, 9.99999993922529e-9)))
        {
            FHermiteCoeff local_34_2 = FHermiteCoeff(1.0);
            FVector local_46_2 = (P0 * local_34_2.P0);
            FVector local_24_2 = (local_6 * local_34_2.T0);
            FVector local_40_2 = (local_46_2 + local_24_2);
            FVector local_24_3 = (P1 * local_34_2.P1);
            FVector local_46_3 = (local_40_2 + local_24_3);
            FVector local_24_4 = (local_12 * local_34_2.T1);
            this.CurvePts.Add(FCurveParamValue(1.0, (local_46_3 + local_24_4)));
        }
        this.CurvePts[0].Tangent = local_6;
        this.CurvePts[0].UnitNormal = N0;
        this.CurvePts[(this.CurvePts.Num() - 1)].Tangent = local_12;
        int local_72 = 1;
        for (; local_72 < this.CurvePts.Num(); )
        {
            FCurveParamValue& local_74 = this.CurvePts[local_72 - 1];
            if (local_72 < (this.CurvePts.Num() - 1))
            {
                FCurveParamValue& local_78 = this.CurvePts[local_72 + 1];
                FVector local_40_3 = local_78.Location;
                FVector local_46_4 = (local_40_3 - local_74.Location);
                float local_68 = local_74.Param;
                float local_70_2 = local_78.Param - local_68;
                this.CurvePts[local_72].Tangent = (local_46_4 / local_70_2);
            }
            this.CurvePts[local_72].UnitNormal = this.ProjectNormalToTangentPlane(N0, this.CurvePts[local_72].Tangent, local_74.UnitNormal);
            ++local_72;
        }
        if (DesiredLength > 0.0)
        {
            float local_68_2 = DesiredLength / this.GetLength();
            this.UpdateSplineWithScale(local_68_2);
        }
        this.LengthRatios.Empty(0);
        this.LengthRatios.Add(0.0);
        int local_72_2 = 1;
        for (; local_72_2 < this.CurvePts.Num(); )
        {
            float local_14_2 = this.LengthRatios.Last(0);
            int local_25_3 = local_72_2 - 1;
            FVector local_40_4 = (FVector(this.CurvePts[local_72_2].Location) - this.CurvePts[local_25_3].Location);
            float local_68_3 = local_40_4.Size();
            this.LengthRatios.Add(local_14_2 + local_68_3);
            ++local_72_2;
        }
        int local_72_3 = 1;
        for (; local_72_3 < this.CurvePts.Num(); )
        {
            float local_68_4 = this.LengthRatios.Last(0);
            float local_70_3 = this.LengthRatios[local_72_3] / local_68_4;
            ++local_72_3;
        }
        return;
    }
    void UpdateSplineWithScale(const float Scale)
    {
        if (this.CurvePts.IsEmpty())
        {
            return;
        }
        FVector local_8 = this.CurvePts[0].Location;
        int local_10 = 0;
        for (; local_10 < this.CurvePts.Num(); )
        {
            if (local_10 > 0)
            {
                FVector local_18 = ((FVector(this.CurvePts[local_10].Location) - local_8) * Scale);
                this.CurvePts[local_10].Location = (local_18 + local_8);
            }
            this.CurvePts[local_10].Tangent *= Scale;
            ++local_10;
        }
        return;
    }
    void BuildComposite(const FVector &inout P0, const FVector &inout PM, const FVector &inout P1, const FVector &inout T0, const FVector &inout TM, const FVector &inout T1, const float Seg1DesiredLen, const float Seg2DesiredLen, const FVector &inout N0, const float Step)
    {
        float local_8 = this.SolveTangentScale(P0, PM, T0, TM, Seg1DesiredLen, 16, 10.0);
        float local_2 = this.SolveTangentScale(PM, P1, TM, T1, Seg2DesiredLen, 16, 10.0);
        FVector local_22 = (T0 * local_8);
        FVector local_16 = (TM * local_8);
        FVector local_28 = (TM * local_2);
        FVector local_34 = (T1 * local_2);
        this.InterpStep = Step;
        this.CurvePts.Empty(0);
        float local_10 = Seg1DesiredLen / (Seg1DesiredLen + Seg2DesiredLen);
        float local_46 = 0.0;
        while (local_46 < 1.0)
        {
            FHermiteCoeff local_56 = FHermiteCoeff(local_46);
            FVector local_40 = (P0 * local_56.P0);
            FVector local_68 = (local_22 * local_56.T0);
            local_68 = (PM * local_56.P1);
            local_40 = ((local_40 + local_68) + local_68);
            local_68 = (local_16 * local_56.T1);
            this.CurvePts.Add(FCurveParamValue(local_46 * local_10, (local_40 + local_68)));
            local_46 = local_46 + Step;
        }
        FHermiteCoeff local_56_2 = FHermiteCoeff(1.0);
        FVector local_62 = (P0 * local_56_2.P0);
        FVector local_40_2 = (local_22 * local_56_2.T0);
        FVector local_68_2 = (local_62 + local_40_2);
        FVector local_40_3 = (PM * local_56_2.P1);
        FVector local_62_2 = (local_68_2 + local_40_3);
        FVector local_40_4 = (local_16 * local_56_2.T1);
        this.CurvePts.Add(FCurveParamValue(local_10, (local_62_2 + local_40_4)));
        float local_46_2 = Step;
        while (local_46_2 < 1.0)
        {
            FHermiteCoeff local_56_3 = FHermiteCoeff(local_46_2);
            FVector local_40_5 = (PM * local_56_3.P0);
            FVector local_74_2 = (local_28 * local_56_3.T0);
            FVector local_62_3 = (local_40_5 + local_74_2);
            local_74_2 = (P1 * local_56_3.P1);
            local_40_5 = (local_62_3 + local_74_2);
            local_74_2 = (local_34 * local_56_3.T1);
            local_62_3 = (local_40_5 + local_74_2);
            float local_44 = local_10 + (local_46_2 * (1.0 - local_10));
            this.CurvePts.Add(FCurveParamValue(local_44, local_62_3));
            local_46_2 = local_46_2 + Step;
        }
        FHermiteCoeff local_56_4 = FHermiteCoeff(1.0);
        FVector local_74_3 = (PM * local_56_4.P0);
        FVector local_68_3 = (local_28 * local_56_4.T0);
        FVector local_40_6 = (local_74_3 + local_68_3);
        FVector local_68_4 = (P1 * local_56_4.P1);
        FVector local_74_4 = (local_40_6 + local_68_4);
        FVector local_68_5 = (local_34 * local_56_4.T1);
        this.CurvePts.Add(FCurveParamValue(1.0, (local_74_4 + local_68_5)));
        this.CurvePts[0].Tangent = local_22;
        this.CurvePts[0].UnitNormal = N0;
        this.CurvePts[(this.CurvePts.Num() - 1)].Tangent = local_34;
        int local_96 = 1;
        for (; local_96 < this.CurvePts.Num(); )
        {
            FCurveParamValue& local_98 = this.CurvePts[local_96 - 1];
            if (local_96 < (this.CurvePts.Num() - 1))
            {
                FCurveParamValue& local_102 = this.CurvePts[local_96 + 1];
                FVector local_62_4 = local_102.Location;
                FVector local_68_6 = (local_62_4 - local_98.Location);
                this.CurvePts[local_96].Tangent = (local_68_6 / (local_102.Param - local_98.Param));
            }
            this.CurvePts[local_96].UnitNormal = this.ProjectNormalToTangentPlane(N0, this.CurvePts[local_96].Tangent, local_98.UnitNormal);
            ++local_96;
        }
        this.LengthRatios.Empty(0);
        this.LengthRatios.Add(0.0);
        int local_96_2 = 1;
        for (; local_96_2 < this.CurvePts.Num(); )
        {
            float local_44_3 = this.LengthRatios.Last(0);
            FVector local_62_5 = (FVector(this.CurvePts[local_96_2].Location) - this.CurvePts[(local_96_2 - 1)].Location);
            local_44_3 = local_44_3 + local_62_5.Size();
            this.LengthRatios.Add(local_44_3);
            ++local_96_2;
        }
        int local_96_3 = 1;
        for (; local_96_3 < this.CurvePts.Num(); )
        {
            float local_44_4 = this.LengthRatios.Last(0);
            float local_42 = this.LengthRatios[local_96_3];
            local_42 = local_42 / local_44_4;
            ++local_96_3;
        }
        return;
    }
    FCurveParamValue Eval(const float T) const
    {
        float local_8 = FMath::Clamp(T, 0.0, 1.0);
        FCurveParamValue local_28;
        int local_29 = 0;
        for (; local_29 < (this.CurvePts.Num() - 1); ++local_29)
        {
            if ((this.CurvePts[local_29].Param <= local_8 && (local_8 <= this.CurvePts[(local_29 + 1)].Param)))
            {
                const FCurveParamValue& local_36 = this.CurvePts[local_29];
                const FCurveParamValue& local_38 = this.CurvePts[local_29 + 1];
                local_28.LerpBy(local_36, local_38, (local_8 - local_36.Param) / (local_38.Param - local_36.Param));
                return local_28;
            }
        }
        return local_28;
    }
    FCurveParamValue EvalByLengthRatio(const float Ratio) const
    {
        float local_8 = FMath::Clamp(Ratio, 0.0, 1.0);
        FCurveParamValue local_28;
        int local_29 = 0;
        for (; local_29 < (this.LengthRatios.Num() - 1); ++local_29)
        {
            if ((local_8 >= this.LengthRatios[local_29] && (local_8 <= this.LengthRatios[local_29 + 1])))
            {
                float local_2 = local_8 - this.LengthRatios[local_29];
                const FCurveParamValue& local_38 = this.CurvePts[local_29];
                const FCurveParamValue& local_40 = this.CurvePts[local_29 + 1];
                local_28.LerpBy(local_38, local_40, (local_2 / (float(this.LengthRatios[local_29 + 1]) - this.LengthRatios[local_29])));
                return local_28;
            }
        }
        return local_28;
    }
    float GetLength() const
    {
        return this.GetLength(1.0f);
    }
    float GetLength(const float32 ParamT) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        float __r; return __r;
    }
    FVector ProjectNormalToTangentPlane(const FVector &inout RefUp, const FVector &inout Tangent, const FVector &inout PrevNormal) const
    {
        FVector local_14 = Tangent.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_26 = (RefUp - (local_14 * RefUp.DotProduct(local_14)));
        float local_8_2 = local_26.Size();
        if (local_8_2 > 9.999999747378752e-5)
        {
            return (local_26 / local_8_2);
        }
        return PrevNormal;
    }
    float ComputeHermiteArcLength(const FVector &inout P0, const FVector &inout P1, const FVector &inout T0, const FVector &inout T1) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        float __r; return __r;
    }
    float SolveTangentScale(const FVector &inout P0, const FVector &inout P1, const FVector &inout T0, const FVector &inout T1, const float DesiredLength, const int Iterations = 16, const float MaxScale = 10.0) const
    {
        if ((P1 - P0).Size() >= DesiredLength)
        {
            return 0.001;
        }
        float local_14 = 0.001;
        float local_16 = 2.0;
        while ((this.ComputeHermiteArcLength(P0, P1, (T0 * local_16), (T1 * local_16))) < DesiredLength)
        {
            local_16 = local_16 * 2.0;
            if (local_16 > MaxScale)
            {
                return MaxScale;
            }
        }
        local_16 = FMath::Min(local_16, MaxScale);
        int local_23 = 0;
        for (; local_23 < Iterations; ++local_23)
        {
            float local_2_2 = (local_14 + local_16) * 0.5;
            FVector local_8 = (T1 * local_2_2);
            if (this.ComputeHermiteArcLength(P0, P1, (T0 * local_2_2), local_8) > DesiredLength)
            {
                local_16 = local_2_2;
                continue;
            }
            local_14 = local_2_2;
        }
        return ((local_14 + local_16) * 0.5);
    }
    void DebugDraw(const USkeletalPoseTweaker TweakerContext, const FVector &inout Offset = FVector::ZeroVector, const FColor &inout Color = FColor::Yellow) const
    {
        int local_1 = 0;
        for (; local_1 < (this.CurvePts.Num() - 1); )
        {
            FVector local_18 = (FVector(this.CurvePts[(local_1 + 1)].Location) + Offset);
            TweakerContext.DrawAnimDebugLine((FVector(this.CurvePts[local_1].Location) + Offset), local_18, Color, EPTDebugDrawSpace(0), 0.0f, true);
            ++local_1;
        }
        float local_28 = 0.0;
        for (; local_28 <= 1.0; )
        {
            TweakerContext.DrawAnimDebugTransform(this.Eval(local_28).MakeTransform(), 20.0f, true);
            local_28 = local_28 + 0.05;
        }
        return;
    }
    float GetLength_DiscreteSum() const
    {
        float local_2 = 0.0;
        int local_5 = 0;
        for (; local_5 < (this.CurvePts.Num() - 1); )
        {
            local_2 = local_2 + (FVector(this.CurvePts[(local_5 + 1)].Location) - this.CurvePts[local_5].Location).Size();
            ++local_5;
        }
        return local_2;
    }
}

struct FHermite2DPoint
{
    UPROPERTY()
    float Param = 0.0;
    UPROPERTY()
    FVector2D Location;
    UPROPERTY()
    FVector2D Tangent;


    float32 GetAngle() const
    {
        return float32((FMath::RadiansToDegrees(FMath::Atan2(this.Tangent.Y, this.Tangent.X))));
    }
    void LerpBy(const FHermite2DPoint &inout V1, const FHermite2DPoint &inout V2, const float Alpha)
    {
        this.Param = FMath::Lerp(V1.Param, V2.Param, Alpha);
        int64 local_4 = 4576918229304087675;
        if (FMath::IsNearlyEqual(Alpha, 0.0, 0.01))
        {
            this = V1;
            return;
        }
        if (FMath::IsNearlyEqual(Alpha, 1.0, 0.01))
        {
            this = V2;
            return;
        }
        FVector2D local_12_2 = ((V2.Location - V1.Location) * Alpha);
        this.Location = (V1.Location + local_12_2);
        FVector2D local_16_2 = (V2.Tangent - V1.Tangent);
        FVector2D local_12_3 = (local_16_2 * Alpha);
        this.Tangent = (V1.Tangent + local_12_3);
        return;
    }
}

struct FHermiteCurve2D
{
    UPROPERTY()
    TArray<FHermite2DPoint> CurvePts;
    UPROPERTY()
    TArray<float> LengthRatios;

    FHermiteCurve2D()
    {
        return;
    }
    void Build(const FVector2D &inout InP0, const FVector2D &inout InP1, const FVector2D &inout InT0, const FVector2D &inout InT1, const float Step)
    {
        this.Empty(0);
        float local_4 = 0.0;
        while (local_4 < 1.0)
        {
            FHermiteCoeff local_16 = FHermiteCoeff(local_4);
            FHermite2DPoint local_26;
            local_26.Param = local_4;
            FVector2D local_30 = (InP0 * local_16.P0);
            FVector2D local_34 = (InT0 * local_16.T0);
            local_34 = (InP1 * local_16.P1);
            local_30 = ((local_30 + local_34) + local_34);
            local_34 = (InT1 * local_16.T1);
            local_26.Location = (local_30 + local_34);
            this.Add(local_26);
            local_4 = local_4 + Step;
        }
        if (this.Num() == 0 || !(FMath::IsNearlyEqual(this.Last(0).Param, 1.0, 9.99999993922529e-9)))
        {
            FHermiteCoeff local_16_2 = FHermiteCoeff(1.0);
            FHermite2DPoint local_26;
            local_26.Param = 1.0;
            FVector2D local_38_2 = (InP0 * local_16_2.P0);
            FVector2D local_30_2 = (InT0 * local_16_2.T0);
            FVector2D local_34_2 = (local_38_2 + local_30_2);
            FVector2D local_30_3 = (InP1 * local_16_2.P1);
            FVector2D local_38_3 = (local_34_2 + local_30_3);
            FVector2D local_30_4 = (InT1 * local_16_2.T1);
            local_26.Location = (local_38_3 + local_30_4);
            this.Add(local_26);
        }
        this[0].Tangent = InT0;
        this[(this.Num() - 1)].Tangent = InT1;
        int local_46 = 1;
        for (; local_46 < (this.Num() - 1); )
        {
            FHermite2DPoint& local_50 = this[local_46 - 1];
            FHermite2DPoint& local_52 = this[local_46 + 1];
            FVector2D local_34_3 = local_52.Location;
            FVector2D local_38_4 = (local_34_3 - local_50.Location);
            float local_6_2 = local_52.Param - local_50.Param;
            this[local_46].Tangent = (local_38_4 / local_6_2);
            ++local_46;
        }
        this.LengthRatios.Empty(0);
        this.LengthRatios.Add(0.0);
        int local_46_2 = 1;
        for (; local_46_2 < this.Num(); )
        {
            float local_42_2 = this.LengthRatios.Last(0);
            FVector2D local_38_5 = (FVector2D(this[local_46_2].Location) - this[(local_46_2 - 1)].Location);
            this.LengthRatios.Add(local_42_2 + local_38_5.Size());
            ++local_46_2;
        }
        float local_54 = this.LengthRatios.Last(0);
        if (local_54 > 9.999999747378752e-5)
        {
            int local_46_3 = 1;
            for (; local_46_3 < this.Num(); )
            {
                float local_42_3 = this.LengthRatios[local_46_3] / local_54;
                ++local_46_3;
            }
        }
        return;
    }
    FHermite2DPoint EvalByLengthRatio(const float Ratio) const
    {
        float local_8 = FMath::Clamp(Ratio, 0.0, 1.0);
        FHermite2DPoint local_18;
        int local_19 = 0;
        for (; local_19 < (this.LengthRatios.Num() - 1); ++local_19)
        {
            if ((local_8 >= this.LengthRatios[local_19] && (local_8 <= this.LengthRatios[local_19 + 1])))
            {
                float local_2 = local_8 - this.LengthRatios[local_19];
                local_18.LerpBy(this[local_19], this[local_19 + 1], local_2 / (float(this.LengthRatios[local_19 + 1]) - this.LengthRatios[local_19]));
                return local_18;
            }
        }
        if (this.Num() > 0)
        {
            return this.Last(0);
        }
        return local_18;
    }
    float32 GetAngleAtRatio(const float Ratio) const
    {
        return this.EvalByLengthRatio(Ratio).GetAngle();
    }
    float GetLength() const
    {
        if (this.Num() < 2)
        {
            return 0.0;
        }
        float local_8 = 0.0;
        int local_9 = 1;
        for (; local_9 < this.Num(); )
        {
            local_8 = local_8 + (FVector2D(this[local_9].Location) - this[(local_9 - 1)].Location).Size();
            ++local_9;
        }
        return local_8;
    }
    float ComputeArcLength2D(const FVector2D &inout P0, const FVector2D &inout P1, const FVector2D &inout T0, const FVector2D &inout T1) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        float __r; return __r;
    }
    float SolveP1X(const FVector2D &inout P0, const FVector2D &inout T0, const FVector2D &inout Target2D, const float P1_Lateral, const float TailIntensity, const float DesiredLength, const int Iterations = 16)
    {
        FVector2D local_26;
        if (FMath::IsNearlyZero(P1_Lateral, 0.01) && FMath::IsNearlyZero(Target2D.Y, 0.01))
        {
            return DesiredLength;
        }
        float local_12 = FMath::Max(0.01, FMath::Abs(P1_Lateral));
        float local_10 = DesiredLength * 2.0;
        int local_15 = 0;
        for (; local_15 < 4; )
        {
            FVector2D local_22 = FVector2D(local_10, P1_Lateral);
            FVector2D local_30 = (Target2D - local_22);
            FVector2D local_46;
            if (local_30.Size() > 9.999999747378752e-5)
            {
                local_46 = (local_30.GetSafeNormal(9.99999993922529e-9) * TailIntensity);
            }
            else
            {
                local_46 = (FVector2D(1.0, 0.0) * TailIntensity);
            }
            if (this.ComputeArcLength2D(P0, local_22, T0, local_46) >= DesiredLength)
            {
                break;
            }
            local_10 = local_10 * 2.0;
            ++local_15;
        }
        int local_15_2 = 0;
        for (; local_15_2 < Iterations; ++local_15_2)
        {
            float local_2_2 = (local_12 + local_10) * 0.5;
            FVector2D local_22_2 = FVector2D(local_2_2, P1_Lateral);
            FVector2D local_34 = (Target2D - local_22_2);
            if (local_34.Size() > 9.999999747378752e-5)
            {
                local_26 = (local_34.GetSafeNormal(9.99999993922529e-9) * TailIntensity);
            }
            else
            {
                local_26 = (FVector2D(1.0, 0.0) * TailIntensity);
            }
            if (this.ComputeArcLength2D(P0, local_22_2, T0, local_26) > DesiredLength)
            {
                local_10 = local_2_2;
                continue;
            }
            local_12 = local_2_2;
        }
        return (local_12 + local_10) * 0.5;
    }
}

