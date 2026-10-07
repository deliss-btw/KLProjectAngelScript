
namespace FVM_MailPanel
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectMailByIndex = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SelectMail = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature LoadNextPage = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ClaimAllAttachment = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature DeleteAllReadMail = FEUIModelCallbackSignature();

}
struct FVM_MailPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_MailModel> m_MailModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_MailBriefItem>> m_MailBriefItems;
    UPROPERTY()
    TEUIModelRef<FVM_MailDetail> m_MailDetailVM;
    UPROPERTY()
    bool m_bHasMorePages;
    UPROPERTY()
    bool m_bHasClaimableAttachment;
    UPROPERTY()
    int m_TotalCount;
    UPROPERTY()
    int m_MailCapacity;
    UPROPERTY()
    bool m_bIsMailboxFull;
    UPROPERTY()
    bool m_bHasDeletableReadMail;
    UPROPERTY()
    int m_SelectedMailIndex;
    UPROPERTY()
    float32 m_ExpireTextAccumulator;
    UPROPERTY()
    float32 m_ExpireTextInterval;
    UPROPERTY()
    int64 m_NextExpireTimestamp;
    UPROPERTY()
    int m_MinVisibleItemCount;

    FVM_MailPanel()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_MailPanel(const FVM_MailPanel &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_MailPanel opAssign(const FVM_MailPanel &inout Other)
    {
        FVM_MailPanel __r;
        this.m_MailModel = Other.m_MailModel;
        this.m_MailBriefItems = Other.m_MailBriefItems;
        this.m_MailDetailVM = Other.m_MailDetailVM;
        this.m_bHasMorePages = Other.m_bHasMorePages;
        this.m_bHasClaimableAttachment = Other.m_bHasClaimableAttachment;
        this.m_TotalCount = int(Other.m_TotalCount);
        this.m_MailCapacity = int(Other.m_MailCapacity);
        this.m_bIsMailboxFull = Other.m_bIsMailboxFull;
        this.m_bHasDeletableReadMail = Other.m_bHasDeletableReadMail;
        this.m_SelectedMailIndex = int(Other.m_SelectedMailIndex);
        this.m_ExpireTextAccumulator = Other.m_ExpireTextAccumulator;
        this.m_ExpireTextInterval = Other.m_ExpireTextInterval;
        this.m_NextExpireTimestamp = Other.m_NextExpireTimestamp;
        this.m_MinVisibleItemCount = int(Other.m_MinVisibleItemCount);
        return __r;
    }
    void PostConstruct()
    {
        this.SetMailModel(TEUIModelRef<FMS_MailModel>(::FMS_MailModel::Get(this.GetContext().Manager)));
        this.SetMailDetailVM(TEUIModelRef<FVM_MailDetail>(::FVM_MailDetail::Create(this.GetContext().Manager)));
        GetDataObjectByGSDataId<FMailSettingsConfig> local_52;
        TDataObjectPtr<FMailSettingsConfig> local_28 = local_52.opImplConv();
        if (local_28)
        {
            this.SetMailCapacity(local_28.opArrow().Capacity);
        }
        this.GetMailModel().opArrow().GS_RequestFirstPage();
        return;
    }
    FText GetMailCountText() const
    {
        if (this.GetMailCapacity() > 0)
        {
            return FText::Format(NSLOCTEXT("Mail", "MailCount", "{0}/{1}"), this.GetTotalCount(), this.GetMailCapacity());
        }
        FNumberFormattingOptions local_18;
        return FText::AsNumber(this.GetTotalCount(), local_18);
    }
    bool IsMailEmpty() const
    {
        return (this.GetMailBriefItems().Num() == 0);
    }
    FText GetMailboxFullWarning() const
    {
        if (this.GetbIsMailboxFull())
        {
            return NSLOCTEXT("Mail", "MailboxFull", "й‚®з®±е·Іж»ЎпјЊиЇ·еЏЉж—¶жё…зђ†");
        }
        return FText();
    }
    FText GetMailStatusText() const
    {
        FText local_8;
        this.GetMailCountText();
        if (this.GetbIsMailboxFull())
        {
            return FText::Format(NSLOCTEXT("Mail", "MailboxFullWithCount", "{0}  <Red16>й‚®з®±е·Іж»ЎпјЊиЇ·еЏЉж—¶жё…зђ†</>"), local_8);
        }
        return local_8;
    }
    void OnMailListRefreshed(const FMsg_MailListRefreshed &inout Msg)
    {
        this.RebuildAndRestoreSelection();
        return;
    }
    void OnMailDeleted(const FMsg_MailDeleted &inout Msg)
    {
        this.RebuildAndRestoreSelection();
        return;
    }
    void OnMailBatchDeleted(const FMsg_MailBatchDeleted &inout Msg)
    {
        this.RebuildAndRestoreSelection();
        return;
    }
    void OnMailAttachmentClaimed(const FMsg_MailAttachmentClaimed &inout Msg)
    {
        if (Msg.Items.Num() > 0)
        {
            FText local_20 = FText();
            FText local_24 = FText();
            ::FCommonRewardListBuilder::BuildFromRewardEntries(Msg.Items);
            NSLOCTEXT("Mail", "ClaimRewardTitle", "иЋ·еѕ—");
        }
        int local_1 = this.GetSelectedMailIndex() + 1;
        this.RebuildBriefItemList();
        if (local_1 > 0 && (local_1 < this.GetMailBriefItems().Num()))
        {
            this.SetSelectedMailIndex(INDEX_NONE);
            this.SelectMailByIndex(local_1);
        }
        return;
    }
    void OnMailAllAttachmentClaimed(const FMsg_MailAllAttachmentClaimed &inout Msg)
    {
        if (Msg.Items.Num() > 0)
        {
            FText local_16 = FText();
            FText local_20 = FText();
            NSLOCTEXT("Mail", "ClaimRewardTitle", "иЋ·еѕ—");
        }
        this.RebuildBriefItemList();
        if (!(!(this.GetMailDetailVM())) && this.GetMailDetailVM().opArrow().GetCurrentMailData())
        {
            this.GetMailDetailVM().opArrow().SetCurrentMail(this.GetMailDetailVM().opArrow().GetCurrentMailData().opArrow().GetMailId());
        }
        return;
    }
    void OnMailDetailLoaded(const FMsg_MailDetailLoaded &inout Msg)
    {
        this.RefreshDeletableReadState();
        return;
    }
    void OnMailExpired(const FMsg_MailExpired &inout Msg)
    {
        this.RebuildAndRestoreSelection();
        return;
    }
    void Tick()
    {
        float local_4 = this.GetContext().DeltaTime.ToSeconds();
        this.SetExpireTextAccumulator((this.GetExpireTextAccumulator() + float32(local_4)));
        if (this.GetExpireTextAccumulator() >= this.GetExpireTextInterval())
        {
            this.SetExpireTextAccumulator(0.0f);
            this.RefreshAllExpireTexts();
        }
        if (this.GetNextExpireTimestamp() > 0 && (::FASCommonUtils::GetTimestamp() >= this.GetNextExpireTimestamp()))
        {
            this.GetMailModel().opArrow().CheckAndRemoveExpiredMails();
            this.RecalcNextExpireTimestamp();
        }
        return;
    }
    void SelectMailByIndex(const int Index)
    {
        if (Index < 0 || (Index >= this.GetMailBriefItems().Num()))
        {
            return;
        }
        this.SetSelectedMailIndex(Index);
        this.GetMailDetailVM().opArrow().SetCurrentMail(this.GetMailBriefItems()[Index].opArrow().GetMailId());
        return;
    }
    void SelectMail(const uint MailId)
    {
        int local_1 = 0;
        for (; local_1 < this.GetMailBriefItems().Num(); ++local_1)
        {
            if (this.GetMailBriefItems()[local_1].opArrow().GetMailId() == MailId)
            {
                this.SetSelectedMailIndex(local_1);
                break;
            }
        }
        this.GetMailDetailVM().opArrow().SetCurrentMail(MailId);
        return;
    }
    void LoadNextPage()
    {
        this.GetMailModel().opArrow().GS_RequestNextPage();
        return;
    }
    void ClaimAllAttachment()
    {
        this.GetMailModel().opArrow().GS_RequestClaimAllAttachment();
        return;
    }
    void DeleteAllReadMail()
    {
        this.GetMailModel().opArrow().GS_RequestDeleteAllReadMail();
        return;
    }
    uint GetSelectedMailId() const
    {
        if (this.GetSelectedMailIndex() >= 0 && (this.GetSelectedMailIndex() < this.GetMailBriefItems().Num()))
        {
            return this.GetMailBriefItems()[this.GetSelectedMailIndex()].opArrow().GetMailId();
        }
        if (this.GetMailDetailVM().opArrow().GetCurrentMailData())
        {
            return this.GetMailDetailVM().opArrow().GetCurrentMailData().opArrow().GetMailId();
        }
        return 0;
    }
    void RebuildAndRestoreSelection()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RebuildBriefItemList()
    {
        TArray<uint> local_4;
        this.GetMailModel().opArrow().GetMailIdList(local_4);
        TMap<uint, TEUIModelRef<FVM_MailBriefItem>> local_26;
        int local_27 = 0;
        for (; local_27 < this.GetMailBriefItems().Num(); )
        {
            local_26.Add(this.GetMailBriefItems()[local_27].opArrow().GetMailId(), this.GetMailBriefItems()[local_27]);
            ++local_27;
        }
        this.GetModify_MailBriefItems().Empty(0);
        int local_27_2 = 0;
        for (; local_27_2 < local_4.Num(); ++local_27_2)
        {
            TEUIModelRef<FVM_MailBriefItem> local_34;
            if (local_26.Find(local_4[local_27_2], local_34))
            {
                this.GetModify_MailBriefItems().Add(local_34);
                continue;
            }
            TEUIModelRef<FM_MailData> local_38 = this.GetMailModel().opArrow().GetMailData(local_4[local_27_2]);
            if (local_38)
            {
                this.GetModify_MailBriefItems().Add(TEUIModelRef<FVM_MailBriefItem>(::FVM_MailBriefItem::Create(this.GetContext().Manager, local_38)));
            }
        }
        this.SetbHasMorePages(this.GetMailModel().opArrow().HasMorePages());
        this.SetTotalCount(this.GetMailModel().opArrow().GetTotalCount());
        this.SetbIsMailboxFull(this.GetMailCapacity() > 0 && (this.GetTotalCount() >= this.GetMailCapacity()));
        this.RefreshClaimableState();
        this.RefreshDeletableReadState();
        return;
    }
    void AutoSelectAfterDelete()
    {
        if (this.GetMailBriefItems().Num() == 0)
        {
            this.SetSelectedMailIndex(INDEX_NONE);
            this.GetMailDetailVM().opArrow().ClearSelection();
            return;
        }
        this.SetSelectedMailIndex(INDEX_NONE);
        this.SelectMailByIndex(0);
        return;
    }
    void RefreshClaimableState()
    {
        this.SetbHasClaimableAttachment(false);
        int local_2 = 0;
        for (; local_2 < this.GetMailBriefItems().Num(); ++local_2)
        {
            if (this.GetMailBriefItems()[local_2].opArrow().GetHasAttachment())
            {
                this.SetbHasClaimableAttachment(true);
                break;
            }
        }
        return;
    }
    void RefreshDeletableReadState()
    {
        bool local_1;
        if (this.GetbHasMorePages())
        {
            this.SetbHasDeletableReadMail(true);
            return;
        }
        this.SetbHasDeletableReadMail(false);
        int local_2 = 0;
        for (; local_2 < this.GetMailBriefItems().Num(); ++local_2)
        {
            if (!(this.GetMailBriefItems()[local_2]))
            {
                local_1 = false;
            }
            else
            {
                local_1 = this.GetMailBriefItems()[local_2].opArrow().GetMailData();
            }
            local_1 = local_1 && !(this.GetMailBriefItems()[local_2].opArrow().GetIsUnread());
            local_1 = local_1 && !(this.GetMailBriefItems()[local_2].opArrow().GetMailData().opArrow().IsAttachmentClaimable());
            if (local_1)
            {
                this.SetbHasDeletableReadMail(true);
                break;
            }
        }
        return;
    }
    void RecalcNextExpireTimestamp()
    {
        this.SetNextExpireTimestamp(0);
        int local_3 = 0;
        TEUIModelRef<FM_MailData> local_8;
        for (; local_3 < this.GetMailBriefItems().Num(); ++local_3)
        {
            if (!(this.GetMailBriefItems()[local_3]))
            {
                continue;
            }
            TEUIModelRef<FM_MailData> local_10 = this.GetMailBriefItems()[local_3].opArrow().GetMailData();
            if (local_8 && (local_8.opArrow().GetExpireTime() > 0))
            {
                int64 local_2 = local_8.opArrow().GetExpireTime();
                if (this.GetNextExpireTimestamp() == 0 || (local_2 < this.GetNextExpireTimestamp()))
                {
                    this.SetNextExpireTimestamp(local_2);
                }
            }
        }
        return;
    }
    void RefreshAllExpireTexts()
    {
        int local_1 = 0;
        for (; local_1 < this.GetMailBriefItems().Num(); ++local_1)
        {
            if (!(!(this.GetMailBriefItems()[local_1])) && this.GetMailBriefItems()[local_1].opArrow().GetMailData())
            {
                this.GetMailBriefItems()[local_1].opArrow().GetMailData().opArrow().RefreshCachedExpireText();
                this.GetMailBriefItems()[local_1].opArrow().RefreshExpireText();
            }
        }
        if (this.GetMailDetailVM())
        {
            this.GetMailDetailVM().opArrow().RefreshExpireText();
        }
        return;
    }
    TEUIModelRef<FMS_MailModel> GetMailModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MailModel;
    }
    void SetMailModel(const TEUIModelRef<FMS_MailModel> &inout __Value) property
    {
        TEUIModelRef<FMS_MailModel> local_2;
        local_2 = this.m_MailModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MailModel = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_MailBriefItem>> GetMailBriefItems() const property
    {
        const TArray<TEUIModelRef<FVM_MailBriefItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_MailBriefItem>> GetModify_MailBriefItems() property
    {
        TArray<TEUIModelRef<FVM_MailBriefItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetMailBriefItems(const TArray<TEUIModelRef<FVM_MailBriefItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MailBriefItems = __Value;
        return;
    }
    TEUIModelRef<FVM_MailDetail> GetMailDetailVM() const property
    {
        this.TrackPropertyRead(2);
        return this.m_MailDetailVM;
    }
    void SetMailDetailVM(const TEUIModelRef<FVM_MailDetail> &inout __Value) property
    {
        TEUIModelRef<FVM_MailDetail> local_2;
        local_2 = this.m_MailDetailVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MailDetailVM = __Value;
        return;
    }
    bool GetbHasMorePages() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bHasMorePages;
    }
    void SetbHasMorePages(const bool __Value) property
    {
        if (!(this.m_bHasMorePages) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bHasMorePages = __Value;
        return;
    }
    bool GetbHasClaimableAttachment() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bHasClaimableAttachment;
    }
    void SetbHasClaimableAttachment(const bool __Value) property
    {
        if (!(this.m_bHasClaimableAttachment) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bHasClaimableAttachment = __Value;
        return;
    }
    int GetTotalCount() const property
    {
        this.TrackPropertyRead(5);
        return this.m_TotalCount;
    }
    void SetTotalCount(const int __Value) property
    {
        if (this.m_TotalCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TotalCount = __Value;
        return;
    }
    int GetMailCapacity() const property
    {
        this.TrackPropertyRead(6);
        return this.m_MailCapacity;
    }
    void SetMailCapacity(const int __Value) property
    {
        if (this.m_MailCapacity == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_MailCapacity = __Value;
        return;
    }
    bool GetbIsMailboxFull() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bIsMailboxFull;
    }
    void SetbIsMailboxFull(const bool __Value) property
    {
        if (!(this.m_bIsMailboxFull) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bIsMailboxFull = __Value;
        return;
    }
    bool GetbHasDeletableReadMail() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bHasDeletableReadMail;
    }
    void SetbHasDeletableReadMail(const bool __Value) property
    {
        if (!(this.m_bHasDeletableReadMail) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bHasDeletableReadMail = __Value;
        return;
    }
    int GetSelectedMailIndex() const property
    {
        this.TrackPropertyRead(9);
        return this.m_SelectedMailIndex;
    }
    void SetSelectedMailIndex(const int __Value) property
    {
        if (this.m_SelectedMailIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_SelectedMailIndex = __Value;
        return;
    }
    const float32 GetExpireTextAccumulator() const property
    {
        const float32 __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    float32 GetModify_ExpireTextAccumulator() property
    {
        float32 __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetExpireTextAccumulator(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_ExpireTextAccumulator = __Value;
        return;
    }
    const float32 GetExpireTextInterval() const property
    {
        const float32 __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    float32 GetModify_ExpireTextInterval() property
    {
        float32 __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetExpireTextInterval(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_ExpireTextInterval = __Value;
        return;
    }
    int64 GetNextExpireTimestamp() const property
    {
        this.TrackPropertyRead(12);
        return this.m_NextExpireTimestamp;
    }
    void SetNextExpireTimestamp(const int64 __Value) property
    {
        if (this.m_NextExpireTimestamp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_NextExpireTimestamp = __Value;
        return;
    }
    int GetMinVisibleItemCount() const property
    {
        this.TrackPropertyRead(13);
        return this.m_MinVisibleItemCount;
    }
    void SetMinVisibleItemCount(const int __Value) property
    {
        if (this.m_MinVisibleItemCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_MinVisibleItemCount = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MailPanel
{
    UPROPERTY()
    FText MailCountText;
    UPROPERTY()
    bool IsMailEmpty;
    UPROPERTY()
    FText MailboxFullWarning;
    UPROPERTY()
    FText MailStatusText;
    UPROPERTY()
    TEUIModelRef<FVM_MailPanel> Self;


}

namespace FVM_MailPanel
{
FVM_MailPanel& Create(const UObject ContextObject)
{
    return FVM_MailPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MailPanel CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MailPanel __r;
    TEUIModelRef<FVM_MailPanel> local_6 = TEUIModelRef<FVM_MailPanel>(EUIInternal::MakeModelWithManager(Manager, FVM_MailPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MailBriefItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_MailBriefItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MailDetailVM";
    local_14.TypeName = "TEUIModelRef<FVM_MailDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasMorePages";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasClaimableAttachment";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TotalCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MailCapacity";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsMailboxFull";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasDeletableReadMail";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MailCountText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsMailEmpty";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MailboxFullWarning";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MailStatusText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MailPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MailPanel;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnMailListRefreshed";
    local_26.MessageTypeName = "Msg_MailListRefreshed";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnMailDeleted";
    local_26.MessageTypeName = "Msg_MailDeleted";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnMailBatchDeleted";
    local_26.MessageTypeName = "Msg_MailBatchDeleted";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnMailAttachmentClaimed";
    local_26.MessageTypeName = "Msg_MailAttachmentClaimed";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnMailAllAttachmentClaimed";
    local_26.MessageTypeName = "Msg_MailAllAttachmentClaimed";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnMailDetailLoaded";
    local_26.MessageTypeName = "Msg_MailDetailLoaded";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnMailExpired";
    local_26.MessageTypeName = "Msg_MailExpired";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MailPanel;
}
void __OnMailListRefreshed(FVM_MailPanel &inout Model, const FMsg_MailListRefreshed &inout Message)
{
    Model.OnMailListRefreshed(Message);
    return;
}
void __OnMailDeleted(FVM_MailPanel &inout Model, const FMsg_MailDeleted &inout Message)
{
    Model.OnMailDeleted(Message);
    return;
}
void __OnMailBatchDeleted(FVM_MailPanel &inout Model, const FMsg_MailBatchDeleted &inout Message)
{
    Model.OnMailBatchDeleted(Message);
    return;
}
void __OnMailAttachmentClaimed(FVM_MailPanel &inout Model, const FMsg_MailAttachmentClaimed &inout Message)
{
    Model.OnMailAttachmentClaimed(Message);
    return;
}
void __OnMailAllAttachmentClaimed(FVM_MailPanel &inout Model, const FMsg_MailAllAttachmentClaimed &inout Message)
{
    Model.OnMailAllAttachmentClaimed(Message);
    return;
}
void __OnMailDetailLoaded(FVM_MailPanel &inout Model, const FMsg_MailDetailLoaded &inout Message)
{
    Model.OnMailDetailLoaded(Message);
    return;
}
void __OnMailExpired(FVM_MailPanel &inout Model, const FMsg_MailExpired &inout Message)
{
    Model.OnMailExpired(Message);
    return;
}
void __Tick(FVM_MailPanel &inout Model)
{
    Model.Tick();
    return;
}
TArray<TEUIModelRef<FVM_MailBriefItem>> __UIGetter_MailBriefItems(const FVM_MailPanel &inout Model)
{
    return Model.GetMailBriefItems();
}
TEUIModelRef<FVM_MailDetail> __UIGetter_MailDetailVM(const FVM_MailPanel &inout Model)
{
    return Model.GetMailDetailVM();
}
bool __UIGetter_bHasMorePages(const FVM_MailPanel &inout Model)
{
    return Model.GetbHasMorePages();
}
bool __UIGetter_bHasClaimableAttachment(const FVM_MailPanel &inout Model)
{
    return Model.GetbHasClaimableAttachment();
}
int __UIGetter_TotalCount(const FVM_MailPanel &inout Model)
{
    return Model.GetTotalCount();
}
int __UIGetter_MailCapacity(const FVM_MailPanel &inout Model)
{
    return Model.GetMailCapacity();
}
bool __UIGetter_bIsMailboxFull(const FVM_MailPanel &inout Model)
{
    return Model.GetbIsMailboxFull();
}
bool __UIGetter_bHasDeletableReadMail(const FVM_MailPanel &inout Model)
{
    return Model.GetbHasDeletableReadMail();
}
FText __UIGetter_MailCountText(const FVM_MailPanel &inout Model)
{
    return Model.GetMailCountText();
}
bool __UIGetter_IsMailEmpty(const FVM_MailPanel &inout Model)
{
    return Model.IsMailEmpty();
}
FText __UIGetter_MailboxFullWarning(const FVM_MailPanel &inout Model)
{
    return Model.GetMailboxFullWarning();
}
FText __UIGetter_MailStatusText(const FVM_MailPanel &inout Model)
{
    return Model.GetMailStatusText();
}
TEUIModelRef<FVM_MailPanel> __UIGetter_Self(const FVM_MailPanel &inout Model)
{
    return TEUIModelRef<FVM_MailPanel>(Model);
}
int __IndexOf_MailModel()
{
    return 0;
}
int __IndexOf_MailBriefItems()
{
    return 1;
}
int __IndexOf_MailDetailVM()
{
    return 2;
}
int __IndexOf_bHasMorePages()
{
    return 3;
}
int __IndexOf_bHasClaimableAttachment()
{
    return 4;
}
int __IndexOf_TotalCount()
{
    return 5;
}
int __IndexOf_MailCapacity()
{
    return 6;
}
int __IndexOf_bIsMailboxFull()
{
    return 7;
}
int __IndexOf_bHasDeletableReadMail()
{
    return 8;
}
int __IndexOf_SelectedMailIndex()
{
    return 9;
}
int __IndexOf_ExpireTextAccumulator()
{
    return 10;
}
int __IndexOf_ExpireTextInterval()
{
    return 11;
}
int __IndexOf_NextExpireTimestamp()
{
    return 12;
}
int __IndexOf_MinVisibleItemCount()
{
    return 13;
}
}
namespace __GeneratedProperties_FVM_MailPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
