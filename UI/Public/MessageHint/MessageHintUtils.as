
namespace MessageHintUtils
{
void ShowMessageHint(const FECSEntity &inout Entity, const TDataObjectPtr<FMessageHintConfig> &inout Config, const TArray<FTextArgument> &inout Arguments = TArray<FTextArgument>())
{
    if (!(Config))
    {
        XWarning(ELog(16), "Show message hint failed, config is empty.");
        return;
    }
    FShowMessageHintParams local_30;
    local_30.SetConfig(Config);
    local_30.SetArguments(Arguments);
    XLog(ELog(16), FString().Append("Show message hint: ").Append(local_30.ToString()));
    if (ECS::GetRuntimeInfo().IsClient && !(ECS::IsFixedFrameJob()))
    {
        MessageHintUtils_Internal::ShowMessageHintInternal(local_30);
        return;
    }
    if (!(Entity))
    {
        XWarning(ELog(16), "Show message hint failed, entity is null.");
        return;
    }
    bool local_1 = ECS::GetRuntimeInfo().IsServer;
    if (local_1)
    {
        FFPTime local_46 = FFPTime(-1);
    }
    else
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            FFPTime local_46_2 = FFPTime(-1);
        }
    }
    return;
}
FText ParseText(const FArgText &inout ArgText, const TArray<FTextArgument> &inout Arguments)
{
    return ArgText::FormatArgText_SpecifiedWorldContext(ECS::GetUEWorld(), ArgText, Arguments);
}
FSoftBrush ParseIcon(const FMessageHintIcon &inout Icon, const TArray<FTextArgument> &inout Arguments)
{
    if (int(Icon.Source) == 0)
    {
        return Icon.IconBrush;
    }
    else
    {
        if (int(Icon.Source) == 1)
        {
            if (Arguments.IsValidIndex(int(Icon.ArgPosition)))
            {
                return MessageHintUtils_Internal::IconFromArgument(Arguments[int(Icon.ArgPosition)]);
            }
            else
            {
                XError(ELog(16), FString().Append("Parse icon failed, argument position ").Append(Icon.ArgPosition).Append(" is out of range."));
                return FSoftBrush();
            }
        }
        else
        {
            return FSoftBrush();
        }
    }
}
void ServerDebugShowHintText(const FString &inout Content, const float32 Time, const FECSEntity &inout SpecifiedShowEntity = ENTITY_NULL)
{
    FECSWorldPtr::SendEvent<FCE_DebugShowHintText> local_8 = FECSWorldPtr::SendEvent<FCE_DebugShowHintText>(ECS::GetECSWorld());
    FCE_DebugShowHintText local_10;
    local_10.ShowContent = Content;
    local_10.ShowLastTime = Time;
    local_10.SpecifiedShowEntity = SpecifiedShowEntity;
    return;
}
void ServerDebugShowHintTextInArea(const FString &inout Content, const FVector &inout Center, const float32 Range = 2000.0f, const float32 Time = 4.0f)
{
    if (Content.IsEmpty())
    {
        return;
    }
    TArray<FECSEntity> local_6;
    FPlayerUtils::GetAllPlayerPawnEntitiesInRange(local_6, ECS::GetECSWorld(), Center, Range, false);
    for (auto& local_22 : local_6)
    {
        MessageHintUtils::ServerDebugShowHintText(Content, Time, local_22);
    }
    return;
}
void ServerDebugShowHintTextForTeam(const FString &inout Content, const float32 Time, const FECSEntity &inout Entity)
{
    FECSEntity local_4 = FTeamUtils::GetPlayerOrAvatarTeamEntity(Entity);
    if ((!((local_4 == ENTITY_NULL))))
    {
        MessageHintUtils::ServerDebugShowHintText(Content, Time, local_4);
    }
    return;
}
}
namespace MessageHintUtils_Internal
{
FSoftBrush FashionIconFromArgumentConfig(const TDataObjectPtr<FFashionConfig> &inout FashionConfig)
{
    FFashionDisplayIconByBody local_68;
    bool local_1 = !(FashionConfig);
    if (local_1)
    {
        return FSoftBrush();
    }
    local_1 = !local_1;
    if (local_1)
    {
        return FSoftBrush();
    }
    FSoftBrush local_116;
    if (local_68.BodyIcons.Find(EBodyType(0), local_116))
    {
        return local_116;
    }
    return local_116;
}
void ShowMessageHintInternal(const FShowMessageHintParams &inout Params)
{
    UMessageHintSettings local_4 = MessageHintUtils_Internal::GetSettings();
    if (local_4 != nullptr)
    {
        FGameplayTag local_8;
        if (local_4.Handlers.Find(Params.GetConfig().opArrow().HintType, local_8))
        {
            XLog(ELog(16), FString().Append("Show message hint internal: ").Append(Params.ToString()).Append(", with handler: ").Append(local_8.GetName()));
            local_8.ShowMessageHint(Params);
            return;
        }
    }
    XError(ELog(16), FString().Append("Show message hint failed, handler for hint type ").Append(Params.GetConfig().opArrow().HintType).Append(" not found."));
    return;
}
FSoftBrush IconFromArgument(const FTextArgument &inout Argument)
{
    FSoftBrush __return;
    if ((int(Argument.GetType())) == 2)
    {
        if (FInstancedStruct::GetPtr(Argument.GetStructValue()).opCall())
        {
            TDataObjectPtr<FItemConfig> local_36;
            if (local_36)
            {
                return local_36.opArrow().ItemIcon;
            }
            TDataObjectPtr<FFashionConfig> local_84;
            if (local_84)
            {
                return MessageHintUtils_Internal::FashionIconFromArgumentConfig(local_84);
            }
            TDataObjectPtr<FMotionData> local_176;
            if (local_176)
            {
                return local_176.opArrow().Icon;
            }
            TDataObjectPtr<FBuffConfig> local_224;
            if (local_224)
            {
                return TDataObjectPtr<FBuffPresentationConfig>(local_224.opArrow().PresentationConfig).opArrow().IconBrush;
            }
            TDataObjectPtr<FAttributeConfig> local_320;
            if (local_320)
            {
                if (UICommonUtil::CVar_UI_UseAttributePresentation.GetBool())
                {
                    return local_320.opArrow().Presentation.GetIcon();
                }
                __return = local_320.opArrow().AttributeIcon;
            }
            else
            {
                TDataObjectPtr<FLevelEventInfoConfigBase> local_368;
                if (local_368)
                {
                    const TDataObjectPtr<FPresentationConfig>& local_394 = local_368.opArrow().GetPresentationConfig();
                    if (local_394)
                    {
                        return local_394.opArrow().GetDefaultIcon();
                    }
                    __return = local_368.opArrow().DisplayIcon;
                }
                else
                {
                    TDataObjectPtr<FCommissionConfig> local_418;
                    if (local_418)
                    {
                        return local_418.opArrow().CommissionIcon;
                    }
                    TDataObjectPtr<FCommissionTypeConfig> local_466;
                    if (local_466)
                    {
                        return local_466.opArrow().CommissionTypeIcon;
                    }
                    TDataObjectPtr<FDivineSkillConfig> local_514;
                    if (local_514)
                    {
                        return local_514.opArrow().DisplayIcon;
                    }
                    TDataObjectPtr<FSystemControlConfig> local_562;
                    if (local_562)
                    {
                    }
                    else
                    {
                        TDataObjectPtr<FCraftConfig> local_610;
                        if (local_610)
                        {
                            if (local_610.opArrow().Product.Item)
                            {
                                return local_610.opArrow().Product.Item.opArrow().ItemIcon;
                            }
                        }
                    }
                }
            }
        }
    }
    XError(ELog(16), FString().Append("Failed to parse icon from argument: ").Append(Argument.ToString()).Append("."));
    return FSoftBrush();
}
UMessageHintSettings GetSettings()
{
    return GetGameplaySettings<UMessageHintSettings>();
}
}
