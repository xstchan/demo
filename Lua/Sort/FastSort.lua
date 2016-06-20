--[[
	file: 	FastSort.lua
	author: stchan
	date: 	2015-11-18
--]]

-- 统计循环次数
local RunCounter = RunCounter or 0
local function RunCount()
	RunCounter = RunCounter + 1
end


-- 调整数组的位置，将数据分成 [PosStart, PosPoint-1] 和 [PosPoint+1, PosEnd]
-- 使 DataTable[PosStart, PosPoint-1] <= DataTable[PosPoint] < DataTable[PosPoint+1, PosEnd]
function TableDivide(DataTable, PosStart, PosEnd)
	local i = PosStart
	local j = PosEnd

	-- 将PosStart位置的值提取出来，此时该位置就有一个坑，可以用来放入其他数据了
	local DataJudge = DataTable[PosStart]

	while i < j do
		RunCount()

		-- 先从后往前找小于等于DataJudge的数
		while i < j and DataTable[j] > DataJudge do
			RunCount()
			j = j - 1
		end
		if i < j then
			DataTable[i] = DataTable[j]
			i = i + 1
		end

		-- 然后从后往前找大雨DataJudge的数
		while i < j and DataTable[i] <= DataJudge do
			RunCount()
			i = i + 1
		end
		if i < j then
			DataTable[j] = DataTable[i]
			j = j - 1
		end
	end

	-- 最后当 i == j 时，该位置的坑就用 DataJudge 来填充
	DataTable[i] =  DataJudge

	-- 返回位置
	return i
end

-- 快速排序，递归调用
-- 先获取比较点的位置，然后排序左右两个区间
function FastSort(DataTable, PosStart, PosEnd)
	RunCount()

	local PosPoint
	if(PosStart < PosEnd) then
		-- 获取比较点的位置
		PosPoint = TableDivide(DataTable, PosStart, PosEnd)

		-- 排序左区间
		FastSort(DataTable, PosStart, PosPoint-1)

		-- 排序右区间
		FastSort(DataTable, PosPoint+1, PosEnd)
	end
end

-- --[==[ 主流程 --]==]
-- -- 带排序数据
-- DataTable = {3, 9, 0, 1, 3, 2, 2, 7, 10, 6, 1, 26, 18, 46, 56, 3, 19, 26, 33}
-- print("排序前序列", table.concat(DataTable, " "))

-- -- 快速排序
-- FastSort(DataTable, 1, #DataTable)
-- print("排序后序列", table.concat(DataTable, " "))
-- print("循环次数：", RunCounter)

local maxCount = 10000
local _DataTable = {}
for i=1, maxCount do
    _DataTable[i] = math.random()
end

--print("排序前：", RunCounter, table.concat(_DataTable, " "))

-- local TimeStart = os.clock()
-- FastSort(_DataTable, 1, #_DataTable)
-- local TimeEnd = os.clock()
-- --print("排序后：", RunCounter, table.concat(_DataTable, " "))
-- print("快速排序用时：", TimeEnd - TimeStart)




for i=1, maxCount do
    _DataTable[i] = math.random()
end
TimeStart = os.clock()
table.sort(_DataTable, function(a,b) return a < b end)
TimeEnd = os.clock()
print("排序1用时：", TimeEnd - TimeStart)




TimeStart = os.clock()
for i=1, maxCount do
    _DataTable[i] = math.random()
		table.sort(_DataTable, function(a,b) return a < b end)
end
TimeEnd = os.clock()
print("排序2用时：", TimeEnd - TimeStart)
