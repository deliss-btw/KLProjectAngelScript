
namespace FEasyMenuLegacyBridge
{
FString BuildPythonBridgeCommandByKey(const FString &inout CmdKey)
{
    return ((((FString("py import os,sys,importlib,unreal; root=unreal.Paths.project_content_dir(); target='EasyMenuLegacyBridge.py'; script_dir=next((d for d,_,fs in os.walk(root) if target in fs),''); sys.path.append(script_dir) if script_dir and script_dir not in sys.path else None; import EasyMenuLegacyBridge as B; B=importlib.reload(B); B.run_by_key('") + CmdKey)) + "')"));
}
void RunByKey(const FString &inout CmdKey)
{
    System::ExecuteConsoleCommand(__GetWorldContext(), FEasyMenuLegacyBridge::BuildPythonBridgeCommandByKey(CmdKey), nullptr);
    return;
}
void RunByGroup(const FString &inout Group, const FString &inout Action)
{
    FString local_4 = ((FString("Menu.") + Group) + ".");
    FEasyMenuLegacyBridge::RunByKey((local_4 + Action));
    return;
}
UFUNCTION()
void Menu_Env_MeshReplace()
{
    FEasyMenuLegacyBridge::RunByGroup("Env", "MeshReplace");
    return;
}
UFUNCTION()
void Menu_Env_SceneTool()
{
    FEasyMenuLegacyBridge::RunByGroup("Env", "SceneTool");
    return;
}
UFUNCTION()
void Menu_Env_PhysicalMaterial()
{
    FEasyMenuLegacyBridge::RunByGroup("Env", "PhysicalMaterial");
    return;
}
UFUNCTION()
void Menu_Character_Import()
{
    FEasyMenuLegacyBridge::RunByGroup("Character", "Import");
    return;
}
UFUNCTION()
void Menu_Character_Makeup()
{
    FEasyMenuLegacyBridge::RunByGroup("Character", "Makeup");
    return;
}
UFUNCTION()
void Menu_Character_CreateMI()
{
    FEasyMenuLegacyBridge::RunByGroup("Character", "CreateMI");
    return;
}
UFUNCTION()
void Menu_Animation_AnimPanel()
{
    ImGui_Agent_EditorSlatePanel("ImGuiAnimPanel", 1);
    return;
}
UFUNCTION()
void Menu_PCG_EUWToolBox()
{
    FEasyMenuLegacyBridge::RunByGroup("PCG", "EUWToolBox");
    return;
}
UFUNCTION()
void Menu_PCG_SMExportFBX()
{
    FEasyMenuLegacyBridge::RunByGroup("PCG", "SMExportFBX");
    return;
}
UFUNCTION()
void Menu_PCG_StaticMeshActorInstanceNum()
{
    FEasyMenuLegacyBridge::RunByGroup("PCG", "StaticMeshActorInstanceNum");
    return;
}
UFUNCTION()
void Menu_Wwise_WorkflowSwitcher()
{
    FEasyMenuLegacyBridge::RunByGroup("Wwise", "WorkflowSwitcher");
    return;
}
UFUNCTION()
void Menu_Wwise_WorkflowStatusCheck()
{
    FEasyMenuLegacyBridge::RunByGroup("Wwise", "WorkflowStatusCheck");
    return;
}
UFUNCTION()
void Menu_PV_FileBrowser()
{
    FEasyMenuLegacyBridge::RunByGroup("PV", "FileBrowser");
    return;
}
UFUNCTION()
void Menu_PV_ECSRecordSubmit()
{
    FEasyMenuLegacyBridge::RunByGroup("PV", "ECSRecordSubmit");
    return;
}
UFUNCTION()
void Menu_Camera_ImportShake()
{
    FEasyMenuLegacyBridge::RunByGroup("Camera", "ImportShake");
    return;
}
}
