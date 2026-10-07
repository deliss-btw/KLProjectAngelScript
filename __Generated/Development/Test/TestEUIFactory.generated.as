

struct FMyTestCodeGenFactory
{
    UPROPERTY()
    int Index;

    FMyTestCodeGenFactory(const int InIndex)
    {
        this.Index = InIndex;
        return;
    }
    void SetIndex(const int InIndex)
    {
        this.Index = InIndex;
        return;
    }
    TEUIModelRef<FVM_TestEUICanvasSlot> Product_FVM_TestEUICanvasSlot(const UObject ContextObject) const
    {
        Product local_2;
        return TEUIModelRef<FVM_TestEUICanvasSlot>(local_2.opImplConv());
    }
}

namespace __FMyTestCodeGenFactoryHelperFunctions
{
UFUNCTION()
FEUIModelRef Product_FVM_TestEUICanvasSlot(const FMyTestCodeGenFactory &inout ModelFactory)
{
    return ModelFactory.Product_FVM_TestEUICanvasSlot(GetCurrentWorld()).opImplConv();
}
}
