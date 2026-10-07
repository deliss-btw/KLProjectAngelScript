

class UESMAction_EntityBBVarLifeTime : UESMBPBaseSpanAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarEntity ListeningEntityBBVar;
    UPROPERTY()
    bool bClearOnEnter = true;
    UPROPERTY()
    bool bClearOnExit = true;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bClearOnEnter)
        {
            FNameHandle_EntityBBVarEntity local_6;
            local_6;
            if (Context.GetEntity().GetBB_Entity(local_6).IsValid())
            {
                local_6;
                Context.GetEntity().SetBB_Entity(local_6, this.ListeningEntityBBVar.Name);
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bClearOnExit)
        {
            FNameHandle_EntityBBVarEntity local_6;
            local_6;
            if (Context.GetEntity().GetBB_Entity(local_6).IsValid())
            {
                local_6;
                Context.GetEntity().SetBB_Entity(local_6, this.ListeningEntityBBVar.Name);
            }
        }
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_4;
        if ((this.bClearOnEnter && this.bClearOnExit))
        {
            local_4 = "жё…й™¤ EBB <ењЁејЂе§‹/з»“жќџ> пјљ";
        }
        else
        {
            if (this.bClearOnEnter)
            {
                local_4 = " жё…й™¤ EBB <ењЁејЂе§‹>пјљ";
            }
            else
            {
                if (this.bClearOnExit)
                {
                    local_4 = " жё…й™¤ EBB <ењЁз»“жќџ>пјљ";
                }
                else
                {
                    local_4 = " жё…й™¤ EBB <жњЄз”џж•€>пјљ";
                }
            }
        }
        local_4 += this.ListeningEntityBBVar.Name.ToString();
        return local_4;
    }
}

