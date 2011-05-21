/**********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/sakai-jforum/tags/2.8.1/jforum-tool/src/java/org/etudes/jforum/dao/AttachmentDAO.java $ 
 * $Id: AttachmentDAO.java 55486 2008-12-01 22:06:47Z murthy@etudes.org $ 
 *********************************************************************************** 
 * 
 * Copyright (c) 2008 Etudes, Inc. 
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); 
 * you may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at 
 * 
 * http://www.apache.org/licenses/LICENSE-2.0 
 * 
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
 * See the License for the specific language governing permissions and 
 * limitations under the License. 
 * 
 * Portions completed before July 1, 2004 Copyright (c) 2003, 2004 Rafael Steil, All rights reserved, licensed under the BSD license. 
 * http://www.opensource.org/licenses/bsd-license.php 
 * 
 * Redistribution and use in source and binary forms, 
 * with or without modification, are permitted provided 
 * that the following conditions are met: 
 * 
 * 1) Redistributions of source code must retain the above 
 * copyright notice, this list of conditions and the 
 * following disclaimer. 
 * 2) Redistributions in binary form must reproduce the 
 * above copyright notice, this list of conditions and 
 * the following disclaimer in the documentation and/or 
 * other materials provided with the distribution. 
 * 3) Neither the name of "Rafael Steil" nor 
 * the names of its contributors may be used to endorse 
 * or promote products derived from this software without 
 * specific prior written permission. 
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT 
 * HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, 
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 * THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE 
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER 
 * IN CONTRACT, STRICT LIABILITY, OR TORT 
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN 
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE 
 ***********************************************************************************/
package org.etudes.jforum.dao;

import java.util.List;
import java.util.Map;

import org.etudes.jforum.entities.Attachment;
import org.etudes.jforum.entities.AttachmentExtension;
import org.etudes.jforum.entities.AttachmentExtensionGroup;
import org.etudes.jforum.entities.QuotaLimit;


/**
 * @author Rafael Steil
 */
public interface AttachmentDAO
{
	/**
	 * Adds a new attachment.
	 * 
	 * @param a The attacment to add
	 * @throws Exception
	 */
	public void addAttachment(Attachment a) throws Exception;
	
	/**
	 * Adds a new PM attachment.
	 * 
	 * @param a The attacment to add
	 * @throws Exception
	 */
	public int addPMAttachment(Attachment a) throws Exception;
	
	/**
	 * Updates an attachment.
	 * Only the file comment is updated.
	 * 
	 * @param a The attachment to update
	 * @throws Exception
	 */
	public void updateAttachment(Attachment a) throws Exception;
	
	/**
	 * Rovemos an attachment.
	 * 
	 * @param id The attachment's id to remove
	 * @param postId the post id
	 * @throws Exception
	 */
	public void removeAttachment(int id, int postId) throws Exception;
	
	/**
	 * removes a private message attachment.
	 * 
	 * @param id The attachment's id to remove
	 * @throws Exception
	 */
	public void removePMAttachment(int id) throws Exception;
	
	/**
	 * Gets the attachments of some message.
	 * 
	 * @param postId The post id associated with the attachments.
	 * @return A list where each entry is a net.jforum.entities.Attachment 
	 * instance.
	 * @throws Exception
	 */
	public List selectAttachments(int postId) throws Exception;
	
	/**
	 * Gets the attachments of some private message.
	 * 
	 * @param privMsgsId The private message id associated with the attachments.
	 * @return A list where each entry is a net.jforum.entities.Attachment 
	 * instance.
	 * @throws Exception
	 */
	public List selectPMAttachments(int privMsgsId) throws Exception;
	
	
	/**
	 * Gets an attachment by its id
	 * 
	 * @param attachId The attachment id
	 * @return The attachment, or <code>null</code> if no record was found
	 * @throws Exception
	 */
	public Attachment selectAttachmentById(int attachId) throws Exception;
	
	
	/**
	 * Gets the count of private messages associated with this attachment
	 * 
	 * @param attachId The attachment id
	 * @return The count of private messages associated with this attachment
	 * @throws Exception
	 */
	public int selectAttachmentPrivateMessages(int attachId) throws Exception;
	
	/**
	 * Inserts a new quota limit.
	 * 
	 * @param limit The data to insert
	 * @throws Exception
	 */
	public void addQuotaLimit(QuotaLimit limit) throws Exception;
	
	/**
	 * Updates a quota limit.
	 * 
	 * @param limit The data to update
	 * @throws Exception
	 */
	public void updateQuotaLimit(QuotaLimit limit) throws Exception;
	
	/**
	 * Deletes a quota limit
	 * 
	 * @param id The id of the quota to remove
	 * @throws Exception
	 */
	public void removeQuotaLimit(int id) throws Exception;
	
	/**
	 * Removes a set of quota limit.
	 * 
	 * @param ids The ids to remove.
	 * @throws Exception
	 */
	public void removeQuotaLimit(String[] ids) throws Exception;
	
	/**
	 * Associates a quota limmit to some group.
	 * 
	 * @param groupId The group id
	 * @param quotaId The quota id
	 * @throws Exception
	 */
	public void setGroupQuota(int groupId, int quotaId) throws Exception;
	
	/**
	 * Removes all quotas limits from all groups.
	 *  
	 * @throws Exception
	 */
	public void cleanGroupQuota() throws Exception;
	
	/**
	 * Gets all registered quota limits
	 * 
	 * @return A list instance where each entry is a
	 * {@link org.etudes.jforum.entities.QuotaLimit} instance.
	 * @throws Exception
	 */
	public List selectQuotaLimit() throws Exception;
	
	/**
	 * Gets the quota associated to some group.
	 * 
	 * @param groupId The group id
	 * @return A <code>QuotaLimit</code> instance, or <code>null</code> if
	 * no records were found. 
	 * @throws Exception
	 */
	public QuotaLimit selectQuotaLimitByGroup(int groupId) throws Exception;
	
	/**
	 * Gets the quota limits of registered groups.
	 * 
	 * @return A map instance where each key is the group id
	 * and the value is the quota limit id.
	 */
	public Map selectGroupsQuotaLimits() throws Exception;
	
	/**
	 * Adds a new extension group.
	 * 
	 * @param g The data to insert
	 * @throws Exception
	 */
	public void addExtensionGroup(AttachmentExtensionGroup g) throws Exception;
	
	/**
	 * Updates some extensin group.
	 * 
	 * @param g The data to update
	 * @throws Exception
	 */
	public void updateExtensionGroup(AttachmentExtensionGroup g) throws Exception;
	
	/**
	 * Removes a set of extension groups.
	 * 
	 * @param ids The ids to remove.
	 * @throws Exception
	 */
	public void removeExtensionGroups(String[] ids) throws Exception;
	
	/**
	 * Gets all extension groups.
	 * 
	 * @return A list instance where each entry is an 
	 * {@link org.etudes.jforum.entities.AttachmentExtensionGroup} instance.
	 * @throws Exception
	 */
	public List selectExtensionGroups() throws Exception;
	
	/**
	 * Gets all extensions and its security options, 
	 * as well from the groups. 
	 * 
	 * @return A map instance where the key is the extension name
	 * and the value is a Boolean, indicating if the extension can
	 * be used in the uploaded files. If there is no entry for
	 * a given extension, then it means that it is allowed. 
	 * @throws Exception
	 */
	public Map extensionsForSecurity() throws Exception;
	
	/**
	 * Adds a new extension
	 * 
	 * @param e The extension to add
	 * @throws Exception
	 */
	public void addExtension(AttachmentExtension e) throws Exception;
	
	/**
	 * Updates an extension
	 * 
	 * @param e The extension to update
	 * @throws Exception
	 */
	public void updateExtension(AttachmentExtension e) throws Exception;
	
	/**
	 * Removes a set of extensions
	 * 
	 * @param ids The ids to remove
	 * @throws Exception
	 */
	public void removeExtensions(String[] ids) throws Exception;
	
	/**
	 * Gets all registered extensions
	 * 
	 * @return A list instance, where each entry is an
	 * {@link org.etudes.jforum.entities.AttachmentExtension} instance
	 * @throws Exception
	 */
	public List selectExtensions() throws Exception;
	
	/**
	 * Gets an extension information by the extension's name
	 * @param extension
	 * @return
	 * @throws Exception
	 */
	public AttachmentExtension selectExtension(String extension) throws Exception;

	/**
	 * Gets the download mode by the extension group id
	 * @param extensionGroupId extension group id
	 * @return true = physical download mode; false = inline download mode
	 * @throws Exception
	 */
	public boolean isPhysicalDownloadMode(int extensionGroupId) throws Exception;
}
