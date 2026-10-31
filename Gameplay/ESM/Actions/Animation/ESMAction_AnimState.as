class UESMAction_AnimState : UESMAnimStateAction
{
    bool bShowAnimNameInfo = true;

    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.bAllowRootMotion && !((Info.StateMachine.GetDataName() == n"MainSM")))
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), FString().Append("Only MainSM support root motion, auto disable bAllowRootMotion"));
            this.bAllowRootMotion = false;
        }
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        bool local_7;
        FString local_22;
        FString local_44;
        FString local_4 = "";
        if (this.AnimPlaySpeed != 1.0f)
        {
            local_7 = true;
        }
        else
        {
            local_7 = this.bAdjustStateSpeedByAnimTable;
        }
        if (local_7)
        {
            float32 local_5 = FMath::RoundToFloat((this.AnimPlaySpeed * 100.0f)) / 100.0f;
            if (!(this.bAdjustStateSpeedByAnimTable))
            {
                local_22 = FString().Append("@").Append(local_5);
            }
            else
            {
                local_22 = FString().Append("@OverrideByAnimTable");
            }
            local_4 = local_22;
        }
        FString local_26 = "";
        if (this.AnimStartPercent != 0.0f || (this.AnimEndPercent != 1.0f))
        {
            FString local_18 = FString();
            FString local_30 = FString(local_18.Append(FMath::CeilToInt(this.AnimStartPercent * 100.0f)));
            if (int(this.NotifyType) == 2)
            {
                local_18 = "#";
            }
            else
            {
                local_18 = FString().Append(FMath::CeilToInt((this.AnimEndPercent * 100.0f)));
            }
            local_26 = FString().Append("[").Append(local_30).Append(", ").Append(local_18).Append("] ");
        }
        FString local_18_2 = "";
        FString local_36;
        if (!(this.bShowAnimNameInfo))
        {
            local_18_2 = "AnimState";
        }
        else
        {
            if (!(this.bOverrideReferenceAsset))
            {
                if (this.AnimStateName.Name.IsNone())
                {
                    local_18_2 = "(无AnimStateName)";
                }
                else
                {
                    int local_39;
                    local_36 = this.AnimStateName.Name.ToString();
                    local_39 = INDEX_NONE;
                    if (local_36.FindChar(int16(46), local_39))
                    {
                        local_18_2 = (local_36.Left(local_39) == "MainLayer") ? local_36.Mid(local_39 + 1, 2147483647) : local_36;
                    }
                    else
                    {
                        local_18_2 = local_36;
                    }
                }
                TSoftObjectPtr<UAnimationAsset> local_56;
                local_56 = this.ReferenceAsset;
                if ((local_56 == nullptr))
                {
                    local_18_2 = (FString("(无ReferenceAsset) ") + local_18_2);
                }
            }
            else
            {
                TSoftObjectPtr<UAnimationAsset> local_56;
                local_56 = this.ReferenceAsset;
                if ((local_56 == nullptr))
                {
                    local_18_2 = "(无ReferenceAsset)";
                }
                else
                {
                    FString local_14 = this.ReferenceAsset.GetAssetName();
                    int local_45 = local_14.Find("_Default_Combat_", ESearchCase(1), ESearchDir(0), -1);
                    if (local_45 != INDEX_NONE)
                    {
                        local_36 = local_14.Mid(local_45 + 15, 2147483647);
                        if (local_36.StartsWith("_", ESearchCase(1)))
                        {
                            local_36 = local_36.Mid(1, 2147483647);
                        }
                        local_18_2 = local_36;
                    }
                    else
                    {
                        int local_38 = local_14.Find("_Default_", ESearchCase(1), ESearchDir(0), -1);
                        if (local_38 != INDEX_NONE)
                        {
                            FString local_30_2 = local_14.Mid(local_38 + 9, 2147483647);
                            if (local_30_2.StartsWith("_", ESearchCase(1)))
                            {
                                local_30_2 = local_30_2.Mid(1, 2147483647);
                            }
                            local_18_2 = local_30_2;
                        }
                        else
                        {
                            local_18_2 = local_14;
                        }
                    }
                }
                if (this.AnimStateName.Name.ToString().Contains("override", ESearchCase(1), ESearchDir(0)))
                {
                    local_36 = "*";
                }
                else
                {
                    local_36 = "*(!)";
                }
                local_18_2 = FString().Append(local_36).Append(" ").Append(local_18_2);
            }
            local_18_2 = FString().Append("动画: ").Append(local_18_2);
        }
        local_7 = this.bOverrideReferenceAsset;
        if (!(local_7))
        {
            local_7 = false;
        }
        else
        {
            local_7 = this.bMirror;
        }
        if (local_7)
        {
            local_44 = " (Mirror)";
        }
        else
        {
            local_44 = "";
        }
        return FString().Append(local_18_2).Append(" ").Append(local_26).Append(local_4).Append(local_44);
    }
}

