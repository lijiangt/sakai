/* 
Profile2 indexes only (Oracle)
-----------------------------

If you didn't run any of the conversion scripts, run this SQL to add the required indexes to the database tables. 
If you are upgrading Profile2, use the proper conversion scripts instead

*/

/* Use this for: v1.1 and earlier to v1.2: */
create index PROFILE_FRIENDS_USER_UUID_I on PROFILE_FRIENDS_T (USER_UUID);
create index PROFILE_FRIENDS_FRIEND_UUID_I on PROFILE_FRIENDS_T (FRIEND_UUID);
create index PROFILE_IMAGES_USER_UUID_I on PROFILE_IMAGES_T (USER_UUID);
create index PROFILE_IMAGES_IS_CURRENT_I on PROFILE_IMAGES_T (IS_CURRENT);
create index SAKAI_PERSON_META_USER_UUID_I on SAKAI_PERSON_META_T (USER_UUID);
create index SAKAI_PERSON_META_PROPERTY_I on SAKAI_PERSON_META_T (PROPERTY);

/* use this for: v1.2 to 1.4 (no db changes in 1.3) */
create index PROFILE_CP_USER_UUID_I on PROFILE_COMPANY_PROFILES_T (USER_UUID);
create index PROFILE_M_THREAD_I on PROFILE_MESSAGES_T (MESSAGE_THREAD);
create index PROFILE_M_DATE_POSTED_I on PROFILE_MESSAGES_T (DATE_POSTED);
create index PROFILE_M_FROM_UUID_I on PROFILE_MESSAGES_T (FROM_UUID);
create index PROFILE_M_P_UUID_I on PROFILE_MESSAGE_PARTICIPANTS_T (PARTICIPANT_UUID);
create index PROFILE_M_P_MESSAGE_ID_I on PROFILE_MESSAGE_PARTICIPANTS_T (MESSAGE_ID);
create index PROFILE_M_P_DELETED_I on PROFILE_MESSAGE_PARTICIPANTS_T (MESSAGE_DELETED);
create index PROFILE_M_P_READ_I on PROFILE_MESSAGE_PARTICIPANTS_T (MESSAGE_READ);
create index PROFILE_GI_USER_UUID_I on PROFILE_GALLERY_IMAGES_T (USER_UUID);
create index PROFILE_FRIENDS_CONFIRMED_I on PROFILE_FRIENDS_T (CONFIRMED);
create index PROFILE_STATUS_DATE_ADDED_I on PROFILE_STATUS_T (DATE_ADDED);