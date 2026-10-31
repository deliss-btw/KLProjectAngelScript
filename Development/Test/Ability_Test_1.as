class UAS_Ability_Test_1 : UEASAbility
{
    UPROPERTY()
    int TestInt0;
    UPROPERTY()
    float32 TestInt1;

    UAS_Ability_Test_1()
    {
        return;
    }
    UFUNCTION()
    void OnAdd_Implementation()
    {
        this.TestInt0 = (this.GetOwnerEntity().GetIdValue() * 10000);
        if (this.GetIsServer())
        {
            XError(ELog(0), FString::Format("[{0}] Test debug {1}", "Server", this.TestInt0));
            return;
        }
        XWarning(ELog(0), FString::Format("[{0}] Test debug {1}", "Client", this.TestInt0));
        return;
    }
    UFUNCTION()
    void OnTick_Implementation(const FFPTime &inout DeltaTime)
    {
        if (this.GetIsServer())
        {
            this.TestInt0 += 10;
            return;
        }
        ++this.TestInt0;
        return;
    }
}

