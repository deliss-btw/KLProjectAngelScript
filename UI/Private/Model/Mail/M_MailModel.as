
namespace FMS_MailModel
{
    const int ModelId = 0;

}
struct FMsg_MailUnreadCountChanged : FEUIMessage
{
    FMsg_MailUnreadCountChanged()
    {
        return;
    }
}

struct FMsg_MailListRefreshed : FEUIMessage
{
    FMsg_MailListRefreshed()
    {
        return;
    }
}

struct FMsg_MailDetailLoaded : FEUIMessage
{
    UPROPERTY()
    uint MailId = 0;


}

struct FMsg_MailAttachmentClaimed : FEUIMessage
{
    UPROPERTY()
    uint MailId = 0;
    UPROPERTY()
    TArray<FRewardItemEntry> Items;


}

struct FMsg_MailAllAttachmentClaimed : FEUIMessage
{
    UPROPERTY()
    TArray<uint> ClaimedMailIds;
    UPROPERTY()
    TArray<FRewardItemEntry> Items;

    FMsg_MailAllAttachmentClaimed()
    {
        return;
    }
}

struct FMsg_MailDeleted : FEUIMessage
{
    UPROPERTY()
    uint MailId = 0;


}

struct FMsg_MailBatchDeleted : FEUIMessage
{
    FMsg_MailBatchDeleted()
    {
        return;
    }
}

struct FMsg_MailExpired : FEUIMessage
{
    UPROPERTY()
    TArray<uint> ExpiredMailIds;

    FMsg_MailExpired()
    {
        return;
    }
}

struct FMS_MailModel : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<uint, TEUIModelRef<FM_MailData>> m_MailDataCache;
    UPROPERTY()
    TArray<uint> m_OrderedMailIds;
    UPROPERTY()
    bool m_bHasMorePages;
    UPROPERTY()
    bool m_bIsLoadingPage;
    UPROPERTY()
    uint m_UnreadCount;
    UPROPERTY()
    uint m_TotalCount;
    UPROPERTY()
    TMap<uint, uint> m_UnreadMailExpireTimeMap;
    UPROPERTY()
    uint m_LatestUnreadMailExpireTime;
    UPROPERTY()
    bool m_bHasUnreadMailSnapshot;

    FMS_MailModel()
    {
        this.m_bHasMorePages = true;
        this.m_bIsLoadingPage = false;
        this.m_UnreadCount = 0;
        this.m_TotalCount = 0;
        this.m_LatestUnreadMailExpireTime = 0;
        this.m_bHasUnreadMailSnapshot = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_MailModel(const FMS_MailModel &inout Other)
    {
        this.m_bHasMorePages = true;
        this.m_bIsLoadingPage = false;
        this.m_UnreadCount = 0;
        this.m_TotalCount = 0;
        this.m_LatestUnreadMailExpireTime = 0;
        this.m_bHasUnreadMailSnapshot = false;
        this.m_MailDataCache = Other.m_MailDataCache;
        this.m_OrderedMailIds = Other.m_OrderedMailIds;
        this.m_bHasMorePages = Other.m_bHasMorePages;
        this.m_bIsLoadingPage = Other.m_bIsLoadingPage;
        this.m_UnreadCount = int(Other.m_UnreadCount);
        this.m_TotalCount = int(Other.m_TotalCount);
        this.m_UnreadMailExpireTimeMap = Other.m_UnreadMailExpireTimeMap;
        this.m_LatestUnreadMailExpireTime = int(Other.m_LatestUnreadMailExpireTime);
        this.m_bHasUnreadMailSnapshot = Other.m_bHasUnreadMailSnapshot;
        return;
    }
    FMS_MailModel opAssign(const FMS_MailModel &inout Other)
    {
        FMS_MailModel __r;
        this.m_MailDataCache = Other.m_MailDataCache;
        this.m_OrderedMailIds = Other.m_OrderedMailIds;
        this.m_bHasMorePages = Other.m_bHasMorePages;
        this.m_bIsLoadingPage = Other.m_bIsLoadingPage;
        this.m_UnreadCount = int(Other.m_UnreadCount);
        this.m_TotalCount = int(Other.m_TotalCount);
        this.m_UnreadMailExpireTimeMap = Other.m_UnreadMailExpireTimeMap;
        this.m_LatestUnreadMailExpireTime = int(Other.m_LatestUnreadMailExpireTime);
        this.m_bHasUnreadMailSnapshot = Other.m_bHasUnreadMailSnapshot;
        return __r;
    }
    void GS_RequestMailList(const uint StartIndex, const uint LastMailId)
    {
        if (this.GetbIsLoadingPage())
        {
            return;
        }
        this.SetbIsLoadingPage(true);
        FPbGetMailListReq local_6;
        local_6.SetStartIndex(StartIndex);
        local_6.SetLastMailId(LastMailId);
        local_6.SetLanguageType(::FGameConnectionUtils::GetCurrentProtoLanguageType());
        this.SendProto(local_6.ToWrapper());
        return;
    }
    void GS_RequestFirstPage()
    {
        this.GetModify_MailDataCache().Empty(0);
        this.GetModify_OrderedMailIds().Empty(0);
        this.SetbHasMorePages(true);
        this.GS_RequestMailList(0, 0);
        return;
    }
    void GS_RequestNextPage()
    {
        int local_6;
        if (!(this.GetbHasMorePages()) || this.GetbIsLoadingPage())
        {
            return;
        }
        if (this.GetOrderedMailIds().Num() > 0)
        {
            local_6 = this.GetOrderedMailIds().Last(0);
        }
        else
        {
            local_6 = 0;
        }
        this.GS_RequestMailList(this.GetOrderedMailIds().Num(), local_6);
        return;
    }
    void GS_RequestMailDetail(const uint MailId)
    {
        TEUIModelRef<FM_MailData> local_2;
        if (this.GetMailDataCache().Find(MailId, local_2))
        {
            if (local_2.opArrow().GetbDetailLoaded())
            {
                FEUIModelRef local_12 = FEUIModelRef(this);
                FEUIMessageBus::Publish(EUIMessageBus);
                FMsg_MailDetailLoaded local_6;
                local_6.MailId = MailId;
                return;
            }
        }
        FPbReadMailReq local_16;
        local_16.SetMailId(MailId);
        local_16.SetLanguageType(::FGameConnectionUtils::GetCurrentProtoLanguageType());
        this.SendProto(local_16.ToWrapper());
        return;
    }
    void RefreshMailDetail(const uint MailId)
    {
        FPbReadMailReq local_4;
        local_4.SetMailId(MailId);
        local_4.SetLanguageType(::FGameConnectionUtils::GetCurrentProtoLanguageType());
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_RequestClaimAttachment(const uint MailId)
    {
        FPbClaimMailAttachmentReq local_4;
        local_4.SetMailId(MailId);
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_RequestClaimAllAttachment()
    {
        FPbClaimAllMailAttachmentReq local_4;
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_RequestDeleteMail(const uint MailId)
    {
        FPbDeleteMailReq local_4;
        local_4.SetMailId(MailId);
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_RequestDeleteAllReadMail()
    {
        FPbDeleteAllReadMailReq local_4;
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_OnMailLoginDataNotify(const FPbMailLoginDataNotify &inout Notify)
    {
        this.SetUnreadCount(Notify.GetUnreadCount());
        this.ApplyMailUnreadInfoSnapshot(Notify);
        FEUIModelRef local_8 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_8);
        this.SyncMailEntranceRedDotToUnreadCount();
        return;
    }
    void GS_OnGetMailListRsp(const FPbGetMailListRsp &inout Rsp)
    {
        this.SetbIsLoadingPage(false);
        if (Rsp.GetRetcode() != 0)
        {
            return;
        }
        this.SetTotalCount(Rsp.GetTotalCount());
        int local_4 = Rsp.GetNextStartIndex();
        this.SetbHasMorePages((local_4 != 0));
        TArray<uint> local_10;
        int local_11 = 0;
        for (; local_11 < Rsp.GetMailList_Num(); ++local_11)
        {
            FPbMailBrief local_32 = Rsp.GetMailList_Index(local_11);
            FM_MailData& local_34 = this.RequireMailData(local_32.GetMailId());
            local_34.SetFromBrief(local_32);
            if (!(this.GetOrderedMailIds().Contains(local_32.GetMailId())))
            {
                local_10.Add(local_32.GetMailId());
            }
        }
        this.SortMailIds(local_10);
        int local_35 = 0;
        for (; local_35 < local_10.Num(); )
        {
            this.GetModify_OrderedMailIds().Add(local_10[local_35]);
            ++local_35;
        }
        FEUIModelRef local_42 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_42);
        return;
    }
    void GS_OnReadMailRsp(const FPbReadMailRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            return;
        }
        FPbMailDetail local_14 = FPbMailDetail(Rsp.GetMailDetail());
        FM_MailData& local_26 = this.RequireMailData(local_14.GetMailId());
        local_26.SetFromDetail(local_14);
        FEUIModelRef local_36 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_MailDetailLoaded local_30;
        local_30.MailId = local_14.GetMailId();
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(FGameplayTag::RequestGameplayTag(n"RedDotSystem.Mail.NewMail", true), local_14.GetMailId());
        this.MarkUnreadMailResolved(local_14.GetMailId(), true);
        return;
    }
    void GS_OnClaimMailAttachmentRsp(const FPbClaimMailAttachmentRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            return;
        }
        TEUIModelRef<FM_MailData> local_10 = this.GetMailData(Rsp.GetMailId());
        if (local_10)
        {
            local_10.opArrow().SetMailState(3);
        }
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(FGameplayTag::RequestGameplayTag(n"RedDotSystem.Mail.NewMail", true), Rsp.GetMailId());
        this.MarkUnreadMailResolved(Rsp.GetMailId(), true);
        FEUIModelRef local_24 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_MailAttachmentClaimed local_18;
        local_18.MailId = Rsp.GetMailId();
        TArray<FPbItem> local_28;
        Rsp.GetAttachmentList(local_28);
        ::FRewardItemEntry::FromPbItems(local_28, local_18.Items);
        return;
    }
    void GS_OnClaimAllMailAttachmentRsp(const FPbClaimAllMailAttachmentRsp &inout Rsp)
    {
        bool local_3;
        int local_8 = 0;
        if (Rsp.GetRetcode() == 0)
        {
            local_3 = false;
        }
        else
        {
            int local_4 = Rsp.GetClaimedMailIdList_Num();
            local_3 = (local_4 == 0);
        }
        if (local_3)
        {
            return;
        }
        FEUIModelRef local_14 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        TArray<FPbItem> local_18;
        Rsp.GetAttachmentList(local_18);
        ::FRewardItemEntry::FromPbItems(local_18, local_8.Items);
        int local_19 = 0;
        for (; local_19 < Rsp.GetClaimedMailIdList_Num(); )
        {
            int local_5 = Rsp.GetClaimedMailIdList_Index(local_19);
            local_8.ClaimedMailIds.Add(local_5);
            TEUIModelRef<FM_MailData> local_24 = this.GetMailData(local_5);
            if (local_24)
            {
                local_24.opArrow().SetMailState(3);
            }
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(FGameplayTag::RequestGameplayTag(n"RedDotSystem.Mail.NewMail", true), local_5);
            this.MarkUnreadMailResolved(local_5, false);
            ++local_19;
        }
        this.SyncMailEntranceRedDotToUnreadCount();
        this.CheckAndClearExpiredUnreadRedDotIfNeeded(true);
        return;
    }
    void GS_OnDeleteMailRsp(const FPbDeleteMailRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            return;
        }
        this.MarkUnreadMailResolved(Rsp.GetMailId(), true);
        this.RemoveMailFromCache(Rsp.GetMailId());
        this.SetTotalCount(FMath::Max(0, this.GetTotalCount() - 1));
        this.ReconcileHasMorePages();
        FEUIModelRef local_14 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_MailDeleted local_8;
        local_8.MailId = Rsp.GetMailId();
        return;
    }
    void GS_OnDeleteAllReadMailRsp(const FPbDeleteAllReadMailRsp &inout Rsp)
    {
        int local_1 = Rsp.GetRetcode();
        if (local_1 != 0)
        {
            return;
        }
        int local_4 = 0;
        for (; local_4 < Rsp.GetDeletedMailIdList_Num(); )
        {
            this.RemoveMailFromCache(Rsp.GetDeletedMailIdList_Index(local_4));
            ++local_4;
        }
        int local_1_2 = ::NumericUtils::AsInt32(Rsp.GetDeletedMailIdList_Num());
        this.SetTotalCount(FMath::Max(0, this.GetTotalCount() - local_1_2));
        this.ReconcileHasMorePages();
        FEUIModelRef local_16 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_16);
        return;
    }
    void GS_OnNewMailNotify(const FPbNewMailNotify &inout Notify)
    {
        this.SetUnreadCount(Notify.GetTotalUnreadCount());
        this.SetbHasUnreadMailSnapshot(true);
        TArray<uint> local_6;
        TArray<uint64> local_10;
        int local_11 = 0;
        for (; local_11 < Notify.GetNewMailList_Num(); )
        {
            FPbMailBrief local_32 = Notify.GetNewMailList_Index(local_11);
            FM_MailData& local_34 = this.RequireMailData(local_32.GetMailId());
            local_34.SetFromBrief(local_32);
            if (!(this.GetOrderedMailIds().Contains(local_32.GetMailId())))
            {
                local_6.Add(local_32.GetMailId());
                local_10.Add(local_32.GetMailId());
            }
            this.TrackUnreadMail(local_32.GetMailId(), local_32.GetExpireTime());
            this.SetTotalCount((this.GetTotalCount() + 1));
            ++local_11;
        }
        this.RecalculateLatestUnreadMailExpireTime();
        this.SortMailIds(local_6);
        int local_42 = local_6.Num() - 1;
        for (; local_42 >= 0; )
        {
            this.GetModify_OrderedMailIds().Insert(local_6[local_42], 0);
            --local_42;
        }
        FEUIModelRef local_48 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_48);
        FEUIModelRef local_48_2 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_48_2);
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(ERedPointEvent(4), local_10);
        this.SyncMailEntranceRedDotToUnreadCount();
        return;
    }
    void CheckAndRemoveExpiredMails()
    {
        TArray<uint> local_4;
        int local_16 = 0;
        int local_5 = 0;
        for (; local_5 < this.GetOrderedMailIds().Num(); ++local_5)
        {
            TEUIModelRef<FM_MailData> local_10;
            if (this.GetMailDataCache().Find(this.GetOrderedMailIds()[local_5], local_10) && local_10.opArrow().IsExpired())
            {
                local_4.Add(this.GetOrderedMailIds()[local_5]);
            }
        }
        if (local_4.Num() == 0)
        {
            return;
        }
        int local_5_2 = 0;
        for (; local_5_2 < local_4.Num(); )
        {
            this.RemoveMailFromCache(local_4[local_5_2]);
            ++local_5_2;
        }
        this.SetTotalCount(FMath::Max(0, (this.GetTotalCount() - local_4.Num())));
        FEUIModelRef local_22 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        local_16.ExpiredMailIds = local_4;
        return;
    }
    void GetMailIdList(TArray<uint> &inout OutIds) const
    {
        OutIds = this.GetOrderedMailIds();
        return;
    }
    int GetCachedMailCount() const
    {
        return this.GetOrderedMailIds().Num();
    }
    bool HasMorePages() const
    {
        return this.GetbHasMorePages();
    }
    bool CheckAndClearExpiredUnreadRedDotIfNeeded(const bool bStoreRedPointImmediately = false)
    {
        if (!(this.GetbHasUnreadMailSnapshot()))
        {
            return false;
        }
        this.SyncMailEntranceRedDotToUnreadCount();
        int64 local_6 = ::FASCommonUtils::GetTimestamp();
        if (this.GetLatestUnreadMailExpireTime() > 0 && (local_6 < this.GetLatestUnreadMailExpireTime()))
        {
            return false;
        }
        this.PruneExpiredUnreadMails(local_6);
        if (this.GetUnreadMailExpireTimeMap().Num() > 0)
        {
            this.SyncMailEntranceRedDotToUnreadCount();
            return false;
        }
        this.SetUnreadCount(0);
        this.SetLatestUnreadMailExpireTime(0);
        this.SetbHasUnreadMailSnapshot(false);
        FEUIModelRef local_18 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_18);
        FMS_RedDotSystem& local_20 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        local_20.ConsumeRedDotByEvent(ERedPointEvent(4));
        this.SyncMailEntranceRedDotToUnreadCount();
        if (bStoreRedPointImmediately)
        {
            local_20.GS_RequestStoreRedPoint();
        }
        return true;
    }
    TEUIModelRef<FM_MailData> GetMailData(const uint MailId) const
    {
        TEUIModelRef<FM_MailData> local_2;
        if (this.GetMailDataCache().Find(MailId, local_2))
        {
            return local_2;
        }
        return local_2;
    }
    FM_MailData RequireMailData(const uint MailId)
    {
        TEUIModelRef<FM_MailData> local_2;
        FM_MailData __r;
        if (this.GetMailDataCache().Find(MailId, local_2))
        {
        }
        else
        {
            this.GetModify_MailDataCache().Add(MailId, TEUIModelRef<FM_MailData>(::FM_MailData::Create(this.GetContext().Manager, MailId)));
        }
        return __r;
    }
    void ApplyMailUnreadInfoSnapshot(const FPbMailLoginDataNotify &inout Notify)
    {
        this.GetModify_UnreadMailExpireTimeMap().Reset();
        this.SetLatestUnreadMailExpireTime(0);
        this.SetbHasUnreadMailSnapshot(true);
        int local_3 = 0;
        for (; local_3 < Notify.GetMailUnreadInfoList_Num(); )
        {
            FPbMailUnreadInfo local_24 = Notify.GetMailUnreadInfoList_Index(local_3);
            this.TrackUnreadMail(local_24.GetMailId(), local_24.GetExpireTime());
            ++local_3;
        }
        this.RecalculateLatestUnreadMailExpireTime();
        return;
    }
    void TrackUnreadMail(const uint MailId, const uint ExpireTime)
    {
        if (MailId == 0)
        {
            return;
        }
        if ((ExpireTime > 0 && (::FASCommonUtils::GetTimestamp() >= ExpireTime)))
        {
            return;
        }
        this.GetModify_UnreadMailExpireTimeMap().Add(MailId, ExpireTime);
        if (ExpireTime > 0 && (ExpireTime > this.GetLatestUnreadMailExpireTime()))
        {
            this.SetLatestUnreadMailExpireTime(ExpireTime);
        }
        return;
    }
    bool MarkUnreadMailResolved(const uint MailId, const bool bSyncImmediately = true)
    {
        int local_1 = 0;
        bool local_4 = this.GetUnreadMailExpireTimeMap().Find(MailId, local_1);
        if (!(local_4))
        {
            if (bSyncImmediately)
            {
                this.SyncMailEntranceRedDotToUnreadCount();
            }
            return false;
        }
        this.SetUnreadCount(FMath::Max(0, this.GetUnreadCount() - 1));
        if (local_1 == this.GetLatestUnreadMailExpireTime())
        {
            this.RecalculateLatestUnreadMailExpireTime();
        }
        if (bSyncImmediately)
        {
            this.SyncMailEntranceRedDotToUnreadCount();
            this.CheckAndClearExpiredUnreadRedDotIfNeeded(true);
        }
        return true;
    }
    void PruneExpiredUnreadMails(const int64 Now)
    {
        TArray<uint> local_4;
        int local_25 = 0;
        for (auto& local_24 : this.GetUnreadMailExpireTimeMap())
        {
            if ((local_25 > 0 && (Now >= 0)))
            {
                local_4.Add(local_24.GetKey());
            }
        }
        if (local_4.IsEmpty())
        {
            return;
        }
        auto local_36 = local_4.Iterator();
        for (; local_36.CanProceed;)
        {
            local_25 = local_36.Proceed();
        }
        this.SetUnreadCount(FMath::Max(0, (this.GetUnreadCount() - local_4.Num())));
        this.RecalculateLatestUnreadMailExpireTime();
        return;
    }
    void RecalculateLatestUnreadMailExpireTime()
    {
        int local_1 = 0;
        this.SetLatestUnreadMailExpireTime(0);
        for (auto& local_22 : this.GetUnreadMailExpireTimeMap())
        {
            local_22;
            if (local_1 > 0 && (local_1 > this.GetLatestUnreadMailExpireTime()))
            {
                this.SetLatestUnreadMailExpireTime(local_1);
            }
        }
        return;
    }
    void SyncMailEntranceRedDotToUnreadCount()
    {
        FMS_RedDotSystem& local_2 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        FRedDotNodeData local_6 = FRedDotNodeData(GameplayTags::RedDotSystem_Mail_Entrance, 0);
        int local_11 = this.GetUnreadCount() - local_2.GetRedDotCount(local_6);
        if (local_11 != 0)
        {
            local_2.GenerateSpecificRedDot(local_6, local_11, true);
        }
        return;
    }
    void RemoveMailFromCache(const uint MailId)
    {
        return;
    }
    void ReconcileHasMorePages()
    {
        bool local_4;
        if (!(this.GetbHasMorePages()))
        {
            local_4 = false;
        }
        else
        {
            int local_1 = this.GetTotalCount();
            local_4 = (local_1 == 0);
        }
        if (local_4)
        {
            this.SetbHasMorePages(false);
        }
        return;
    }
    void SortMailIds(TArray<uint> &inout Ids) const
    {
        int local_5;
        int local_1 = 1;
        for (; local_1 < Ids.Num(); ++local_1)
        {
            local_5 = Ids[local_1];
            TEUIModelRef<FM_MailData> local_8;
            if (!(this.GetMailDataCache().Find(local_5, local_8)))
            {
                continue;
            }
            int local_3 = local_1 - 1;
            while (local_3 >= 0)
            {
                TEUIModelRef<FM_MailData> local_12;
                if (!(this.GetMailDataCache().Find(Ids[local_3], local_12)))
                {
                    break;
                }
                if (local_12.opArrow().GetSendTime() > local_8.opArrow().GetSendTime())
                {
                    break;
                }
                if (local_12.opArrow().GetSendTime() == local_8.opArrow().GetSendTime() && (local_12.opArrow().GetMailId() >= local_8.opArrow().GetMailId()))
                {
                    break;
                }
                Ids[(local_3 + 1)] = Ids[local_3];
                --local_3;
            }
            Ids[(local_3 + 1)] = local_5;
        }
        return;
    }
    const TMap<uint, TEUIModelRef<FM_MailData>> GetMailDataCache() const property
    {
        const TMap<uint, TEUIModelRef<FM_MailData>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<uint, TEUIModelRef<FM_MailData>> GetModify_MailDataCache() property
    {
        TMap<uint, TEUIModelRef<FM_MailData>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMailDataCache(const TMap<uint, TEUIModelRef<FM_MailData>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MailDataCache = __Value;
        return;
    }
    const TArray<uint> GetOrderedMailIds() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<uint> GetModify_OrderedMailIds() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetOrderedMailIds(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_OrderedMailIds = __Value;
        return;
    }
    bool GetbHasMorePages() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bHasMorePages;
    }
    void SetbHasMorePages(const bool __Value) property
    {
        if (!(this.m_bHasMorePages) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bHasMorePages = __Value;
        return;
    }
    bool GetbIsLoadingPage() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bIsLoadingPage;
    }
    void SetbIsLoadingPage(const bool __Value) property
    {
        if (!(this.m_bIsLoadingPage) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bIsLoadingPage = __Value;
        return;
    }
    uint GetUnreadCount() const property
    {
        this.TrackPropertyRead(4);
        return this.m_UnreadCount;
    }
    void SetUnreadCount(const uint __Value) property
    {
        if (this.m_UnreadCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_UnreadCount = __Value;
        return;
    }
    uint GetTotalCount() const property
    {
        this.TrackPropertyRead(5);
        return this.m_TotalCount;
    }
    void SetTotalCount(const uint __Value) property
    {
        if (this.m_TotalCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TotalCount = __Value;
        return;
    }
    const TMap<uint, uint> GetUnreadMailExpireTimeMap() const property
    {
        const TMap<uint, uint> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TMap<uint, uint> GetModify_UnreadMailExpireTimeMap() property
    {
        TMap<uint, uint> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetUnreadMailExpireTimeMap(const TMap<uint, uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_UnreadMailExpireTimeMap = __Value;
        return;
    }
    uint GetLatestUnreadMailExpireTime() const property
    {
        this.TrackPropertyRead(7);
        return this.m_LatestUnreadMailExpireTime;
    }
    void SetLatestUnreadMailExpireTime(const uint __Value) property
    {
        if (this.m_LatestUnreadMailExpireTime == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_LatestUnreadMailExpireTime = __Value;
        return;
    }
    bool GetbHasUnreadMailSnapshot() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bHasUnreadMailSnapshot;
    }
    void SetbHasUnreadMailSnapshot(const bool __Value) property
    {
        if (!(this.m_bHasUnreadMailSnapshot) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bHasUnreadMailSnapshot = __Value;
        return;
    }
}

namespace FMS_MailModel
{
FMS_MailModel& Get(const UObject ContextObject)
{
    return FMS_MailModel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_MailModel GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_MailModel __r;
    TEUIModelRef<FMS_MailModel> local_6 = TEUIModelRef<FMS_MailModel>(EUIInternal::MakeModelWithManager(Manager, FMS_MailModel::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnMailLoginDataNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnGetMailListRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnReadMailRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnClaimMailAttachmentRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnClaimAllMailAttachmentRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnDeleteMailRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnDeleteAllReadMailRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnNewMailNotify";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_MailModel;
}
void __GS_OnMailLoginDataNotify(FMS_MailModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnMailLoginDataNotify(FPbMailLoginDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnGetMailListRsp(FMS_MailModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnGetMailListRsp(FPbGetMailListRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnReadMailRsp(FMS_MailModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnReadMailRsp(FPbReadMailRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnClaimMailAttachmentRsp(FMS_MailModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnClaimMailAttachmentRsp(FPbClaimMailAttachmentRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnClaimAllMailAttachmentRsp(FMS_MailModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnClaimAllMailAttachmentRsp(FPbClaimAllMailAttachmentRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnDeleteMailRsp(FMS_MailModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnDeleteMailRsp(FPbDeleteMailRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnDeleteAllReadMailRsp(FMS_MailModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnDeleteAllReadMailRsp(FPbDeleteAllReadMailRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnNewMailNotify(FMS_MailModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnNewMailNotify(FPbNewMailNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_MailDataCache()
{
    return 0;
}
int __IndexOf_OrderedMailIds()
{
    return 1;
}
int __IndexOf_bHasMorePages()
{
    return 2;
}
int __IndexOf_bIsLoadingPage()
{
    return 3;
}
int __IndexOf_UnreadCount()
{
    return 4;
}
int __IndexOf_TotalCount()
{
    return 5;
}
int __IndexOf_UnreadMailExpireTimeMap()
{
    return 6;
}
int __IndexOf_LatestUnreadMailExpireTime()
{
    return 7;
}
int __IndexOf_bHasUnreadMailSnapshot()
{
    return 8;
}
}
