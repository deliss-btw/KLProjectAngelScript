

namespace __ConsoleCommond
{
class UAppearanceConsoleCommand : UKLConsoleCommandLibrary
{
    default Category = n"Appearance";

    UAppearanceConsoleCommand()
    {
        return;
    }
    UFUNCTION()
    void FaceSet_Implementation(const int FacePresetId, const int EntityId = 0)
    {
        int local_4;
        if (EntityId != 0)
        {
            local_4 = EntityId;
        }
        else
        {
            local_4 = this.GetLocalPawnEntityId();
        }
        if (local_4 == 0)
        {
            Print("FaceSet: no valid target entity", 5.0f, FLinearColor::LucBlue);
            return;
        }
        System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("FaceSet_Server ").Append(FacePresetId).Append(" ").Append(local_4), nullptr);
        return;
    }
    UFUNCTION()
    void FaceSet_Server_Implementation(const int FacePresetId, const int EntityId)
    {
        int local_48 = 0;
        if (!(FECSEntity(EntityId).IsValid()))
        {
            Print(FString().Append("FaceSet_Server: Entity ").Append(EntityId).Append(" invalid"), 5.0f, FLinearColor::LucBlue);
            return;
        }
        if (FacePresetId != 0 && !(::FFacePresetConfig::GetByDataId(FacePresetId)))
        {
            Print(FString().Append("FaceSet_Server: FacePresetId ").Append(FacePresetId).Append(" not found in FFacePresetConfig"), 5.0f, FLinearColor::LucBlue);
            return;
        }
        local_48.SetFacePreset(FacePresetId);
        Print(FString().Append("FaceSet_Server: Entity=").Append(EntityId).Append(", FacePresetId=").Append(FacePresetId), 5.0f, FLinearColor::LucBlue);
        return;
    }
    UFUNCTION()
    void FashionAdd_Implementation(const int DataId, const int EntityId = 0)
    {
        int local_4;
        if (EntityId != 0)
        {
            local_4 = EntityId;
        }
        else
        {
            local_4 = this.GetLocalPawnEntityId();
        }
        if (local_4 == 0)
        {
            Print("FashionAdd: no valid target entity", 5.0f, FLinearColor::LucBlue);
            return;
        }
        System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("Fashion_Server 1 ").Append(DataId).Append(" ").Append(local_4), nullptr);
        return;
    }
    UFUNCTION()
    void FashionRemove_Implementation(const int DataId, const int EntityId = 0)
    {
        int local_4;
        if (EntityId != 0)
        {
            local_4 = EntityId;
        }
        else
        {
            local_4 = this.GetLocalPawnEntityId();
        }
        if (local_4 == 0)
        {
            Print("FashionRemove: no valid target entity", 5.0f, FLinearColor::LucBlue);
            return;
        }
        System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("Fashion_Server 0 ").Append(DataId).Append(" ").Append(local_4), nullptr);
        return;
    }
    UFUNCTION()
    void Fashion_Server_Implementation(const int bAdd, const int DataId, const int EntityId)
    {
        FString local_14;
        int local_65 = 0;
        int local_72 = 0;
        int local_80 = 0;
        int local_88 = 0;
        if (!(FECSEntity(EntityId).IsValid()))
        {
            Print(FString().Append("Fashion_Server: Entity ").Append(EntityId).Append(" invalid"), 5.0f, FLinearColor::LucBlue);
            return;
        }
        if (!(::FFashionConfig::GetByDataId(DataId)))
        {
            Print(FString().Append("Fashion_Server: DataId ").Append(DataId).Append(" not found in FFashionConfig"), 5.0f, FLinearColor::LucBlue);
            return;
        }
        if (::FFashionConfig::IsPlayerFashionSlot(EFashionSlotType(local_65)))
        {
            if (!(local_72) || !(local_72.GetPlayerEntity().IsValid()))
            {
                Print(FString().Append("Fashion_Server: Entity ").Append(EntityId).Append(" has no valid player controller for player fashion"), 5.0f, FLinearColor::LucBlue);
                return;
            }
            if (bAdd != 0)
            {
                local_80.AddFashion(DataId);
            }
            else
            {
                local_80.RemoveFashion(DataId);
            }
        }
        else
        {
            if (bAdd != 0)
            {
                local_88.AddFashion(DataId);
            }
            else
            {
                local_88.RemoveFashion(DataId);
            }
        }
        if (bAdd != 0)
        {
            local_14 = "Add";
        }
        else
        {
            local_14 = "Remove";
        }
        Print(FString().Append("Fashion_Server: ").Append(local_14).Append(" Entity=").Append(EntityId).Append(", DataId=").Append(DataId).Append(", Slot=").Append(local_65), 5.0f, FLinearColor::LucBlue);
        return;
    }
    UFUNCTION()
    void FashionLargeHint_Implementation(const int DataId)
    {
        if (!(::FFashionConfig::GetByDataId(DataId)))
        {
            Print(FString().Append("FashionLargeHint: DataId ").Append(DataId).Append(" not found in FFashionConfig"), 5.0f, FLinearColor::LucBlue);
            return;
        }
        FECSEntity local_64 = ::FASCommonUtils::GetLocalUniquePlayerEntity();
        if (!(local_64))
        {
            Print("FashionLargeHint: no valid local player entity", 5.0f, FLinearColor::LucBlue);
            return;
        }
        TDataObjectPtr<FMessageHintConfig> local_112 = ::FashionSettings::GetNewUnlockLargeHint();
        if (!(local_112))
        {
            Print("FashionLargeHint: DA_FashionSettings.NewUnlockLargeHint is empty", 5.0f, FLinearColor::LucBlue);
            return;
        }
        TArray<FTextArgument> local_116;
        Make local_122;
        local_116.Add(local_122.opImplConv());
        ::MessageHintUtils::ShowMessageHint(local_64, local_112, local_116);
        FString local_134;
        Print(FString().Append("FashionLargeHint: showed hint for DataId=").Append(DataId).Append(", Name=").Append(local_134), 5.0f, FLinearColor::LucBlue);
        return;
    }
    int GetLocalPawnEntityId()
    {
        int local_12 = 0;
        FECSWorldPtr local_2 = KLConsoleCommand::CheatGetECSWorld();
        if (!(local_2.IsValid()))
        {
            return 0;
        }
        if (!(local_12))
        {
            return 0;
        }
        return local_12.GetPlayerPawnEntity().GetIdValue();
    }
    void FaceSet(const int FacePresetId, const int EntityId = 0)
    {
        __Evt_PushArgument__int32(FacePresetId);
        __Evt_PushArgument__int32(EntityId);
        __Evt_Execute(this, n"FaceSet");
        return;
    }
    void FaceSet_Server(const int FacePresetId, const int EntityId)
    {
        __Evt_PushArgument__int32(FacePresetId);
        __Evt_PushArgument__int32(EntityId);
        __Evt_Execute(this, n"FaceSet_Server");
        return;
    }
    void FashionAdd(const int DataId, const int EntityId = 0)
    {
        __Evt_PushArgument__int32(DataId);
        __Evt_PushArgument__int32(EntityId);
        __Evt_Execute(this, n"FashionAdd");
        return;
    }
    void FashionRemove(const int DataId, const int EntityId = 0)
    {
        __Evt_PushArgument__int32(DataId);
        __Evt_PushArgument__int32(EntityId);
        __Evt_Execute(this, n"FashionRemove");
        return;
    }
    void Fashion_Server(const int bAdd, const int DataId, const int EntityId)
    {
        __Evt_PushArgument__int32(bAdd);
        __Evt_PushArgument__int32(DataId);
        __Evt_PushArgument__int32(EntityId);
        __Evt_Execute(this, n"Fashion_Server");
        return;
    }
    void FashionLargeHint(const int DataId)
    {
        __Evt_PushArgument__int32(DataId);
        __Evt_Execute(this, n"FashionLargeHint");
        return;
    }
}

}
