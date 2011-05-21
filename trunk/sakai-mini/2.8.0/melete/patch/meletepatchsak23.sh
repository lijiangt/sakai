#
# $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/patch/meletepatchsak23.sh $
# $Id: meletepatchsak23.sh 56408 2008-12-19 21:16:52Z rashmi@etudes.org $
#
# Copyright (c) 2008 Etudes, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Portions completed before September 1, 2008 Copyright (c) 2004, 2005, 2006, 2007, 2008 Foothill College, ETUDES Project
#
# Licensed under the Apache License, Version 2.0 (the "License"); you
# may not use this file except in compliance with the License. You may
# obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0 
#   
# Unless required by applicable law or agreed to in writing, software 
# distributed under the License is distributed on an "AS IS" BASIS, 
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or 
# implied. See the License for the specific language governing 
# permissions and limitations under the License. 
#
#!/bin/sh
#For /private support (Melete)
#
#SAK-7700
#r20516 /dav
cd dav
svn merge -r20515:20516 https://source.sakaiproject.org/svn/dav/trunk
#U dav/src/java/org/sakaiproject/dav/DavServlet.java
#
#r20517 /content
cd ../content
svn merge -r20516:20517 https://source.sakaiproject.org/svn/content/trunk
#U content-impl/impl/src/java/org/sakaiproject/content/impl/BaseContentService.java
#
#SAK-8759
#r22835 /content
svn merge -r22834:22835 https://source.sakaiproject.org/svn/content/trunk
#U content-impl/impl/src/sql/mysql/sakai_content.sql
#U content-impl/impl/src/sql/oracle/sakai_content.sql
#U content-impl/impl/src/sql/hsqldb/sakai_content.sql
#
#r22837 /content
svn merge -r22836:22837 https://source.sakaiproject.org/svn/content/trunk
#G content-impl/impl/src/sql/mysql/sakai_content.sql
#G content-impl/impl/src/sql/oracle/sakai_content.sql
#G content-impl/impl/src/sql/hsqldb/sakai_content.sql
#SAK-7269
cd ../util
svn merge -r18444:18445 https://source.sakaiproject.org/svn/util/trunk
#U    util-util/util/src/java/org/sakaiproject/util/StringUtil.java
#
#SAK-7611
svn merge -r20267:20268 https://source.sakaiproject.org/svn/util/trunk
svn merge -r20280:20281 https://source.sakaiproject.org/svn/util/trunk

cd ../jsf
svn merge -r22009:22210 https://source.sakaiproject.org/svn/jsf/trunk
svn merge -r22294:22295 https://source.sakaiproject.org/svn/jsf/trunk
svn merge -r30725:30727 https://source.sakaiproject.org/svn/jsf/trunk

#update Xml.java
cd ../util
rm -rf util-util/util/src/java/org/sakaiproject/util/Xml.java
svn merge -r28676:28677 https://source.sakaiproject.org/svn/util/trunk
svn update -r28677