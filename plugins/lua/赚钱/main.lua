name="�ϰ�׬Ǯ"
sample="[money] ��1000"
interval=10

-- ������
day_earn = 1000
work_from = 9
work_end = 18
-- 

-- ������
local total_seconds = (work_end - work_from)*3600
local earn_every_second = day_earn / total_seconds
local prefix = "[money] ��"
--

local function seconds_working()
    local current_time = os.time()
    local today = os.time{year=os.date("%Y"), month=os.date("%m"), day=os.date("%d"), hour=work_from}
    local seconds_passed = current_time - today

    if seconds_passed < 0 then
        return 0
    elseif seconds_passed > total_seconds then
        return total_seconds
    else
        -- ��9�㵽18��֮��,����ʵ�ʹ�ȥ������
        return seconds_passed
    end
end

function onUpdate()
	local seconds = seconds_working()
	local earn = earn_every_second * seconds
	return prefix..math.floor(earn)
end

function onClick()
end