
enum EItemSortCompareResult
{
    Less,
    Equal,
    Greater,
}


struct FItemSortContext
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> ItemConfig;
    UPROPERTY()
    int ItemNum;
    UPROPERTY()
    int64 LastModifiedTimestamp;
    UPROPERTY()
    bool bIsNewItem;


}

UCLASS(Abstract)
class UItemSorterBase : UObject
{
    UItemSorterBase()
    {
        return;
    }
    EItemSortCompareResult Compare(const FItemSortContext &inout A, const FItemSortContext &inout B)
    {
        return EItemSortCompareResult(1);
    }
}

class UItemSorter_ItemNum : UItemSorterBase
{
    UItemSorter_ItemNum()
    {
        super();
        return;
    }
    EItemSortCompareResult Compare(const FItemSortContext &inout A, const FItemSortContext &inout B)
    {
        if (int(A.ItemNum) < int(B.ItemNum))
        {
            return EItemSortCompareResult(0);
        }
        if (int(A.ItemNum) > int(B.ItemNum))
        {
            return EItemSortCompareResult(2);
        }
        return EItemSortCompareResult(1);
    }
}

class UItemSorter_ItemRarity : UItemSorterBase
{
    UItemSorter_ItemRarity()
    {
        super();
        return;
    }
    EItemSortCompareResult Compare(const FItemSortContext &inout A, const FItemSortContext &inout B)
    {
        if (int(A.ItemConfig.opArrow().Rarity) < int(B.ItemConfig.opArrow().Rarity))
        {
            return EItemSortCompareResult(0);
        }
        if (int(A.ItemConfig.opArrow().Rarity) > int(B.ItemConfig.opArrow().Rarity))
        {
            return EItemSortCompareResult(2);
        }
        return EItemSortCompareResult(1);
    }
}

class UItemSorter_EquipmentLevel : UItemSorterBase
{
    UItemSorter_EquipmentLevel()
    {
        super();
        return;
    }
    EItemSortCompareResult Compare(const FItemSortContext &inout A, const FItemSortContext &inout B)
    {
        int local_78;
        int local_80;
        CastTo local_4;
        TDataObjectPtr<FEquipmentConfig> local_28 = local_4.opCall();
        TDataObjectPtr<FEquipmentConfig> local_52 = local_4.opCall();
        if ((local_28 == nullptr))
        {
            local_78 = 0;
        }
        else
        {
            local_78 = local_28.opArrow().Level;
        }
        if ((local_52 == nullptr))
        {
            local_80 = 0;
        }
        else
        {
            local_80 = local_52.opArrow().Level;
        }
        if (local_78 < local_80)
        {
            return EItemSortCompareResult(0);
        }
        if (local_78 > local_80)
        {
            return EItemSortCompareResult(2);
        }
        return EItemSortCompareResult(1);
    }
}

class UItemSorter_NewItem : UItemSorterBase
{
    UItemSorter_NewItem()
    {
        super();
        return;
    }
    EItemSortCompareResult Compare(const FItemSortContext &inout A, const FItemSortContext &inout B)
    {
        int64 local_2;
        int64 local_6;
        if (A.bIsNewItem)
        {
            local_6 = A.LastModifiedTimestamp;
        }
        else
        {
            local_6 = 0;
        }
        if (B.bIsNewItem)
        {
            local_2 = B.LastModifiedTimestamp;
        }
        else
        {
            local_2 = 0;
        }
        if (local_6 > local_2)
        {
            return EItemSortCompareResult(0);
        }
        if (local_6 < local_2)
        {
            return EItemSortCompareResult(2);
        }
        return EItemSortCompareResult(1);
    }
}

class UItemSorter_ItemId : UItemSorterBase
{
    UItemSorter_ItemId()
    {
        super();
        return;
    }
    EItemSortCompareResult Compare(const FItemSortContext &inout A, const FItemSortContext &inout B)
    {
        if (A.ItemConfig.opArrow().DataId < B.ItemConfig.opArrow().DataId)
        {
            return EItemSortCompareResult(0);
        }
        if (A.ItemConfig.opArrow().DataId > B.ItemConfig.opArrow().DataId)
        {
            return EItemSortCompareResult(2);
        }
        return EItemSortCompareResult(1);
    }
}

class UItemSorter_Sequence : UItemSorterBase
{
    UPROPERTY()
    TArray<UItemSorterBase> Sorters;

    UItemSorter_Sequence()
    {
        super();
        return;
    }
    EItemSortCompareResult Compare(const FItemSortContext &inout A, const FItemSortContext &inout B)
    {
        return ::ItemSorterUtils::CompareSequence(this.Sorters, A, B);
    }
}

class UItemSorter_Inversed : UItemSorterBase
{
    UPROPERTY()
    UItemSorterBase Sorter;

    UItemSorter_Inversed()
    {
        super();
        return;
    }
    EItemSortCompareResult Compare(const FItemSortContext &inout A, const FItemSortContext &inout B)
    {
        return ::ItemSorterUtils::Compare(this.Sorter, B, A);
    }
}

namespace ItemSorterUtils
{
bool Cmp(const UItemSorterBase Sorter, const FItemSortContext &inout A, const FItemSortContext &inout B, const bool bAscending = true)
{
    return ItemSorterUtils::CompareResultToBoolean(ItemSorterUtils::Compare(Sorter, A, B), bAscending);
}
bool CmpSequence(const TArray<UItemSorterBase> &inout Sorters, const FItemSortContext &inout A, const FItemSortContext &inout B, const bool bAscending = true)
{
    return ItemSorterUtils::CompareResultToBoolean(ItemSorterUtils::CompareSequence(Sorters, A, B), bAscending);
}
EItemSortCompareResult Compare(const UItemSorterBase Sorter, const FItemSortContext &inout A, const FItemSortContext &inout B)
{
    if ((!((Sorter != nullptr))))
    {
        return EItemSortCompareResult(1);
    }
    return Sorter.Compare(A, B);
}
EItemSortCompareResult CompareSequence(const TArray<UItemSorterBase> &inout Sorters, const FItemSortContext &inout A, const FItemSortContext &inout B)
{
    for (auto local_16 : Sorters)
    {
        int local_19 = int((ItemSorterUtils::Compare(local_16, A, B)));
        if (local_19 <= 2)
        {
            if (local_19 != 0)
            {
                if (local_19 != 2)
                {
                }
            }
            else
            {
                return EItemSortCompareResult(0);
            }
        }
        continue;
    }
    return EItemSortCompareResult(1);
}
bool CompareResultToBoolean(const EItemSortCompareResult Result, const bool bAscending = true)
{
    switch (int(Result))
    {
    case 0:
    {
        return bAscending;
    }
    case 2:
    {
        return !(bAscending);
    }
    case 1:
    {
        return false;
    }
    }
    return false;
}
}
