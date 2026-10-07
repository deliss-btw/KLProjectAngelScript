
namespace CGPlayerUtils
{
UFUNCTION()
bool OpenCGPlayerByDataObject(const ULocalPlayer LocalPlayer, const TDataObjectPtr<FCGConfig> &inout CGConfig)
{
    if ((!((LocalPlayer != nullptr))))
    {
        XError(ELog(16), "CGPlayerUtils::OpenCGPlayerByDataObject failed: LocalPlayer is null");
        return false;
    }
    if (!(CGConfig.IsSet()))
    {
        XError(ELog(16), "CGPlayerUtils::OpenCGPlayerByDataObject failed: CG config is invalid");
        return false;
    }
    FEUIWidget::AddWidget(LocalPlayer, GameplayTags::UI_Type_CGPlayer, FEUIModelRef(FVM_CGPlayer::Create(LocalPlayer, CGConfig)));
    return true;
}
}
