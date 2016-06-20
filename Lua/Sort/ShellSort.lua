--[[
	file: 	ShellSort.lua
	author: stchan
	date: 	2015-11-17
--]]

-- 记录循环的次数
RunCount = 0

-- 希尔排序
function ShellSort(DataTable)
	-- 取步长（取整）
	local gap = math.modf(#DataTable/2)
	
	while gap >= 1 do
		for i=gap+1,#DataTable do
			local j = i - gap
			local temp = DataTable[i]

			while j >= 1 and DataTable[j] >= temp do
				DataTable[j+gap] = DataTable[j]
				j = j - gap
				RunCount = RunCount + 1
			end

			DataTable[j + gap] = temp
			RunCount = RunCount + 1
		end

		gap = math.modf(gap/2)

		RunCount = RunCount + 1
	end
end

local _DataTable = {9, 1, 2, 5, 7, 4, 8, 6, 3, 5}

print("排序前：", RunCount, table.concat(_DataTable, " "))

ShellSort(_DataTable)
print("排序后：", RunCount, table.concat(_DataTable, " "))