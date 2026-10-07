
void Test_KLText(FUnitTest &inout T)
{
    FString local_4 = "112233рџЊ дё­ж–‡";
    FString local_8 = "112233дё­ж–‡";
    T.AssertTrue(KLText::ContainsEmoji(local_4), "");
    T.AssertFalse(KLText::ContainsEmoji(local_8), "");
    FString local_14 = local_4;
    T.AssertTrue(KLText::RemoveEmojiFromString(local_14), "");
    T.AssertEquals(local_8, local_14, "");
    return;
}
