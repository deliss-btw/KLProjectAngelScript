
enum ENetReason
{
    ENET_NONE,
    ENET_TIMEOUT,
    ENET_LOGIN_UNFINISHED,
    ENET_CLIENT_REQ,
    ENET_SERVER_RELOGIN,
    ENET_DSDead,
    ENET_DSAllocFailed,
    ENET_GAME_DOWNTIME,
}


struct FErrorCodeSettingsCache
{
    UPROPERTY()
    TMap<int, FText> ErrorCodeMessages;

    FErrorCodeSettingsCache()
    {
        return;
    }
}

class UErrorCodeSettings : UGameplaySettingsBase
{
    UPROPERTY()
    UDataTable ErrorCodeConfigTable;
    UPROPERTY()
    TMap<ENetReason, TDataObjectPtr<FKLTextData>> NetReasonMessages;

    UErrorCodeSettings()
    {
        return;
    }
    UFUNCTION()
    FInstancedStruct ComputeCacheData_Implementation() const
    {
        FErrorCodeSettingsCache local_20;
        if (this.ErrorCodeConfigTable != nullptr)
        {
            TDataObjectIterator<FErrorCodeConfig> local_40;
            for (; local_40; )
            {
                FString local_50 = local_40.GetData().GetDataName().ToString();
                if (!(String::IsNumeric(local_50)))
                {
                    XError(ELog(31), FString().Append("ErrorCodeConfigTable: Invalid row name: ").Append(local_50).Append(", error code must be numeric"));
                }
                else
                {
                    int local_53 = String::Conv_StringToInt(local_50);
                    FText local_60 = FText(local_40.GetData().ErrorCodeText);
                    if (!(local_60.IsEmpty()))
                    {
                        local_20.ErrorCodeMessages.Add(local_53, local_60);
                    }
                }
                local_40.Next();
            }
        }
        return FInstancedStruct::Make(local_20);
    }
    bool GetErrorCodeText(const int ErrorCode, FText &inout OutErrorCodeText) const
    {
        TConstRawPtr<FErrorCodeSettingsCache> local_6 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (local_6.opArrow().ErrorCodeMessages.Find(ErrorCode, OutErrorCodeText))
        {
            return true;
        }
        return false;
    }
    FString GetErrorCodeDebugString(const int ErrorCode) const
    {
        FName local_6 = FName(String::Conv_IntToString(ErrorCode));
        UDataTable::FindDataObject local_12;
        TDataObjectPtr<FErrorCodeConfig> local_36 = local_12.opCall(local_6);
        if (local_36)
        {
            return local_36.opArrow().ErrorCodeComment;
        }
        return FString::Format("Unknown Error ({0})", ErrorCode);
    }
    bool GetNetErrorCodeText(const ENetReason NetReason, FText &inout OutNetErrorCodeText) const
    {
        bool local_1;
        bool local_5 = false;
        if (this.NetReasonMessages.Contains(NetReason))
        {
            const TDataObjectPtr<FKLTextData>& local_4 = this.NetReasonMessages[NetReason];
            if (!(local_4.IsSet()))
            {
                local_1 = false;
            }
            else
            {
                local_5 = !local_5;
                local_1 = local_5;
            }
            if (local_1)
            {
            }
            return true;
        }
        OutNetErrorCodeText = FText();
        return false;
    }
}

