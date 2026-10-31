const FConsoleVariable CVar_BreathSFX_EnableDebug = FConsoleVariable();

namespace BreathSFXUtils
{
UFUNCTION()
void EnableBreathSFX(const FECSEntity &inout Entity, const int Index, const bool bAllowStacking = false)
{
    int local_8 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (Index >= local_8.GetEnableCountersNum())
    {
        return;
    }
    int local_11 = local_8.GetEnableCounterValue(Index);
    int local_10 = local_8.GetDisableCounterValue(Index);
    if (bAllowStacking)
    {
        local_8.EnableSFX(Index);
        int local_12 = local_8.GetEnableCounterValue(Index);
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("EnableBreathSFX: 叠加模式 - 启用计数器从 ").Append(local_11).Append(" 增加到 ").Append(local_12));
    }
    else
    {
        local_8.EnableSFXToOne(Index);
        int local_12_2 = local_8.GetEnableCounterValue(Index);
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("EnableBreathSFX: 单次模式 - 启用计数器从 ").Append(local_11).Append(" 设置为 ").Append(local_12_2));
    }
    FString local_16 = BreathSFXUtils::GetConfigDebugInfo(Entity, Index, true);
    FString local_22;
    if (bAllowStacking)
    {
        local_22 = " [叠加]";
    }
    else
    {
        local_22 = " [单次]";
    }
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("启用呼吸音效: Entity ").Append(Entity.ToString()).Append(", SFX索引 ").Append(Index).Append(local_22).Append(local_16));
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), local_22.Append("计数器状态: 启用=").Append(local_8.GetEnableCounterValue(Index)).Append(" (之前=").Append(local_11).Append("), 禁用=").Append(local_8.GetDisableCounterValue(Index)).Append(" (之前=").Append(local_10).Append(")"));
    return;
}
UFUNCTION()
void EnableBreathSFXByName(const FECSEntity &inout Entity, const FName &inout ComponentName, const bool bAllowStacking = false)
{
    int local_14 = 0;
    Has local_6;
    if (!(Entity.IsValid()) || !(local_6.opCall()))
    {
        return;
    }
    int local_16 = BreathSFXUtils::FindAudioComponentIndex(local_14, ComponentName);
    if (local_16 == -1)
    {
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("EnableBreathSFXByName: 未找到音频组件 ").Append(ComponentName).Append(", Entity: ").Append(Entity.ToString()));
        return;
    }
    BreathSFXUtils::EnableBreathSFX(Entity, local_16, bAllowStacking);
    return;
}
UFUNCTION()
void DisableBreathSFX(const FECSEntity &inout Entity, const int Index, const bool bAllowStacking = false)
{
    int local_8 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (Index >= local_8.GetDisableCountersNum())
    {
        return;
    }
    int local_11 = local_8.GetEnableCounterValue(Index);
    int local_10 = local_8.GetDisableCounterValue(Index);
    if (bAllowStacking)
    {
        local_8.DisableSFX(Index);
        int local_12 = local_8.GetDisableCounterValue(Index);
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("DisableBreathSFX: 叠加模式 - 禁用计数器从 ").Append(local_10).Append(" 增加到 ").Append(local_12));
    }
    else
    {
        local_8.DisableSFXToOne(Index);
        int local_12_2 = local_8.GetEnableCounterValue(Index);
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("DisableBreathSFX: 单次模式 - 启用计数器从 ").Append(local_11).Append(" 清零为 ").Append(local_12_2));
    }
    FString local_16 = BreathSFXUtils::GetConfigDebugInfo(Entity, Index, false);
    FString local_22;
    if (bAllowStacking)
    {
        local_22 = " [叠加]";
    }
    else
    {
        local_22 = " [单次]";
    }
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("禁用呼吸音效: Entity ").Append(Entity.ToString()).Append(", SFX索引 ").Append(Index).Append(local_22).Append(local_16));
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), local_22.Append("计数器状态: 启用=").Append(local_8.GetEnableCounterValue(Index)).Append(" (之前=").Append(local_11).Append("), 禁用=").Append(local_8.GetDisableCounterValue(Index)).Append(" (之前=").Append(local_10).Append(")"));
    return;
}
UFUNCTION()
void DisableBreathSFXByName(const FECSEntity &inout Entity, const FName &inout ComponentName, const bool bAllowStacking = false)
{
    int local_14 = 0;
    Has local_6;
    if (!(Entity.IsValid()) || !(local_6.opCall()))
    {
        return;
    }
    int local_16 = BreathSFXUtils::FindAudioComponentIndex(local_14, ComponentName);
    if (local_16 == -1)
    {
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("DisableBreathSFXByName: 未找到音频组件 ").Append(ComponentName).Append(", Entity: ").Append(Entity.ToString()));
        return;
    }
    BreathSFXUtils::DisableBreathSFX(Entity, local_16, bAllowStacking);
    return;
}
UFUNCTION()
void EnableAllBreathSFX(const FECSEntity &inout Entity, const bool bAllowStacking = false)
{
    int local_14 = 0;
    Has local_6;
    if (!(Entity.IsValid()) || !(local_6.opCall()))
    {
        return;
    }
    int local_16 = local_14.BreathEnablePatterns.Num();
    if (local_16 == 0)
    {
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("EnableAllBreathSFX: 实体 ").Append(Entity.ToString()).Append(" 没有配置呼吸音效"));
        return;
    }
    int local_26 = 0;
    for (; local_26 < local_16; )
    {
        BreathSFXUtils::EnableBreathSFX(Entity, local_26, bAllowStacking);
        ++local_26;
    }
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("EnableAllBreathSFX: 已启用实体 ").Append(Entity.ToString()).Append(" 的所有呼吸音效 (共 ").Append(local_16).Append(" 个组件)"));
    return;
}
UFUNCTION()
void DisableAllBreathSFX(const FECSEntity &inout Entity, const bool bAllowStacking = false)
{
    int local_14 = 0;
    Has local_6;
    if (!(Entity.IsValid()) || !(local_6.opCall()))
    {
        return;
    }
    int local_16 = local_14.BreathDisablePatterns.Num();
    if (local_16 == 0)
    {
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("DisableAllBreathSFX: 实体 ").Append(Entity.ToString()).Append(" 没有配置呼吸音效"));
        return;
    }
    int local_26 = 0;
    for (; local_26 < local_16; )
    {
        BreathSFXUtils::DisableBreathSFX(Entity, local_26, bAllowStacking);
        ++local_26;
    }
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("DisableAllBreathSFX: 已禁用实体 ").Append(Entity.ToString()).Append(" 的所有呼吸音效 (共 ").Append(local_16).Append(" 个组件)"));
    return;
}
UFUNCTION()
void ResetAllBreathSFX(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    Has local_6;
    if (!(Entity.IsValid()) || !(local_6.opCall()))
    {
        return;
    }
    local_14.ResetAll();
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("ResetAllBreathSFX: 已重置实体 ").Append(Entity.ToString()).Append(" 的所有呼吸音效状态"));
    return;
}
void PlayEnableBreathAudio(const FECSEntity &inout Entity, const int Index)
{
    Has local_4;
    int local_12 = 0;
    if (!(local_4.opCall()))
    {
        return;
    }
    if (!(local_12.HasStartPattern(Index)))
    {
        return;
    }
    const FSFXBreathEnablePatterns& local_14 = local_12.BreathEnablePatterns[Index];
    FString local_22 = BreathSFXUtils::GetPatternDebugInfo(local_14, Index, "Enable");
    local_14.SourceConfig.PostEvent(Entity, local_14.EnterEvent);
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("播放开启呼吸音频: Entity ").Append(Entity.ToString()).Append(", 索引 ").Append(Index).Append(local_22));
    return;
}
void PlayDisableBreathAudio(const FECSEntity &inout Entity, const int Index)
{
    int local_20 = 0;
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("PlayDisableBreathAudio: 开始处理实体 ").Append(Entity.ToString()).Append(", 索引 ").Append(Index));
    Has local_14;
    if (!(local_14.opCall()))
    {
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("PlayDisableBreathAudio: 实体 ").Append(Entity.ToString()).Append(" 没有FC_SFXStateConfig组件，退出"));
        return;
    }
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("PlayDisableBreathAudio: 检查停止模式，索引 ").Append(Index).Append(", 停止模式数量: ").Append(local_20.BreathDisablePatterns.Num()));
    if (!(local_20.HasStopPattern(Index)))
    {
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("PlayDisableBreathAudio: 索引 ").Append(Index).Append(" 没有配置停止模式，退出"));
        return;
    }
    const FSFXBreathDisablePatterns& local_24 = local_20.BreathDisablePatterns[Index];
    FString local_8 = BreathSFXUtils::GetPatternDebugInfo(local_24, Index, "Disable");
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("PlayDisableBreathAudio: 准备播放停止音频，事件: ").Append(local_24.EnterEvent.GetAssetName()));
    local_24.SourceConfig.PostEvent(Entity, local_24.EnterEvent);
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("播放停止呼吸音频: Entity ").Append(Entity.ToString()).Append(", 索引 ").Append(Index).Append(local_8));
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("PlayDisableBreathAudio: 完成处理实体 ").Append(Entity.ToString()).Append(", 索引 ").Append(Index));
    return;
}
void HandleBreathStateChange(const FECSEntity &inout Entity, const int Index, const bool bEnable)
{
    if (bEnable)
    {
        BreathSFXUtils::PlayEnableBreathAudio(Entity, Index);
        return;
    }
    BreathSFXUtils::PlayDisableBreathAudio(Entity, Index);
    return;
}
FString GetConfigDebugInfo(const FECSEntity &inout Entity, const int Index, const bool bEnable)
{
    Has local_4;
    int local_12 = 0;
    if (!(local_4.opCall()))
    {
        return "";
    }
    FString local_16 = "";
    if (bEnable && local_12.HasStartPattern(Index))
    {
        const FSFXBreathEnablePatterns& local_20 = local_12.BreathEnablePatterns[Index];
        local_16 = BreathSFXUtils::GetPatternDebugInfo(local_20, Index, "Enable");
    }
    else
    {
        if (!(bEnable) && local_12.HasStopPattern(Index))
        {
            const FSFXBreathDisablePatterns& local_26 = local_12.BreathDisablePatterns[Index];
            local_16 = BreathSFXUtils::GetPatternDebugInfo(local_26, Index, "Disable");
        }
    }
    return local_16;
}
FString GetPatternDebugInfo(const FSFXPatternsBase &inout Pattern, const int Index, const FString &inout Type)
{
    FString local_16;
    if (Pattern.EnterEvent.IsValid())
    {
        local_16 = Pattern.EnterEvent.Get().GetName();
    }
    else
    {
        local_16 = "Invalid";
    }
    return FString().Append(", ").Append(Type).Append("模式索引 ").Append(Index).Append(", 事件: ").Append(local_16).Append(", Socket: ").Append(Pattern.SourceConfig.Socket.ToString());
}
UFUNCTION()
void ProcessEntityBreathSFX(const FECSEntity &inout Entity, const EBreathSFXTriggerType TriggerType, const FName &inout AudioComponentName, const bool bAllowStacking)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    switch (TriggerType)
    {
        case EBreathSFXTriggerType::Enable:
            BreathSFXUtils::EnableBreathSFXByName(Entity, AudioComponentName, bAllowStacking);
            return;
        case EBreathSFXTriggerType::Disable:
            BreathSFXUtils::DisableBreathSFXByName(Entity, AudioComponentName, bAllowStacking);
            return;
    }
    return;
}
int FindAudioComponentIndex(const FC_SFXStateConfig &inout Config, const FName &inout AudioComponentName)
{
    if (AudioComponentName.IsNone())
    {
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("FindAudioComponentIndex: 组件名称为空，使用默认索引 -1"));
        return -1;
    }
    int local_8 = Config.BreathEnablePatterns.Num();
    if (local_8 == 0)
    {
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("FindAudioComponentIndex: 没有配置任何音频组件"));
        return -1;
    }
    int local_10 = 0;
    for (; local_10 < local_8; ++local_10)
    {
        if (local_10 < Config.AudioComponentNames.Num() && (FName(Config.AudioComponentNames[local_10]) == AudioComponentName))
        {
            XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("FindAudioComponentIndex: 找到组件 ").Append(AudioComponentName).Append(" 在索引 ").Append(local_10));
            return local_10;
        }
    }
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("FindAudioComponentIndex: 未找到组件 ").Append(AudioComponentName).Append("，可用组件数量: ").Append(local_8));
    return -1;
}
UFUNCTION()
FString GetBreathSFXStatusInfo(const FECSEntity &inout Entity)
{
    int local_16 = 0;
    FString local_22;
    int local_32 = 0;
    int local_45;
    int local_47;
    if (!(Entity.IsValid()))
    {
        return "实体无效";
    }
    FString local_6 = "";
    Has local_10;
    if (!(local_10.opCall()))
    {
        return "实体没有呼吸音效配置";
    }
    int local_18 = local_16.BreathEnablePatterns.Num();
    if (local_18 == 0)
    {
        return "实体没有配置任何呼吸音效";
    }
    local_6 += FString().Append("呼吸音效配置信息:\n");
    local_6 += FString().Append("  总组件数: ").Append(local_18).Append("\n");
    local_6 += FString().Append("  启用模式数: ").Append(local_16.BreathEnablePatterns.Num()).Append("\n");
    local_6 += FString().Append("  禁用模式数: ").Append(local_16.BreathDisablePatterns.Num()).Append("\n");
    local_6 += FString().Append("  默认状态数: ").Append(local_16.DefaultStates.Num()).Append("\n");
    Has local_26;
    if (!(local_26.opCall()))
    {
        local_6 += "  运行时状态: 未初始化\n";
        return local_6;
    }
    local_6 += FString().Append("  运行时状态: 已初始化\n");
    local_6 += FString().Append("  启用计数器数: ").Append(local_32.GetEnableCountersNum()).Append("\n");
    local_6 += FString().Append("  禁用计数器数: ").Append(local_32.GetDisableCountersNum()).Append("\n");
    int local_33 = 0;
    for (; local_33 < local_18; )
    {
        FString local_38 = "未知组件";
        if (local_33 < local_16.AudioComponentNames.Num())
        {
            local_38 = local_16.AudioComponentNames[local_33].ToString();
        }
        bool local_1 = local_32.IsSFXActive(local_33);
        if (local_33 < local_32.GetEnableCountersNum())
        {
            int local_44 = local_33;
            local_45 = local_32.GetEnableCounterValue(local_44);
        }
        else
        {
            int local_42 = 0;
            local_45 = local_42;
        }
        if (local_33 < local_32.GetDisableCountersNum())
        {
            local_47 = local_32.GetDisableCounterValue(local_33);
        }
        else
        {
            int local_41 = 0;
            local_47 = local_41;
        }
        if (local_1)
        {
            local_22 = "活跃";
        }
        else
        {
            local_22 = "非活跃";
        }
        local_6 += FString().Append("    [").Append(local_33).Append("] ").Append(local_38).Append(": ").Append(local_22).Append(" (启用:").Append(local_45).Append(" 禁用:").Append(local_47).Append(")\n");
        ++local_33;
    }
    return local_6;
}
UFUNCTION()
TArray<FName> ListAudioComponentNames(const FECSEntity &inout Entity)
{
    int local_18 = 0;
    Has local_10;
    if (!(Entity.IsValid()) || !(local_10.opCall()))
    {
        return TArray<FName>();
    }
    return local_18.AudioComponentNames;
}
UFUNCTION()
bool IsBreathSFXSystemComplete(const FECSEntity &inout Entity)
{
    int local_16 = 0;
    int local_22 = 0;
    if (!(Entity.IsValid()))
    {
        return false;
    }
    Has local_6;
    if (!(local_6.opCall()))
    {
        return false;
    }
    Has local_10;
    if (!(local_10.opCall()))
    {
        return false;
    }
    int local_24 = local_16.BreathEnablePatterns.Num();
    if (local_24 == 0)
    {
        return false;
    }
    if (local_22.GetEnableCountersNum() < local_24)
    {
        return false;
    }
    if (local_22.GetDisableCountersNum() < local_24)
    {
        return false;
    }
    return true;
}
}
