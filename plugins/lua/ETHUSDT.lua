name="ETH_Price"
sample="BTC: 101197.03"
interval=2

local function get_price(symbol)
    local ok, ipconfig_output = pcall(tf.runCmdLine, "ipconfig")
    if not ok then
        return "Error"
    end

    -- 检查是否使用 Mihomo 代理
    if not string.find(ipconfig_output or "", "Mihomo") then
        return "Error"
    end
	
    -- 捕获 curl 命令执行的异常
    local ok, json_str = pcall(tf.runCmdLine, "curl https://api.binance.com/api/v3/ticker/price?symbol=" .. symbol)
    if not ok then
        return "-"
    end

    local ok, price = pcall(function()
        return string.match(json_str, '"price":"(%d+%.%d%d)%d*"')
    end)
    if not ok or not price then
        return "-"
    end

    return price
end

function onUpdate()
    local price = get_price("ETHUSDT")
    return string.format("ETH: %s", price)
end

function onClick()
    return onUpdate()
end