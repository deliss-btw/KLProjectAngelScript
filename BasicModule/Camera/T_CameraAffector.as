

struct FT_CameraAffector : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CameraAffector_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CameraAffector, NAME_None);
    UPROPERTY()
    bool bHas_FC_CameraAffector = false;
    UPROPERTY()
    FC_CameraAffector Config_FC_CameraAffector;


    FString ValidateConfig(const AECSPrefab Prefab) const
    {
        if (this.bHas_FC_CameraAffector)
        {
            const FCameraAffectorItem& local_4 = this.Config_FC_CameraAffector.GetConfig();
            if (!(local_4.ValidSorted()))
            {
                FString local_8 = Prefab.GetPathName(nullptr);
                FString local_12 = FString();
                return local_12.Append("Prefab [").Append(local_8).Append("] ValidateConfig Fail: CameraAffector RadisuжІЎжњ‰жЊ‰йЂ’еўћжЋ’е€—пјЃ");
            }
            if (!(local_4.ValidDataRow()))
            {
                FString local_12_2 = Prefab.GetPathName(nullptr);
                FString local_8_2 = FString();
                return local_8_2.Append("Prefab [").Append(local_12_2).Append("] ValidateConfig Fail: CameraAffector Configдё­жњ‰ж— ж•€зљ„DataRowпјЃ");
            }
        }
        return "";
    }
}

