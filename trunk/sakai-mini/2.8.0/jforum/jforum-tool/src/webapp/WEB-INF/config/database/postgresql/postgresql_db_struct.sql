---------------------------------------------------------------------------------- 
-- $URL: https://source.sakaiproject.org/contrib/etudes/sakai-jforum/tags/2.8.1/jforum-tool/src/webapp/WEB-INF/config/database/postgresql/postgresql_db_struct.sql $ 
-- $Id: postgresql_db_struct.sql 55571 2008-12-02 19:26:02Z murthy@etudes.org $ 
----------------------------------------------------------------------------------- 
-- 
-- Copyright (c) 2008 Etudes, Inc. 
-- 
-- Licensed under the Apache License, Version 2.0 (the "License"); 
-- you may not use this file except in compliance with the License. 
-- You may obtain a copy of the License at 
-- 
-- http://www.apache.org/licenses/LICENSE-2.0 
-- 
-- Unless required by applicable law or agreed to in writing, software 
-- distributed under the License is distributed on an "AS IS" BASIS, 
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
-- See the License for the specific language governing permissions and 
-- limitations under the License. 
-- 
-- Portions completed before July 1, 2004 Copyright (c) 2003, 2004 Rafael Steil, All rights reserved, licensed under the BSD license. 
-- http://www.opensource.org/licenses/bsd-license.php 
-- 
-- Redistribution and use in source and binary forms, 
-- with or without modification, are permitted provided 
-- that the following conditions are met: 
-- 
-- 1) Redistributions of source code must retain the above 
-- copyright notice, this list of conditions and the 
-- following disclaimer. 
-- 2) Redistributions in binary form must reproduce the 
-- above copyright notice, this list of conditions and 
-- the following disclaimer in the documentation and/or 
-- other materials provided with the distribution. 
-- 3) Neither the name of "Rafael Steil" nor 
-- the names of its contributors may be used to endorse 
-- or promote products derived from this software without 
-- specific prior written permission. 
-- 
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT 
-- HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, 
-- BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
-- MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
-- THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE 
-- FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
-- OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
-- CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER 
-- IN CONTRACT, STRICT LIABILITY, OR TORT 
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN 
-- ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE 
----------------------------------------------------------------------------------
--
-- Table structure for table 'jforum_banlist'
--

CREATE SEQUENCE jforum_banlist_seq;
CREATE TABLE jforum_banlist (
  banlist_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_banlist_seq'),
  user_id INTEGER NOT NULL DEFAULT 0,
  banlist_ip VARCHAR(20) NOT NULL DEFAULT '',
  banlist_email VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY  (banlist_id)
);
CREATE INDEX idx_banlist_user ON jforum_banlist(user_id);

--
-- Table structure for table 'jforum_categories'
--

CREATE SEQUENCE jforum_categories_seq;
CREATE SEQUENCE jforum_categories_order_seq;
CREATE TABLE jforum_categories (
  categories_id INTEGER NOT NULL PRIMARY KEY DEFAULT NEXTVAL('jforum_categories_seq'),
  title VARCHAR(100) NOT NULL DEFAULT '',
  display_order INTEGER NOT NULL DEFAULT 0,
  moderated INTEGER DEFAULT 0
);

--
-- Table structure for table 'jforum_config'
--

CREATE SEQUENCE jforum_config_seq;
CREATE TABLE jforum_config (
  config_name VARCHAR(255) NOT NULL DEFAULT '',
  config_value VARCHAR(255) NOT NULL DEFAULT '',
  config_id int NOT NULL PRIMARY KEY DEFAULT nextval('jforum_config_seq')
);

--
-- Table structure for table 'jforum_forums'
--

CREATE SEQUENCE jforum_forums_seq;
CREATE TABLE jforum_forums (
  forum_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_forums_seq'),
  categories_id INTEGER NOT NULL DEFAULT 1,
  forum_name VARCHAR(150) NOT NULL DEFAULT '',
  forum_desc VARCHAR(255) DEFAULT NULL,
  forum_order INTEGER DEFAULT 1,
  forum_topics INTEGER NOT NULL DEFAULT 0,
  forum_last_post_id INTEGER NOT NULL DEFAULT 0,
  moderated INTEGER DEFAULT 0,
  PRIMARY KEY  (forum_id)
);
CREATE INDEX idx_forums_categories_id ON jforum_forums(categories_id);

--
-- Table structure for table 'jforum_groups'
--

CREATE SEQUENCE jforum_groups_seq;
CREATE TABLE jforum_groups (
  group_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_groups_seq'),
  group_name VARCHAR(40) NOT NULL DEFAULT '',
  group_description VARCHAR(255) DEFAULT NULL,
  parent_id INTEGER DEFAULT 0,
  PRIMARY KEY  (group_id)
);


CREATE TABLE jforum_user_groups (
	group_id INT NOT NULL,
	user_id INT NOT NULL
);
CREATE INDEX idx_ug_group ON jforum_user_groups(group_id);
CREATE INDEX idx_ug_user ON jforum_user_groups(user_id);

--
-- Table structure for table 'jforum_roles'
--

CREATE SEQUENCE jforum_roles_seq;
CREATE TABLE jforum_roles (
  role_id INT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('jforum_roles_seq'),
  group_id INTEGER DEFAULT 0,
  user_id INTEGER DEFAULT 0,
  name VARCHAR(255) NOT NULL,
  role_type INTEGER DEFAULT 1
);
CREATE INDEX idx_roles_group ON jforum_roles(group_id);
CREATE INDEX idx_roles_user ON jforum_roles(user_id);
CREATE INDEX idx_roles_name ON jforum_roles(name);

--
-- Table structure for table 'jforum_role_values'
--
CREATE TABLE jforum_role_values (
  role_id INT NOT NULL,
  role_value VARCHAR(255),
  role_type INTEGER DEFAULT 1
);
CREATE INDEX idx_rv_role ON jforum_role_values(role_id);

--
-- Table structure for table 'jforum_posts'
--

CREATE SEQUENCE jforum_posts_seq;
CREATE TABLE jforum_posts (
  post_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_posts_seq'),
  topic_id INTEGER NOT NULL DEFAULT 0,
  forum_id INTEGER NOT NULL DEFAULT 0,
  user_id INTEGER DEFAULT NULL,
  post_time timestamp DEFAULT NULL,
  poster_ip VARCHAR(15) DEFAULT NULL,
  enable_bbcode INTEGER NOT NULL DEFAULT 1,
  enable_html INTEGER NOT NULL DEFAULT 1,
  enable_smilies INTEGER NOT NULL DEFAULT 1,
  enable_sig INTEGER NOT NULL DEFAULT 1,
  post_edit_time timestamp DEFAULT NULL,
  post_edit_count INTEGER NOT NULL DEFAULT 0,
  status INTEGER DEFAULT 1,
  attach INTEGER DEFAULT 0,
  need_moderate INTEGER DEFAULT 0,
  PRIMARY KEY  (post_id)
);
CREATE INDEX idx_posts_user ON jforum_posts(user_id);
CREATE INDEX idx_posts_topic ON jforum_posts(topic_id);
CREATE INDEX idx_posts_forum ON jforum_posts(forum_id);

--
-- Table structure for table 'jforum_posts_text'
--
CREATE TABLE jforum_posts_text (
	post_id INTEGER NOT NULL,
	post_text TEXT,
	post_subject VARCHAR(100) DEFAULT NULL,
	PRIMARY KEY ( post_id )
);

--
-- Table structure for table 'jforum_privmsgs'
--

CREATE SEQUENCE jforum_privmsgs_seq;
CREATE TABLE jforum_privmsgs (
  privmsgs_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_privmsgs_seq'),
  privmsgs_type INTEGER NOT NULL DEFAULT 0,
  privmsgs_subject VARCHAR(255) NOT NULL DEFAULT '',
  privmsgs_from_userid INTEGER NOT NULL DEFAULT 0,
  privmsgs_to_userid INTEGER NOT NULL DEFAULT 0,
  privmsgs_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  privmsgs_ip VARCHAR(8) NOT NULL DEFAULT '',
  privmsgs_enable_bbcode INTEGER NOT NULL DEFAULT 1,
  privmsgs_enable_html INTEGER NOT NULL DEFAULT 0,
  privmsgs_enable_smilies INTEGER NOT NULL DEFAULT 1,
  privmsgs_attach_sig INTEGER NOT NULL DEFAULT 1,
  PRIMARY KEY  (privmsgs_id)
);

CREATE TABLE jforum_privmsgs_text (
	privmsgs_id INTEGER NOT NULL,
	privmsgs_text TEXT
);
CREATE INDEX idx_pm_text_id ON jforum_privmsgs_text (privmsgs_id);

--
-- Table structure for table 'jforum_ranks'
--

CREATE SEQUENCE jforum_ranks_seq;
CREATE TABLE jforum_ranks (
  rank_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_ranks_seq'),
  rank_title VARCHAR(50) NOT NULL DEFAULT '',
  rank_min INTEGER NOT NULL DEFAULT 0,
  rank_special INTEGER DEFAULT NULL,
  rank_image VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY  (rank_id)
);

--
-- Table structure for table 'jforum_sessions'
--

CREATE TABLE jforum_sessions (
  session_id VARCHAR(50) NOT NULL DEFAULT '',
  session_user_id INTEGER NOT NULL DEFAULT 0,
  session_start timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  session_time int NOT NULL DEFAULT 0,
  session_ip VARCHAR(8) NOT NULL DEFAULT '',
  session_page INTEGER NOT NULL DEFAULT 0,
  session_logged_int INTEGER DEFAULT NULL
);

--
-- Table structure for table 'jforum_smilies'
--

CREATE SEQUENCE jforum_smilies_seq;
CREATE TABLE jforum_smilies (
  smilie_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_smilies_seq'),
  code VARCHAR(50) NOT NULL DEFAULT '',
  url VARCHAR(100) DEFAULT NULL,
  disk_name VARCHAR(255),
  PRIMARY KEY  (smilie_id)
);

--
-- Table structure for table 'jforum_themes'
--

CREATE SEQUENCE jforum_themes_seq;
CREATE TABLE jforum_themes (
  themes_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_themes_seq'),
  template_name VARCHAR(30) NOT NULL DEFAULT '',
  style_name VARCHAR(30) NOT NULL DEFAULT '',
  PRIMARY KEY  (themes_id)
);

--
-- Table structure for table 'jforum_topics'
--

CREATE SEQUENCE jforum_topics_seq;
CREATE TABLE jforum_topics (
  topic_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_topics_seq'),
  forum_id INTEGER NOT NULL DEFAULT 0,
  topic_title VARCHAR(100) NOT NULL DEFAULT '',
  user_id INTEGER NOT NULL DEFAULT 0,
  topic_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  topic_views INTEGER DEFAULT 1,
  topic_replies INTEGER DEFAULT 0,
  topic_status INTEGER DEFAULT 0,
  topic_vote INTEGER DEFAULT 0,
  topic_type INTEGER DEFAULT 0,
  topic_first_post_id INTEGER DEFAULT 0,
  topic_last_post_id INTEGER NOT NULL DEFAULT 0,
  moderated INTEGER DEFAULT 0,
  PRIMARY KEY  (topic_id)
);
CREATE INDEX idx_topics_forum ON jforum_topics(forum_id);
CREATE INDEX idx_topics_user ON jforum_topics(user_id);
CREATE INDEX idx_topics_fp ON jforum_topics(topic_first_post_id);
CREATE INDEX idx_topics_lp ON jforum_topics(topic_last_post_id);

--
-- Table structure for table 'jforum_topics_watch'
--

CREATE TABLE jforum_topics_watch (
  topic_id INTEGER NOT NULL DEFAULT 0,
  user_id INTEGER NOT NULL DEFAULT 0,
  is_read INTEGER NOT NULL DEFAULT 0
);
CREATE INDEX idx_tw_topic ON jforum_topics_watch(topic_id);
CREATE INDEX idx_tw_user ON jforum_topics_watch(user_id);

--
-- Table structure for table 'jforum_users'
--

CREATE SEQUENCE jforum_users_seq;
CREATE TABLE jforum_users (
  user_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_users_seq'),
  user_active INTEGER DEFAULT NULL,
  username VARCHAR(50) NOT NULL DEFAULT '',
  user_password VARCHAR(32) NOT NULL DEFAULT '',
  user_session_time int NOT NULL DEFAULT 0,
  user_session_page INTEGER NOT NULL DEFAULT 0,
  user_lastvisit timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_regdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_level INTEGER DEFAULT NULL,
  user_posts INTEGER NOT NULL DEFAULT 0,
  user_timezone VARCHAR(5) NOT NULL DEFAULT '',
  user_style INTEGER DEFAULT NULL,
  user_lang VARCHAR(255) DEFAULT NULL,
  user_dateformat VARCHAR(20) NOT NULL DEFAULT '%d/%M/%Y %H:%i',
  user_new_privmsg INTEGER NOT NULL DEFAULT 0,
  user_unread_privmsg INTEGER NOT NULL DEFAULT 0,
  user_last_privmsg timestamp NULL,
  user_emailtime timestamp NULL,
  user_viewemail INTEGER DEFAULT 0,
  user_attachsig INTEGER DEFAULT 1,
  user_allowhtml INTEGER DEFAULT 0,
  user_allowbbcode INTEGER DEFAULT 1,
  user_allowsmilies INTEGER DEFAULT 1,
  user_allowavatar INTEGER DEFAULT 1,
  user_allow_pm INTEGER DEFAULT 1,
  user_allow_viewonline INTEGER DEFAULT 1,
  user_notify INTEGER DEFAULT 1,
  user_notify_pm INTEGER DEFAULT 1,
  user_popup_pm INTEGER DEFAULT 1,
  rank_id INTEGER DEFAULT 1,
  user_avatar VARCHAR(100) DEFAULT NULL,
  user_avatar_type INTEGER NOT NULL DEFAULT 0,
  user_email VARCHAR(255) NOT NULL DEFAULT '',
  user_icq VARCHAR(15) DEFAULT NULL,
  user_website VARCHAR(100) DEFAULT NULL,
  user_from VARCHAR(100) DEFAULT NULL,
  user_sig TEXT,
  user_sig_bbcode_uid VARCHAR(10) DEFAULT NULL,
  user_aim VARCHAR(255) DEFAULT NULL,
  user_yim VARCHAR(255) DEFAULT NULL,
  user_msnm VARCHAR(255) DEFAULT NULL,
  user_occ VARCHAR(100) DEFAULT NULL,
  user_interests VARCHAR(255) DEFAULT NULL,
  user_actkey VARCHAR(32) DEFAULT NULL,
  gender CHAR(1) DEFAULT NULL,
  themes_id INTEGER DEFAULT NULL,
  deleted INTEGER DEFAULT NULL,
  user_viewonline INTEGER DEFAULT 1,
  security_hash VARCHAR(32),
  user_karma NUMERIC(10,2),
  PRIMARY KEY  (user_id)
);


--
-- Table structure for table 'jforum_vote_desc'
--

CREATE SEQUENCE jforum_vote_desc_seq;
CREATE TABLE jforum_vote_desc (
  vote_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_vote_desc_seq'),
  topic_id INTEGER NOT NULL DEFAULT 0,
  vote_text TEXT NOT NULL,
  vote_start INTEGER NOT NULL DEFAULT 0,
  vote_length INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY  (vote_id)
);

--
-- Table structure for table 'jforum_vote_results'
--

CREATE TABLE jforum_vote_results (
  vote_id INTEGER NOT NULL DEFAULT 0,
  vote_option_id INTEGER NOT NULL DEFAULT 0,
  vote_option_text VARCHAR(255) NOT NULL DEFAULT '',
  vote_result INTEGER NOT NULL DEFAULT 0
);

--
-- Table structure for table 'jforum_vote_voters'
--

CREATE TABLE jforum_vote_voters (
  vote_id INTEGER NOT NULL DEFAULT 0,
  vote_user_id INTEGER NOT NULL DEFAULT 0,
  vote_user_ip CHAR(8) NOT NULL DEFAULT ''
);

--
-- Table structure for table 'jforum_words'
--

CREATE SEQUENCE jforum_words_seq;
CREATE TABLE jforum_words (
  word_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_words_seq'),
  word VARCHAR(100) NOT NULL DEFAULT '',
  replacement VARCHAR(100) NOT NULL DEFAULT '',
  PRIMARY KEY  (word_id)
);

--
-- Table structure for table 'jforum_search_words'
--
CREATE SEQUENCE jforum_search_words_seq;
CREATE TABLE jforum_search_words (
  word_id INT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('jforum_search_words_seq'),
  word VARCHAR(100) NOT NULL,
  word_hash INT
);
CREATE INDEX idx_sw_word ON jforum_search_words(word);
CREATE INDEX idx_sw_hash ON jforum_search_words(word_hash);

-- 
-- Table structure for table 'jforum_search_wordmatch'
--
CREATE TABLE jforum_search_wordmatch (
  post_id INT NOT NULL,
  word_id INT NOT NULL,
  title_match INTEGER DEFAULT 0
);
CREATE INDEX idx_swm_post ON jforum_search_wordmatch(post_id);
CREATE INDEX idx_swm_word ON jforum_search_wordmatch(word_id);
CREATE INDEX idx_swm_title ON jforum_search_wordmatch(title_match);

--
-- Table structure for table 'jforum_search_results'
--
CREATE TABLE jforum_search_results (
  topic_id INT NOT NULL,
  session VARCHAR(50),
  search_time TIMESTAMP
);
CREATE INDEX idx_sr_topic ON jforum_search_results(topic_id);


CREATE TABLE jforum_search_topics (
  topic_id INTEGER NOT NULL,
  forum_id INTEGER NOT NULL DEFAULT 0,
  topic_title VARCHAR(100) NOT NULL DEFAULT '',
  user_id INTEGER NOT NULL DEFAULT 0,
  topic_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  topic_views INTEGER DEFAULT 1,
  topic_replies INTEGER DEFAULT 0,
  topic_status INTEGER DEFAULT 0,
  topic_vote INTEGER DEFAULT 0,
  topic_type INTEGER DEFAULT 0,
  topic_first_post_id INTEGER DEFAULT 0,
  topic_last_post_id INTEGER NOT NULL DEFAULT 0,
  moderated INTEGER DEFAULT 0,
  session VARCHAR(50),
  search_time TIMESTAMP
);

CREATE INDEX idx_st_topic ON jforum_search_topics(topic_id);
CREATE INDEX idx_st_forum ON jforum_search_topics(forum_id);
CREATE INDEX idx_st_user ON jforum_search_topics(user_id);
CREATE INDEX idx_st_fp ON jforum_search_topics(topic_first_post_id);
CREATE INDEX idx_st_lp ON jforum_search_topics(topic_last_post_id);

--
-- Table structure for table 'jforum_karma'
--
CREATE SEQUENCE jforum_karma_seq;
CREATE TABLE jforum_karma (
	karma_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_karma_seq'),
	post_id INTEGER NOT NULL,
	topic_id INTEGER NOT NULL,
	post_user_id INTEGER NOT NULL,
	from_user_id INTEGER NOT NULL,
	points INTEGER NOT NULL,
	rate_date TIMESTAMP DEFAULT NULL,
	PRIMARY KEY(karma_id)
);

CREATE INDEX idx_krm_post ON jforum_karma(post_id);
CREATE INDEX idx_krm_topic ON jforum_karma(topic_id);
CREATE INDEX idx_krm_user ON jforum_karma(post_user_id);
CREATE INDEX idx_krm_from ON jforum_karma(from_user_id);

--
-- Table structure for table 'jforum_bookmark'
--
CREATE SEQUENCE jforum_bookmarks_seq;
CREATE TABLE jforum_bookmarks (
	bookmark_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_bookmarks_seq'),
	user_id INTEGER NOT NULL,
	relation_id INTEGER NOT NULL,
	relation_type INTEGER NOT NULL,
	public_visible INTEGER DEFAULT 1,
	title VARCHAR(255),
	description VARCHAR(255),
	PRIMARY KEY(bookmark_id)
);

CREATE INDEX idx_bok_user ON jforum_bookmarks(user_id);
CREATE INDEX idx_bok_rel ON jforum_bookmarks(relation_id);

-- 
-- Table structure for table 'jforum_quota_limit'
--
CREATE SEQUENCE jforum_quota_limit_seq;
CREATE TABLE jforum_quota_limit (
	quota_limit_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_quota_limit_seq'),
	quota_desc VARCHAR(50) NOT NULL,
	quota_limit INTEGER NOT NULL,
	quota_type INTEGER DEFAULT 1,
	PRIMARY KEY(quota_limit_id)
);

--
-- Table structure for table 'jforum_extension_groups'
--
CREATE SEQUENCE jforum_extension_groups_seq;
CREATE TABLE jforum_extension_groups (
	extension_group_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_extension_groups_seq'),
	name VARCHAR(100) NOT NULL,
	allow INTEGER DEFAULT 1, 
	upload_icon VARCHAR(100),
	download_mode INTEGER DEFAULT 1,
	PRIMARY KEY(extension_group_id)
);

-- 
-- Table structure for table 'jforum_extensions'
--
CREATE SEQUENCE jforum_extensions_seq;
CREATE TABLE jforum_extensions (
	extension_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_extensions_seq'),
	extension_group_id INTEGER NOT NULL,
	description VARCHAR(100),
	upload_icon VARCHAR(100),
	extension VARCHAR(10),
	allow INTEGER DEFAULT 1,
	PRIMARY KEY(extension_id)
);

CREATE INDEX idx_ext_group ON jforum_extensions(extension_group_id);
CREATE INDEX idx_ext_ext ON jforum_extensions(extension);

--
-- Table structure for table 'jforum_attach'
--
CREATE SEQUENCE jforum_attach_seq;
CREATE TABLE jforum_attach (
	attach_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_attach_seq'),
	post_id INTEGER,
	privmsgs_id INTEGER,
	user_id INTEGER NOT NULL,
	PRIMARY KEY(attach_id)
);

CREATE INDEX idx_att_post ON jforum_attach(post_id);
CREATE INDEX idx_att_priv ON jforum_attach(privmsgs_id);
CREATE INDEX idx_att_user ON jforum_attach(user_id);

-- 
-- Table structure for table 'jforum_attach_desc'
--
CREATE SEQUENCE jforum_attach_desc_seq;
CREATE TABLE jforum_attach_desc (
	attach_desc_id INTEGER NOT NULL PRIMARY KEY DEFAULT NEXTVAL('jforum_attach_desc_seq'),
	attach_id INTEGER NOT NULL,
	physical_filename VARCHAR(255) NOT NULL,
	real_filename VARCHAR(255) NOT NULL,
	download_count INTEGER,
	description VARCHAR(255),
	mimetype VARCHAR(50),
	filesize NUMERIC(20),
	upload_time DATE,
	thumb INTEGER DEFAULT 0,
	extension_id INTEGER
);

CREATE INDEX idx_att_d_att ON jforum_attach_desc(attach_id);
CREATE INDEX idx_att_d_ext ON jforum_attach_desc(extension_id);

--
-- Table structure for table 'jforum_attach_quota'
--
CREATE SEQUENCE jforum_attach_quota_seq;
CREATE TABLE jforum_attach_quota (
	attach_quota_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_attach_quota_seq'),
	group_id INTEGER NOT NULL,
	quota_limit_id INTEGER NOT NULL,
	PRIMARY KEY(attach_quota_id)
);

CREATE INDEX idx_aq_group ON jforum_attach_quota(group_id);
CREATE INDEX idx_aq_ql ON jforum_attach_quota(quota_limit_id);

--
-- Table structure for table 'jforum_banner'
--
CREATE SEQUENCE jforum_banner_seq;
CREATE TABLE jforum_banner (
	banner_id INTEGER NOT NULL DEFAULT NEXTVAL('jforum_banner_seq'),
	banner_name VARCHAR(90),
	banner_placement INTEGER NOT NULL DEFAULT 0,
	banner_description VARCHAR(250),
	banner_clicks INTEGER NOT NULL DEFAULT 0,
	banner_views INTEGER NOT NULL DEFAULT 0,
	banner_url VARCHAR(250),
	banner_weight INTEGER NOT NULL DEFAULT 50,
	banner_active INTEGER NOT NULL DEFAULT 0,
	banner_comment VARCHAR(250),
	banner_type INTEGER NOT NULL DEFAULT 0,
	banner_width INTEGER NOT NULL DEFAULT 0,
	banner_height INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY(banner_id)
);

--sakai integration related
ALTER TABLE jforum_users ADD COLUMN user_fname VARCHAR(255);
ALTER TABLE jforum_users ADD COLUMN user_lname VARCHAR(255);

CREATE TABLE jforum_sakai_course_categories (
	course_id VARCHAR(99) NOT NULL,
	categories_id INTEGER NOT NULL
);

CREATE TABLE jforum_sakai_course_groups (
	course_id VARCHAR(99) NOT NULL,
	group_id INTEGER NOT NULL
);

CREATE TABLE jforum_sakai_course_initvalues (
	course_id VARCHAR(99) NOT NULL,
	init_status SMALLINT NOT NULL
);

CREATE TABLE jforum_sakai_course_privmsgs (
	course_id VARCHAR(99) NOT NULL,
	privmsgs_id INTEGER NOT NULL
);

ALTER TABLE jforum_users ALTER user_notify INTEGER SET DEFAULT  0;
ALTER TABLE jforum_users ALTER user_notify_pm INTEGER SET DEFAULT  0;

CREATE TABLE jforum_sakai_sessions (
	course_id VARCHAR(99) NOT NULL,
	user_id INTEGER NOT NULL,
	visit_time timestamp NOT NULL
);