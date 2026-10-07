

struct FDialogueSubtitle
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_Entity;
    UPROPERTY()
    uint m_DialogueNodeId;
    UPROPERTY()
    FName m_DialogueLineName;
    UPROPERTY()
    float32 m_Duration;
    UPROPERTY()
    FText m_Content;
    UPROPERTY()
    FText m_SpeakerName;
    UPROPERTY()
    FString m_VOFile;

    FDialogueSubtitle()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDialogueSubtitle(const FDialogueSubtitle &inout Other)
    {
        this.m_DialogueNodeId = 0;
        this.m_Duration = 0.0f;
        this.m_Entity = Other.m_Entity;
        this.m_DialogueNodeId = int(Other.m_DialogueNodeId);
        this.m_DialogueLineName = Other.m_DialogueLineName;
        this.m_Duration = Other.m_Duration;
        this.m_Content = Other.m_Content;
        this.m_SpeakerName = Other.m_SpeakerName;
        this.m_VOFile = Other.m_VOFile;
        return;
    }
    FDialogueSubtitle(const FECSEntity &inout InEntity, const uint InDialogueNodeId, const FName &inout InDialogueLineName)
    {
        this.m_DialogueNodeId = 0;
        this.m_Duration = 0.0f;
        this.SetEntity(InEntity);
        this.SetDialogueNodeId(InDialogueNodeId);
        this.SetDialogueLineName(InDialogueLineName);
        return;
    }
    FDialogueSubtitle opAssign(const FDialogueSubtitle &inout Other)
    {
        FDialogueSubtitle __r;
        this.SetEntity(Other.GetEntity());
        this.SetDialogueNodeId(Other.GetDialogueNodeId());
        this.SetDialogueLineName(Other.GetDialogueLineName());
        this.SetDuration(Other.GetDuration());
        this.SetContent(Other.GetContent());
        this.SetSpeakerName(Other.GetSpeakerName());
        this.SetVOFile(Other.GetVOFile());
        return __r;
    }
    FECSEntity GetEntity() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_Entity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Entity = __Value;
        return;
    }
    uint GetDialogueNodeId() const property
    {
        return this.m_DialogueNodeId;
    }
    void SetDialogueNodeId(const uint __Value) property
    {
        if (this.m_DialogueNodeId == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DialogueNodeId = __Value;
        return;
    }
    FName GetDialogueLineName() const property
    {
        return this.m_DialogueLineName;
    }
    void SetDialogueLineName(const FName &inout __Value) property
    {
        if ((this.m_DialogueLineName == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_DialogueLineName = __Value;
        return;
    }
    float32 GetDuration() const property
    {
        return this.m_Duration;
    }
    void SetDuration(const float32 __Value) property
    {
        if (this.m_Duration == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Duration = __Value;
        return;
    }
    FText GetContent() const property
    {
        return this.m_Content;
    }
    void SetContent(const FText &inout __Value) property
    {
        this.m_Content = __Value;
        return;
    }
    FText GetSpeakerName() const property
    {
        return this.m_SpeakerName;
    }
    void SetSpeakerName(const FText &inout __Value) property
    {
        this.m_SpeakerName = __Value;
        return;
    }
    FString GetVOFile() const property
    {
        return this.m_VOFile;
    }
    void SetVOFile(const FString &inout __Value) property
    {
        this.m_VOFile = __Value;
        return;
    }
}

struct FDialogueOptionInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FText m_OptionText;
    UPROPERTY()
    TDataObjectPtr<FDialogueOptionStyleConfig> m_OptionStyle;
    UPROPERTY()
    uint m_OptionNodeId;
    UPROPERTY()
    TArray<uint> m_RelatedActionNodeIds;
    UPROPERTY()
    FECSEntity m_InteractTarget;
    UPROPERTY()
    TDataObjectPtr<FDialogueConfig> m_AttachedDialogueConfig;

    FDialogueOptionInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDialogueOptionInfo(const FDialogueOptionInfo &inout Other)
    {
        this.m_OptionNodeId = 0;
        this.m_OptionText = Other.m_OptionText;
        this.m_OptionStyle = Other.m_OptionStyle;
        this.m_OptionNodeId = int(Other.m_OptionNodeId);
        this.m_RelatedActionNodeIds = Other.m_RelatedActionNodeIds;
        this.m_InteractTarget = Other.m_InteractTarget;
        this.m_AttachedDialogueConfig = Other.m_AttachedDialogueConfig;
        return;
    }
    FDialogueOptionInfo(const uint InOptionNodeId)
    {
        this.m_OptionNodeId = 0;
        this.SetOptionNodeId(InOptionNodeId);
        return;
    }
    FDialogueOptionInfo opAssign(const FDialogueOptionInfo &inout Other)
    {
        FDialogueOptionInfo __r;
        this.SetOptionText(Other.GetOptionText());
        this.SetOptionStyle(Other.GetOptionStyle());
        this.SetOptionNodeId(Other.GetOptionNodeId());
        this.SetRelatedActionNodeIds(Other.GetRelatedActionNodeIds());
        this.SetInteractTarget(Other.GetInteractTarget());
        this.SetAttachedDialogueConfig(Other.GetAttachedDialogueConfig());
        return __r;
    }
    FText GetOptionText() const property
    {
        return this.m_OptionText;
    }
    void SetOptionText(const FText &inout __Value) property
    {
        this.m_OptionText = __Value;
        return;
    }
    const TDataObjectPtr<FDialogueOptionStyleConfig> GetOptionStyle() const property
    {
        const TDataObjectPtr<FDialogueOptionStyleConfig> __r;
        return __r;
    }
    TDataObjectPtr<FDialogueOptionStyleConfig> GetOptionStyle() property
    {
        TDataObjectPtr<FDialogueOptionStyleConfig> __r;
        return __r;
    }
    void SetOptionStyle(const TDataObjectPtr<FDialogueOptionStyleConfig> &inout __Value) property
    {
        this.m_OptionStyle = __Value;
        return;
    }
    uint GetOptionNodeId() const property
    {
        return this.m_OptionNodeId;
    }
    void SetOptionNodeId(const uint __Value) property
    {
        if (this.m_OptionNodeId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_OptionNodeId = __Value;
        return;
    }
    const TArray<uint> GetRelatedActionNodeIds() const property
    {
        const TArray<uint> __r;
        return __r;
    }
    TArray<uint> GetModify_RelatedActionNodeIds() property
    {
        TArray<uint> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetRelatedActionNodeIds(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RelatedActionNodeIds = __Value;
        return;
    }
    const FECSEntity GetInteractTarget() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_InteractTarget() property
    {
        FECSEntity __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetInteractTarget(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_InteractTarget = __Value;
        return;
    }
    const TDataObjectPtr<FDialogueConfig> GetAttachedDialogueConfig() const property
    {
        const TDataObjectPtr<FDialogueConfig> __r;
        return __r;
    }
    TDataObjectPtr<FDialogueConfig> GetModify_AttachedDialogueConfig() property
    {
        TDataObjectPtr<FDialogueConfig> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetAttachedDialogueConfig(const TDataObjectPtr<FDialogueConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_AttachedDialogueConfig = __Value;
        return;
    }
}

struct FDialogueSection
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FName m_DialogueName;
    UPROPERTY()
    EDialogueType m_DialogueType;
    UPROPERTY()
    FECSEntity m_DialogueContextEntity;
    UPROPERTY()
    TArray<FDialogueSubtitle> m_Subtitles;
    UPROPERTY()
    TArray<FDialogueOptionInfo> m_Options;
    UPROPERTY()
    FDialogueSubtitle m_SubtitleOnPaused;

    FDialogueSection()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDialogueSection(const FDialogueSection &inout Other)
    {
        this.m_DialogueType = EDialogueType(0);
        this.m_DialogueName = Other.m_DialogueName;
        this.m_DialogueType = Other.m_DialogueType;
        this.m_DialogueContextEntity = Other.m_DialogueContextEntity;
        this.m_Subtitles = Other.m_Subtitles;
        this.m_Options = Other.m_Options;
        this.m_SubtitleOnPaused = Other.m_SubtitleOnPaused;
        return;
    }
    FDialogueSection(const FName &inout InDialogueName, const EDialogueType InDialogueType, const FECSEntity &inout InDialogueContextEntity)
    {
        this.m_DialogueType = EDialogueType(0);
        this.SetDialogueName(InDialogueName);
        this.SetDialogueType(EDialogueType(InDialogueType));
        this.SetDialogueContextEntity(InDialogueContextEntity);
        return;
    }
    FDialogueSection opAssign(const FDialogueSection &inout Other)
    {
        FDialogueSection __r;
        this.SetDialogueName(Other.GetDialogueName());
        this.SetDialogueType(Other.GetDialogueType());
        this.SetDialogueContextEntity(Other.GetDialogueContextEntity());
        this.SetSubtitles(Other.GetSubtitles());
        this.SetOptions(Other.GetOptions());
        this.SetSubtitleOnPaused(Other.GetSubtitleOnPaused());
        return __r;
    }
    FName GetDialogueName() const property
    {
        return this.m_DialogueName;
    }
    void SetDialogueName(const FName &inout __Value) property
    {
        if ((this.m_DialogueName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DialogueName = __Value;
        return;
    }
    EDialogueType GetDialogueType() const property
    {
        return this.m_DialogueType;
    }
    void SetDialogueType(const EDialogueType __Value) property
    {
        if (int(this.m_DialogueType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DialogueType = __Value;
        return;
    }
    const FECSEntity GetDialogueContextEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_DialogueContextEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetDialogueContextEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_DialogueContextEntity = __Value;
        return;
    }
    const TArray<FDialogueSubtitle> GetSubtitles() const property
    {
        const TArray<FDialogueSubtitle> __r;
        return __r;
    }
    TArray<FDialogueSubtitle> GetModify_Subtitles() property
    {
        TArray<FDialogueSubtitle> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetSubtitles(const TArray<FDialogueSubtitle> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Subtitles = __Value;
        return;
    }
    TArray<FDialogueOptionInfo> GetOptions() const property
    {
        TArray<FDialogueOptionInfo> __r;
        return __r;
    }
    TArray<FDialogueOptionInfo> GetModify_Options() property
    {
        TArray<FDialogueOptionInfo> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetOptions(const TArray<FDialogueOptionInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Options = __Value;
        return;
    }
    const FDialogueSubtitle GetSubtitleOnPaused() const property
    {
        const FDialogueSubtitle __r;
        return __r;
    }
    FDialogueSubtitle GetSubtitleOnPaused() property
    {
        FDialogueSubtitle __r;
        return __r;
    }
    void SetSubtitleOnPaused(const FDialogueSubtitle &inout __Value) property
    {
        this.m_SubtitleOnPaused = __Value;
        return;
    }
}

struct FDialoguePlayState
{
    UPROPERTY()
    FName m_DialogueName;
    UPROPERTY()
    uint m_LastNodeId = 0;


    FName GetDialogueName() const property
    {
        return this;
    }
    void SetDialogueName(const FName &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    uint GetLastNodeId() const property
    {
        return this.m_LastNodeId;
    }
    void SetLastNodeId(const uint __Value) property
    {
        this.m_LastNodeId = __Value;
        return;
    }
}

struct FDialogueInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FDialogueConfig> m_DialogueConfig;
    UPROPERTY()
    bool m_bHasAttachPoint;
    UPROPERTY()
    bool m_bIsAttachable;

    FDialogueInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDialogueInfo(const FDialogueInfo &inout Other)
    {
        this.m_bHasAttachPoint = false;
        this.m_bIsAttachable = false;
        this.m_DialogueConfig = Other.m_DialogueConfig;
        this.m_bHasAttachPoint = Other.m_bHasAttachPoint;
        this.m_bIsAttachable = Other.m_bIsAttachable;
        return;
    }
    FDialogueInfo(const TDataObjectPtr<FDialogueConfig> &inout InDialogueConfig)
    {
        UDialogueGraphAsset local_4;
        this.m_bHasAttachPoint = false;
        this.m_bIsAttachable = false;
        this.SetDialogueConfig(InDialogueConfig);
        if (local_4 == nullptr)
        {
            return;
        }
        this.SetbHasAttachPoint(local_4.DialogueGraphData.HasAttachPoint());
        this.SetbIsAttachable(local_4.DialogueGraphData.IsAttachable());
        return;
    }
    FDialogueInfo opAssign(const FDialogueInfo &inout Other)
    {
        FDialogueInfo __r;
        this.SetDialogueConfig(Other.GetDialogueConfig());
        this.SetbHasAttachPoint(Other.GetbHasAttachPoint());
        this.SetbIsAttachable(Other.GetbIsAttachable());
        return __r;
    }
    const TDataObjectPtr<FDialogueConfig> GetDialogueConfig() const property
    {
        const TDataObjectPtr<FDialogueConfig> __r;
        return __r;
    }
    TDataObjectPtr<FDialogueConfig> GetModify_DialogueConfig() property
    {
        TDataObjectPtr<FDialogueConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDialogueConfig(const TDataObjectPtr<FDialogueConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DialogueConfig = __Value;
        return;
    }
    bool GetbHasAttachPoint() const property
    {
        return this.m_bHasAttachPoint;
    }
    void SetbHasAttachPoint(const bool __Value) property
    {
        if (!(this.m_bHasAttachPoint) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bHasAttachPoint = __Value;
        return;
    }
    bool GetbIsAttachable() const property
    {
        return this.m_bIsAttachable;
    }
    void SetbIsAttachable(const bool __Value) property
    {
        if (!(this.m_bIsAttachable) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bIsAttachable = __Value;
        return;
    }
}

struct FDialogueInfoList
{
    UPROPERTY()
    TMap<FName, FDialogueInfo> m_DialogueInfos;

    FDialogueInfoList()
    {
        return;
    }
    const TMap<FName, FDialogueInfo> GetDialogueInfos() const property
    {
        const TMap<FName, FDialogueInfo> __r;
        return __r;
    }
    TMap<FName, FDialogueInfo> GetDialogueInfos() property
    {
        TMap<FName, FDialogueInfo> __r;
        return __r;
    }
    void SetDialogueInfos(const TMap<FName, FDialogueInfo> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FDialogueDeliveryContext
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FName m_DialogueName;
    UPROPERTY()
    EDialogueType m_DialogueType;
    UPROPERTY()
    FECSEntity m_InteractTarget;
    UPROPERTY()
    TDataObjectPtr<FDialogueConfig> m_DialogueConfig;
    UPROPERTY()
    TArray<FDialogueInfo> m_AttachableDialogues;
    UPROPERTY()
    uint m_StartAtNodeId;
    UPROPERTY()
    uint m_LastNodeId;
    UPROPERTY()
    float m_InterruptDistanceSquared;
    UPROPERTY()
    float m_ResumeDistanceSquared;
    UPROPERTY()
    float32 m_SubtitleInterval;

    FDialogueDeliveryContext()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDialogueDeliveryContext(const FDialogueDeliveryContext &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDialogueDeliveryContext opAssign(const FDialogueDeliveryContext &inout Other)
    {
        FDialogueDeliveryContext __r;
        this.SetDialogueName(Other.GetDialogueName());
        this.SetDialogueType(Other.GetDialogueType());
        this.SetInteractTarget(Other.GetInteractTarget());
        this.SetDialogueConfig(Other.GetDialogueConfig());
        this.SetAttachableDialogues(Other.GetAttachableDialogues());
        this.SetStartAtNodeId(Other.GetStartAtNodeId());
        this.SetLastNodeId(Other.GetLastNodeId());
        this.SetInterruptDistanceSquared(Other.GetInterruptDistanceSquared());
        this.SetResumeDistanceSquared(Other.GetResumeDistanceSquared());
        this.SetSubtitleInterval(Other.GetSubtitleInterval());
        return __r;
    }
    FDialogueGraphScriptBase LoadDialogueGraph() const
    {
        UDialogueGraphAsset local_22;
        FDialogueGraphScriptBase __r;
        if (!(this.GetDialogueConfig().IsSet()))
        {
            XError(ELog(64), FString().Append("Invalid Dialogue Config: ").Append(this.GetDialogueName()));
        }
        else
        {
            if (local_22 == nullptr)
            {
                XError(ELog(64), FString().Append("DialogueData asset is null for Dialogue Config: ").Append(this.GetDialogueName()));
            }
            else
            {
            }
        }
        return __r;
    }
    uint ProcessSection(const uint InLastNodeId, FDialogueSection &inout Section) const
    {
        int local_54 = 0;
        int local_1 = 0;
        FDialogueSubtitle local_24;
        Section.SetSubtitleOnPaused(local_24);
        Section.GetModify_Subtitles().Empty(0);
        Section.GetModify_Options().Empty(0);
        TArray<uint> local_30;
        FDialogueGraphScriptBase local_38 = this.LoadDialogueGraph();
        if (local_38._base_FDialogueGraphBase.IsEmpty())
        {
            return 0;
        }
        if (InLastNodeId == 0)
        {
            int local_53;
            FInstancedStruct local_52;
            local_53 = 0;
            int local_2 = this.GetStartAtNodeId();
            if (local_2 == 0)
            {
                local_52 = local_38._base_FDialogueGraphBase[0];
                if (FInstancedStruct::GetPtr(local_52).opCall())
                {
                    local_53 = local_54;
                }
            }
            else
            {
                local_52 = local_38.GetNode(this.GetStartAtNodeId());
                local_53 = this.GetStartAtNodeId();
            }
            this.ProcessNodeRecursively(local_38, local_52, Section, local_30);
            local_1 = local_53;
        }
        else
        {
            int local_53;
            TArrayConstIterator<uint> local_72;
            if ((local_38.GetNodePtr(InLastNodeId) == nullptr))
            {
                return 0;
            }
            for (; local_72.CanProceed;)
            {
                local_53 = local_72.Proceed();
                FInstancedStruct local_66 = local_38.GetNode(local_53);
                this.ProcessNodeRecursively(local_38, local_66, Section, local_30);
                local_1 = local_53;
            }
        }
        return local_1;
    }
    bool FillSubtitle(FDialogueSubtitle &inout Subtitle) const
    {
        FDialogueGraphScriptBase local_8 = this.LoadDialogueGraph();
        if (local_8._base_FDialogueGraphBase.IsEmpty())
        {
            return false;
        }
        FInstancedStruct local_22 = local_8.GetNode(Subtitle.GetDialogueNodeId());
        if (FInstancedStruct::GetPtr(local_22).opCall())
        {
            Subtitle.FillSubtitle();
        }
        return true;
    }
    bool FillOption(const FInstancedStruct &inout OptionNodeData, const FECSEntity &inout DialogueContextEntity, FDialogueOptionInfo &inout InOption) const
    {
        if ((FInstancedStruct::GetPtr(OptionNodeData).opCall() == nullptr))
        {
            return false;
        }
        if (!(DialogueContextEntity.CheckCondition(this)))
        {
            return false;
        }
        InOption.FillOption();
        return true;
    }
    TArray<FDialogueOptionInfo> GetFilledOptions(const FDialogueSection &inout Section) const
    {
        UDialogueGraphAsset local_44;
        TArray<FDialogueOptionInfo> local_4;
        FDialogueGraphScriptBase local_12 = this.LoadDialogueGraph();
        FInstancedStruct::GetPtr local_54;
        for (auto& local_36 : Section.GetOptions())
        {
            FInstancedStruct local_40;
            if (local_36.GetAttachedDialogueConfig().IsSet())
            {
                if (local_44 != nullptr)
                {
                    local_40 = local_44.DialogueGraphData.AttachedOption;
                }
            }
            else
            {
                local_40 = local_12.GetNode(local_36.GetOptionNodeId());
            }
            if (local_54.opCall())
            {
                FDialogueOptionInfo local_120 = FDialogueOptionInfo(local_36);
                if (this.FillOption(local_40, Section.GetDialogueContextEntity(), local_120))
                {
                    local_4.Add(local_120);
                }
            }
        }
        return local_4;
    }
    bool HasDeferredActions(const uint InNodeId, const EMissionActionType InActionType) const
    {
        TArrayConstIterator<FInstancedStruct> local_32;
        FDialogueGraphScriptBase local_8 = this.LoadDialogueGraph();
        if (local_8._base_FDialogueGraphBase.IsEmpty())
        {
            return false;
        }
        if ((local_8.GetNodePtr(InNodeId) == nullptr) || (0 == 0))
        {
            return false;
        }
        for (; local_32.CanProceed;)
        {
            if (int(::MissionExecUtils::GetActionType(local_32.Proceed())) == (int(InActionType)))
            {
                return true;
            }
        }
        return false;
    }
    int ExecuteDeferredActions(const FECSEntity &inout PlayerEntity, const uint InNodeId, const EMissionActionType InActionType) const
    {
        TArrayConstIterator<FInstancedStruct> local_62;
        int local_1 = -1;
        FDialogueGraphScriptBase local_10 = this.LoadDialogueGraph();
        if (local_10._base_FDialogueGraphBase.IsEmpty())
        {
            XError(ELog(64), FString().Append("DialogueGraph is null or nodes are empty, cannot execute deferred client actions for node ").Append(InNodeId));
            return local_1;
        }
        if ((local_10.GetNodePtr(InNodeId) == nullptr) || (0 == 0))
        {
            return local_1;
        }
        FMissionExecutionEntry local_56 = int(InActionType) == 1 ? ::MissionExecUtils::CreateExecutionEntry(local_1) : ::MissionExecUtils::CreateExecutionEntry();
        for (; local_62.CanProceed;)
        {
            const FInstancedStruct& local_70 = local_62.Proceed();
            if (int(::MissionExecUtils::GetActionType(local_70)) != int(InActionType))
            {
                continue;
            }
            local_56.AddAction(local_70);
        }
        if (!(local_56.ActionInstances.IsEmpty()))
        {
            if (::MissionExecUtils::RequestStartExecution(PlayerEntity, local_56, EMissionActionType(InActionType)))
            {
                return int(local_56.EntryId);
            }
        }
        return local_1;
    }
    void GatherRelatedActionNodeIds(const uint StartNodeId, TArray<uint> &out OutActionNodeIds) const
    {
        TArray<uint> local_4;
        OutActionNodeIds = local_4;
        FDialogueGraphScriptBase local_12 = this.LoadDialogueGraph();
        if (local_12._base_FDialogueGraphBase.IsEmpty())
        {
            return;
        }
        this.GatherRelatedActionNodeIdsImpl(local_12, StartNodeId, OutActionNodeIds);
        return;
    }
    void GatherRelatedActionNodeIdsImpl(const FDialogueGraphScriptBase &inout Graph, const uint NodeId, TArray<uint> &out OutActionNodeIds) const
    {
        TArray<uint> local_4;
        bool local_10 = false;
        int local_13 = 0;
        OutActionNodeIds = local_4;
        if ((Graph.GetNodePtr(NodeId) == nullptr) || local_10)
        {
            return;
        }
        int local_12 = local_13;
        FInstancedStruct local_18 = Graph.GetNode(local_12);
        if ((FInstancedStruct::GetPtr(local_18).opCall() == nullptr))
        {
            return;
        }
        if (OutActionNodeIds.Contains(local_12))
        {
            return;
        }
        OutActionNodeIds.Add(local_12);
        this.GatherRelatedActionNodeIdsImpl(Graph, local_12, OutActionNodeIds);
        return;
    }
    bool ProcessSingleNode(const FInstancedStruct &inout NodeData, FDialogueSection &inout Section) const
    {
        if ((FInstancedStruct::GetPtr(NodeData).opCall() == nullptr))
        {
            return false;
        }
        if ((!((FInstancedStruct::GetPtr(NodeData).opCall() == nullptr))))
        {
            Section.FillSection(this);
        }
        else
        {
            if ((!((FInstancedStruct::GetPtr(NodeData).opCall() == nullptr))))
            {
                Section.FillSection(this);
            }
            else
            {
                if ((!((FInstancedStruct::GetPtr(NodeData).opCall() == nullptr))))
                {
                    Section.GetDialogueContextEntity().Execute();
                }
            }
        }
        return Section.GetDialogueContextEntity().NeedGoOn();
    }
    void ProcessNodeRecursively(const FDialogueGraphScriptBase &inout DialogueGraph, const FInstancedStruct &inout NodeData, FDialogueSection &inout Section, TArray<uint> &inout VisitedNodeIds) const
    {
        bool local_11 = false;
        UDialogueGraphAsset local_40;
        TArrayConstIterator<uint> local_186;
        int local_193;
        if ((FInstancedStruct::GetPtr(NodeData).opCall() == nullptr))
        {
            return;
        }
        bool local_9 = this.ProcessSingleNode(NodeData, Section);
        if (FInstancedStruct::GetPtr<FDialogueNode_Speech>(NodeData).opCall() && local_11 && (this.GetAttachableDialogues().Num() > 0))
        {
            for (auto& local_36 : this.GetAttachableDialogues())
            {
                if (!(local_36.GetDialogueConfig().IsSet()))
                {
                    continue;
                }
                if (local_40 == nullptr)
                {
                    continue;
                }
                if (FInstancedStruct::GetPtr(local_40.DialogueGraphData.AttachedOption).opCall() && Section.GetDialogueContextEntity().CheckCondition(this))
                {
                    FDialogueOptionInfo local_116;
                    local_116.CreateOptionInfo();
                    local_116.SetInteractTarget(this.GetInteractTarget());
                    local_116.SetAttachedDialogueConfig(local_36.GetDialogueConfig());
                    Section.GetModify_Options().Add(local_116);
                }
            }
        }
        if (!(local_9))
        {
            return;
        }
        for (; local_186.CanProceed;)
        {
            local_193 = local_186.Proceed();
            if (VisitedNodeIds.Contains(local_193))
            {
                FString local_198 = FString();
                continue;
            }
            FInstancedStruct local_204 = DialogueGraph.GetNode(local_193);
            this.ProcessNodeRecursively(DialogueGraph, local_204, Section, VisitedNodeIds);
        }
        return;
    }
    FName GetDialogueName() const property
    {
        return this.m_DialogueName;
    }
    void SetDialogueName(const FName &inout __Value) property
    {
        if ((this.m_DialogueName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DialogueName = __Value;
        return;
    }
    EDialogueType GetDialogueType() const property
    {
        return this.m_DialogueType;
    }
    void SetDialogueType(const EDialogueType __Value) property
    {
        if (int(this.m_DialogueType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DialogueType = __Value;
        return;
    }
    const FECSEntity GetInteractTarget() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_InteractTarget() property
    {
        FECSEntity __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetInteractTarget(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_InteractTarget = __Value;
        return;
    }
    const TDataObjectPtr<FDialogueConfig> GetDialogueConfig() const property
    {
        const TDataObjectPtr<FDialogueConfig> __r;
        return __r;
    }
    TDataObjectPtr<FDialogueConfig> GetModify_DialogueConfig() property
    {
        TDataObjectPtr<FDialogueConfig> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetDialogueConfig(const TDataObjectPtr<FDialogueConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_DialogueConfig = __Value;
        return;
    }
    const TArray<FDialogueInfo> GetAttachableDialogues() const property
    {
        const TArray<FDialogueInfo> __r;
        return __r;
    }
    TArray<FDialogueInfo> GetModify_AttachableDialogues() property
    {
        TArray<FDialogueInfo> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetAttachableDialogues(const TArray<FDialogueInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_AttachableDialogues = __Value;
        return;
    }
    uint GetStartAtNodeId() const property
    {
        return this.m_StartAtNodeId;
    }
    void SetStartAtNodeId(const uint __Value) property
    {
        if (this.m_StartAtNodeId == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_StartAtNodeId = __Value;
        return;
    }
    uint GetLastNodeId() const property
    {
        return this.m_LastNodeId;
    }
    void SetLastNodeId(const uint __Value) property
    {
        if (this.m_LastNodeId == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_LastNodeId = __Value;
        return;
    }
    float GetInterruptDistanceSquared() const property
    {
        return this.m_InterruptDistanceSquared;
    }
    void SetInterruptDistanceSquared(const float __Value) property
    {
        if (this.m_InterruptDistanceSquared == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_InterruptDistanceSquared = __Value;
        return;
    }
    float GetResumeDistanceSquared() const property
    {
        return this.m_ResumeDistanceSquared;
    }
    void SetResumeDistanceSquared(const float __Value) property
    {
        if (this.m_ResumeDistanceSquared == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_ResumeDistanceSquared = __Value;
        return;
    }
    float32 GetSubtitleInterval() const property
    {
        return this.m_SubtitleInterval;
    }
    void SetSubtitleInterval(const float32 __Value) property
    {
        if (this.m_SubtitleInterval == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_SubtitleInterval = __Value;
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FDialogueSubtitle &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FDialogueSubtitle &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDialogueSubtitle
{
int __IndexOf_Entity()
{
    return 0;
}
int __IndexOf_DialogueNodeId()
{
    return 1;
}
int __IndexOf_DialogueLineName()
{
    return 2;
}
int __IndexOf_Duration()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FDialogueOptionInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FDialogueOptionInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDialogueOptionInfo
{
int __IndexOf_OptionNodeId()
{
    return 0;
}
int __IndexOf_RelatedActionNodeIds()
{
    return 1;
}
int __IndexOf_InteractTarget()
{
    return 2;
}
int __IndexOf_AttachedDialogueConfig()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FDialogueSection &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FDialogueSection &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDialogueSection
{
int __IndexOf_DialogueName()
{
    return 0;
}
int __IndexOf_DialogueType()
{
    return 1;
}
int __IndexOf_DialogueContextEntity()
{
    return 2;
}
int __IndexOf_Subtitles()
{
    return 3;
}
int __IndexOf_Options()
{
    return 4;
}
int __IndexOf_SubtitleOnPaused()
{
    return 5;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FDialogueInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FDialogueInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDialogueInfo
{
int __IndexOf_DialogueConfig()
{
    return 0;
}
int __IndexOf_bHasAttachPoint()
{
    return 1;
}
int __IndexOf_bIsAttachable()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FDialogueDeliveryContext &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FDialogueDeliveryContext &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDialogueDeliveryContext
{
int __IndexOf_DialogueName()
{
    return 0;
}
int __IndexOf_DialogueType()
{
    return 1;
}
int __IndexOf_InteractTarget()
{
    return 2;
}
int __IndexOf_DialogueConfig()
{
    return 3;
}
int __IndexOf_AttachableDialogues()
{
    return 4;
}
int __IndexOf_StartAtNodeId()
{
    return 5;
}
int __IndexOf_LastNodeId()
{
    return 6;
}
int __IndexOf_InterruptDistanceSquared()
{
    return 7;
}
int __IndexOf_ResumeDistanceSquared()
{
    return 8;
}
int __IndexOf_SubtitleInterval()
{
    return 9;
}
}
