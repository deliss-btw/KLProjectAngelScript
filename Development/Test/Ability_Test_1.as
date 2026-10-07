

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
        ELog local_12;
        this.TestInt0 = (this.GetOwnerEntity().GetIdValue() * 10000);
        if (this.GetIsServer())
        {
            FString::Format("Server", "[{0}] Test debug {1}", local_12);
            return;
        }
        FString::Format("Client", "[{0}] Test debug {1}", local_12);
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

