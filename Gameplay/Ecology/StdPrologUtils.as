
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
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FLegacyEcoQueryContext __r; return __r;
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FLegacyEcoQueryContext __r; return __r;
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FLegacyEcoQueryContext __r; return __r;
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2, const FPlTerm &inout Arg3)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FLegacyEcoQueryContext __r; return __r;
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2, const FPlTerm &inout Arg3, const FPlTerm &inout Arg4)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FLegacyEcoQueryContext __r; return __r;
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2, const FPlTerm &inout Arg3, const FPlTerm &inout Arg4, const FPlTerm &inout Arg5)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FLegacyEcoQueryContext __r; return __r;
}
FLegacyEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2, const FPlTerm &inout Arg3, const FPlTerm &inout Arg4, const FPlTerm &inout Arg5, const FPlTerm &inout Arg6, const FPlTerm &inout Arg7 = None, const FPlTerm &inout Arg8 = None)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FLegacyEcoQueryContext __r; return __r;
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
