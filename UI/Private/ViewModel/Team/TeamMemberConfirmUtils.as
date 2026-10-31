namespace TeamMemberConfirmUtils
{
FText BuildMissingIllustrateWarning(const TArray<TEUIModelRef<FM_Player>> &inout Players)
{
    const UAvatarBuildSettings local_88;
    TSet<EAvatarIllustrate> local_20;
    for (auto& local_36 : Players)
    {
        if (!(local_36.IsValid()))
        {
            continue;
        }
        TDataObjectPtr<FDivineSkillConfig> local_60 = local_36.Get().GetDivineSkill();
        if (local_60)
        {
            local_20.Add(local_60.opArrow().GetTypeConfig().opArrow().TargetIllustrate);
        }
    }
    FText local_108;
    if (local_20.Num() < 3)
    {
        GetGameplaySettings<UAvatarBuildSettings> local_90;
        local_88 = local_90;
        TArray<FText> local_96;
        int local_97 = 0;
        for (; local_97 < 3; ++local_97)
        {
            int local_98 = local_97;
            if (!(local_20.Contains(EAvatarIllustrate(local_98))))
            {
                local_96.Add(local_88.AvatarIllustrateInfos[EAvatarIllustrate(local_98)].DisplayName);
            }
        }
        local_108 = FText::Join(NSLOCTEXT("MissingIllustrateDelimiter", "，"), local_96);
        return FText::Format(NSLOCTEXT("MissingIllustrateWarning", "队伍中缺少{0}定位，可进入后调整"), local_108);
    }
    return local_108;
}
}
