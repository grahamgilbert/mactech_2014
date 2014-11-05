#!/usr/bin/python

import csv
import subprocess
import plistlib
import sys

FILE_LOCATION = '/usr/local/name_mac/names.csv'

def get_hardware_info():
    '''Uses system profiler to get hardware info for this machine'''
    cmd = ['/usr/sbin/system_profiler', 'SPHardwareDataType', '-xml']
    proc = subprocess.Popen(cmd, shell=False, bufsize=-1,
                            stdin=subprocess.PIPE,
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (output, unused_error) = proc.communicate()
    try:
        plist = plistlib.readPlistFromString(output)
        # system_profiler xml is an array
        sp_dict = plist[0]
        items = sp_dict['_items']
        sp_hardware_dict = items[0]
        return sp_hardware_dict
    except Exception:
        return {}

def check_serial(serial_number, computername):
    with open(FILE_LOCATION, 'rb') as csvfile:
        csv_data = csv.DictReader(csvfile, delimiter=',')
        for row in csv_data:
            serial = row['serial']
            if serial == serial_number:
                if row['name'] != computername:
                    sys.exit(0)
                else:
                    sys.exit(1)

def get_serial_number():
    hardware_info = get_hardware_info()
    return hardware_info.get('serial_number', 'UNKNOWN') 

def get_computername():
    cmd = ['/usr/sbin/scutil', '--get', 'ComputerName']
    proc = subprocess.Popen(cmd, shell=False, bufsize=-1,
                            stdin=subprocess.PIPE,
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (output, unused_error) = proc.communicate()
    return output

def main():
    serial_number = get_serial_number()
    computername = get_computername()
    check_serial(serial_number, computername)

if __name__ == '__main__':
    main()