
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
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("EnableBreathSFX: еЏ еЉ жЁЎејЏ - еђЇз”Ёи®Ўж•°е™Ёд»Ћ ").Append(local_11).Append(" еўћеЉ е€° ").Append(local_12));
    }
    else
    {
        local_8.EnableSFXToOne(Index);
        int local_12_2 = local_8.GetEnableCounterValue(Index);
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("EnableBreathSFX: еЌ•ж¬ЎжЁЎејЏ - еђЇз”Ёи®Ўж•°е™Ёд»Ћ ").Append(local_11).Append(" и®ѕзЅ®дёє ").Append(local_12_2));
    }
    FString local_16 = BreathSFXUtils::GetConfigDebugInfo(Entity, Index, true);
    FString local_22;
    if (bAllowStacking)
    {
        local_22 = " [еЏ еЉ ]";
    }
    else
    {
        local_22 = " [еЌ•ж¬Ў]";
    }
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("еђЇз”Ёе‘јеђёйџіж•€: Entity ").Append(Entity.ToString()).Append(", SFXзґўеј• ").Append(Index).Append(local_22).Append(local_16));
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), local_22.Append("и®Ўж•°е™ЁзЉ¶жЂЃ: еђЇз”Ё=").Append(local_8.GetEnableCounterValue(Index)).Append(" (д№‹е‰Ќ=").Append(local_11).Append("), з¦Ѓз”Ё=").Append(local_8.GetDisableCounterValue(Index)).Append(" (д№‹е‰Ќ=").Append(local_10).Append(")"));
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
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("EnableBreathSFXByName: жњЄж‰ѕе€°йџійў‘з»„д»¶ ").Append(ComponentName).Append(", Entity: ").Append(Entity.ToString()));
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
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("DisableBreathSFX: еЏ еЉ жЁЎејЏ - з¦Ѓз”Ёи®Ўж•°е™Ёд»Ћ ").Append(local_10).Append(" еўћеЉ е€° ").Append(local_12));
    }
    else
    {
        local_8.DisableSFXToOne(Index);
        int local_12_2 = local_8.GetEnableCounterValue(Index);
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("DisableBreathSFX: еЌ•ж¬ЎжЁЎејЏ - еђЇз”Ёи®Ўж•°е™Ёд»Ћ ").Append(local_11).Append(" жё…й›¶дёє ").Append(local_12_2));
    }
    FString local_16 = BreathSFXUtils::GetConfigDebugInfo(Entity, Index, false);
    FString local_22;
    if (bAllowStacking)
    {
        local_22 = " [еЏ еЉ ]";
    }
    else
    {
        local_22 = " [еЌ•ж¬Ў]";
    }
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("з¦Ѓз”Ёе‘јеђёйџіж•€: Entity ").Append(Entity.ToString()).Append(", SFXзґўеј• ").Append(Index).Append(local_22).Append(local_16));
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), local_22.Append("и®Ўж•°е™ЁзЉ¶жЂЃ: еђЇз”Ё=").Append(local_8.GetEnableCounterValue(Index)).Append(" (д№‹е‰Ќ=").Append(local_11).Append("), з¦Ѓз”Ё=").Append(local_8.GetDisableCounterValue(Index)).Append(" (д№‹е‰Ќ=").Append(local_10).Append(")"));
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
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("DisableBreathSFXByName: жњЄж‰ѕе€°йџійў‘з»„д»¶ ").Append(ComponentName).Append(", Entity: ").Append(Entity.ToString()));
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
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("EnableAllBreathSFX: е®ћдЅ“ ").Append(Entity.ToString()).Append(" жІЎжњ‰й…ЌзЅ®е‘јеђёйџіж•€"));
        return;
    }
    int local_26 = 0;
    for (; local_26 < local_16; )
    {
        BreathSFXUtils::EnableBreathSFX(Entity, local_26, bAllowStacking);
        ++local_26;
    }
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("EnableAllBreathSFX: е·ІеђЇз”Ёе®ћдЅ“ ").Append(Entity.ToString()).Append(" зљ„ж‰Ђжњ‰е‘јеђёйџіж•€ (е…± ").Append(local_16).Append(" дёЄз»„д»¶)"));
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
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("DisableAllBreathSFX: е®ћдЅ“ ").Append(Entity.ToString()).Append(" жІЎжњ‰й…ЌзЅ®е‘јеђёйџіж•€"));
        return;
    }
    int local_26 = 0;
    for (; local_26 < local_16; )
    {
        BreathSFXUtils::DisableBreathSFX(Entity, local_26, bAllowStacking);
        ++local_26;
    }
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("DisableAllBreathSFX: е·Із¦Ѓз”Ёе®ћдЅ“ ").Append(Entity.ToString()).Append(" зљ„ж‰Ђжњ‰е‘јеђёйџіж•€ (е…± ").Append(local_16).Append(" дёЄз»„д»¶)"));
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
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("ResetAllBreathSFX: е·Ій‡ЌзЅ®е®ћдЅ“ ").Append(Entity.ToString()).Append(" зљ„ж‰Ђжњ‰е‘јеђёйџіж•€зЉ¶жЂЃ"));
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
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("ж’­ж”ѕејЂеђЇе‘јеђёйџійў‘: Entity ").Append(Entity.ToString()).Append(", зґўеј• ").Append(Index).Append(local_22));
    return;
}
void PlayDisableBreathAudio(const FECSEntity &inout Entity, const int Index)
{
    int local_20 = 0;
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("PlayDisableBreathAudio: ејЂе§‹е¤„зђ†е®ћдЅ“ ").Append(Entity.ToString()).Append(", зґўеј• ").Append(Index));
    Has local_14;
    if (!(local_14.opCall()))
    {
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("PlayDisableBreathAudio: е®ћдЅ“ ").Append(Entity.ToString()).Append(" жІЎжњ‰FC_SFXStateConfigз»„д»¶пјЊйЂЂе‡є"));
        return;
    }
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("PlayDisableBreathAudio: жЈЂжџҐеЃњж­ўжЁЎејЏпјЊзґўеј• ").Append(Index).Append(", еЃњж­ўжЁЎејЏж•°й‡Џ: ").Append(local_20.BreathDisablePatterns.Num()));
    if (!(local_20.HasStopPattern(Index)))
    {
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("PlayDisableBreathAudio: зґўеј• ").Append(Index).Append(" жІЎжњ‰й…ЌзЅ®еЃњж­ўжЁЎејЏпјЊйЂЂе‡є"));
        return;
    }
    const FSFXBreathDisablePatterns& local_24 = local_20.BreathDisablePatterns[Index];
    FString local_8 = BreathSFXUtils::GetPatternDebugInfo(local_24, Index, "Disable");
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("PlayDisableBreathAudio: е‡†е¤‡ж’­ж”ѕеЃњж­ўйџійў‘пјЊдє‹д»¶: ").Append(local_24.EnterEvent.GetAssetName()));
    local_24.SourceConfig.PostEvent(Entity, local_24.EnterEvent);
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("ж’­ж”ѕеЃњж­ўе‘јеђёйџійў‘: Entity ").Append(Entity.ToString()).Append(", зґўеј• ").Append(Index).Append(local_8));
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("PlayDisableBreathAudio: е®Њж€ђе¤„зђ†е®ћдЅ“ ").Append(Entity.ToString()).Append(", зґўеј• ").Append(Index));
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
        UAkAudioEvent local_8;
        local_16 = local_8.GetName();
    }
    else
    {
        local_16 = "Invalid";
    }
    return FString().Append(", ").Append(Type).Append("жЁЎејЏзґўеј• ").Append(Index).Append(", дє‹д»¶: ").Append(local_16).Append(", Socket: ").Append(Pattern.SourceConfig.Socket.ToString());
}
UFUNCTION()
void ProcessEntityBreathSFX(const FECSEntity &inout Entity, const EBreathSFXTriggerType TriggerType, const FName &inout AudioComponentName, const bool bAllowStacking)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
int FindAudioComponentIndex(const FC_SFXStateConfig &inout Config, const FName &inout AudioComponentName)
{
    if (AudioComponentName.IsNone())
    {
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("FindAudioComponentIndex: з»„д»¶еђЌз§°дёєз©єпјЊдЅїз”Ёй»и®¤зґўеј• -1"));
        return -1;
    }
    int local_8 = Config.Num();
    if (local_8 == 0)
    {
        XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("FindAudioComponentIndex: жІЎжњ‰й…ЌзЅ®д»»дЅ•йџійў‘з»„д»¶"));
        return -1;
    }
    int local_10 = 0;
    for (; local_10 < local_8; ++local_10)
    {
        if (local_10 < Config.AudioComponentNames.Num() && (FName(Config.AudioComponentNames[local_10]) == AudioComponentName))
        {
            XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("FindAudioComponentIndex: ж‰ѕе€°з»„д»¶ ").Append(AudioComponentName).Append(" ењЁзґўеј• ").Append(local_10));
            return local_10;
        }
    }
    XLogIf(CVar_BreathSFX_EnableDebug.GetBool(), ELog(1), FString().Append("FindAudioComponentIndex: жњЄж‰ѕе€°з»„д»¶ ").Append(AudioComponentName).Append("пјЊеЏЇз”Ёз»„д»¶ж•°й‡Џ: ").Append(local_8));
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
        return "е®ћдЅ“ж— ж•€";
    }
    FString local_6 = "";
    Has local_10;
    if (!(local_10.opCall()))
    {
        return "е®ћдЅ“жІЎжњ‰е‘јеђёйџіж•€й…ЌзЅ®";
    }
    int local_18 = local_16.BreathEnablePatterns.Num();
    if (local_18 == 0)
    {
        return "е®ћдЅ“жІЎжњ‰й…ЌзЅ®д»»дЅ•е‘јеђёйџіж•€";
    }
    local_6 += FString().Append("е‘јеђёйџіж•€й…ЌзЅ®дїЎжЃЇ:\n");
    local_6 += FString().Append("  жЂ»з»„д»¶ж•°: ").Append(local_18).Append("\n");
    local_6 += FString().Append("  еђЇз”ЁжЁЎејЏж•°: ").Append(local_16.BreathEnablePatterns.Num()).Append("\n");
    local_6 += FString().Append("  з¦Ѓз”ЁжЁЎејЏж•°: ").Append(local_16.BreathDisablePatterns.Num()).Append("\n");
    local_6 += FString().Append("  й»и®¤зЉ¶жЂЃж•°: ").Append(local_16.DefaultStates.Num()).Append("\n");
    Has local_26;
    if (!(local_26.opCall()))
    {
        local_6 += "  иїђиЎЊж—¶зЉ¶жЂЃ: жњЄе€ќе§‹еЊ–\n";
        return local_6;
    }
    local_6 += FString().Append("  иїђиЎЊж—¶зЉ¶жЂЃ: е·Іе€ќе§‹еЊ–\n");
    local_6 += FString().Append("  еђЇз”Ёи®Ўж•°е™Ёж•°: ").Append(local_32.GetEnableCountersNum()).Append("\n");
    local_6 += FString().Append("  з¦Ѓз”Ёи®Ўж•°е™Ёж•°: ").Append(local_32.GetDisableCountersNum()).Append("\n");
    int local_33 = 0;
    for (; local_33 < local_18; )
    {
        FString local_38 = "жњЄзџҐз»„д»¶";
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
            local_22 = "жґ»и·ѓ";
        }
        else
        {
            local_22 = "йќћжґ»и·ѓ";
        }
        local_6 += FString().Append("    [").Append(local_33).Append("] ").Append(local_38).Append(": ").Append(local_22).Append(" (еђЇз”Ё:").Append(local_45).Append(" з¦Ѓз”Ё:").Append(local_47).Append(")\n");
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
