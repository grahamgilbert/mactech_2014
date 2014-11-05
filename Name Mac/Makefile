USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=name_mac
PACKAGE_NAME=${TITLE}
PACKAGE_VERSION=1.0.0
REVERSE_DOMAIN=com.pebbleit
PAYLOAD=\
    pack-csv

pack-csv: l_usr_local
	@sudo mkdir -p ${WORK_D}/usr/local/name_mac
	@sudo ${CP} names.csv ${WORK_D}/usr/local/name_mac/names.csv
	@sudo chown root:wheel ${WORK_D}/usr/local/name_mac/names.csv
	@sudo chmod 600 ${WORK_D}/usr/local/name_mac/names.csv
