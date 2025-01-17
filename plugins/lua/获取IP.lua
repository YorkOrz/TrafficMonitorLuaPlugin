name="GetIP"
sample="192.168.100.10 (CN)"
interval=10

local function get_ip_1()
	local json_str = tf.runCmdLine("curl https://ipinfo.io/json?token=ba0234c01f79d3")
	local ip = string.match(json_str, '"ip"%s*:%s*"([^"]+)"') or "unknown"
	local country = string.match(json_str, '"country"%s*:%s*"([^"]+)"') or "-"
	return string.format("%s(%s)", tostring(ip), tostring(country))
end

local function get_ip_2()
	local json_str = tf.runCmdLine('curl "https://pro.ip-api.com/json/?fields=16985625&key=EEKS6bLi6D91G1p"')
	local ip = string.match(json_str, '"query":"([%d%.]+)"') or "unknown"
	local country = string.match(json_str, '"country":"([%a%s]+)"') or "-"
	return string.format("%s(%s)", tostring(ip), tostring(country))
end

local function get_ip_3()
	local json_str = tf.runCmdLine("curl https://myip.ipip.net/json")
	local ip = string.match(json_str, '"ip":"([%d%.]+)"') or "unknown"
	return ip
end

local function get_ip_4()
	local json_str = tf.runCmdLine("curl https://api-v3.speedtest.cn/ip")
	local ip = string.match(json_str, '"ip":"([%d%.%*]+)"') or "unknown"
	local country = string.match(json_str, '"country":"([%C]+)"') or "-"
	return string.format("%s(%s)", tostring(ip), tostring(country))
end

function onUpdate()
	local ip = get_ip_1()
	if string.find(ip, "unknown") then
		ip = get_ip_2()
		if string.find(ip, "unknown") then
			ip = get_ip_3()
		end
	end
	return ip;
end

function onClick()
    return onUpdate()
end