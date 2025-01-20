name="NetworkStatus"
sample="N: Mihomo(TW)"
interval=1

local function get_ip_1()
	local json_str = tf.runCmdLine('curl "https://pro.ip-api.com/json/?fields=16985625&key=EEKS6bLi6D91G1p"')
	local ip = string.match(json_str, '"query":"([%d%.]+)"') or "unknown"
	local country = string.match(json_str, '"country":"([%a%s]+)"') or "unknown"
	-- return string.format("%s(%s)", tostring(ip), tostring(country))
	return country
end

local function get_ip_2()
	local json_str = tf.runCmdLine("curl https://myip.ipip.net/json")
	local ip = string.match(json_str, '"ip":"([%d%.]+)"') or "unknown"
	local city = string.match(str, '"location":%s*%b[[]%s*".+?",%s*".+?",%s*"(.-)",') or "unknown"
	return city
end

local function get_ip_3()
	local json_str = tf.runCmdLine("curl https://api-v3.speedtest.cn/ip")
	local ip = string.match(json_str, '"ip":"([%d%.%*]+)"') or "unknown"
	local countryCode = string.match(json_str, '"countryCode":"(%w+)"') or "unknown"
	-- return string.format("%s(%s)", tostring(ip), tostring(country))
	return countryCode
end

local function get_ip()
	local ip = get_ip_3()
	if string.find(ip, "unknown") then
		ip = get_ip_1()
		if string.find(ip, "unknown") then
			ip = get_ip_2()
		end
	end
	return ip
end

local function get_network_status()
    local status = "Direct"  -- 默认状态为直连

    -- 捕获 ipconfig 命令执行的异常
    local ok, ipconfig_output = pcall(tf.runCmdLine, "ipconfig")
    if not ok then
        return "Error"
    end

    -- 检查是否使用 Mihomo 代理
    if string.find(ipconfig_output or "", "Mihomo") then
        status = string.format("Mihomo(%s)", tostring(get_ip()))
    else
        -- 捕获 reg query 命令执行的异常
        local ok, reg_output = pcall(tf.runCmdLine, [[reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable]])
        if not ok then
            return "Error"
        end

        -- 检查注册表输出中是否包含 "0x1"（代理启用）
        if string.find(reg_output or "", "0x1") then
            status = "Proxy"
        end
    end

    return status
end

function onUpdate()
	return string.format("N: %s", get_network_status())
end

function onClick()
    return onUpdate()
end
