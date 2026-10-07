

namespace FPrologUtils
{
struct FPrologQueryMapResult
{
    UPROPERTY()
    TMap<FString, FString> MapResult;

    FPrologQueryMapResult()
    {
        return;
    }
}

struct FCustomPrologQueryResult
{
    UPROPERTY()
    TArray<FPrologUtils::FPrologQueryMapResult> CustomResult;

    FCustomPrologQueryResult()
    {
        return;
    }
}

struct FPologQueryArgValueResult
{
    UPROPERTY()
    TMap<FString, FString> ArgValueResult;

    FPologQueryArgValueResult()
    {
        return;
    }
}

void PrologLog(const FString &inout Content)
{
    if (FEcologyMisc::CVar_Prolog_DebugPrologLog.GetBool())
    {
        XLog(ELog(25), Content);
    }
    return;
}
UFUNCTION()
void DebugTestPrologFunction()
{
    FFilePath local_4;
    local_4.FilePath = "MoleRes/Dev/PrologFile/prolog_test.pl";
    SwiProlog::PlConsult(local_4);
    FPlQuery local_26 = FPlQuery("entity_in_area(T, area_01)");
    FPlQueryAllResult local_32 = local_26.AllSolutionAndClose();
    int local_39 = 0;
    for (; local_39 < int(local_32.Num); )
    {
        FString local_46;
        FString local_54 = (local_46 + " ");
        FString local_50;
        Print((local_54 + local_50), 5.0f, FLinearColor::LucBlue);
        ++local_39;
    }
    return;
}
UFUNCTION()
void ConsultFile(const FString &inout FileInPrologDir, const bool bDoLog = true)
{
    FString local_4 = FileInPrologDir;
    if (!(local_4.EndsWith(".pl", ESearchCase(1))))
    {
        local_4 += ".pl";
    }
    FFilePath local_10;
    local_10.FilePath = (FString("MoleRes/Dev/PrologFile/") + local_4);
    SwiProlog::PlConsult(local_10);
    if (bDoLog)
    {
        FPrologUtils::PrologLog((FString("PrologLog: Consult File ") + local_4));
    }
    return;
}
UFUNCTION()
void UnloadFile(const FString &inout FileInPrologDir)
{
    FString local_4 = FileInPrologDir;
    if (!(local_4.EndsWith(".pl", ESearchCase(1))))
    {
        local_4 += ".pl";
    }
    FFilePath local_10;
    local_10.FilePath = (FString("MoleRes/Dev/PrologFile/") + local_4);
    SwiProlog::PlUnloadFile(local_10);
    FPrologUtils::PrologLog((FString("PrologLog: UnloadFile File ") + local_4));
    return;
}
UFUNCTION()
void CleanAllPrologData(const bool bDoLog = true)
{
    if (bDoLog)
    {
        FPrologUtils::PrologLog("PrologLog: CleanAllPrologData");
    }
    SwiProlog::PlCleanUp();
    return;
}
UFUNCTION()
void PrintQueryAllResult(FPlQueryAllResult &inout AllResult, const int TopN = -1)
{
    int local_1 = 0;
    for (; local_1 < int(AllResult.Num); ++local_1)
    {
        if ((TopN <= 0 || (local_1 < TopN)))
        {
            FString local_10;
            FString local_26 = (local_10 + " ");
            FString local_14;
            FString local_30 = (local_26 + local_14);
            local_26 = (local_30 + " ");
            FString local_18;
            local_30 = (local_26 + local_18);
            local_26 = (local_30 + " ");
            FString local_22;
            Print((local_26 + local_22), 5.0f, FLinearColor::LucBlue);
        }
    }
    return;
}
UFUNCTION()
void QueryAndPrint(const FString &inout QueryContent)
{
    FPlQuery local_20 = FPlQuery(QueryContent);
    FPlQueryAllResult local_26 = local_20.AllSolutionAndClose();
    FPrologUtils::PrintQueryAllResult(local_26, 1);
    return;
}
void InsertAtFrontFact(const FString &inout FactContent, const bool bIgnoreReplicated = true, const bool bPrintLog = true)
{
    if (bIgnoreReplicated && FPrologUtils::Is(FactContent, false))
    {
        return;
    }
    SwiProlog::PlAssert(FPlTerm(FactContent), true);
    if (bPrintLog)
    {
        FPrologUtils::PrologLog((FString("PrologLog: AddFact ") + FactContent));
    }
    return;
}
UFUNCTION()
void AddFact(const FString &inout FactContent, const bool bIgnoreReplicated = true, const bool bPrintLog = true)
{
    if (bIgnoreReplicated && FPrologUtils::Is(FactContent, false))
    {
        return;
    }
    SwiProlog::PlAssert(FPlTerm(FactContent), false);
    if (bPrintLog)
    {
        FPrologUtils::PrologLog((FString("PrologLog: AddFact ") + FactContent));
    }
    return;
}
void AddOrUpdateFact(const FString &inout FactContent, const FString &inout RetractFactIfNot)
{
    if (FPrologUtils::Is(FactContent, false))
    {
        return;
    }
    FPrologUtils::RetractFactAll(RetractFactIfNot, true, true);
    FPrologUtils::AddFact(FactContent, true, true);
    return;
}
UFUNCTION()
void AddFact1(const FString &inout Functor, const FString &inout Arg1, const bool bIgnoreReplicated = true)
{
    FString local_12 = (((Functor + "(")) + Arg1);
    FString local_8_2 = (local_12 + ")");
    if (bIgnoreReplicated && FPrologUtils::Is(local_8_2, false))
    {
        return;
    }
    SwiProlog::PlAssert(FPlTerm(local_8_2), false);
    FPrologUtils::PrologLog((FString("PrologLog: AddFact ") + local_8_2));
    return;
}
UFUNCTION()
void AddFact2(const FString &inout Functor, const FString &inout Arg1, const FString &inout Arg2, const bool bIgnoreReplicated = true)
{
    FString local_12 = (((Functor + "(")) + Arg1);
    FString local_8_2 = (local_12 + ",");
    FString local_12_2 = (local_8_2 + Arg2);
    FString local_8_3 = (local_12_2 + ")");
    if (bIgnoreReplicated && FPrologUtils::Is(local_8_3, false))
    {
        return;
    }
    SwiProlog::PlAssert(FPlTerm(local_8_3), false);
    FPrologUtils::PrologLog((FString("PrologLog: AddFact ") + local_8_3));
    return;
}
UFUNCTION()
void AddFact3(const FString &inout Functor, const FString &inout Arg1, const FString &inout Arg2, const FString &inout Arg3, const bool bIgnoreReplicated = true)
{
    FString local_12 = (((Functor + "(")) + Arg1);
    FString local_8_2 = (local_12 + ",");
    FString local_12_2 = (local_8_2 + Arg2);
    FString local_8_3 = (local_12_2 + ",");
    FString local_12_3 = (local_8_3 + Arg3);
    FString local_8_4 = (local_12_3 + ")");
    if (bIgnoreReplicated && FPrologUtils::Is(local_8_4, false))
    {
        return;
    }
    SwiProlog::PlAssert(FPlTerm(local_8_4), false);
    FPrologUtils::PrologLog((FString("PrologLog: AddFact ") + local_8_4));
    return;
}
UFUNCTION()
void AddFact4(const FString &inout Functor, const FString &inout Arg1, const FString &inout Arg2, const FString &inout Arg3, const FString &inout Arg4, const bool bIgnoreReplicated = true)
{
    FString local_12 = (((Functor + "(")) + Arg1);
    FString local_8_2 = (local_12 + ",");
    FString local_12_2 = (local_8_2 + Arg2);
    FString local_8_3 = (local_12_2 + ",");
    FString local_12_3 = (local_8_3 + Arg3);
    FString local_8_4 = (local_12_3 + ",");
    FString local_12_4 = (local_8_4 + Arg4);
    FString local_8_5 = (local_12_4 + ")");
    if (bIgnoreReplicated && FPrologUtils::Is(local_8_5, false))
    {
        return;
    }
    SwiProlog::PlAssert(FPlTerm(local_8_5), false);
    FPrologUtils::PrologLog((FString("PrologLog: AddFact ") + local_8_5));
    return;
}
UFUNCTION()
void AddFacts(const FString &inout Name, const TArray<FString> &inout Args, const bool bIgnoreReplicated = true)
{
    FString local_8 = (Name + "(");
    for (auto& local_24 : Args)
    {
        FString local_4 = (local_24 + ",");
        local_8 += local_4;
    }
    local_8 += ")";
    if (bIgnoreReplicated && FPrologUtils::Is(local_8, false))
    {
        return;
    }
    SwiProlog::PlAssert(FPlTerm(local_8), false);
    XLog(ELog(25), FString().Append("PrologLog: AddFact ").Append(local_8));
    return;
}
UFUNCTION()
void AddFactWithArrayArg(const FString &inout Functor, const TArray<FString> &inout ArrayArg)
{
    FString local_8 = (Functor + "(");
    int local_9 = 0;
    for (; local_9 < ArrayArg.Num(); ++local_9)
    {
        local_8 += ArrayArg[local_9];
        if (local_9 < (ArrayArg.Num() - 1))
        {
            local_8 += ",";
            continue;
        }
        local_8 += ")";
    }
    SwiProlog::PlAssert(FPlTerm(local_8), false);
    FPrologUtils::PrologLog((FString("AddFact ") + local_8));
    return;
}
UFUNCTION()
void RetractFact(const FString &inout FactContent)
{
    if (!(FPrologUtils::Is(FactContent, false)))
    {
        return;
    }
    SwiProlog::PlRetract(FPlTerm(FactContent));
    FPrologUtils::PrologLog((FString("PrologLog: RetractFact ") + FactContent));
    return;
}
UFUNCTION()
void RetractFactAll(const FString &inout FactContent, const bool bOnlyHandleWhenExist = true, const bool bPrintLog = true)
{
    if (bOnlyHandleWhenExist && !(FPrologUtils::Is(FactContent, false)))
    {
        return;
    }
    SwiProlog::PlRetractAll(FPlTerm(FactContent));
    if (bPrintLog)
    {
        FPrologUtils::PrologLog((FString("PrologLog: RetractAll ") + FactContent));
    }
    return;
}
UFUNCTION()
void RetractFact1(const FString &inout Functor, const FString &inout Arg1)
{
    FString local_12 = (((Functor + "(")) + Arg1);
    FString local_8_2 = (local_12 + ")");
    SwiProlog::PlRetract(FPlTerm(local_8_2));
    FPrologUtils::PrologLog((FString("PrologLog: RetractFact ") + local_8_2));
    return;
}
UFUNCTION()
void RetractFact2(const FString &inout Functor, const FString &inout Arg1, const FString &inout Arg2)
{
    FString local_12 = (((Functor + "(")) + Arg1);
    FString local_8_2 = (local_12 + ",");
    FString local_12_2 = (local_8_2 + Arg2);
    FString local_8_3 = (local_12_2 + ")");
    SwiProlog::PlRetract(FPlTerm(local_8_3));
    FPrologUtils::PrologLog((FString("PrologLog: RetractFact ") + local_8_3));
    return;
}
UFUNCTION()
void PrintPrologQueryByString(const FString &inout QueryContent, const FString &inout ConsultFilePath = "", const bool bClearAllPrologData = false, const bool bDebugTrace = true)
{
    FString local_14 = String::Conv_IntToString(FDateTime::Now().GetSecond());
    FString local_10_2 = (((local_14 + " PrologLog: ======PrintPrologQueryByString====== ") + QueryContent) + " Start");
    FPrologUtils::PrologLog(local_10_2);
    if (bClearAllPrologData)
    {
        FPrologUtils::CleanAllPrologData(true);
    }
    if (!(ConsultFilePath.IsEmpty()))
    {
        FFilePath local_24;
        local_24.FilePath = ConsultFilePath;
        SwiProlog::PlConsult(local_24);
    }
    FPlQuery local_44 = FPlQuery(QueryContent, bDebugTrace);
    FPlQueryAllResult local_50 = local_44.AllSolutionAndClose();
    int local_57 = 0;
    FString local_68;
    for (; local_57 < int(local_50.Num); )
    {
        FString local_62 = "PrologLog: ";
        int local_63 = 0;
        for (; local_63 < local_50.ArgsNum(); ++local_63)
        {
            if (!(local_44.Args.IsVariable(local_63)))
            {
                local_62 += local_68;
            }
            else
            {
                FString local_10_3 = (FString(local_44.Args.ArgNames[local_63]) + " = ");
                FString local_18_2 = (local_10_3 + local_68);
                local_62 += local_18_2;
            }
            if (local_63 < (local_50.ArgsNum() - 1))
            {
                local_62 += ", ";
            }
        }
        FPrologUtils::PrologLog(local_62);
        ++local_57;
    }
    FString local_18_3 = (local_14 + " PrologLog: ======PrintPrologQueryByString====== ");
    FPrologUtils::PrologLog(local_18_3);
    return;
}
UFUNCTION()
void DebugPrintPrologIs(const FString &inout QueryContent, const bool bDebugTrace = true)
{
    FPlQuery local_20 = FPlQuery(QueryContent, bDebugTrace);
    FString local_34 = String::Conv_IntToString(FDateTime::Now().GetSecond());
    FString local_30_2 = (((local_34 + " PrologLog: ======PrintPrologIs====== ") + QueryContent) + " Start");
    FPrologUtils::PrologLog(local_30_2);
    FPrologUtils::PrologLog(FString().Append("PrologLog: Result -> ").Append(local_20.QueryIsAndClose()));
    FString local_30_3 = (local_34 + " PrologLog: ======PrintPrologQueryByString====== ");
    FPrologUtils::PrologLog(local_30_3);
    return;
}
UFUNCTION()
bool Is(const FString &inout QueryContent, const bool bDebugPrologTrace = false)
{
    return FPlQuery(QueryContent, (FEcologyMisc::CVar_Prolog_DebugPrologTrace.GetBool() || bDebugPrologTrace)).QueryIsAndClose();
}
UFUNCTION()
bool GetFirstQueryMapResult(const FString &inout QueryContent, TMap<FString, FString> &out MapResult)
{
    TMap<FString, FString> local_20;
    MapResult = local_20;
    FPlQuery local_40 = FPlQuery(QueryContent, FEcologyMisc::CVar_Prolog_DebugPrologTrace.GetBool());
    FPlQueryAllResult local_48 = local_40.AllSolutionAndClose();
    if (int(local_48.Num) == 0)
    {
        return false;
    }
    bool local_57 = false;
    int local_58 = 0;
    for (; local_58 < local_48.ArgsNum(); ++local_58)
    {
        if (!(local_40.Args.IsVariable(local_58)))
        {
            continue;
        }
        MapResult.Add(local_40.Args.ArgNames[local_58], FString());
        local_57 = true;
    }
    return local_57;
}
UFUNCTION()
bool GetRandomQueryMapResult(const FString &inout QueryContent, TMap<FString, FString> &out MapResult)
{
    TMap<FString, FString> local_20;
    MapResult = local_20;
    FPlQuery local_40 = FPlQuery(QueryContent, FEcologyMisc::CVar_Prolog_DebugPrologTrace.GetBool());
    FPlQueryAllResult local_48 = local_40.AllSolutionAndClose();
    if (int(local_48.Num) == 0)
    {
        return false;
    }
    bool local_57 = false;
    int local_59 = FMath::RandRange(0, (int(local_48.Num) - 1));
    int local_60 = 0;
    for (; local_60 < local_48.ArgsNum(); ++local_60)
    {
        if (!(local_40.Args.IsVariable(local_60)))
        {
            continue;
        }
        MapResult.Add(local_40.Args.ArgNames[local_60], FString());
        local_57 = true;
    }
    return local_57;
}
void SimpleQuery(const FString &inout QueryContent, const bool bDebugPrologTrace = false)
{
    int local_21;
    if (FEcologyMisc::CVar_Prolog_DebugPrologTrace.GetBool())
    {
        local_21 = 1;
    }
    else
    {
        local_21 = bDebugPrologTrace;
    }
    FPlQuery local_20 = FPlQuery(QueryContent, (local_21 != 0));
    local_20.AllSolutionAndClose();
    return;
}
UFUNCTION()
bool GetQueryArgValueResult(const FString &inout QueryContent, TArray<FPrologUtils::FPologQueryArgValueResult> &out ArgValueResults, const bool bDebugPrologTrace = false)
{
    TArray<FPrologUtils::FPologQueryArgValueResult> local_4;
    ArgValueResults = local_4;
    FPlQuery local_24 = FPlQuery(QueryContent, (FEcologyMisc::CVar_Prolog_DebugPrologTrace.GetBool() || bDebugPrologTrace));
    FPlQueryAllResult local_32 = local_24.AllSolutionAndClose();
    if (int(local_32.Num) == 0)
    {
        return false;
    }
    int local_41 = 0;
    for (; local_41 < int(local_32.Num); )
    {
        FPrologUtils::FPologQueryArgValueResult local_62;
        int local_63 = 0;
        for (; local_63 < local_32.ArgsNum(); ++local_63)
        {
            if (!(local_24.Args.IsVariable(local_63)))
            {
                continue;
            }
            local_62.ArgValueResult.Add(local_24.Args.ArgNames[local_63], FString());
        }
        ArgValueResults.Add(local_62);
        ++local_41;
    }
    return !(ArgValueResults.IsEmpty());
}
UFUNCTION()
bool GetQueryValueResultByArgName(const FString &inout QueryContent, const FString &inout ArgName, TArray<FString> &out ResultValue, const bool bUnique = true, const bool bDebugPrologTrace = false)
{
    TArray<FString> local_4;
    ResultValue = local_4;
    FPlQuery local_24 = FPlQuery(QueryContent, (FEcologyMisc::CVar_Prolog_DebugPrologTrace.GetBool() || bDebugPrologTrace));
    FPlQueryAllResult local_32 = local_24.AllSolutionAndClose();
    FScopeCycleCounter local_39 = FScopeCycleCounter(FStatID(n"GetQueryValueResultByArgName Process Result"), false);
    if (int(local_32.Num) == 0)
    {
        return false;
    }
    int local_43 = 0;
    for (; local_43 < int(local_32.Num); ++local_43)
    {
        int local_44 = 0;
        for (; local_44 < local_32.ArgsNum(); ++local_44)
        {
            if (!(local_24.Args.IsVariable(local_44)))
            {
                continue;
            }
            if ((ArgName == local_24.Args.ArgNames[local_44]))
            {
                if (bUnique)
                {
                    ResultValue.AddUnique(FString());
                    continue;
                }
                ResultValue.Add(FString());
            }
        }
    }
    return !(ResultValue.IsEmpty());
}
UFUNCTION()
bool GetRandomQueryMapResultByArgName(const FString &inout QueryContent, const FString &inout ArgName, FString &out ResultValue, const bool bDebugPrologTrace = false)
{
    FString local_4;
    ResultValue = local_4;
    FPlQuery local_24 = FPlQuery(QueryContent, (FEcologyMisc::CVar_Prolog_DebugPrologTrace.GetBool() || bDebugPrologTrace));
    FPlQueryAllResult local_32 = local_24.AllSolutionAndClose();
    if (int(local_32.Num) == 0)
    {
        return false;
    }
    int local_42 = FMath::RandRange(0, (int(local_32.Num) - 1));
    int local_43 = 0;
    for (; local_43 < local_32.ArgsNum(); ++local_43)
    {
        if (!(local_24.Args.IsVariable(local_43)))
        {
            continue;
        }
        if ((ArgName == local_24.Args.ArgNames[local_43]))
        {
            FString local_48;
            ResultValue = local_48;
            return true;
        }
    }
    return false;
}
UFUNCTION()
bool GetFirstQueryResultValueByArgName(const FString &inout QueryContent, const FString &inout ArgName, FString &out ResultValue, const bool bDebugPrologTrace = false)
{
    FString local_4;
    ResultValue = local_4;
    FPlQuery local_24 = FPlQuery(QueryContent, (FEcologyMisc::CVar_Prolog_DebugPrologTrace.GetBool() || bDebugPrologTrace));
    FPlQueryAllResult local_32 = local_24.AllSolutionAndClose();
    if (int(local_32.Num) == 0)
    {
        return false;
    }
    int local_41 = 0;
    for (; local_41 < int(local_32.Num); ++local_41)
    {
        int local_42 = 0;
        for (; local_42 < local_32.ArgsNum(); ++local_42)
        {
            if (!(local_24.Args.IsVariable(local_42)))
            {
                continue;
            }
            if ((ArgName == local_24.Args.ArgNames[local_42]))
            {
                FString local_48;
                ResultValue = local_48;
                return true;
            }
        }
    }
    return false;
}
UFUNCTION()
bool CustomQuery(const FString &inout QueryContent, FPrologUtils::FCustomPrologQueryResult &out CustomPrologQueryResult)
{
    FPrologUtils::FPrologQueryMapResult local_62;
    FPlQuery local_24 = FPlQuery(QueryContent, FEcologyMisc::CVar_Prolog_DebugPrologTrace.GetBool());
    FPlQueryAllResult local_32 = local_24.AllSolutionAndClose();
    if (int(local_32.Num) == 0)
    {
        return false;
    }
    int local_41 = 0;
    for (; local_41 < int(local_32.Num); ++local_41)
    {
        CustomPrologQueryResult.CustomResult.Add(local_62);
        int local_63 = 0;
        for (; local_63 < local_32.ArgsNum(); ++local_63)
        {
            if (!(local_24.Args.IsVariable(local_63)))
            {
                continue;
            }
            local_62.MapResult.Add(local_24.Args.ArgNames[local_63], FString());
        }
    }
    return true;
}
UFUNCTION()
bool GetArgValueResultValuesByKeyName(const TArray<FPrologUtils::FPologQueryArgValueResult> &inout ArgValueResults, const FString &inout KeyName, TArray<FString> &out ValueList)
{
    TArray<FString> local_4;
    ValueList = local_4;
    FString local_8;
    for (auto& local_24 : ArgValueResults)
    {
        if (local_24.ArgValueResult.Find(KeyName, local_8))
        {
            ValueList.AddUnique(local_8);
        }
    }
    return !(ValueList.IsEmpty());
}
}
