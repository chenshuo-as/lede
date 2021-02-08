#!/bin/bash
cd openwrt
rm -rf package/lean/luci-theme-argon
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）
#

# 修改openwrt登陆地址,把下面的192.168.2.2修改成你想要的就可以了，其他的不要动
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

sed -i 's/root:.*/root:$1$tTPCBw1t$ldzfp37h5lSpO9VXk4uUE\/:18336:0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings  #设置密码为空

sed -i '/S99opkg/d' /etc/crontabs/root
echo "30 04 * * * sleep 5 && touch /etc/banner && reboot" >> /etc/crontabs/root

git clone https://github.com/jerrykuku/luci-theme-argon



