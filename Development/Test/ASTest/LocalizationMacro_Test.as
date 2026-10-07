

void Test_LocalizationMacro(FUnitTest &inout T)
{
    T.AssertEquals("nNSLOCTEXT test Same Namespace", NSLOCTEXT("LocalizationMacro_Test", "LocalizationMacro_TestSameNamespace", "nNSLOCTEXT test Same Namespace").ToString(), "");
    T.AssertEquals("nNSLOCTEXT test Different Namespace", NSLOCTEXT("LocalizationMacro_TestDifferent", "LocalizationMacro_TestDifferentNamespace", "nNSLOCTEXT test Different Namespace").ToString(), "");
    T.AssertEquals("nLOCTEXT test", NSLOCTEXT("LocalizationMacro_TestLoctext", "nLOCTEXT test").ToString(), "");
    return;
}
