name="����Ա����"
sample="����Ա������� 2 ����: 1. дע��/�ĵ���2. ���˲�дע��/�ĵ�"
interval=300

math.randomseed(os.time())

function onUpdate()
    local length = #res
    local index = math.random(length)
	return res[index]
end

function onClick()
    return onUpdate()
end

res = {
    "Apple", "Banana", "Cherry", "Date", "Elderberry"
}