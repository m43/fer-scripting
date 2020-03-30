#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# m43


 for file in localhost_access_log.*-02-*.txt ; do
     echo ${file} | sed -En 's#.*([0-9]{4})(-[0-9]{2}-)([0-9]{2}).*#\tdatum: \3\2\1#p'
     echo $(for i in {1..27}; do echo "-"; done) | tr " " "-"
     cat ${file} | sed -En "s#.*\"(.*)\".*#\1#p" | sort | uniq -c | sort -t: -k 1nr
     echo
 done

