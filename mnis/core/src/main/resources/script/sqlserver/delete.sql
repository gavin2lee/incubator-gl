--删除生命体征记录
DELETE FROM dbo.PAT_BODYSIGN_DETAIL;
DELETE FROM dbo.PAT_EVENT;
DELETE FROM dbo.PAT_SKIN_TEST;
DELETE FROM dbo.PAT_BODYSIGN_MAS;

--删除医嘱执行记录
DELETE FROM dbo.PAT_INFUSION_MONITOR_ITEM;
DELETE FROM dbo.PAT_INFUSION_MONITOR;
DELETE FROM dbo.PAT_SKIN_TEST;
DELETE FROM dbo.PAT_ORDER_EXEC;

--删除医嘱记录
DELETE FROM dbo.PAT_ORDER_ITEM;
DELETE FROM dbo.PAT_ORDER_GROUP;
DELETE FROM dbo.PAT_ORDER_ORIGINAL;

--删除病房巡视
DELETE FROM dbo.NURSE_WARD_PATROL;

