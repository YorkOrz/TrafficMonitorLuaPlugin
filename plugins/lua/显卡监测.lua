name="nvidia�Կ����"
sample="�Կ�: 100%"
interval=3

function onUpdate()
	return "�Կ�: "..tf.runCmdLine("nvidia-smi.exe --query-gpu=utilization.gpu --format=csv,noheader")
end

function onClick()
end