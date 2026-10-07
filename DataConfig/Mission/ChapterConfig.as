

struct FChapterConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText ChapterNumber;
    UPROPERTY()
    FText ChapterTitle;
    UPROPERTY()
    int SortPriority = 0;


}

