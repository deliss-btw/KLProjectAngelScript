

struct FAnimAimPoseAllowSource : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSet<EAnimLookSource> AllowSources;

    FAnimAimPoseAllowSource()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

