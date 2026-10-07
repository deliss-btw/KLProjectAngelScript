
namespace FVM_SearchFriendInput
{
    const int ModelId = 0;

}
struct FVM_SearchFriendInput : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_ChatRuntimeData> m_ChatRuntimeData;
    UPROPERTY()
    TEUIModelRef<FMS_FriendDataModel> m_FriendDataModel;
    UPROPERTY()
    FString m_AlreadyInputText;
    UPROPERTY()
    FString m_TempInputText;
    UPROPERTY()
    bool m_bShowSearchResult;
    UPROPERTY()
    FStringValidationHelper m_StringValidationHelper;
    UPROPERTY()
    bool m_bSearchInputValid;
    UPROPERTY()
    bool m_bPendingFriendSearchAfterValidation;
    UPROPERTY()
    FString m_PendingFriendSearchTrimmedText;

    FVM_SearchFriendInput()
    {
        this.m_bShowSearchResult = false;
        this.m_bSearchInputValid = true;
        this.m_bPendingFriendSearchAfterValidation = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SearchFriendInput(const FVM_SearchFriendInput &inout Other)
    {
        this.m_bShowSearchResult = false;
        this.m_bSearchInputValid = true;
        this.m_bPendingFriendSearchAfterValidation = false;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_FriendDataModel = Other.m_FriendDataModel;
        this.m_AlreadyInputText = Other.m_AlreadyInputText;
        this.m_TempInputText = Other.m_TempInputText;
        this.m_bShowSearchResult = Other.m_bShowSearchResult;
        this.m_bSearchInputValid = Other.m_bSearchInputValid;
        this.m_bPendingFriendSearchAfterValidation = Other.m_bPendingFriendSearchAfterValidation;
        this.m_PendingFriendSearchTrimmedText = Other.m_PendingFriendSearchTrimmedText;
        return;
    }
    FVM_SearchFriendInput& opAssign(const FVM_SearchFriendInput &inout Other)
    {
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_FriendDataModel = Other.m_FriendDataModel;
        this.m_AlreadyInputText = Other.m_AlreadyInputText;
        this.m_TempInputText = Other.m_TempInputText;
        this.m_bShowSearchResult = Other.m_bShowSearchResult;
        this.m_bSearchInputValid = Other.m_bSearchInputValid;
        this.m_bPendingFriendSearchAfterValidation = Other.m_bPendingFriendSearchAfterValidation;
        return Other.m_PendingFriendSearchTrimmedText;
    }
    bool IsShowCancelButton() const
    {
        return !(this.GetTempInputText().IsEmpty());
    }
    void PostConstruct()
    {
        const UPlayerInfoSettings local_6;
        this.SetFriendDataModel(TEUIModelRef<FMS_FriendDataModel>(::FMS_FriendDataModel::Get(this.GetContext().Manager)));
        this.SetChatRuntimeData(TEUIModelRef<FMS_ChatRuntimeData>(::FMS_ChatRuntimeData::Get(this.GetContext().Manager)));
        GetGameplaySettings<UPlayerInfoSettings> local_8;
        local_6 = local_8;
        if (local_6.PlayerNameValidator != nullptr)
        {
            this.GetModify_StringValidationHelper().SetConfigAsset(local_6.PlayerNameValidator);
        }
        else
        {
            XWarning(ELog(16), "Player name validator not set, friend search name path will reject non-UID input");
        }
        this.RefreshSearchState();
        this.SyncInputTextFromRuntimeCache();
        this.SetTempInputText(this.GetAlreadyInputText());
        return;
    }
    void OnInputTextChanged()
    {
        if (this.GetChatRuntimeData().IsValid())
        {
            TEUIModelRef<FMS_ChatRuntimeData> local_2 = this.GetChatRuntimeData();
            this.GetTempInputText().CacheSearchFriendInputText();
        }
        bool local_3 = this.GetChatRuntimeData().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FMS_ChatRuntimeData> local_2_2 = this.GetChatRuntimeData();
            local_3 = GetbShowFriendSearchResult();
        }
        local_3 = local_3 && this.GetTempInputText().TrimStartAndEnd().IsEmpty();
        if (local_3)
        {
            if (this.GetFriendDataModel().IsValid())
            {
                TEUIModelRef<FMS_FriendDataModel> local_10 = this.GetFriendDataModel();
                ClearFriendSearchResultsList();
            }
            bool local_3_2 = false;
            TEUIModelRef<FMS_ChatRuntimeData> local_2_3 = this.GetChatRuntimeData();
            local_3_2.SetbShowFriendSearchResult();
            this.SetbPendingFriendSearchAfterValidation(false);
            this.SetPendingFriendSearchTrimmedText("");
            this.GetModify_StringValidationHelper().StopValidation();
            this.SetbSearchInputValid(true);
            this.RefreshSearchState();
        }
        return;
    }
    void OnFriendSearchStateChange()
    {
        this.RefreshSearchState();
        return;
    }
    void TickSearchInputValidation()
    {
        int local_28 = 0;
        if (!(this.GetStringValidationHelper().IsStarted()))
        {
            return;
        }
        if (this.GetStringValidationHelper().IsInProgress())
        {
            this.GetModify_StringValidationHelper().TickValidation();
        }
        if (this.GetStringValidationHelper().IsInProgress())
        {
            return;
        }
        EStringValidationResult local_3 = this.GetStringValidationHelper().GetValidationResult();
        if (this.GetbPendingFriendSearchAfterValidation())
        {
            if (!((this.GetTempInputText().TrimStartAndEnd() == this.GetPendingFriendSearchTrimmedText())))
            {
                this.SetbPendingFriendSearchAfterValidation(false);
                this.SetPendingFriendSearchTrimmedText("");
                this.ApplyHelperResultToSearchInputState(EStringValidationResult(local_3));
                return;
            }
            this.SetbPendingFriendSearchAfterValidation(false);
            FString local_16 = FString(this.GetPendingFriendSearchTrimmedText());
            this.SetPendingFriendSearchTrimmedText("");
            if ((int(local_3)) == 0)
            {
                if (this.GetFriendDataModel().IsValid())
                {
                    FEUIModelRef local_26 = this.GetFriendDataModel().opImplConv();
                    FEUIMessageBus::Publish(EUIMessageBus);
                    local_28.SearchText = local_16;
                }
            }
            else
            {
                if ((int(local_3)) == 1)
                {
                    ::FriendUtil::PublishDeferredPopup(true, this.GetStringValidationHelper().GetFailReason());
                }
            }
            return;
        }
        this.ApplyHelperResultToSearchInputState(EStringValidationResult(local_3));
        return;
    }
    void ApplySearchInputFromEdit(const FString &inout Raw)
    {
        if (this.GetbPendingFriendSearchAfterValidation() && !((Raw.TrimStartAndEnd() == this.GetPendingFriendSearchTrimmedText())))
        {
            this.SetbPendingFriendSearchAfterValidation(false);
            this.SetPendingFriendSearchTrimmedText("");
        }
        this.SetTempInputText(Raw.TrimStartAndEnd());
        return;
    }
    void ClearSearchResult()
    {
        this.SetbPendingFriendSearchAfterValidation(false);
        this.SetPendingFriendSearchTrimmedText("");
        this.SetAlreadyInputText("");
        this.SetTempInputText("");
        this.OnInputTextChanged();
        if (this.GetChatRuntimeData().IsValid())
        {
            TEUIModelRef<FMS_ChatRuntimeData> local_4 = this.GetChatRuntimeData();
            false.SetbShowFriendSearchResult();
        }
        this.GetModify_StringValidationHelper().StopValidation();
        this.SetbSearchInputValid(true);
        return;
    }
    void OnBeginSearch()
    {
        int local_20 = 0;
        const UPlayerInfoSettings local_22;
        if (!(this.GetFriendDataModel().IsValid()))
        {
            return;
        }
        FString local_12 = this.GetTempInputText().TrimStartAndEnd();
        if (local_12.IsEmpty())
        {
            ::FriendUtil::ShowSearchFriendEmptyWeakTips();
            return;
        }
        if (this.IsAllAsciiDigits(local_12))
        {
            FEUIModelRef local_18 = this.GetFriendDataModel().opImplConv();
            FEUIMessageBus::Publish(EUIMessageBus);
            local_20.SearchText = local_12;
            return;
        }
        GetGameplaySettings<UPlayerInfoSettings> local_24;
        local_22 = local_24;
        if ((!((local_22.PlayerNameValidator != nullptr))))
        {
            XError(ELog(74), "жњЄй…ЌзЅ®жµз§°ж ЎйЄЊпјЊж— жі•жЊ‰жµз§°жђњзґў");
            return;
        }
        this.SetbPendingFriendSearchAfterValidation(false);
        this.SetPendingFriendSearchTrimmedText("");
        this.GetModify_StringValidationHelper().StopValidation();
        this.GetModify_StringValidationHelper().SetString(local_12);
        this.GetModify_StringValidationHelper().StartValidation();
        EStringValidationResult local_31 = this.GetStringValidationHelper().GetValidationResult();
        if ((int(local_31)) == 2)
        {
            this.SetbPendingFriendSearchAfterValidation(true);
            this.SetPendingFriendSearchTrimmedText(local_12);
            return;
        }
        if ((int(local_31)) != 0)
        {
            ::FriendUtil::PublishDeferredPopup(true, this.GetStringValidationHelper().GetFailReason());
            return;
        }
        FEUIModelRef local_18_2 = this.GetFriendDataModel().opImplConv();
        FEUIMessageBus::Publish(EUIMessageBus);
        local_20.SearchText = local_12;
        return;
    }
    void RefreshSearchState()
    {
        if (this.GetChatRuntimeData().IsValid())
        {
            TEUIModelRef<FMS_ChatRuntimeData> local_2 = this.GetChatRuntimeData();
            this.SetbShowSearchResult(GetbShowFriendSearchResult());
        }
        return;
    }
    void SyncInputTextFromRuntimeCache()
    {
        if (this.GetChatRuntimeData().IsValid())
        {
            TEUIModelRef<FMS_ChatRuntimeData> local_2 = this.GetChatRuntimeData();
            this.SetAlreadyInputText(GetCachedSearchFriendInputText());
        }
        return;
    }
    bool IsAllAsciiDigits(const FString &inout S) const
    {
        if (S.IsEmpty())
        {
            return false;
        }
        int local_2 = 0;
        for (; local_2 < S.Len(); ++local_2)
        {
            int local_4 = S[local_2];
            if ((local_4 < 48 || (local_4 > 57)))
            {
                return false;
            }
        }
        return true;
    }
    void ApplyHelperResultToSearchInputState(const EStringValidationResult R)
    {
        this.SetbSearchInputValid((int(R) == 0));
        return;
    }
    TEUIModelRef<FMS_ChatRuntimeData> GetChatRuntimeData() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ChatRuntimeData;
    }
    void SetChatRuntimeData(const TEUIModelRef<FMS_ChatRuntimeData> &inout __Value) property
    {
        TEUIModelRef<FMS_ChatRuntimeData> local_2;
        local_2 = this.m_ChatRuntimeData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ChatRuntimeData = __Value;
        return;
    }
    TEUIModelRef<FMS_FriendDataModel> GetFriendDataModel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_FriendDataModel;
    }
    void SetFriendDataModel(const TEUIModelRef<FMS_FriendDataModel> &inout __Value) property
    {
        TEUIModelRef<FMS_FriendDataModel> local_2;
        local_2 = this.m_FriendDataModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_FriendDataModel = __Value;
        return;
    }
    const FString GetAlreadyInputText() const property
    {
        const FString __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FString GetModify_AlreadyInputText() property
    {
        FString __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAlreadyInputText(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AlreadyInputText = __Value;
        return;
    }
    const FString GetTempInputText() const property
    {
        const FString __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FString GetModify_TempInputText() property
    {
        FString __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTempInputText(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TempInputText = __Value;
        return;
    }
    bool GetbShowSearchResult() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bShowSearchResult;
    }
    void SetbShowSearchResult(const bool __Value) property
    {
        if (!(this.m_bShowSearchResult) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bShowSearchResult = __Value;
        return;
    }
    const FStringValidationHelper GetStringValidationHelper() const property
    {
        const FStringValidationHelper __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FStringValidationHelper GetModify_StringValidationHelper() property
    {
        FStringValidationHelper __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetStringValidationHelper(const FStringValidationHelper &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        return;
    }
    bool GetbSearchInputValid() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bSearchInputValid;
    }
    void SetbSearchInputValid(const bool __Value) property
    {
        if (!(this.m_bSearchInputValid) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bSearchInputValid = __Value;
        return;
    }
    bool GetbPendingFriendSearchAfterValidation() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bPendingFriendSearchAfterValidation;
    }
    void SetbPendingFriendSearchAfterValidation(const bool __Value) property
    {
        if (!(this.m_bPendingFriendSearchAfterValidation) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bPendingFriendSearchAfterValidation = __Value;
        return;
    }
    const FString GetPendingFriendSearchTrimmedText() const property
    {
        const FString __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FString GetModify_PendingFriendSearchTrimmedText() property
    {
        FString __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetPendingFriendSearchTrimmedText(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_PendingFriendSearchTrimmedText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SearchFriendInput
{
    UPROPERTY()
    bool IsShowCancelButton;
    UPROPERTY()
    TEUIModelRef<FVM_SearchFriendInput> Self;


}

namespace FVM_SearchFriendInput
{
FVM_SearchFriendInput& Create(const UObject ContextObject)
{
    return FVM_SearchFriendInput::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SearchFriendInput CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SearchFriendInput __r;
    TEUIModelRef<FVM_SearchFriendInput> local_6 = TEUIModelRef<FVM_SearchFriendInput>(EUIInternal::MakeModelWithManager(Manager, FVM_SearchFriendInput::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_SearchFriendInput;
}
void __OnInputTextChanged(FVM_SearchFriendInput &inout Model)
{
    Model.OnInputTextChanged();
    return;
}
void __OnFriendSearchStateChange(FVM_SearchFriendInput &inout Model)
{
    Model.OnFriendSearchStateChange();
    return;
}
void __TickSearchInputValidation(FVM_SearchFriendInput &inout Model)
{
    Model.TickSearchInputValidation();
    return;
}
bool __UIGetter_bShowSearchResult(const FVM_SearchFriendInput &inout Model)
{
    return Model.GetbShowSearchResult();
}
bool __UIGetter_IsShowCancelButton(const FVM_SearchFriendInput &inout Model)
{
    return Model.IsShowCancelButton();
}
TEUIModelRef<FVM_SearchFriendInput> __UIGetter_Self(const FVM_SearchFriendInput &inout Model)
{
    return TEUIModelRef<FVM_SearchFriendInput>(Model);
}
int __IndexOf_ChatRuntimeData()
{
    return 0;
}
int __IndexOf_FriendDataModel()
{
    return 1;
}
int __IndexOf_AlreadyInputText()
{
    return 2;
}
int __IndexOf_TempInputText()
{
    return 3;
}
int __IndexOf_bShowSearchResult()
{
    return 4;
}
int __IndexOf_StringValidationHelper()
{
    return 5;
}
int __IndexOf_bSearchInputValid()
{
    return 6;
}
int __IndexOf_bPendingFriendSearchAfterValidation()
{
    return 7;
}
int __IndexOf_PendingFriendSearchTrimmedText()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_SearchFriendInput
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
