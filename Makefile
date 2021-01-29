ETCDIR=${DESTDIR}/etc
LIBDIR=${DESTDIR}/lib
SERVICEDIR=${LIBDIR}/services
MAN8=${DESTDIR}/usr/share/man/man8
SBIN=${DESTDIR}/sbin
MODE=754
DIRMODE=755
CONFMODE=644

install: files

create-dirs:
	install -d -m ${DIRMODE} ${ETCDIR}/init.d
	install -d -m ${DIRMODE} ${ETCDIR}/sysconfig
	install -d -m ${DIRMODE} ${LIBDIR}
	install -d -m ${DIRMODE} ${SERVICEDIR}
	install -d -m ${DIRMODE} ${MAN8}
	install -d -m ${DIRMODE} ${SBIN}
	ln -sfn services ${LIBDIR}/lsb

files: create-dirs
	install -m ${MODE} init.d/checkfs ${ETCDIR}/init.d/
	install -m ${MODE} init.d/cleanfs ${ETCDIR}/init.d/
	install -m ${MODE} init.d/halt ${ETCDIR}/init.d/
	install -m ${MODE} init.d/console ${ETCDIR}/init.d/
	install -m ${MODE} init.d/localnet ${ETCDIR}/init.d/
	install -m ${MODE} init.d/modules ${ETCDIR}/init.d/
	install -m ${MODE} init.d/mountfs ${ETCDIR}/init.d/
	install -m ${MODE} init.d/mountvirtfs ${ETCDIR}/init.d/
	install -m ${MODE} init.d/network ${ETCDIR}/init.d/
	install -m ${MODE} init.d/rc ${ETCDIR}/init.d/
	install -m ${MODE} init.d/reboot ${ETCDIR}/init.d/
	install -m ${MODE} init.d/rngd ${ETCDIR}/init.d/
	install -m ${MODE} init.d/sendsignals ${ETCDIR}/init.d/
	install -m ${MODE} init.d/swap ${ETCDIR}/init.d/
	install -m ${MODE} init.d/sysctl ${ETCDIR}/init.d/
	install -m ${MODE} init.d/sysklogd ${ETCDIR}/init.d/
	install -m ${MODE} init.d/template ${ETCDIR}/init.d/
	install -m ${MODE} init.d/udev ${ETCDIR}/init.d/
	install -m ${MODE} init.d/udev_retry ${ETCDIR}/init.d/
	install -m ${MODE} init.d/fake-hwclock ${ETCDIR}/init.d/
	install -m ${MODE} init.d/switch-cpu-governor ${ETCDIR}/init.d/
	install -m ${MODE} sbin/ifup ${SBIN}
	install -m ${MODE} sbin/ifdown ${SBIN}
	install -m ${CONFMODE} sbin/ifup.8 ${MAN8}
	ln -sf  ifup.8 ${MAN8}/ifdown.8
	install -m ${MODE} lib/services/ipv4-static-route ${SERVICEDIR}
	install -m ${MODE} lib/services/ipv4-static ${SERVICEDIR}
	install -m ${CONFMODE} lib/services/init-functions ${SERVICEDIR}
	if [ ! -f ${ETCDIR}/sysconfig/createfiles ]; then install -m ${CONFMODE} sysconfig/createfiles ${ETCDIR}/sysconfig/ ; fi
	if [ ! -f ${ETCDIR}/sysconfig/modules ]; then install -m ${CONFMODE} sysconfig/modules ${ETCDIR}/sysconfig/ ; fi
	if [ ! -f ${ETCDIR}/sysconfig/udev_retry ]; then install -m ${CONFMODE} sysconfig/udev_retry ${ETCDIR}/sysconfig/ ; fi
	if [ ! -f ${ETCDIR}/sysconfig/rc.site ]; then install -m ${CONFMODE} sysconfig/rc.site ${ETCDIR}/sysconfig/ ; fi

.PHONY: create-dirs install files
