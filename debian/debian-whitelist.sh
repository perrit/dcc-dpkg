#!/bin/bash
# 
#  debian-whitelist.sh - get up2date list information from
#                        lists.debian.org
# 
#  Copyright (C) 2004 Martin Zobel-Helas <mhelas@helas.net>
#                 and Dan Weber <dan@mirrorlynx.com>
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  
# 

if [ -f whitelist.debian ]; then
	rm -f whitelist.debian
fi
# set date somewhere in the file to track up2dateness.
DATE=`date +%c`
echo "# last update: $DATE" > whitelist.debian

for t in `wget -q http://lists.debian.org/completeindex.html -O- | grep "<li><a" | sed -re 's/<[^>]+>//g'`;do
	if [ $t != "whitelist" ]; then
		echo "ok env_from $t@lists.debian.org" >> whitelist.debian 
	fi
done

# return a true value
exit 0

