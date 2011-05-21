# $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/patch/meleteetudesPatch.sh $
# $Id: meleteetudesPatch.sh 56408 2008-12-19 21:16:52Z rashmi@etudes.org $
#
# $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/patch/meleteetudesPatch.sh $
# $Id: meleteetudesPatch.sh 56408 2008-12-19 21:16:52Z rashmi@etudes.org $
#
# Copyright (c) 2008 Etudes, Inc.
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

cd ../jsf
svn merge -r22009:22210 https://source.sakaiproject.org/svn/jsf/trunk
svn merge -r22294:22295 https://source.sakaiproject.org/svn/jsf/trunk
svn merge -r30725:30727 https://source.sakaiproject.org/svn/jsf/trunk

# pre tag support
cd ../util
svn merge -r20814:20815 https://source.sakaiproject.org/svn/util/trunk
svn merge -r22885:22886 https://source.sakaiproject.org/svn/util/trunk
svn merge -r28347:28348 https://source.sakaiproject.org/svn/util/trunk
svn merge -r31403:31404 https://source.sakaiproject.org/svn/util/trunk

#SAK-7573
cd ../assignment
svn merge -r20206:20207 https://source.sakaiproject.org/svn/assignment/trunk
cd ../announcement
svn merge -r20209:20210 https://source.sakaiproject.org/svn/announcement/trunk

#update Xml.java
# cd ../util
# rm -rf util-util/util/src/java/org/sakaiproject/util/Xml.java
# svn merge -r28676:28677 https://source.sakaiproject.org/svn/util/trunk
# svn update -r28677

#SAK-8277
#cd ../assignment
#svn merge -r20962:20965 https://source.sakaiproject.org/svn/assignment/trunk
#svn merge -r28473:28474 https://source.sakaiproject.org/svn/assignment/trunk
#svn merge -r29437:29438 https://source.sakaiproject.org/svn/assignment/trunk

#cd ../site-manage
#svn merge -r29438:29439 https://source.sakaiproject.org/svn/site-manage/trunk