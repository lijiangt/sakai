/**********************************************************************************
 * $URL: https://source.sakaiproject.org/svn/syllabus/branches/sakai-2.8.0/syllabus-api/src/java/org/sakaiproject/api/app/syllabus/GatewaySyllabus.java $
 * $Id: GatewaySyllabus.java 59687 2009-04-03 23:44:40Z arwhyte@umich.edu $
 ***********************************************************************************
 *
 * Copyright (c) 2003, 2004, 2005, 2006, 2008 The Sakai Foundation
 *
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.osedu.org/licenses/ECL-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 **********************************************************************************/
package org.sakaiproject.api.app.syllabus;

import java.util.ArrayList;

/**
 * @author <a href="mailto:cwen.iupui.edu">Chen Wen</a>
 * @version $Id: GatewaySyllabus.java 59687 2009-04-03 23:44:40Z arwhyte@umich.edu $
 * 
 */
public interface GatewaySyllabus
{
  public ArrayList getAttachList();

  public void setAttachList(ArrayList attachList);

  public SyllabusData getSyllabusData();

  public void setSyllabusData(SyllabusData syllabusData);
}