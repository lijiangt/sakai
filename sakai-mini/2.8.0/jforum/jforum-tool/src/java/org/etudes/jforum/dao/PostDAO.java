/**********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/sakai-jforum/tags/2.8.1/jforum-tool/src/java/org/etudes/jforum/dao/PostDAO.java $ 
 * $Id: PostDAO.java 63031 2009-09-04 00:09:18Z murthy@etudes.org $ 
 *********************************************************************************** 
 * 
 * Copyright (c) 2008, 2009 Etudes, Inc. 
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

import org.etudes.jforum.entities.Post;


/**
  * Model interface for {@link net.jforum.Post}.
 * This interface defines methods which are expected to be
 * implementd by a specific data access driver. The intention is
 * to provide all functionality needed to update, insert, delete and
 * select some specific data.
 * 
 * @author Rafael Steil
 */
public interface PostDAO 
{
	/**
	 * Gets a specific <code>Post</code>.
	 * 
	 * @param postId The Post ID to search
	 * @return <code>Post</code>object containing all the information
	 * @throws Exception
	 * @see #selectAll
	 */
	public Post selectById(int postId) throws Exception;
		
	/**
	 * Delete a Post.
	 * 
	 * @param Post The Post to delete
	 * @throws Exception
	 * @see #canDelete(int)
	 */
	public void delete(Post post) throws Exception;
	
	/**
	 * Updates a Post.
	 * 
	 * @param post Reference to a <code>Post</code> object to update
	 * @throws Exception
	 * @see #update(int)
	 */
	public void update(Post post) throws Exception;
	
	/**
	 * Adds a new Post.
	 * 
	 * @param Post Reference to a valid and configured <code>Post</code> object
	 * @return The new ID
	 * @throws Exception
	 */
	public int addNew(Post post) throws Exception;
	
	/**
	 * Selects all messages relacted to a specific topic. 
	 * 
	 * @param topicId The topic ID 
	 * @param startFrom The count position to start fetching
	 * @param count The total number of records to retrieve
	 * @return <code>ArrayList</code> containing all records found. Each entry of the <code>ArrayList</code> is a {@link net.jforum.Post} object
	 * @throws Exception
	 */
	public List selectAllByTopicByLimit(int topicId, int startFrom, int count) throws Exception;
	
	/**
	 * Selects all messages relacted to a specific topic. 
	 * 
	 * @param topicId The topic ID 
	 * @return <code>ArrayList</code> containing all records found. Each entry of the <code>ArrayList</code> is a {@link net.jforum.Post} object
	 * @throws Exception
	 */	
	public List selectAllByTopic(int topicId) throws Exception;
	
	
	/**
	 * Selects all messages related to a specific topic and user. 
	 * 
	 * @param topicId The topic ID 
	 * @param userId user id
	 * @return <code>ArrayList</code> containing all records found. Each entry of the <code>ArrayList</code> is a {@link net.jforum.Post} object
	 * @throws Exception
	 */	
	public List selectAllByTopicByUser(int topicId, int userId) throws Exception;
	
	/**
	 * Selects all messages related to a specific forum and user.
	 * 
	 * @param forumId forum ID
	 * @param userId user id
	 * @return <code>ArrayList</code> containing all records found. Each entry of the <code>ArrayList</code> is a {@link net.jforum.Post} object
	 * @throws Exception
	 */
	public List selectAllByForumByUser(int forumId, int userId) throws Exception;
	
	/**
	 * Selects all messages related to a specific category and user.
	 * 
	 * @param categoryId category Id
	 * @param userId user id
	 * @return <code>ArrayList</code> containing all records found. Each entry of the <code>ArrayList</code> is a {@link net.jforum.Post} object
	 * @throws Exception
	 */
	public List selectAllByCategoryByUser(int categoryId, int userId) throws Exception;
	
	/**
	 * Delete all posts related to the given topic
	 * 
	 * @param topicId
	 * @throws Exception
	 */
	public void deleteByTopic(int topicId) throws Exception;
}
