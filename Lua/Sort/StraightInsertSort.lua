--[[
	file: 	StraightInsertSort.lua
	author: stchan
	date: 	2015-11-17
--]]

-- 记录循环的次数
RunCount = 0

-- 直接插入排序
function StraightInsertSort(DataTable)
    for i=2,#DataTable do
        local j = i - 1
        local temp = DataTable[i]
        while j >= 1 and DataTable[j] >= temp do
            DataTable[j+1] = DataTable[j]
            j = j - 1
            RunCount = RunCount + 1
        end

        -- 注意的是上面的循环里j已经减一了
        DataTable[j+1] = temp
        RunCount = RunCount + 1
    end
end

local _DataTable = {}
for i=1, 3000 do
    _DataTable[i] = math.random()
end

--print("排序前：", RunCount, table.concat(_DataTable, " "))

local TimeStart = os.clock()
StraightInsertSort(_DataTable)
local TimeEnd = os.clock()
--print("排序后：", RunCount, table.concat(_DataTable, " "))
print("用时：", TimeEnd - TimeStart)
