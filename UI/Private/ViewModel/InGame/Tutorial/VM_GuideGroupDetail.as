namespace FVM_GuideGroupDetail
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature PrevPage = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature NextPage = FEUIModelCallbackSignature();

}
struct FVM_GuideGroupDetail : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FGuideGroupConfig> m_GuideConfig;
    UPROPERTY()
    int m_CurrentPage;
    UPROPERTY()
    TEUIModelRef<FVM_PageIndicator> m_PageIndicator;

    FVM_GuideGroupDetail()
    {
        this.m_CurrentPage = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_GuideGroupDetail' by default constructor.");
        return;
    }
    FVM_GuideGroupDetail(const FVM_GuideGroupDetail &inout Other)
    {
        this.m_CurrentPage = 0;
        this.m_GuideConfig = Other.m_GuideConfig;
        this.m_CurrentPage = int(Other.m_CurrentPage);
        this.m_PageIndicator = Other.m_PageIndicator;
        return;
    }
    FVM_GuideGroupDetail(const TDataObjectPtr<FGuideGroupConfig> &inout InGuideConfig)
    {
        this.m_CurrentPage = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetGuideConfig(InGuideConfig);
        return;
    }
    FVM_GuideGroupDetail& opAssign(const FVM_GuideGroupDetail &inout Other)
    {
        this.m_GuideConfig = Other.m_GuideConfig;
        this.m_CurrentPage = int(Other.m_CurrentPage);
        return Other.m_PageIndicator;
    }
    void PostConstruct()
    {
        this.SetPageIndicator(TEUIModelRef<FVM_PageIndicator>(::FVM_PageIndicator::Create(this.GetManager())));
        this.GetPageIndicator().Get().Init(this.GetTotalPages());
        return;
    }
    FText GetTitle() const
    {
        if (!(this.GetGuideConfig()))
        {
            return FText();
        }
        return this.GetGuideConfig().Get().Name;
    }
    int GetTotalPages() const
    {
        if (!(this.GetGuideConfig()))
        {
            return 0;
        }
        int local_3 = 0;
        for (auto& local_18 : this.GetGuideConfig().Get().GetGuidePageList())
        {
            if (local_18)
            {
                local_3 = local_3 + 1;
            }
        }
        return local_3;
    }
    int GetAssetTypeIndex() const
    {
        TDataObjectPtr<FGuidePageConfig> local_24 = this.GetCurrentPageConfig();
        if (!(local_24))
        {
            return 0;
        }
        return (int(local_24.Get().AssetType) - 1);
    }
    int GetAssetSwitcherIndex() const
    {
        TDataObjectPtr<FGuidePageConfig> local_24 = this.GetCurrentPageConfig();
        return local_24 && (int(local_24.Get().AssetType) == 3) ? 1 : 0;
    }
    FSoftBrush GetCurrentImage() const
    {
        TDataObjectPtr<FGuidePageConfig> local_24 = this.GetCurrentPageConfig();
        FSoftBrush local_140;
        if (local_24)
        {
            local_140 = local_24.Get().AssetImage;
        }
        else
        {
            local_140 = FSoftBrush();
        }
        return local_140;
    }
    UMediaSource GetCurrentVideo() const
    {
        UMediaSource local_52;
        TDataObjectPtr<FGuidePageConfig> local_24 = this.GetCurrentPageConfig();
        if (local_24)
        {
            local_52 = local_24.Get().AssetVideo;
        }
        else
        {
        }
        return local_52;
    }
    FText GetCurrentDesc() const
    {
        TDataObjectPtr<FGuidePageConfig> local_24 = this.GetCurrentPageConfig();
        FText local_58;
        if (local_24)
        {
            local_58 = local_24.Get().Desc;
        }
        else
        {
            local_58 = FText();
        }
        return local_58;
    }
    bool HasPrevPage() const
    {
        return (this.GetCurrentPage() > 0);
    }
    bool HasNextPage() const
    {
        return (this.GetCurrentPage() < (this.GetTotalPages() - 1));
    }
    bool IsLastPage() const
    {
        return (this.GetCurrentPage() >= (this.GetTotalPages() - 1));
    }
    void PrevPage()
    {
        if (this.HasPrevPage())
        {
            this.SetCurrentPage((this.GetCurrentPage() - 1));
            this.GetPageIndicator().Get().UpdateTo(this.GetCurrentPage());
        }
        return;
    }
    void NextPage()
    {
        if (this.HasNextPage())
        {
            this.SetCurrentPage((this.GetCurrentPage() + 1));
            this.GetPageIndicator().Get().UpdateTo(this.GetCurrentPage());
        }
        return;
    }
    TDataObjectPtr<FGuidePageConfig> GetCurrentPageConfig() const
    {
        if (!(this.GetGuideConfig()) || (this.GetCurrentPage() < 0))
        {
            return TDataObjectPtr<FGuidePageConfig>();
        }
        int local_53 = 0;
        for (auto& local_68 : this.GetGuideConfig().Get().GetGuidePageList())
        {
            if (!(local_68))
            {
                continue;
            }
            if (local_53 == this.GetCurrentPage())
            {
                return local_68;
            }
            local_53 = local_53 + 1;
        }
        return TDataObjectPtr<FGuidePageConfig>();
    }
    const TDataObjectPtr<FGuideGroupConfig> GetGuideConfig() const property
    {
        const TDataObjectPtr<FGuideGroupConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FGuideGroupConfig> GetModify_GuideConfig() property
    {
        TDataObjectPtr<FGuideGroupConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetGuideConfig(const TDataObjectPtr<FGuideGroupConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_GuideConfig = __Value;
        return;
    }
    int GetCurrentPage() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurrentPage;
    }
    void SetCurrentPage(const int __Value) property
    {
        if (this.m_CurrentPage == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentPage = __Value;
        return;
    }
    TEUIModelRef<FVM_PageIndicator> GetPageIndicator() const property
    {
        this.TrackPropertyRead(2);
        return this.m_PageIndicator;
    }
    void SetPageIndicator(const TEUIModelRef<FVM_PageIndicator> &inout __Value) property
    {
        TEUIModelRef<FVM_PageIndicator> local_2;
        local_2 = this.m_PageIndicator;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PageIndicator = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_GuideGroupDetail
{
    UPROPERTY()
    FText Title;
    UPROPERTY()
    int TotalPages;
    UPROPERTY()
    int AssetTypeIndex;
    UPROPERTY()
    int AssetSwitcherIndex;
    UPROPERTY()
    FSoftBrush CurrentImage;
    UPROPERTY()
    UMediaSource CurrentVideo = nullptr;
    UPROPERTY()
    FText CurrentDesc;
    UPROPERTY()
    bool HasPrevPage;
    UPROPERTY()
    bool HasNextPage;
    UPROPERTY()
    bool IsLastPage;
    UPROPERTY()
    TEUIModelRef<FVM_GuideGroupDetail> Self;

}

namespace FVM_GuideGroupDetail
{
FVM_GuideGroupDetail& Create(const UObject ContextObject, const TDataObjectPtr<FGuideGroupConfig> &inout GuideConfig)
{
    return FVM_GuideGroupDetail::CreateByManager(EUIInternal::GetContextManager(ContextObject), GuideConfig);
}
FVM_GuideGroupDetail& CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FGuideGroupConfig> &inout GuideConfig)
{
    return TEUIModelRef<FVM_GuideGroupDetail>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_GuideGroupDetail::ModelId, 0, GuideConfig)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrentPage";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PageIndicator";
    local_14.TypeName = "TEUIModelRef<FVM_PageIndicator>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TotalPages";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AssetTypeIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AssetSwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentVideo";
    local_14.TypeName = "UMediaSource";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasPrevPage";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasNextPage";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsLastPage";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_GuideGroupDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_GuideGroupDetail;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_GuideGroupDetail;
}
int __UIGetter_CurrentPage(const FVM_GuideGroupDetail &inout Model)
{
    return Model.GetCurrentPage();
}
TEUIModelRef<FVM_PageIndicator> __UIGetter_PageIndicator(const FVM_GuideGroupDetail &inout Model)
{
    return Model.GetPageIndicator();
}
FText __UIGetter_Title(const FVM_GuideGroupDetail &inout Model)
{
    return Model.GetTitle();
}
int __UIGetter_TotalPages(const FVM_GuideGroupDetail &inout Model)
{
    return Model.GetTotalPages();
}
int __UIGetter_AssetTypeIndex(const FVM_GuideGroupDetail &inout Model)
{
    return Model.GetAssetTypeIndex();
}
int __UIGetter_AssetSwitcherIndex(const FVM_GuideGroupDetail &inout Model)
{
    return Model.GetAssetSwitcherIndex();
}
FSoftBrush __UIGetter_CurrentImage(const FVM_GuideGroupDetail &inout Model)
{
    return Model.GetCurrentImage();
}
UMediaSource __UIGetter_CurrentVideo(const FVM_GuideGroupDetail &inout Model)
{
    return Model.GetCurrentVideo();
}
FText __UIGetter_CurrentDesc(const FVM_GuideGroupDetail &inout Model)
{
    return Model.GetCurrentDesc();
}
bool __UIGetter_HasPrevPage(const FVM_GuideGroupDetail &inout Model)
{
    return Model.HasPrevPage();
}
bool __UIGetter_HasNextPage(const FVM_GuideGroupDetail &inout Model)
{
    return Model.HasNextPage();
}
bool __UIGetter_IsLastPage(const FVM_GuideGroupDetail &inout Model)
{
    return Model.IsLastPage();
}
TEUIModelRef<FVM_GuideGroupDetail> __UIGetter_Self(const FVM_GuideGroupDetail &inout Model)
{
    return TEUIModelRef<FVM_GuideGroupDetail>(Model);
}
int __IndexOf_GuideConfig()
{
    return 0;
}
int __IndexOf_CurrentPage()
{
    return 1;
}
int __IndexOf_PageIndicator()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_GuideGroupDetail
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_GuideGroupDetail.Get();
}
}
