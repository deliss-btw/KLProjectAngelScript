

// NOTE: class defaults are not authored in this module: APropPrefabBase_CombatProp (default scalar field APropPrefabBase.bNoNeedPropSpecificCheck has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class APropPrefabBase_SimplePresentation : APropPrefabScriptBase
{
    APropPrefabBase_SimplePresentation()
    {
        super();
        this.PropFuncConfig.UpdateAtomFuncConfig(FPropFuncConfig().UnionByTraitName(FName("Fundamental")).UnionByTraitName(FName("UIIndicator")).UnionByTraitName(FName("HitPresentation")).UnionByTraitName(FName("AnimationPlayer")));
        return;
    }
}

class APropPrefabBase_Turret : APropPrefabScriptBase
{
    APropPrefabBase_Turret()
    {
        super();
        this.PropFuncConfig.UpdateAtomFuncConfig(FPropFuncConfig().UnionByTraitName(FName("Fundamental")).UnionByTraitName(FName("Interactable")).UnionByTraitName(FName("Turret")).UnionByTraitName(FName("UIIndicator")).UnionByTraitName(FName("Hittable")).UnionByTraitName(FName("HitPresentation")));
        return;
    }
}

class APropPrefabBase_AutoTrackTurret : APropPrefabScriptBase
{
    APropPrefabBase_AutoTrackTurret()
    {
        super();
        this.PropFuncConfig.UpdateAtomFuncConfig(FPropFuncConfig().UnionByTraitName(FName("Fundamental")).UnionByTraitName(FName("AutoTrackTurret")).UnionByTraitName(FName("UIIndicator")).UnionByTraitName(FName("Hittable")).UnionByTraitName(FName("HitPresentation")));
        return;
    }
}

class APropPrefabBase_TreasureBox : APropPrefabScriptBase
{
    APropPrefabBase_TreasureBox()
    {
        super();
        this.PropFuncConfig.UpdateAtomFuncConfig(FPropFuncConfig().UnionByTraitName(FName("Fundamental")).UnionByTraitName(FName("Interactable")).UnionByTraitName(FName("UIIndicator")).UnionByTraitName(FName("HitPresentation")).UnionByTraitName(FName("TreasureBoxDropItem")).UnionByTraitName(FName("AnimationPlayer")));
        return;
    }
}

class APropPrefabBase_CollisionTrigger : APropPrefabScriptBase
{
    APropPrefabBase_CollisionTrigger()
    {
        super();
        this.PropFuncConfig.UpdateAtomFuncConfig(FPropFuncConfig().UnionByTraitName(FName("Fundamental")).UnionByTraitName(FName("Hittable")).UnionByTraitName(FName("HitPresentation")).UnionByTraitName(FName("DropItem")).UnionByTraitName(FName("MonsterSpawner")).UnionByTraitName(FName("UIIndicator")).UnionByTraitName(FName("CameraAffector")).UnionByTraitName(FName("Movable")).UnionByTraitName(FName("AddBuff")));
        return;
    }
}

class APropPrefabBase_Trap : APropPrefabScriptBase
{
    APropPrefabBase_Trap()
    {
        super();
        this.PropFuncConfig.UpdateAtomFuncConfig(FPropFuncConfig().UnionByTraitName(FName("Fundamental")).UnionByTraitName(FName("Interactable")).UnionByTraitName(FName("Hittable")).UnionByTraitName(FName("HitPresentation")).UnionByTraitName(FName("AutoTrackTurret")).UnionByTraitName(FName("AbilityOwner")).UnionByTraitName(FName("DropItem")).UnionByTraitName(FName("MonsterSpawner")).UnionByTraitName(FName("CameraAffector")).UnionByTraitName(FName("UIIndicator")).UnionByTraitName(FName("AddBuff")));
        return;
    }
}

class APropPrefabBase_ExploitableMine : APropPrefabScriptBase
{
    APropPrefabBase_ExploitableMine()
    {
        super();
        this.PropFuncConfig.UpdateAtomFuncConfig(FPropFuncConfig().UnionByTraitName(FName("Fundamental")).UnionByTraitName(FName("Hittable")).UnionByTraitName(FName("HitPresentation")).UnionByTraitName(FName("UIIndicator")).UnionByTraitName(FName("DropItem")).UnionByTraitName(FName("MonsterSpawner")));
        return;
    }
}

class APropPrefabBase_Throwable : APropPrefabScriptBase
{
    APropPrefabBase_Throwable()
    {
        super();
        this.PropFuncConfig.UpdateAtomFuncConfig(FPropFuncConfig().UnionByTraitName(FName("Fundamental")).UnionByTraitName(FName("Interactable")).UnionByTraitName(FName("Hittable")).UnionByTraitName(FName("HitPresentation")).UnionByTraitName(FName("UIIndicator")).UnionByTraitName(FName("Movable")));
        return;
    }
}

class APropPrefabBase_Interactable : APropPrefabScriptBase
{
    APropPrefabBase_Interactable()
    {
        super();
        this.PropFuncConfig.UpdateAtomFuncConfig(FPropFuncConfig().UnionByTraitName(FName("Fundamental")).UnionByTraitName(FName("UIIndicator")).UnionByTraitName(FName("AbilityOwner")).UnionByTraitName(FName("CameraAffector")).UnionByTraitName(FName("DropItem")).UnionByTraitName(FName("MonsterSpawner")).UnionByTraitName(FName("Interactable")).UnionByTraitName(FName("HitPresentation")).UnionByTraitName(FName("AddBuff")));
        return;
    }
}

class APropPrefabBase_Cook : APropPrefabScriptBase
{
    APropPrefabBase_Cook()
    {
        super();
        this.PropFuncConfig.UpdateAtomFuncConfig(FPropFuncConfig().UnionByTraitName(FName("Fundamental")).UnionByTraitName(FName("UIIndicator")).UnionByTraitName(FName("Cook")).UnionByTraitName(FName("AbilityOwner")).UnionByTraitName(FName("CameraAffector")).UnionByTraitName(FName("HitPresentation")).UnionByTraitName(FName("Interactable")));
        return;
    }
}

class APropPrefabBase_CombatProp : APropPrefabScriptBase
{
    APropPrefabBase_CombatProp()
    {
        super();
        this.PropFuncConfig.UpdateAtomFuncConfig(FPropFuncConfig().UnionByTraitName(FName("Fundamental")).UnionByTraitName(FName("AnimationPlayer")).UnionByTraitName(FName("AbilityOwner")).UnionByTraitName(FName("UIIndicator")).UnionByTraitName(FName("Movable")).UnionByTraitName(FName("Interactable")).UnionByTraitName(FName("DropItem")).UnionByTraitName(FName("MonsterSpawner")).UnionByTraitName(FName("TreasureBoxDropItem")).UnionByTraitName(FName("Hittable")).UnionByTraitName(FName("HitPresentation")).UnionByTraitName(FName("CameraAffector")).UnionByTraitName(FName("Turret")).UnionByTraitName(FName("AddBuff")));
        return;
    }
}

