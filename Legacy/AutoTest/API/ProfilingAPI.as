
namespace AutoTest::API::ProfilingAPI
{
bool IsDumpDcUnderCapture()
{
    return KLProfilingFunctionRuntime::IsDumpDcUnderCapture();
}
bool IsDumpNiagaraProfilingUnderCapture()
{
    return KLProfilingFunctionRuntime::IsDumpNiagaraProfilingUnderCapture();
}
bool IsDumpStreamingUnderCapture()
{
    return KLProfilingFunctionRuntime::IsDumpStreamingUnderCapture();
}
bool IsDumpFrameEventsUnderCapture()
{
    return KLProfilingFunctionRuntime::IsDumpFrameEventsUnderCapture();
}
}
