
namespace EcoCollectableDebugDrawer
{
    const TArray<FColor> ColorWindowBgList = TArray<FColor>();
    const FColor ColorText = FColor();

struct FConfigPreviewSpawnerSettings
{
    FConfigPreviewSpawnerSettings()
    {
        return;
    }
}

class UEcoCollectableSpawnerDrawer : UGameDebugImGuiActorDrawer
{
    UEcoCollectableSpawnerDrawer()
    {
        return;
    }
}

class UEcoCollectableResourcePointConfigDrawer : UGameDebugImGuiGlobalDrawer
{
    UEcoCollectableResourcePointConfigDrawer()
    {
        return;
    }
}

class UEcologyPropResourcePointConfigDrawer : UGameDebugImGuiGlobalDrawer
{
    UEcologyPropResourcePointConfigDrawer()
    {
        return;
    }
}

class UEcoCollectablePrefabConfigDrawer : UGameDebugImGuiGlobalDrawer
{
    UEcoCollectablePrefabConfigDrawer()
    {
        return;
    }
}

class UEcologyPropPrefabConfigDrawer : UGameDebugImGuiGlobalDrawer
{
    UEcologyPropPrefabConfigDrawer()
    {
        return;
    }
}

class UEcoCollectableResourcePointLocationDrawer : UGameDebugImGuiActorDrawer
{
    UEcoCollectableResourcePointLocationDrawer()
    {
        return;
    }
}

class UEcologyPropResourcePointLocationDrawer : UGameDebugImGuiActorDrawer
{
    UEcologyPropResourcePointLocationDrawer()
    {
        return;
    }
}

class UEcoCollectablePrefabConfigDraw : UGameDebugImGuiActorDrawer
{
    bool bShowLowLevelVisualStatus = false;

    default SetbEnable(false);
    default SetbGameEnableRender(true);
    default SetbEditorEnableRender(true);
    default SetbOnlyOnSelectedRender(false);
    default DrawActor = AEcoCollectablePrefabBase;


    UFUNCTION()
    void WhenDraw_Implementation(const AActor Actor, const FGameDebugDrawHandle &inout Handle, const FGameDebugActorDrawerContext &inout Context)
    {
        float32 local_27;
        int local_46 = 0;
        int local_100 = 0;
        Get local_106;
        int local_137;
        if (!(Context.GetbGameView()))
        {
            Handle.DrawLine(Actor.GetActorLocation(), (Actor.GetActorLocation() + FVector(0.0, 0.0, 99999999.0)), FLinearColor(FColor::Silver), ESceneDepthPriorityGroup(0), 10.0f, 0.0f);
            return;
        }
        AEcoCollectablePrefabBase local_38 = (Cast<AEcoCollectablePrefabBase>(Actor));
        FECSWorldPtr local_40 = ECS::GetECSWorld();
        if (!((local_38 != nullptr)) || !(local_46))
        {
            return;
        }
        if (Context.GetbGameView())
        {
            bool local_57;
            if (!(::FASCommonUtils::GetLocalPlayerPawnEntity().IsValid()))
            {
                return;
            }
            local_57 = true;
            Get local_62;
            const FC_Transform& local_64 = local_62.opCall();
            if (local_64)
            {
                if (local_64.GetPosition().DistSquared(local_38.GetActorLocation()) >= 160000.0)
                {
                    local_57 = false;
                }
            }
            if (local_57)
            {
                ImGui::PushStyleColor(EImGuiCol(2), FColor(uint8(0), uint8(0), uint8(0), uint8(200)));
                bool local_47 = Handle.BeginPanelAt(local_38.GetFName(), local_38.GetActorLocation(), 10.0f, Handle.GetDefaultPanelFlags());
                if (local_47)
                {
                    ImGui::Text(FString().Append("й‡‡й›†з‰©пјљ").Append(local_38.GetClass().GetName()));
                    FECSEntity local_56 = ECS::GetPrefabEntity(local_38);
                    if (local_56)
                    {
                        Get local_124;
                        ImGui::Text(FString().Append("Static Entity: ").Append(local_56.GetId().GetIdValue()));
                        float32 local_90 = -1.0f;
                        FECSEntity local_94 = FECSEntity(ENTITY_NULL);
                        if (local_46.GetStatic2DynamicEntityIdMap().Contains(local_56.GetId()))
                        {
                            local_94 = FECSEntity(local_46.GetStatic2DynamicEntityIdMap()[local_56.GetId()]);
                            if (local_94)
                            {
                                ImGui::SameLine(0.0f, -1.0f);
                                ImGui::Text(FString().Append(", Dynamic Entity: ").Append(local_94.GetId().GetIdValue()));
                                local_90 = float32((local_100.GetRecoverCDTargetTime().ToSeconds() - ECS::GetContextTime().ToSeconds()));
                            }
                        }
                        const FC_EcoCollectableNonSyncedVisualStatus& local_108 = local_106.opCall();
                        if (local_108)
                        {
                            if (!(local_108.bVisibilityStatusCacheValid))
                            {
                                ImGui::Text(FString().Append("зј“е­жѕз¤єзЉ¶жЂЃ: "));
                                ImGui::PushStyleColor(EImGuiCol(0), FColor::Yellow);
                                ImGui::SameLine(0.0f, -1.0f);
                                ImGui::Text(FString().Append("Invalid"));
                                ImGui::PopStyleColor(1);
                            }
                            else
                            {
                                if (int(local_108.VisibilityStatus) == 0)
                                {
                                    ImGui::Text(FString().Append("зј“е­жѕз¤єзЉ¶жЂЃ: "));
                                    ImGui::PushStyleColor(EImGuiCol(0), FColor::Green);
                                    ImGui::SameLine(0.0f, -1.0f);
                                    ImGui::Text(FString().Append("Show"));
                                    ImGui::PopStyleColor(1);
                                }
                                else
                                {
                                    if (int(local_108.VisibilityStatus) == 1)
                                    {
                                        ImGui::Text(FString().Append("зј“е­жѕз¤єзЉ¶жЂЃ: "));
                                        ImGui::PushStyleColor(EImGuiCol(0), FColor::Red);
                                        ImGui::SameLine(0.0f, -1.0f);
                                        ImGui::Text(FString().Append("Hidden"));
                                        ImGui::PopStyleColor(1);
                                    }
                                }
                            }
                            if (int(local_108.CollectReadyStatus) == 1)
                            {
                                ImGui::Text(FString().Append("зј“е­й‡‡й›†зЉ¶жЂЃ: "));
                                ImGui::SameLine(0.0f, -1.0f);
                                FVector2D local_116;
                                local_47 = ImGui::Button(FName("жё…й›¶"), local_116);
                                if (local_47)
                                {
                                    if (local_94.IsValid())
                                    {
                                        System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLEcoCollectableZeroOutCDTime ").Append(local_94.GetIdValue()), nullptr);
                                    }
                                }
                                ImGui::PushStyleColor(EImGuiCol(0), FColor::Cyan);
                                ImGui::SameLine(0.0f, -1.0f);
                                if (local_90 >= 0.0f)
                                {
                                    local_27 = local_90;
                                }
                                else
                                {
                                    local_27 = 24322.0f;
                                }
                                ImGui::Text(FString().Append("е·Ій‡‡й›†е†·еЌґдё­(").Append(local_27).Append());
                                ImGui::PopStyleColor(1);
                            }
                            else
                            {
                                if (int(local_108.CollectReadyStatus) == 0)
                                {
                                    ImGui::Text(FString().Append("зј“е­й‡‡й›†зЉ¶жЂЃ: "));
                                    ImGui::PushStyleColor(EImGuiCol(0), FColor::Green);
                                    ImGui::SameLine(0.0f, -1.0f);
                                    ImGui::Text(FString().Append("еЏЇй‡‡й›†"));
                                    ImGui::PopStyleColor(1);
                                }
                            }
                        }
                        ImGui::Separator();
                        const FC_EcoCollectableLayoutInfo& local_126 = local_124.opCall();
                        if (local_126)
                        {
                            ImGui::Text(FString().Append("BakedOrderIndex: ").Append(local_126.LayoutInfo.BakedOrderIndex));
                            if (local_126.LayoutInfo.BundleDef.IsSet())
                            {
                                ImGui::Text(FString().Append("BundleDef: ").Append(local_126.LayoutInfo.BundleDef));
                            }
                            if (local_126.LayoutInfo.CreatureDef.IsSet())
                            {
                                ImGui::Text(FString().Append("CreatureDef: ").Append(local_126.LayoutInfo.CreatureDef));
                            }
                        }
                        const FC_EcoCollectableNonSyncedVisualStatus& local_108_2 = local_106.opCall();
                        if (local_108_2)
                        {
                            ImGui::Text(FString().Append("--- SpawnRatio зј“е­ ---"));
                            if (local_108_2.bSpawnRatioCacheValid)
                            {
                                ImGui::PushStyleColor(EImGuiCol(0), FColor::Green);
                                ImGui::Text(FString().Append("зј“е­зЉ¶жЂЃ: Valid"));
                                ImGui::PopStyleColor(1);
                                ImGui::Text(FString().Append("е¤©ж°”: ").Append(local_108_2.CachedWeatherName));
                                ImGui::Text(FString().Append("ж—¶й—ґж®µ: ").Append(local_108_2.CachedTimeSegments));
                                ImGui::Text(FString().Append("BundleSpawnRatio: ").Append(local_108_2.CachedBundleSpawnRatio));
                                ImGui::Text(FString().Append("CreatureSpawnRatio: ").Append(local_108_2.CachedCreatureSpawnRatio));
                            }
                            else
                            {
                                ImGui::PushStyleColor(EImGuiCol(0), FColor::Yellow);
                                ImGui::Text(FString().Append("зј“е­зЉ¶жЂЃ: Invalid (жњЄе€ќе§‹еЊ–)"));
                                ImGui::PopStyleColor(1);
                            }
                        }
                        const FC_EcoCollectableLayoutInfo& local_126_2 = local_124.opCall();
                        if (local_126_2)
                        {
                            if (!((local_126_2.CachedSpawnerEntityId == ENTITY_ID_NULL)))
                            {
                                FECSEntity local_88 = FECSEntity(local_126_2.CachedSpawnerEntityId);
                                Get local_134;
                                const FC_EcoCollectableSpawnerRuntime& local_136 = local_134.opCall();
                                if (local_136)
                                {
                                    const FC_EcoCollectableNonSyncedVisualStatus& local_108_3 = local_106.opCall();
                                    if (local_108_3)
                                    {
                                        if (local_126_2.LayoutInfo.BundleDef.IsSet() && local_136.CreatureDefToCountMap.Contains(local_126_2.LayoutInfo.BundleDef))
                                        {
                                            local_137 = local_136.CreatureDefToCountMap[local_126_2.LayoutInfo.BundleDef];
                                            local_27 = local_137;
                                            local_27 = local_27 * local_108_3.CachedBundleSpawnRatio;
                                            ImGui::Text(FString().Append("Spawner BundleCount: ").Append(local_137).Append(" (й€еЂј: ").Append(uint(local_27)).Append(")"));
                                        }
                                        if (local_126_2.LayoutInfo.CreatureDef.IsSet() && local_136.CreatureDefToCountMap.Contains(local_126_2.LayoutInfo.CreatureDef))
                                        {
                                            local_137 = local_136.CreatureDefToCountMap[local_126_2.LayoutInfo.CreatureDef];
                                            float local_28_2 = local_137;
                                            local_28_2 = local_28_2 * local_108_3.CachedCreatureSpawnRatio;
                                            ImGui::Text(FString().Append("Spawner CreatureCount: ").Append(local_137).Append(" (й€еЂј: ").Append(uint(local_28_2)).Append(")"));
                                        }
                                    }
                                }
                            }
                        }
                        ImGui::Separator();
                        local_137 = -1;
                        ImGui::CheckBox(FName("и®Ўз®—еє•е±‚жѕз¤єзЉ¶жЂЃ"), this.bShowLowLevelVisualStatus);
                        if (this.bShowLowLevelVisualStatus)
                        {
                            bool local_138;
                            local_138 = false;
                            ImGui::Text(FString().Append("еє•е±‚жћње®ћжѕз¤єзЉ¶жЂЃ: "));
                            ImGui::SameLine(0.0f, -1.0f);
                            if (::EcoCollectableUtils::LowLevelIsAllShowOrHidden(local_56, true, true, local_137))
                            {
                                if (local_137 == 1)
                                {
                                    ImGui::Text("All show");
                                    local_138 = true;
                                }
                                else
                                {
                                    if (local_137 == -1)
                                    {
                                        ImGui::Text("Scene Components Empty");
                                        local_138 = true;
                                    }
                                    else
                                    {
                                        if (::EcoCollectableUtils::LowLevelIsAllShowOrHidden(local_56, true, false, local_137))
                                        {
                                            if (local_137 == 1)
                                            {
                                                ImGui::Text("All Hidden");
                                                local_138 = true;
                                            }
                                        }
                                    }
                                }
                            }
                            if (!(local_138))
                            {
                                ImGui::PushStyleColor(EImGuiCol(0), FColor::Red);
                                ImGui::Text(FString().Append("еј‚еёё"));
                                ImGui::PopStyleColor(1);
                            }
                            local_138 = false;
                            ImGui::Text(FString().Append("еє•е±‚йќћжћње®ћжѕз¤єзЉ¶жЂЃ: "));
                            ImGui::SameLine(0.0f, -1.0f);
                            if (::EcoCollectableUtils::LowLevelIsAllShowOrHidden(local_56, false, true, local_137))
                            {
                                if (local_137 == 1)
                                {
                                    ImGui::Text("All show");
                                    local_138 = true;
                                }
                                else
                                {
                                    if (local_137 == -1)
                                    {
                                        ImGui::Text("Scene Components Empty");
                                        local_138 = true;
                                    }
                                    else
                                    {
                                        if (::EcoCollectableUtils::LowLevelIsAllShowOrHidden(local_56, false, false, local_137))
                                        {
                                            if (local_137 == 1)
                                            {
                                                ImGui::Text("All Hidden");
                                                local_138 = true;
                                            }
                                        }
                                    }
                                }
                            }
                            if (!(local_138))
                            {
                                ImGui::PushStyleColor(EImGuiCol(0), FColor::Red);
                                ImGui::Text(FString().Append("еј‚еёё"));
                                ImGui::PopStyleColor(1);
                            }
                        }
                    }
                    ImGui::PopStyleColor(1);
                }
                Handle.EndPanel();
            }
            if (ECS::GetPrefabEntity(local_38))
            {
                const FC_EcoCollectableNonSyncedVisualStatus& local_108_4 = local_106.opCall();
                if (local_108_4)
                {
                    if (int(local_108_4.VisibilityStatus) == 1)
                    {
                        Handle.DrawLine(Actor.GetActorLocation(), (Actor.GetActorLocation() + FVector(0.0, 0.0, 99999999.0)), FLinearColor(FColor::Red), ESceneDepthPriorityGroup(0), 10.0f, 0.0f);
                    }
                    else
                    {
                        if (int(local_108_4.VisibilityStatus) == 0 && (int(local_108_4.CollectReadyStatus) == 0))
                        {
                            Handle.DrawLine(Actor.GetActorLocation(), (Actor.GetActorLocation() + FVector(0.0, 0.0, 99999999.0)), FLinearColor(FColor::Green), ESceneDepthPriorityGroup(0), 10.0f, 0.0f);
                        }
                        else
                        {
                            if (int(local_108_4.VisibilityStatus) == 0 && (int(local_108_4.CollectReadyStatus) == 1))
                            {
                                Handle.DrawLine(Actor.GetActorLocation(), (Actor.GetActorLocation() + FVector(0.0, 0.0, 99999999.0)), FLinearColor(FColor::Blue), ESceneDepthPriorityGroup(0), 10.0f, 0.0f);
                            }
                        }
                    }
                }
            }
        }
        return;
    }
}

class UEcologyPropPrefabConfigDraw : UGameDebugImGuiActorDrawer
{
    default SetbEnable(false);
    default SetbGameEnableRender(true);
    default SetbEditorEnableRender(true);
    default SetbOnlyOnSelectedRender(false);
    default DrawActor = APropPrefabScriptBase;

    UEcologyPropPrefabConfigDraw()
    {
        return;
    }
    UFUNCTION()
    void WhenDraw_Implementation(const AActor Actor, const FGameDebugDrawHandle &inout Handle, const FGameDebugActorDrawerContext &inout Context)
    {
        APropPrefabScriptBase local_4 = (Cast<APropPrefabScriptBase>(Actor));
        if (!((local_4 != nullptr)) || !(local_4.LayoutInfo.SpawnerGUID.IsValid()))
        {
            return;
        }
        Handle.DrawLine(Actor.GetActorLocation(), (Actor.GetActorLocation() + FVector(0.0, 0.0, 99999999.0)), FLinearColor(FColor::Silver), ESceneDepthPriorityGroup(0), 10.0f, 0.0f);
        return;
    }
}

}
