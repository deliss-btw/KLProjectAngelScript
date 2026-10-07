
enum EVirtualItemType
{
    None,
    Level_Exp,
    Coin,
    Voucher,
    Souls,
    Points,
    Battle_Token,
    MaxCount,
}


struct FVirtualItemConfig : FItemConfig
{
    FItemConfig _base_FItemConfig;
    UPROPERTY()
    EVirtualItemType VirtualType;

    default ItemType = EItemType(1);

    FVirtualItemConfig()
    {
        super();
        this.VirtualType = EVirtualItemType(0);
        this.__InitDefaults();
        return;
    }
}

namespace FVirtualItemConfig
{
FDataObjectPtr FindByKey(const EVirtualItemType &inout Value)
{
    FindByGlobalKeyValue<EVirtualItemType> local_28 = FindByGlobalKeyValue<EVirtualItemType>(__DataObjectStructName(n"FVirtualItemConfig"), Value);
    return local_28.opImplConv();
}
}
