
enum EPresentationSpotDecoractor
{
    Guide,
    Mark,
    Mission,
    BossLowHP,
    MAX,
}

FBitSet32 GetDecoractorsBitSet(const FM_Spot &inout Spot, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    if (Spot)
    {
        if (FInstancedStruct(PresentationDataUtils::GetPresentationData(Spot, EPresentationDataType(8), View)).IsValid())
        {
            Get local_10;
            return local_10.opCall();
        }
    }
    return FBitSet32();
}
TArray<EPresentationSpotDecoractor> GetDecoractors(const FM_Spot &inout Spot, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    TArray<EPresentationSpotDecoractor> local_4;
    FBitSet32 local_5 = GetDecoractorsBitSet(Spot, View);
    if (!(local_5.IsEmpty()))
    {
        int local_8 = 0;
        for (; local_8 < 4; ++local_8)
        {
            if (local_5.GetBit(local_8))
            {
                local_4.Add(EPresentationSpotDecoractor(local_8));
            }
        }
    }
    return local_4;
}
bool HasDecoractor(const FM_Spot &inout Spot, const EPresentationSpotDecoractor Decoractor, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    return GetDecoractorsBitSet(Spot, View).GetBit(int(Decoractor));
}
bool HasAnyDecorator(const FM_Spot &inout Spot, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    FBitSet32 local_1 = GetDecoractorsBitSet(Spot, View);
    return !(local_1.IsEmpty());
}
void AddDecoractor(FM_Spot &inout Spot, const EPresentationSpotDecoractor Decoractor, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    if (Spot)
    {
        FBitSet32 local_2;
        FInstancedStruct local_16;
        if (local_16.IsValid())
        {
            Get local_20;
            local_2 = local_20.opCall();
        }
        if (!(local_2.GetBit(int(Decoractor))))
        {
            local_2.SetBit(int(Decoractor), true);
            EPresentationDataType local_26;
            FInstancedStruct::Make(local_26);
        }
    }
    return;
}
void RemoveDecoractor(FM_Spot &inout Spot, const EPresentationSpotDecoractor Decoractor, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    if (Spot)
    {
        int local_11 = 8;
        FInstancedStruct local_16;
        if (local_16.IsValid())
        {
            Get local_22;
            FBitSet32 local_17 = local_22.opCall();
            if (local_17.GetBit(int(Decoractor)))
            {
                local_17.SetBit(int(Decoractor), false);
                if (local_17.IsEmpty())
                {
                    PresentationDataUtils::RemovePresentationData(Spot, EPresentationDataType(8), Registry);
                }
                else
                {
                    EPresentationDataType local_28;
                    FInstancedStruct::Make(local_28);
                    local_11 = 8;
                }
            }
        }
    }
    return;
}
