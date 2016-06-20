--[[
	file: 	TestSort.lua
	author: stchan
	date: 	2015-11-18
--]]

-- 打印二维数组
function ArrayShow(DataTable)
	local ShowStr = "{ "
	for i=1, #DataTable do
		ShowStr = ShowStr .. "{"
		for j=1, #DataTable[i] do
			ShowStr = ShowStr .. "" .. DataTable[i][j]
			if j ~= #DataTable[i] then
				ShowStr = ShowStr .. ","
			end
		end
		ShowStr = ShowStr .. "}"
		if i ~= #DataTable then
			ShowStr = ShowStr .. ", "
		end
	end
	ShowStr = ShowStr .. " }"
	return ShowStr
end

-- 冒泡排序
function TestSort(DataTable)
	for i=1, #DataTable-1 do
		for j=i+1, #DataTable do
			for k=1,#DataTable[i] do
				if DataTable[i][k] > DataTable[j][k] then
					DataTable[i], DataTable[j] = DataTable[j], DataTable[i]
					break
				elseif DataTable[i][k] < DataTable[j][k] then
					break
				end
			end
		end
	end
end

local TestDataTable = {{76,98}, {98,62},{43,76},{83,12},{98,25},{76,112}}
print("排序前：", ArrayShow(TestDataTable))

TestSort(TestDataTable)
print("排序后：", ArrayShow(TestDataTable))