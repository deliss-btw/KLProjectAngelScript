
namespace NumericUtils
{
int AsInt32(const uint Value)
{
    if (Value <= 2147483647)
    {
        return Value;
    }
    return 2147483647;
}
int AsInt32(const int Value)
{
    return Value;
}
uint AsUInt32(const int Value)
{
    if (Value >= 0)
    {
        return Value;
    }
    return 0;
}
uint AsUInt32(const uint Value)
{
    return Value;
}
}
