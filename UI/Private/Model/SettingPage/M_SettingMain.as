namespace FMS_SettingMain
{
    const int ModelId = 0;

}
struct FMS_SettingMain : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FVMS_SettingPage> m_Settings;
    UPROPERTY()
    int PrevIndex;

    FMS_SettingMain()
    {
        this.PrevIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_SettingMain(const FMS_SettingMain &inout Other)
    {
        this.PrevIndex = 0;
        this.m_Settings = Other.m_Settings;
        return;
    }
    FMS_SettingMain& opAssign(const FMS_SettingMain &inout Other)
    {
        return Other.m_Settings;
    }
    void PostConstruct()
    {
        this.SetSettings(TEUIModelRef<FVMS_SettingPage>(::FVMS_SettingPage::Get(this.GetContext().Manager)));
        return;
    }
    void OnSelectedCategoryIndexChanged()
    {
        TEUIModelRef<FVMS_SettingPage> local_4 = this.GetSettings();
        TEUIModelRef<FVMS_SettingPage> local_2 = this.GetSettings();
        if (GetCategories().IsValidIndex(GetSelectedCategoryIndex()))
        {
            TEUIModelRef<FVMS_SettingPage> local_4_2 = this.GetSettings();
            this.PrevIndex = GetSelectedCategoryIndex();
        }
        return;
    }
    TEUIModelRef<FVMS_SettingPage> GetSettings() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Settings;
    }
    void SetSettings(const TEUIModelRef<FVMS_SettingPage> &inout __Value) property
    {
        TEUIModelRef<FVMS_SettingPage> local_2;
        local_2 = this.m_Settings;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Settings = __Value;
        return;
    }
}

namespace FMS_SettingMain
{
FMS_SettingMain& Get(const UObject ContextObject)
{
    return FMS_SettingMain::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_SettingMain GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_SettingMain __r;
    TEUIModelRef<FMS_SettingMain> local_6 = TEUIModelRef<FMS_SettingMain>(EUIInternal::MakeModelWithManager(Manager, FMS_SettingMain::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelRefPropertyDirtyIndexer local_10 = FEUIModelRefPropertyDirtyIndexer(1);
    local_10.AddRefPropertyDirty(0, 0, FVMS_SettingPage::__IndexOf_SelectedCategoryIndex());
    local_10.ApplySort();
    FEUIModelRefPropertyDirty local_18;
    local_18.PropertyName = FName("Settings");
    int local_2_2 = FVMS_SettingPage::ModelId;
    int local_2_3 = local_10.GetMappingDirtyOffset(0);
    local_18.RelatedDirtyMask.SetBit(FVMS_SettingPage::__IndexOf_SelectedCategoryIndex(), true);
    Result.ListeningModelRefDirties.Add(local_18);
    FEUIModelDirtyDefine local_28;
    local_28.FunctionName = "__OnSelectedCategoryIndexChanged";
    local_28.DirtyFlags.Set(FMS_SettingMain::__IndexOf_Settings());
    local_28.DirtyFlags.Set(local_10.GetMappingDirtyIndex(0));
    Result.DirtyFunctions.Add(local_28);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_SettingMain;
}
void __OnSelectedCategoryIndexChanged(FMS_SettingMain &inout Model)
{
    Model.OnSelectedCategoryIndexChanged();
    return;
}
int __IndexOf_Settings()
{
    return 0;
}
}
