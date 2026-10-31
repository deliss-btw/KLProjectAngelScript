enum ENPCDailyRouteStayTimeMode
{
    Fixed,
    RandomRange,
}

struct FNPCDailyRouteStayTimeConfig
{
    UPROPERTY()
    ENPCDailyRouteStayTimeMode Mode = ENPCDailyRouteStayTimeMode(0);
    UPROPERTY()
    float32 FixedTime = 0.0f;
    UPROPERTY()
    float32 MinTime = 0.0f;
    UPROPERTY()
    float32 MaxTime = 0.0f;

    bool IsValid() const
    {
        int local_8;
        int local_10;
        if (int(this.Mode) == 0)
        {
            bool local_7 = (this.FixedTime >= 0.0f);
            local_10 = local_7;
        }
        else
        {
            if (this.MinTime < 0.0f)
            {
                local_8 = 0;
            }
            else
            {
                bool local_9 = (this.MaxTime >= this.MinTime);
                local_8 = local_9;
            }
            local_10 = local_8;
        }
        return (local_10 != 0);
    }
    float32 GetMinTime() const
    {
        float32 local_5 = 0.0f;
        if (int(this.Mode) == 0)
        {
        }
        else
        {
        }
        return local_5;
    }
    float32 GetMaxTime() const
    {
        float32 local_5 = 0.0f;
        if (int(this.Mode) == 0)
        {
        }
        else
        {
        }
        return local_5;
    }
}

struct FNPCDailyRouteNodeConfig
{
    UPROPERTY()
    FName PointId = NAME_None;
    UPROPERTY()
    FNPCDailyRouteStayTimeConfig StayTime;

    FNPCDailyRouteNodeConfig()
    {
        return;
    }
}

struct FNPCDailyRouteConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FName RouteSourceId;
    UPROPERTY()
    FName PlanName;
    UPROPERTY()
    TArray<FNPCDailyRouteNodeConfig> Nodes;
    UPROPERTY()
    int LoopStartIndex;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FNPCDailyRouteConfig.Get());

    FNPCDailyRouteConfig()
    {
        this.RouteSourceId = NAME_None;
        this.PlanName = NAME_None;
        this.LoopStartIndex = 0;
        this.__InitDefaults();
        return;
    }
    bool IsLoopStartIndexValid() const
    {
        return ((this.Nodes.Num() >= 2 && (this.LoopStartIndex >= 0)) && (this.LoopStartIndex < (this.Nodes.Num() - 1)));
    }
    bool HasRouteNodes() const
    {
        return (this.Nodes.Num() >= 2);
    }
    FName GetStartLocationName() const
    {
        return this.GetStartPointId();
    }
    FName GetStartPointId() const
    {
        FName local_5;
        if (this.Nodes.Num() > 0)
        {
            local_5 = this.Nodes[0].PointId;
        }
        else
        {
            local_5 = NAME_None;
        }
        return local_5;
    }
    int GetNextNodeIndex(const int CurrentNodeIndex) const
    {
        if (this.Nodes.Num() == 0)
        {
            return -1;
        }
        int local_1 = CurrentNodeIndex + 1;
        if (this.Nodes.IsValidIndex(local_1))
        {
            return local_1;
        }
        return this.IsLoopStartIndexValid() ? this.LoopStartIndex : 0;
    }
    FNPCDailyRouteNodeConfig GetRouteNode(const int NodeIndex) const
    {
        FNPCDailyRouteNodeConfig local_14;
        if (this.Nodes.IsValidIndex(NodeIndex))
        {
            local_14 = this.Nodes[NodeIndex];
        }
        else
        {
            FNPCDailyRouteNodeConfig local_8;
            local_14 = local_8;
        }
        return local_14;
    }
    FDataObjectValidationResult IsDataValidImpl_Implementation() const
    {
        FDataObjectValidationResult local_16;
        if (this.RouteSourceId.IsNone())
        {
            local_16.Error = FString("路网源ID不能为空");
            return local_16;
        }
        if (this.PlanName.IsNone())
        {
            local_16.Error = FString("路线方案名不能为空");
            return local_16;
        }
        if (this.Nodes.Num() < 2)
        {
            local_16.Error = FString("NPC日常路线至少需要两个节点");
            return local_16;
        }
        int local_25 = 0;
        for (; local_25 < this.Nodes.Num(); ++local_25)
        {
            FNPCDailyRouteNodeConfig local_32;
            FNPCDailyRouteNodeConfig local_38;
            local_38 = this.Nodes[local_25];
            local_32 = local_38;
            if (local_32.PointId.IsNone())
            {
                local_16.Error = FString().Append("路线节点[").Append(local_25).Append("]区域点ID不能为空");
                return local_16;
            }
            if (!(local_32.StayTime.IsValid()))
            {
                local_16.Error = FString().Append("路线节点[").Append(local_25).Append("]停留时间配置非法");
                return local_16;
            }
            if ((local_25 > 0 && (FName(this.Nodes[(local_25 - 1)].PointId) == local_32.PointId)))
            {
                local_16.Error = FString().Append("路线节点[").Append((local_25 - 1)).Append("]和[").Append(local_25).Append("]不能引用同一个区域点[").Append(local_32.PointId).Append("]");
                return local_16;
            }
        }
        if (!(this.IsLoopStartIndexValid()))
        {
            local_16.Error = FString().Append("循环起点索引[").Append(this.LoopStartIndex).Append("]必须指向最后一个节点之前的路线节点");
            return local_16;
        }
        if ((FName(this.Nodes.Last(0).PointId) == this.Nodes[this.LoopStartIndex].PointId))
        {
            local_16.Error = FString().Append("路线末尾节点和循环起点不能引用同一个区域点[").Append(this.Nodes.Last(0).PointId).Append("]");
        }
        return local_16;
    }
}

