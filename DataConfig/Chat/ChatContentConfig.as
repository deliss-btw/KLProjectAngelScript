
enum EChatSystemPbArgKind
{
    None,
    String,
    Int,
    Uint,
    Float,
    Double,
}

enum EChatSystemContentType
{
    None,
    GetItemWithRarity,
    ContextWithPlayerName,
    GetItem,
    GetVirtualItem,
    CompleteCommission,
    GetExpWihtOverflow,
    RecruitSendCommission,
}


struct FChatSystemSerializedArg
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EChatSystemPbArgKind m_Kind;
    UPROPERTY()
    FString m_Value;
    UPROPERTY()
    FString m_DisplayName;

    FChatSystemSerializedArg()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FChatSystemSerializedArg(const FChatSystemSerializedArg &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FChatSystemSerializedArg(const EChatSystemPbArgKind InKind, const FString &inout InValue)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FChatSystemSerializedArg opAssign(const FChatSystemSerializedArg &inout Other)
    {
        FChatSystemSerializedArg __r;
        this.SetKind(Other.GetKind());
        this.SetValue(Other.GetValue());
        this.SetDisplayName(Other.GetDisplayName());
        return __r;
    }
    EChatSystemPbArgKind GetKind() const property
    {
        return this.m_Kind;
    }
    void SetKind(const EChatSystemPbArgKind __Value) property
    {
        if (int(this.m_Kind) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Kind = __Value;
        return;
    }
    FString GetValue() const property
    {
        return this.m_Value;
    }
    void SetValue(const FString &inout __Value) property
    {
        if ((this.m_Value == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Value = __Value;
        return;
    }
    FString GetDisplayName() const property
    {
        return this.m_DisplayName;
    }
    void SetDisplayName(const FString &inout __Value) property
    {
        if ((this.m_DisplayName == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_DisplayName = __Value;
        return;
    }
}

struct FChatContentConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    EChatSystemContentType ContentType = EChatSystemContentType(0);
    UPROPERTY()
    FArgText Content;
    UPROPERTY()
    bool bIsShowInMiddle = false;


}

namespace FChatContentConfig
{
TDataObjectPtr<FChatContentConfig> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FChatContentConfig>();
}
FText ParseText(const FChatContentConfig &inout Config, const TArray<FTextArgument> &inout Arguments)
{
    return ArgText::FormatArgText_SpecifiedWorldContext(ECS::GetUEWorld(), Config.Content, Arguments);
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FChatSystemSerializedArg &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FChatSystemSerializedArg &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FChatSystemSerializedArg
{
int __IndexOf_Kind()
{
    return 0;
}
int __IndexOf_Value()
{
    return 1;
}
int __IndexOf_DisplayName()
{
    return 2;
}
}
