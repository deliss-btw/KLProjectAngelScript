class AGTCEmptyPrefab : AKLLevelPrefabBase
{
    AGTCEmptyPrefab()
    {
        return;
    }
}

class AGTCGameTestPrefab : AGTCEmptyPrefab
{
    UPROPERTY()
    FT_GameTest GameTestConfig;

    AGTCGameTestPrefab()
    {
        super();
        return;
    }
}

