#!/bin/sh

# Program: Gather sar Data From AIX Server <gather-sar-data.sh>
# Author: Matty < matty91 at gmail dot com >
# Current Version: 1.0
# Date: 06-27-2017
# License:
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.

PATH=/bin:/usr/bin:/usr/sbin
export PATH

if [ $# -eq 0 ]; then
    echo "Usage: $0 day1 day2 ..."
    exit 1
fi

# Directory were the sa files live
sar_dir="/var/adm/sa"

for sar_file in `ls ${sar_dir}/sa[0-9]*`; do
    sar_file_date=`sar -f ${sar_file} | awk '/AIX/ {print $6 }'`
    day=`echo ${sar_file_date} | awk -F'/' '{ print $2 }'`

    for sar_day in `echo $@`; do
        if [ "${sar_day}" = "${day}" ]; then
            sar -f ${sar_file} | egrep "^[0-9][0-9]:" | egrep -v "physc" | while read line; do
               echo "${sar_file_date} ${line}"
            done
        fi
    done
done
