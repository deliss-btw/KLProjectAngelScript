

struct FForeign_TestCheckEntityHasComponent : FScriptForeignAutoBinder
{
    FScriptForeignAutoBinder _base_FScriptForeignAutoBinder;

    FForeign_TestCheckEntityHasComponent()
    {
        return;
    }
    int GetArity() const
    {
        return 2;
    }
    FString GetName() const
    {
        return "fn_test_check_entity_has_component";
    }
    EForeignRet Execute(FForeignControl &inout Control, const FEcoTerm &inout EntityTerm, const FEcoTerm &inout ComponentName)
    {
        if (FECSEntity(EntityTerm.GetEntityId()).IsValid())
        {
        }
        return EForeignRet(1);
    }
}

