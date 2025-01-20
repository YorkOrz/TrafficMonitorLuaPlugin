name="SIM2"
sample="S2: 58.60R 94.41+186.66G"
interval=30

-- Cookie获取：https://github.com/ChinaTelecomOperators/ChinaUnicom/releases
local cookie = [[]]

local function get_price()
	local apiUrl = "https://m.client.10010.com/mobileserviceimportant/home/queryUserInfoSeven?version=iphone_c@8.0200&desmobiel=&showType=0"
	local curlCommand = string.format('curl -X GET "%s" -H "Cookie: %s"', apiUrl, cookie)
    local ok, json_str = pcall(tf.runCmdLine, curlCommand)
    if not ok then
		return "Error04"
    end

	-- 提取 code 和 flush_date_time
	local code = json_str:match('"code":"(.-)"')
	local flush_date_time = json_str:match('"flush_date_time":"(.-)"')

	print("Code:", code)
	print("Flush Date Time:", flush_date_time)

	-- 提取 dataList 中的 number 和 unit
	local result = {}
	local fee = ""
	local dataList = json_str:match('"dataList":%[(.-)%]')
	if dataList then
		for item in dataList:gmatch('{(.-)}') do
			local number = item:match('"number":"(.-)"')
			local unit = item:match('"unit":"(.-)"')
			local type = item:match('"type":"(.-)"')
			if number and unit and type then
				if type == "fee" then
					fee = number .. "R"
					-- table.insert(result, number .. "R")
				end
				--[[if type == "flow" then
					table.insert(result, number .. unit)
				end]]
			end
		end
	else
		print("未找到 dataList")
		return "Error05"
	end
	
	local apiUrl = "https://m.client.10010.com/servicequerybusiness/operationservice/queryOcsPackageFlowLeftContentRevisedInJune"
	local curlCommand = string.format('curl -X GET "%s" -H "Cookie: %s"', apiUrl, cookie)
    local ok, json_str = pcall(tf.runCmdLine, curlCommand)
    if not ok then
		return "Error07"
    end

	-- 提取 flowSumList 部分
	local flowSumListPattern = '"flowSumList"%s*:%s*%[(.-)%]'
	local flowSumListStr = string.match(json_str, flowSumListPattern)
	
	if not flowSumListStr then
		return "Error08"
	end
	
	-- 正则表达式提取 xcanusevalue 字段
	local xcanusevaluePattern = '"xcanusevalue"%s*:%s*"([%d%.]+)"'
	local values = {}
	
	-- 使用 string.gmatch 匹配所有符合条件的值
	for value in string.gmatch(flowSumListStr, xcanusevaluePattern) do
		local numValue = tonumber(value)
		if numValue > 0 then
			local valueGB = string.format("%.2f", numValue / 1024)
			table.insert(values, valueGB)
		end
	end
	
	-- 拼接结果字符串
	local finalString = table.concat(values, "+") .. "G"

    return fee .. " " ..finalString
    -- return table.concat(result, " ")
	-- return string.sub(content, 1, 10)
end

function onUpdate()
    local str = get_price()
    return string.format("S2: %s", str)
end

function onClick()
    return onUpdate()
end