
enum EGTCInputImportMode
{
    InputAction,
    FixedInput,
}


UCLASS(Abstract)
class UGTCAction : UObject
{
    UPROPERTY()
    int ActionID;
    UPROPERTY()
    EGTCActionType ActionType;
    UPROPERTY()
    FFPTime StartTime;
    UPROPERTY()
    FFPTime EndTime;
    UPROPERTY()
    FName TargetUniqueName;

    UGTCAction()
    {
        return;
    }
    void OnStart(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        return;
    }
    void OnFinish(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        return;
    }
    void Execute(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        return;
    }
}

struct FGTCCameraInitTransformConfig
{
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    FRotator Rotation;

    FGTCCameraInitTransformConfig()
    {
        return;
    }
}

struct FGTCCameraStateConfig
{
    UPROPERTY()
    FRotator InputDir;
    UPROPERTY()
    FRotator FinalDir;
    UPROPERTY()
    FRotator BaseDir;
    UPROPERTY()
    bool bHasBaseDir = false;
    UPROPERTY()
    float32 ArmLength = 0.0f;
    UPROPERTY()
    FVector SocketOffset;
    UPROPERTY()
    FVector TargetOffset;
    UPROPERTY()
    FVector FollowDamping;
    UPROPERTY()
    float32 FOV = 90.0f;
    UPROPERTY()
    float32 PitchMin = -89.99f;
    UPROPERTY()
    float32 PitchMax = 89.99f;
    UPROPERTY()
    float32 EyePosVerticalOffset = 50.0f;
    UPROPERTY()
    float32 FollowVerticalOffset = 90.0f;
    UPROPERTY()
    TArray<FString> ActiveModifierIdentifiers;
    UPROPERTY()
    TArray<FString> ActiveShakeIdentifiers;


}

struct FGTCInitConfig
{
    UPROPERTY()
    FGTCCameraInitTransformConfig CameraInitTransform;
    UPROPERTY()
    FGTCCameraStateConfig CameraState;
    UPROPERTY()
    bool bHasCameraState = false;


}

struct FGTCCameraViewConfig
{
    UPROPERTY()
    float32 Time;
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    FRotator Rotation;
    UPROPERTY()
    float32 FOV = 75.0f;


}

struct FGTCESMLayerState
{
    UPROPERTY()
    int SMIndex = 0;
    UPROPERTY()
    int StateIndex = 0;
    UPROPERTY()
    float32 StateTime = 0.0f;
    UPROPERTY()
    float32 PlaySpeed = 1.0f;


}

struct FGTCEntityConfig
{
    UPROPERTY()
    FName UniqueName;
    UPROPERTY()
    bool bUsePlayerPawn = false;
    UPROPERTY()
    bool bSpawnAsControlledPlayer = false;
    UPROPERTY()
    bool bGameSpawnedLazyBind = false;
    UPROPERTY()
    TSoftClassPtr<AECSPrefab> PrefabToSpawn;
    UPROPERTY()
    FName InitState;
    UPROPERTY()
    float32 InitStateTime = 0.0f;
    UPROPERTY()
    TArray<FGTCESMLayerState> InitESMLayers;
    UPROPERTY()
    EFaction InitFaction;
    UPROPERTY()
    FTransform InitTransform;
    UPROPERTY()
    bool bTakeSampleOnClient = true;
    UPROPERTY()
    bool bDisableCollision = false;
    UPROPERTY()
    float32 ReuseExistingRadius = 5000.0f;
    UPROPERTY()
    int RandomSeed = 0;
    UPROPERTY()
    int64 RandomInitTimeTicks = 0;


}

struct FGTCActionSource
{
    FGTCActionSource()
    {
        return;
    }
}

