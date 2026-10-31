namespace FStdPrologUtils
{
    const FPlTerm None = FPlTerm();
    const FStatID StatContextCreate = FStatID();

bool Exit(const FEcoFunctorDeclare &inout Declare, const TArray<FPlTerm> &inout Args, const bool bDebugPrologTrace = false)
{
    FPlFunctor local_12 = Declare.ToPlFunctor();
    if (FEcologyMisc::CVar_Prolog_DebugPrologTrace.GetBool())
    {
    }
    else
    {
        bool local_33_2 = bDebugPrologTrace;
    }
    FPlQuery local_32;
    return local_32.QueryIsAndClose();
}
void AddFact(const FEcoFunctorDeclare &inout Declare, const TArray<FPlTerm> &inout Args)
{
    if (FStdPrologUtils::Exit(Declare, Args, false))
    {
        return;
    }
    SwiProlog::PlAssert(Declare.ToPlFunctor().ConsTermList(Args), false);
    return;
}
void RetractFact(const FEcoFunctorDeclare &inout Declare, const TArray<FPlTerm> &inout Args)
{
    SwiProlog::PlRetract(Declare.ToPlFunctor().ConsTermList(Args));
    return;
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare)
{
    // body not fully recovered — stub [opcode-uncovered]
    FLegacyEcoQueryContext __r; return __r;
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1)
{
    TArray<FPlTerm> local_8 = {Arg1};
    return FLegacyEcoQueryContext::Create(Declare, local_8);
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2)
{
    TArray<FPlTerm> local_8 = {Arg1, Arg2};
    return FLegacyEcoQueryContext::Create(Declare, local_8);
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2, const FPlTerm &inout Arg3)
{
    FScopeCycleCounter local_1 = FScopeCycleCounter(FStdPrologUtils::StatContextCreate, false);
    TArray<FPlTerm> local_10 = {Arg1, Arg2, Arg3};
    return FLegacyEcoQueryContext::Create(Declare, local_10);
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2, const FPlTerm &inout Arg3, const FPlTerm &inout Arg4)
{
    TArray<FPlTerm> local_8 = {Arg1, Arg2, Arg3, Arg4};
    return FLegacyEcoQueryContext::Create(Declare, local_8);
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2, const FPlTerm &inout Arg3, const FPlTerm &inout Arg4, const FPlTerm &inout Arg5)
{
    TArray<FPlTerm> local_8 = {Arg1, Arg2, Arg3, Arg4, Arg5};
    return FLegacyEcoQueryContext::Create(Declare, local_8);
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2, const FPlTerm &inout Arg3, const FPlTerm &inout Arg4, const FPlTerm &inout Arg5, const FPlTerm &inout Arg6, const FPlTerm &inout Arg7 = None, const FPlTerm &inout Arg8 = None)
{
    bool local_15 = false;
    TArray<FPlTerm> local_8 = {Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8};
    int local_14 = local_8.Num() - 1;
    while (local_15)
    {
        local_8.RemoveAt(local_14);
        --local_14;
        if (local_14 < 0)
        {
            local_15 = false;
            continue;
        }
        local_15 = (local_14 >= int(Declare.Arity));
    }
    return FLegacyEcoQueryContext::Create(Declare, local_8);
}
}
void GetQueryValueResultByArgIndex(FLegacyEcoQuery &inout Query, const int Index, TArray<FLegacyTermValue> &out ResultValue)
{
    TArray<FLegacyTermValue> local_4;
    ResultValue = local_4;
    Query.OnlyRecord(Index);
    while (Query.NextSolution())
    {
        ResultValue.Add(Query.RecordValue(Index));
    }
    Query.Close();
    return;
}
void GetUniqueStrResultByArgIndex(FLegacyEcoQuery &inout Query, const int Index, TArray<FString> &out ResultValue)
{
    TArray<FString> local_4;
    ResultValue = local_4;
    Query.OnlyRecord(Index);
    TSet<FLegacyTermValue> local_44;
    while (Query.NextSolution())
    {
        local_44.Add(Query.RecordValue(Index));
    }
    Query.Close();
    for (auto& local_72 : local_44)
    {
        ResultValue.Add(local_72.GetString());
    }
    return;
}
bool GetFirstResultByArgIndex(FLegacyEcoQuery &inout Query, const int Index, FLegacyTermValue &out ResultValue)
{
    FLegacyTermValue local_4;
    ResultValue = local_4;
    Query.OnlyRecord(Index);
    bool local_5 = false;
    if (Query.NextSolution())
    {
        local_5 = true;
        ResultValue = Query.RecordValue(Index);
    }
    Query.Close();
    return local_5;
}
bool GetFirstStrResultByArgIndex(FLegacyEcoQuery &inout Query, const int Index, FString &out ResultValue)
{
    FString local_4;
    ResultValue = local_4;
    Query.OnlyRecord(Index);
    bool local_5 = false;
    if (Query.NextSolution())
    {
        local_5 = true;
        ResultValue = Query.RecordValue(Index).GetString();
    }
    Query.Close();
    return local_5;
}
bool LegacySimpleQueryAndClose(FLegacyEcoQuery &inout Query)
{
    bool local_1 = false;
    if (Query.NextSolution())
    {
        local_1 = true;
    }
    Query.Close();
    return local_1;
}
bool SimpleQueryAndClose(FLegacyEcoQuery &inout Query)
{
    bool local_1 = false;
    if (Query.NextSolution())
    {
        local_1 = true;
    }
    Query.Close();
    return local_1;
}
