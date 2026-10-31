TEUIModelRef<FM_Player> GetPlayer(const FM_Spot &inout Spot)
{
    if (Spot)
    {
        FSpotViewAdapter local_10;
        if (FInstancedStruct(PresentationDataUtils::GetPresentationData(Spot, EPresentationDataType(7), local_10)).IsValid())
        {
            Get local_26;
            return TEUIModelRef<FM_Player>(local_26.opCall());
        }
    }
    return TEUIModelRef<FM_Player>();
}
void SetPlayer(FM_Spot &inout Spot, const TEUIModelRef<FM_Player> &inout Player)
{
    FEUIModelRef local_2;
    FEUIModelRef local_8;
    TEUIModelRef<FM_SpotRegistry> local_10 = TEUIModelRef<FM_SpotRegistry>(local_8);
    Player;
    PresentationDataUtils::AddPresentationData(Spot, EPresentationDataType(7), FInstancedStruct::Make(local_2), local_2);
    return;
}
