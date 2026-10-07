
namespace FEcoWorldStateUtils
{
    const FPlTerm None = FPlTerm();
    const FStatID StatContextCreate = FStatID();

FEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FEcoQueryContext __r; return __r;
}
FEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FEcoQueryContext __r; return __r;
}
FEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2, const FPlTerm &inout Arg3)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FEcoQueryContext __r; return __r;
}
FEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2, const FPlTerm &inout Arg3, const FPlTerm &inout Arg4)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FEcoQueryContext __r; return __r;
}
FEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2, const FPlTerm &inout Arg3, const FPlTerm &inout Arg4, const FPlTerm &inout Arg5)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FEcoQueryContext __r; return __r;
}
FEcoQueryContext Context(const FEcoFunctorDeclare &inout Declare, const FPlTerm &inout Arg1, const FPlTerm &inout Arg2, const FPlTerm &inout Arg3, const FPlTerm &inout Arg4, const FPlTerm &inout Arg5, const FPlTerm &inout Arg6, const FPlTerm &inout Arg7 = None, const FPlTerm &inout Arg8 = None)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FEcoQueryContext __r; return __r;
}
}
void GetQueryValueResultByArgIndex(FEcoQuery &inout Query, const int Index, TArray<FTermValue> &out ResultValue)
{
    TArray<FTermValue> local_4;
    ResultValue = local_4;
    Query.OnlyRecord(Index);
    while (Query.NextSolution())
    {
        ResultValue.Add(Query.RecordValue(Index));
    }
    Query.Close();
    return;
}
void GetUniqueStrResultByArgIndex(FEcoQuery &inout Query, const int Index, TArray<FString> &out ResultValue)
{
    TArray<FString> local_4;
    ResultValue = local_4;
    Query.OnlyRecord(Index);
    TSet<FTermValue> local_44;
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
bool GetFirstResultByArgIndex(FEcoQuery &inout Query, const int Index, FTermValue &out ResultValue)
{
    FTermValue local_4;
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
bool GetFirstStrResultByArgIndex(FEcoQuery &inout Query, const int Index, FString &out ResultValue)
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
