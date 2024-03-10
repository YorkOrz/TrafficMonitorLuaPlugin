[TrafficMonitor](https://github.com/zhongyang219/TrafficMonitor)��һ�����ܻ�ӭ����������ع��ߡ�����֧�ֲ��������Ȼ��������������������鷳��

����Ŀ֧����lua����TrafficMonitor����������ܽ��Ϳ����Ѷȡ�


# 1. ��װ

��releaseҳ������zip�󣬽�ѹ��[TrafficMonitor�Ĳ��Ŀ¼](https://github.com/zhongyang219/TrafficMonitorPlugins/blob/main/README.md)����

ѹ�����Դ�����lua��д�Ĳ���������ڡ���ʾ���á������á�

# 2. lua�������ָ��

���Բο�[plugins](./plugins/)Ŀ¼�µ����ӡ�

## ������

ģ�����£�

```lua
-- ��ʾ�ڡ���ʾ���á��������
name="nvidia�Կ����"
-- �����ı����ᰴ���ı�����������ʾ��ȡ��������������ܿ�ȵ������ı���
sample="�Կ�: 100%"
-- ����onUpdate��Ƶ�ʣ���λ��
interval=3

-- ÿ��interval�����һ�Σ�����ֵ�������Ƶ�������
function onUpdate()
	return "�Կ�: "..tf.runCmdLine("nvidia-smi.exe --query-gpu=utilization.gpu --format=csv,noheader")
end

-- �û��ڲ���ı��ϵ�����ʱ����
function onClick()
end
```

> ��ע�⣺����������Ļ�������Ҫ��lua�ļ��ı�������ΪGBK

## �����ѡ��

ֱ����lua���޸ĺͱ��漴�ɣ��ǵ�Ϊ�û��ṩ��ϸ˵�����ɲο�[׬Ǯ.lua](./plugins/lua/׬Ǯ.lua)

## ��ʾͼ��

Ŀǰ��֧��lua����ͼ�񣬵�������֧�ֻ���ָ��ͼ�ꡣ

��`onUpdate`���ص��ı��У�����`[xxx]`��ʽ���ı�������Ϊ��Ҫ����`xxx.ico`��

��```hello world[smile]```�ᱻ��ȾΪ`hello world?`

Ӧ��`xxx.ico`����lua�ļ�ͬ����imagesĿ¼�£��������ܱ䶯����

## ����������

����ĿΪlua����ṩ��һЩ��չ��ͳһ���������ռ�tf�¡�

Ҫ���б���������Ե���`tf.runCmdLine`�Ի�ñ�׼����ͱ�׼��������ݡ�

## ���ʼ����Ϣ

��ͨ��`tf.monitorInfo`��ȡ�����Ϣ�������ֶμ�[PluginInterface.h](./PluginInterface.h)

# 3. Demo

��[plugins](./plugins/)Ŀ¼�����ұ�д�ļ�������

- �Կ����.lua������`nvidia-smi`��ȡ����ʾGPUʹ����
- ׬Ǯ.lua��ʵʱ��ʾ���մ����˶���Ǯ����������macos�ϵ�ĳ����������������ˡ�����

# 4. �����ƻ�

- [ ] ͼ����ʾ�Ż����Լ����ǰ�ͼ���ÿ��lua�ű���һ�𣬶����Ƕ�����images��
- [ ] ����һ�����ӻ��ġ����ԡ����棬����lua�ű���дʱ����
- [ ] �����ϴ���������/��Ȥ�Ĳ��
