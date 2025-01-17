name="NetworkStatus"
sample="N: Mihomo"
interval=1

local function get_network_status()
    local status = "Direct"  -- 默认状态为直连

    -- 捕获 ipconfig 命令执行的异常
    local ok, ipconfig_output = pcall(tf.runCmdLine, "ipconfig")
    if not ok then
        return "Error"
    end

    -- 检查是否使用 Mihomo 代理
    if string.find(ipconfig_output or "", "Mihomo") then
        status = "Mihomo"
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