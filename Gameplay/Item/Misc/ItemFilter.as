

struct FItemFilterContext
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> ItemConfig;

    FItemFilterContext()
    {
        return;
    }
}

UCLASS(Abstract)
class UItemFilterBase : UObject
{
    UItemFilterBase()
    {
        return;
    }
    bool Match(const FItemFilterContext &inout Context)
    {
        return false;
    }
}

class UItemFilter_ItemCategory : UItemFilterBase
{
    UPROPERTY()
    FGameplayTag CategoryTag;

    UItemFilter_ItemCategory()
    {
        super();
        return;
    }
    bool Match(const FItemFilterContext &inout Context)
    {
        return Context.ItemConfig.opArrow().ItemCategory.AsGameplayTag().MatchesTag(this.CategoryTag);
    }
}

class UItemFilter_And : UItemFilterBase
{
    UPROPERTY()
    TArray<UItemFilterBase> Filters;

    UItemFilter_And()
    {
        super();
        return;
    }
    bool Match(const FItemFilterContext &inout Context)
    {
        return ::ItemFilterUtils::MatchAll(this.Filters, Context);
    }
}

class UItemFilter_Or : UItemFilterBase
{
    UPROPERTY()
    TArray<UItemFilterBase> Filters;

    UItemFilter_Or()
    {
        super();
        return;
    }
    bool Match(const FItemFilterContext &inout Context)
    {
        return ::ItemFilterUtils::MatchAny(this.Filters, Context);
    }
}

class UItemFilter_Nand : UItemFilterBase
{
    UPROPERTY()
    TArray<UItemFilterBase> Filters;

    UItemFilter_Nand()
    {
        super();
        return;
    }
    bool Match(const FItemFilterContext &inout Context)
    {
        return !(::ItemFilterUtils::MatchAll(this.Filters, Context));
    }
}

class UItemFilter_Nor : UItemFilterBase
{
    UPROPERTY()
    TArray<UItemFilterBase> Filters;

    UItemFilter_Nor()
    {
        super();
        return;
    }
    bool Match(const FItemFilterContext &inout Context)
    {
        return !(::ItemFilterUtils::MatchAny(this.Filters, Context));
    }
}

namespace ItemFilterUtils
{
bool Match(const UItemFilterBase Filter, const FItemFilterContext &inout Context)
{
    if (Filter != nullptr)
    {
        return Filter.Match(Context);
    }
    return true;
}
bool MatchAll(const TArray<UItemFilterBase> &inout Filters, const FItemFilterContext &inout Context)
{
    for (auto local_16 : Filters)
    {
        if ((!((local_16 != nullptr))))
        {
            continue;
        }
        if (!(local_16.Match(Context)))
        {
            return false;
        }
    }
    return true;
}
bool MatchAny(const TArray<UItemFilterBase> &inout Filters, const FItemFilterContext &inout Context)
{
    for (auto local_16 : Filters)
    {
        if ((!((local_16 != nullptr))))
        {
            continue;
        }
        if (local_16.Match(Context))
        {
            return true;
        }
    }
    return false;
}
}
