
TEUIModelRef<FM_Player> GetPlayer(const FM_Spot &inout Spot)
{
    if (Spot)
    {
        FInstancedStruct local_16;
        if (local_16.IsValid())
        {
            Get local_26;
            return TEUIModelRef<FM_Player>(local_26.opCall());
        }
    }
    return TEUIModelRef<FM_Player>();
}
void SetPlayer(FM_Spot &inout Spot, const TEUIModelRef<FM_Player> &inout Player)
{
    FEUIModelRef local_8;
    TEUIModelRef<FM_SpotRegistry> local_10 = TEUIModelRef<FM_SpotRegistry>(local_8);
    Player;
    EPresentationDataType local_6;
    FInstancedStruct::Make(local_6);
    return;
}
