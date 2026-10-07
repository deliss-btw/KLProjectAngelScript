
enum EEUILayoutLayer
{
    Invalid,
    UnRooted,
    Dynamic,
    NATIVE_MAX = 2,
    HUD,
    Window,
    Message,
    Overall,
}

enum EEUIActionDisplaySlot
{
    Any,
    Left,
    Right,
    Top,
    Bottom,
    NATIVE_MAX = 4,
    CommonHover,
}

namespace FEUILayoutLayer
{
    const FEUILayoutLayerDefine HUDDefine = FEUILayoutLayerDefine();
    const FEUILayoutLayerDefine WindowDefine = FEUILayoutLayerDefine();
    const FEUILayoutLayerDefine MessageDefine = FEUILayoutLayerDefine();
    const FEUILayoutLayerDefine OverallDefine = FEUILayoutLayerDefine();

}
