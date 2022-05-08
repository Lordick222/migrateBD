
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, CODE, CHECK_TYPE, OPERATION_TYPE, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROOVY_SCRIPT, FILTER_XML, IS_ACTIVE, GROUP_ID
FROM tms.dbo.SEC_CONSTRAINT;
INSERT INTO sec_constraint
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, code, check_type, operation_type, entity_name, join_clause, where_clause, groovy_script, filter_xml, is_active, group_id)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, EVENT_TS, USER_ID, CHANGE_TYPE, ENTITY, ENTITY_INSTANCE_NAME, ENTITY_ID, STRING_ENTITY_ID, INT_ENTITY_ID, LONG_ENTITY_ID, CHANGES
FROM tms.dbo.SEC_ENTITY_LOG;
INSERT INTO sec_entity_log
(id, create_ts, created_by, sys_tenant_id, event_ts, user_id, change_type, entity, entity_instance_name, entity_id, string_entity_id, int_entity_id, long_entity_id, changes)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, COMPONENT, NAME, CODE, [XML], USER_ID, GLOBAL_DEFAULT
FROM tms.dbo.SEC_FILTER;
INSERT INTO sec_filter
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, component, "name", code, "xml", user_id, global_default)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, PARENT_ID
FROM tms.dbo.SEC_GROUP;
INSERT INTO sec_group
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, "name", parent_id)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, GROUP_ID, PARENT_ID, HIERARCHY_LEVEL
FROM tms.dbo.SEC_GROUP_HIERARCHY;
INSERT INTO sec_group_hierarchy
(id, create_ts, created_by, sys_tenant_id, group_id, parent_id, hierarchy_level)
VALUES(?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ENTITY_NAME, OPERATION_TYPE, VALUES_
FROM tms.dbo.SEC_LOCALIZED_CONSTRAINT_MSG;
INSERT INTO sec_localized_constraint_msg
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, entity_name, operation_type, values_)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, ENTITY_ID, NAME
FROM tms.dbo.SEC_LOGGED_ATTR;
INSERT INTO sec_logged_attr
(id, create_ts, created_by, entity_id, "name")
VALUES(?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, NAME, AUTO, MANUAL
FROM tms.dbo.SEC_LOGGED_ENTITY;
INSERT INTO sec_logged_entity
(id, create_ts, created_by, "name", auto, manual)
VALUES(?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID
FROM tms.dbo.SEC_PERMISSION;
INSERT INTO sec_permission
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, permission_type, target, value_, role_id)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, COMPONENT, NAME, [XML], USER_ID, IS_AUTO_SAVE
FROM tms.dbo.SEC_PRESENTATION;
INSERT INTO sec_presentation
(id, create_ts, created_by, update_ts, updated_by, sys_tenant_id, component, "name", "xml", user_id, is_auto_save)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, USER_ID, TOKEN
FROM tms.dbo.SEC_REMEMBER_ME;
INSERT INTO sec_remember_me
(id, create_ts, created_by, "version", user_id, "token")
VALUES(?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, LOC_NAME, DESCRIPTION, IS_DEFAULT_ROLE, ROLE_TYPE
FROM tms.dbo.SEC_ROLE;
INSERT INTO sec_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, "name", loc_name, description, is_default_role, role_type, security_scope)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, USER_ID, CAPTION, URL, ENTITY_ID, SUBSTITUTED_USER_ID
FROM tms.dbo.SEC_SCREEN_HISTORY;
INSERT INTO sec_screen_history
(id, create_ts, created_by, sys_tenant_id, user_id, caption, url, entity_id, string_entity_id, int_entity_id, long_entity_id, substituted_user_id)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT FOLDER_ID, FILTER_COMPONENT, FILTER_XML, USER_ID, PRESENTATION_ID, APPLY_DEFAULT, IS_SET, ENTITY_TYPE
FROM tms.dbo.SEC_SEARCH_FOLDER;
INSERT INTO sec_search_folder
(folder_id, filter_component, filter_xml, user_id, presentation_id, apply_default, is_set, entity_type)
VALUES(?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, STR_VALUE, DATATYPE, GROUP_ID
FROM tms.dbo.SEC_SESSION_ATTR;
INSERT INTO sec_session_attr
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, "name", str_value, "datatype", group_id)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, SESSION_ID, USER_ID, SUBSTITUTED_USER_ID, USER_DATA, LAST_ACTION, CLIENT_INFO, CLIENT_TYPE, ADDRESS, STARTED_TS, FINISHED_TS, SERVER_ID
FROM tms.dbo.SEC_SESSION_LOG;
INSERT INTO sec_session_log
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, session_id, user_id, substituted_user_id, user_data, last_action, client_info, client_type, address, started_ts, finished_ts, server_id)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, [LOGIN], LOGIN_LC, PASSWORD, NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, POSITION_, EMAIL, LANGUAGE_, TIME_ZONE, TIME_ZONE_AUTO, ACTIVE, GROUP_ID, IP_MASK, CHANGE_PASSWORD_AT_LOGON
FROM tms.dbo.SEC_USER;
INSERT INTO sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active, group_id, group_names, ip_mask, change_password_at_logon)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, USER_ID, ROLE_ID
FROM tms.dbo.SEC_USER_ROLE;
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, user_id, role_id, role_name)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, USER_ID, CLIENT_TYPE, NAME, VALUE_
FROM tms.dbo.SEC_USER_SETTING;
INSERT INTO sec_user_setting
(id, create_ts, created_by, user_id, client_type, "name", value_)
VALUES(?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, USER_ID, SUBSTITUTED_USER_ID, START_DATE, END_DATE
FROM tms.dbo.SEC_USER_SUBSTITUTION;
INSERT INTO sec_user_substitution
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, user_id, substituted_user_id, start_date, end_date)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end

-- start
SELECT ID, CREATE_TS, TOKEN_VALUE, TOKEN_BYTES, AUTHENTICATION_KEY, AUTHENTICATION_BYTES, EXPIRY, USER_LOGIN, LOCALE, REFRESH_TOKEN_VALUE
FROM tms.dbo.SYS_ACCESS_TOKEN;
INSERT INTO sys_access_token
(id, create_ts, token_value, token_bytes, authentication_key, authentication_bytes, expiry, user_login, locale, refresh_token_value)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT FOLDER_ID, FILTER_COMPONENT, FILTER_XML, VISIBILITY_SCRIPT, QUANTITY_SCRIPT, APPLY_DEFAULT
FROM tms.dbo.SYS_APP_FOLDER;
INSERT INTO sys_app_folder
(folder_id, filter_component, filter_xml, visibility_script, quantity_script, apply_default)
VALUES(?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, CATEGORY_ATTR_ID, ENTITY_ID, STRING_ENTITY_ID, INT_ENTITY_ID, LONG_ENTITY_ID, STRING_VALUE, INTEGER_VALUE, DOUBLE_VALUE, DATE_VALUE, BOOLEAN_VALUE, ENTITY_VALUE, STRING_ENTITY_VALUE, INT_ENTITY_VALUE, LONG_ENTITY_VALUE, CODE, PARENT_ID
FROM tms.dbo.SYS_ATTR_VALUE;
INSERT INTO sys_attr_value
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, category_attr_id, code, entity_id, string_entity_id, int_entity_id, long_entity_id, string_value, integer_value, double_value, decimal_value, date_value, date_wo_time_value, boolean_value, entity_value, string_entity_value, int_entity_value, long_entity_value, parent_id)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, SPECIAL, ENTITY_TYPE, IS_DEFAULT, DISCRIMINATOR, LOCALE_NAMES
FROM tms.dbo.SYS_CATEGORY;
INSERT INTO sys_category
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", special, entity_type, is_default, discriminator, locale_names)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, CATEGORY_ENTITY_TYPE, NAME, CODE, CATEGORY_ID, ENTITY_CLASS, DATA_TYPE, DEFAULT_STRING, DEFAULT_INT, DEFAULT_DOUBLE, DEFAULT_DATE, DEFAULT_DATE_IS_CURRENT, DEFAULT_BOOLEAN, DEFAULT_ENTITY_VALUE, DEFAULT_STR_ENTITY_VALUE, DEFAULT_INT_ENTITY_VALUE, DEFAULT_LONG_ENTITY_VALUE, ENUMERATION, ORDER_NO, SCREEN, REQUIRED, LOOKUP, TARGET_SCREENS, WIDTH, ROWS_COUNT, IS_COLLECTION, JOIN_CLAUSE, WHERE_CLAUSE, FILTER_XML, LOCALE_NAMES, ENUMERATION_LOCALES
FROM tms.dbo.SYS_CATEGORY_ATTR;
INSERT INTO sys_category_attr
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, category_entity_type, "name", code, description, category_id, entity_class, data_type, default_string, default_int, default_double, default_decimal, default_date, default_date_wo_time, default_date_is_current, default_boolean, default_entity_value, default_str_entity_value, default_int_entity_value, default_long_entity_value, enumeration, order_no, screen, required, lookup, target_screens, width, rows_count, is_collection, join_clause, where_clause, filter_xml, locale_names, locale_descriptions, enumeration_locales, attribute_configuration_json)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, NAME, VALUE_
FROM tms.dbo.SYS_CONFIG;
INSERT INTO sys_config
(id, create_ts, created_by, "version", update_ts, updated_by, "name", value_)
VALUES(?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, ENTITY_META_CLASS, ENTITY_ID, STRING_ENTITY_ID, INT_ENTITY_ID, LONG_ENTITY_ID, AUTHOR_ID, VIEW_XML, SNAPSHOT_XML, SNAPSHOT_DATE
FROM tms.dbo.SYS_ENTITY_SNAPSHOT;
INSERT INTO sys_entity_snapshot
(id, create_ts, created_by, sys_tenant_id, entity_meta_class, entity_id, string_entity_id, int_entity_id, long_entity_id, author_id, view_xml, snapshot_xml, snapshot_date)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, NAME, INSTANCE_COUNT, FETCH_UI, MAX_FETCH_UI, LAZY_COLLECTION_THRESHOLD, LOOKUP_SCREEN_THRESHOLD
FROM tms.dbo.SYS_ENTITY_STATISTICS;
INSERT INTO sys_entity_statistics
(id, create_ts, created_by, update_ts, updated_by, "name", instance_count, fetch_ui, max_fetch_ui, lazy_collection_threshold, lookup_screen_threshold)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, EXT, FILE_SIZE, CREATE_DATE
FROM tms.dbo.SYS_FILE;
INSERT INTO sys_file
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, "name", ext, file_size, create_date)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, FOLDER_TYPE, PARENT_ID, NAME, TAB_NAME, SORT_ORDER
FROM tms.dbo.SYS_FOLDER;
INSERT INTO sys_folder
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, folder_type, parent_id, "name", tab_name, sort_order)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, ENTITY_ID, STRING_ENTITY_ID, INT_ENTITY_ID, LONG_ENTITY_ID, ENTITY_NAME, CHANGE_TYPE, SOURCE_HOST, INDEXING_HOST, FAKE
FROM tms.dbo.SYS_FTS_QUEUE;
INSERT INTO sys_fts_queue
(id, create_ts, created_by, entity_id, string_entity_id, int_entity_id, long_entity_id, entity_name, change_type, source_host, indexing_host, fake)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NODE_NAME, ADDRESS, [LOGIN], PASSWORD
FROM tms.dbo.SYS_JMX_INSTANCE;
INSERT INTO sys_jmx_instance
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, node_name, address, login, "password")
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, NAME, TIMEOUT_SEC
FROM tms.dbo.SYS_LOCK_CONFIG;
INSERT INTO sys_lock_config
(id, create_ts, created_by, "name", timeout_sec)
VALUES(?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, SESSION_ID, QUERY_KEY, ENTITY_ID, STRING_ENTITY_ID, INT_ENTITY_ID, LONG_ENTITY_ID
FROM tms.dbo.SYS_QUERY_RESULT;
INSERT INTO sys_query_result
(session_id, query_key, entity_id, string_entity_id, int_entity_id, long_entity_id)
VALUES(?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, TOKEN_VALUE, TOKEN_BYTES, AUTHENTICATION_BYTES, EXPIRY, USER_LOGIN
FROM tms.dbo.SYS_REFRESH_TOKEN;
INSERT INTO sys_refresh_token
(id, create_ts, token_value, token_bytes, authentication_bytes, expiry, user_login)
VALUES(?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, TASK_ID, SERVER, START_TIME, FINISH_TIME, [RESULT]
FROM tms.dbo.SYS_SCHEDULED_EXECUTION;
INSERT INTO sys_scheduled_execution
(id, create_ts, created_by, sys_tenant_id, task_id, "server", start_time, finish_time, "result")
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, DEFINED_BY, CLASS_NAME, SCRIPT_NAME, BEAN_NAME, METHOD_NAME, METHOD_PARAMS, USER_NAME, IS_SINGLETON, IS_ACTIVE, PERIOD, TIMEOUT, START_DATE, TIME_FRAME, START_DELAY, PERMITTED_SERVERS, LOG_START, LOG_FINISH, LAST_START_TIME, LAST_START_SERVER, DESCRIPTION, CRON, SCHEDULING_TYPE
FROM tms.dbo.SYS_SCHEDULED_TASK;
INSERT INTO sys_scheduled_task
(id, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, defined_by, class_name, script_name, bean_name, method_name, method_params, user_name, is_singleton, is_active, period_, timeout, start_date, time_frame, start_delay, permitted_servers, log_start, log_finish, last_start_time, last_start_server, description, cron, scheduling_type)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, MESSAGE_ID, CONTENT, CONTENT_FILE_ID, CONTENT_ID, NAME, DISPOSITION, TEXT_ENCODING
FROM tms.dbo.SYS_SENDING_ATTACHMENT;
INSERT INTO sys_sending_attachment
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, message_id, "content", content_file_id, content_id, "name", disposition, text_encoding)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ADDRESS_TO, ADDRESS_FROM, CAPTION, EMAIL_HEADERS, CONTENT_TEXT, CONTENT_TEXT_FILE_ID, DEADLINE, STATUS, DATE_SENT, ATTEMPTS_COUNT, ATTEMPTS_MADE, ATTACHMENTS_NAME, BODY_CONTENT_TYPE
FROM tms.dbo.SYS_SENDING_MESSAGE;
INSERT INTO sys_sending_message
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, address_to, address_cc, address_bcc, address_from, caption, email_headers, content_text, content_text_file_id, deadline, status, date_sent, attempts_count, attempts_made, attachments_name, body_content_type)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, NAME, IS_RUNNING, [DATA]
FROM tms.dbo.SYS_SERVER;
INSERT INTO sys_server
(id, create_ts, created_by, update_ts, updated_by, "name", is_running, "data")
VALUES(?, ?, ?, ?, ?, ?, ?, ?);
-- end