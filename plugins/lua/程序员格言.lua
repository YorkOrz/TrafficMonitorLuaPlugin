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
    "Talk is cheap. Show me the code.",
    "����Ա������� 2 ����: 1. дע��/�ĵ���2. ���˲�дע��/�ĵ�", 
    "Hello World ��", 
    "������ˣ���һ�����ܾ���", 
    "�������������Ѽ�ӡ���Ӿ��Ѽ�ӡ�������Ѽ�ӣ���ô�����ܾ���ֻѼ��",
    "�ֳ������������м��������̡� ��̤ǧ�������ͣ�Ц��������ﻡ�",
    "���ܷ����������һ���ᷢ��",
    "Unix ��ѧ��һ������ֻ��һ���£���������",
    "���ڸ�ɳ����̨",
    "���κ�����˵��640KB �ڴ涼�㹻�ˡ� �����ȶ����Ǵ�.",
    "Across the Great Wall, we can reach every corner in the world",
    "������Ż������֮Դ",
}