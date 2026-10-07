

struct FStringCheckerCharNumConfig
{
    UPROPERTY()
    bool bEnable = false;
    UPROPERTY()
    int MinNum = 0;
    UPROPERTY()
    int MaxNum = 14;
    UPROPERTY()
    int NonAsciiCharCountNum = 2;
    UPROPERTY()
    FText LargerThanMaxNumErrorMessage;
    UPROPERTY()
    FText LessThanMinNumErrorMessage;


}

struct FStringCheckerCharRange
{
    UPROPERTY()
    int StartChar = 0;
    UPROPERTY()
    int EndChar = 0;


}

struct FStringCheckerCharRangeConfig
{
    UPROPERTY()
    bool bEnable = false;
    UPROPERTY()
    bool bIsWhiteList = true;
    UPROPERTY()
    TArray<FStringCheckerCharRange> CharRangeList;
    UPROPERTY()
    FText ErrorMessage;
    UPROPERTY()
    FText InvalidCharListDelimiter = INVTEXT(", ");


}

struct FStringCheckerEmojiConfig
{
    UPROPERTY()
    bool bEnable = false;
    UPROPERTY()
    FText ErrorMessage;


}

struct FStringCheckerRegexConfig
{
    UPROPERTY()
    bool bEnable = false;
    UPROPERTY()
    FString Regex;
    UPROPERTY()
    bool bMatchForSuccess;
    UPROPERTY()
    bool bCaseSensitive;
    UPROPERTY()
    FText ErrorMessage;


}

struct FStringCheckerConfig
{
    UPROPERTY()
    FStringCheckerCharNumConfig CharNum;
    UPROPERTY()
    FStringCheckerCharRangeConfig CharRange;
    UPROPERTY()
    FStringCheckerEmojiConfig Emoji;
    UPROPERTY()
    FStringCheckerRegexConfig Regex;

    FStringCheckerConfig()
    {
        return;
    }
}

