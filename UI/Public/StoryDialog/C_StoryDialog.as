
namespace __INTENRAL_FC_PlayerStoryDialog_NS
{
    const TECSComponentDerivedPtr<FC_PlayerStoryDialog> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerStoryDialog>();
    const FC_PlayerStoryDialog DefaultValue = FC_PlayerStoryDialog();
}
namespace __INTENRAL_FCE_StoryDialogStart_NS
{
    const TECSEventDerivedPtr<FCE_StoryDialogStart> DerivedPtr = TECSEventDerivedPtr<FCE_StoryDialogStart>();
}
namespace __INTENRAL_FCE_StoryDialogServerInterrupt_NS
{
    const TECSEventDerivedPtr<FCE_StoryDialogServerInterrupt> DerivedPtr = TECSEventDerivedPtr<FCE_StoryDialogServerInterrupt>();
}
namespace __INTENRAL_FCE_StoryDialogPageClosed_NS
{
    const TECSEventDerivedPtr<FCE_StoryDialogPageClosed> DerivedPtr = TECSEventDerivedPtr<FCE_StoryDialogPageClosed>();
}
namespace __INTENRAL_FCE_StoryDialogSelect_NS
{
    const TECSEventDerivedPtr<FCE_StoryDialogSelect> DerivedPtr = TECSEventDerivedPtr<FCE_StoryDialogSelect>();
}
namespace __INTENRAL_FCE_StoryDialogInterrupt_NS
{
    const TECSEventDerivedPtr<FCE_StoryDialogInterrupt> DerivedPtr = TECSEventDerivedPtr<FCE_StoryDialogInterrupt>();
}
namespace __INTENRAL_FCE_StoryDialogEnd_NS
{
    const TECSEventDerivedPtr<FCE_StoryDialogEnd> DerivedPtr = TECSEventDerivedPtr<FCE_StoryDialogEnd>();

}
struct FStoryDialogDisplayData
{
    UPROPERTY()
    FString m_StringData;

    FStoryDialogDisplayData()
    {
        return;
    }
    FString GetStringData() const property
    {
        return this;
    }
    void SetStringData(const FString &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FStoryDialogParticipantDetail
{
    UPROPERTY()
    int m_ParticipantIndex;
    UPROPERTY()
    FString m_NickName;


    int GetParticipantIndex() const property
    {
        return this.m_ParticipantIndex;
    }
    void SetParticipantIndex(const int __Value) property
    {
        this.m_ParticipantIndex = __Value;
        return;
    }
    FString GetNickName() const property
    {
        return this.m_NickName;
    }
    void SetNickName(const FString &inout __Value) property
    {
        this.m_NickName = __Value;
        return;
    }
}

struct FStoryDialogSection
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FStoryDialogParticipantDetail> m_ParticipantDetails;
    UPROPERTY()
    FStoryDialogDisplayData m_Content;
    UPROPERTY()
    TArray<FStoryDialogDisplayData> m_Options;
    UPROPERTY()
    bool m_bIsPureOption;

    FStoryDialogSection()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FStoryDialogSection(const FStoryDialogSection &inout Other)
    {
        this.m_bIsPureOption = false;
        this.m_ParticipantDetails = Other.m_ParticipantDetails;
        this.m_Options = Other.m_Options;
        this.m_bIsPureOption = Other.m_bIsPureOption;
        return;
    }
    FStoryDialogSection opAssign(const FStoryDialogSection &inout Other)
    {
        FStoryDialogSection __r;
        this.SetParticipantDetails(Other.GetParticipantDetails());
        this.SetContent(Other.GetContent());
        this.SetOptions(Other.GetOptions());
        this.SetbIsPureOption(Other.GetbIsPureOption());
        return __r;
    }
    const TArray<FStoryDialogParticipantDetail> GetParticipantDetails() const property
    {
        const TArray<FStoryDialogParticipantDetail> __r;
        return __r;
    }
    TArray<FStoryDialogParticipantDetail> GetModify_ParticipantDetails() property
    {
        TArray<FStoryDialogParticipantDetail> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetParticipantDetails(const TArray<FStoryDialogParticipantDetail> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ParticipantDetails = __Value;
        return;
    }
    FStoryDialogDisplayData GetContent() const property
    {
        FStoryDialogDisplayData __r;
        return __r;
    }
    FStoryDialogDisplayData GetModify_Content() property
    {
        FStoryDialogDisplayData __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetContent(const FStoryDialogDisplayData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        return;
    }
    TArray<FStoryDialogDisplayData> GetOptions() const property
    {
        TArray<FStoryDialogDisplayData> __r;
        return __r;
    }
    TArray<FStoryDialogDisplayData> GetModify_Options() property
    {
        TArray<FStoryDialogDisplayData> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetOptions(const TArray<FStoryDialogDisplayData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Options = __Value;
        return;
    }
    bool GetbIsPureOption() const property
    {
        return this.m_bIsPureOption;
    }
    void SetbIsPureOption(const bool __Value) property
    {
        if (!(this.m_bIsPureOption) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bIsPureOption = __Value;
        return;
    }
}

struct FStoryDialogInfo
{
    UPROPERTY()
    TArray<FECSEntity> m_Participants;
    UPROPERTY()
    TArray<FStoryDialogSection> m_DialogSections;

    FStoryDialogInfo()
    {
        return;
    }
    const TArray<FECSEntity> GetParticipants() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetParticipants() property
    {
        TArray<FECSEntity> __r;
        return __r;
    }
    void SetParticipants(const TArray<FECSEntity> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const TArray<FStoryDialogSection> GetDialogSections() const property
    {
        const TArray<FStoryDialogSection> __r;
        return __r;
    }
    TArray<FStoryDialogSection> GetDialogSections() property
    {
        TArray<FStoryDialogSection> __r;
        return __r;
    }
    void SetDialogSections(const TArray<FStoryDialogSection> &inout __Value) property
    {
        this.m_DialogSections = __Value;
        return;
    }
}

struct FC_PlayerStoryDialog : FECSComponent
{
    UPROPERTY()
    FECSEntity TargetEntity;

    FC_PlayerStoryDialog()
    {
        return;
    }
}

struct FStoryDialogInfoBuilder
{
    UPROPERTY()
    TArray<FECSEntity> ParticipatedEntities;
    UPROPERTY()
    TArray<FStoryDialogSection> BuildingSections;
    UPROPERTY()
    bool ContainsChoose = false;


    FStoryDialogInfo Get()
    {
        FStoryDialogInfo local_8;
        FStoryDialogInfo __r;
        local_8.SetParticipants(this);
        local_8.SetDialogSections(this.BuildingSections);
        return __r;
    }
    bool IsEmpty() const
    {
        return this.IsEmpty() && this.BuildingSections.IsEmpty();
    }
    bool EntitySay(const FECSEntity &inout Entity, const FString &inout Content, const FString &inout UseNickName = "")
    {
        if (this.ContainsChoose)
        {
            return false;
        }
        FStoryDialogSection local_18;
        local_18.SetContent(this.MakeDisplayData(Content));
        local_18.SetParticipantDetails(this.MakeParticipantDetailArray(Entity, UseNickName));
        this.BuildingSections.Add(local_18);
        return true;
    }
    bool EntityChoose(const FECSEntity &inout Entity, const TArray<FString> &inout Options)
    {
        if (this.ContainsChoose || Options.IsEmpty())
        {
            return false;
        }
        FStoryDialogSection local_18;
        local_18.SetOptions(this.MakeDisplayDataArray(Options));
        local_18.SetParticipantDetails(this.MakeParticipantDetailArray(Entity, ""));
        local_18.SetbIsPureOption(true);
        this.BuildingSections.Add(local_18);
        this.ContainsChoose = true;
        return true;
    }
    bool EntityChoose(const FECSEntity &inout Entity, const FString &inout Content, const TArray<FString> &inout Options, const FString &inout UseNickName = "")
    {
        if (this.ContainsChoose || Options.IsEmpty())
        {
            return false;
        }
        FStoryDialogSection local_18;
        local_18.SetContent(this.MakeDisplayData(Content));
        local_18.SetOptions(this.MakeDisplayDataArray(Options));
        local_18.SetParticipantDetails(this.MakeParticipantDetailArray(Entity, UseNickName));
        this.BuildingSections.Add(local_18);
        this.ContainsChoose = true;
        return true;
    }
    FStoryDialogDisplayData MakeDisplayData(const FString &inout Content)
    {
        FStoryDialogDisplayData local_4;
        FStoryDialogDisplayData __r;
        local_4.SetStringData(Content);
        return __r;
    }
    TArray<FStoryDialogDisplayData> MakeDisplayDataArray(const TArray<FString> &inout ContentArray)
    {
        TArray<FStoryDialogDisplayData> local_4;
        local_4.SetNum(ContentArray.Num());
        int local_6 = 0;
        for (; local_6 < ContentArray.Num(); )
        {
            this.MakeDisplayData(ContentArray[local_6]);
            ++local_6;
        }
        return local_4;
    }
    TArray<FStoryDialogParticipantDetail> MakeParticipantDetailArray(const FECSEntity &inout Entity, const FString &inout NickName)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        TArray<FStoryDialogParticipantDetail> __r; return __r;
    }
}

struct FCE_StoryDialogStart : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FStoryDialogInfo DialogInfo;
    UPROPERTY()
    FECSEntity TargetEntity;

    FCE_StoryDialogStart()
    {
        return;
    }
}

struct FCE_StoryDialogServerInterrupt : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetEntity;

    FCE_StoryDialogServerInterrupt()
    {
        return;
    }
}

struct FCE_StoryDialogPageClosed : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_StoryDialogPageClosed()
    {
        return;
    }
}

struct FCE_StoryDialogSelect : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int SelectedIndex;


}

struct FCE_StoryDialogInterrupt : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetEntity;

    FCE_StoryDialogInterrupt()
    {
        return;
    }
}

struct FCE_StoryDialogEnd : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    int SelectedIndex;


}

namespace ECSFunc_FC_PlayerStoryDialog
{
UFUNCTION()
bool HasPlayerStoryDialog(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerStoryDialog);
}
FC_PlayerStoryDialog& AssignPlayerStoryDialog(const FECSEntity &inout Entity, const FC_PlayerStoryDialog &inout DefaultValue = FC_PlayerStoryDialog())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerStoryDialog, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerStoryDialog_BP(const FECSEntity &inout Entity, const FC_PlayerStoryDialog &inout DefaultValue = FC_PlayerStoryDialog())
{
    ECSFunc_FC_PlayerStoryDialog::AssignPlayerStoryDialog(Entity, DefaultValue);
    return;
}
FC_PlayerStoryDialog& ModifyPlayerStoryDialog(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerStoryDialog));
    return local_12.GetComp();
}
FC_PlayerStoryDialog& ModifyOrAddPlayerStoryDialog(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerStoryDialog));
    return local_12.GetComp();
}
const FC_PlayerStoryDialog& GetPlayerStoryDialog(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerStoryDialog));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerStoryDialog GetPlayerStoryDialog_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PlayerStoryDialog __r;
    bValid = false;
    bValid = ECSFunc_FC_PlayerStoryDialog::GetPlayerStoryDialog(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PlayerStoryDialog GetDefaultedPlayerStoryDialog(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerStoryDialog __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerStoryDialog);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_PlayerStoryDialog GetDefaultedPlayerStoryDialog_BP(const FECSEntity &inout Entity)
{
    FC_PlayerStoryDialog __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerStoryDialog(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerStoryDialog);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerStoryDialogOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerStoryDialog, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerStoryDialogOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerStoryDialog, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerStoryDialogOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerStoryDialog, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerStoryDialogOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerStoryDialog, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerStoryDialogOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerStoryDialog, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerStoryDialogLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerStoryDialog, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerStoryDialogActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerStoryDialog, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerStoryDialogModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerStoryDialog, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FStoryDialogSection &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FStoryDialogSection &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FStoryDialogSection
{
int __IndexOf_ParticipantDetails()
{
    return 0;
}
int __IndexOf_Content()
{
    return 1;
}
int __IndexOf_Options()
{
    return 2;
}
int __IndexOf_bIsPureOption()
{
    return 3;
}
}
