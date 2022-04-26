-- -- start
-- SELECT ID, ORDER_ID, LOADING_DATE, UNLOADING_DATE, RATE, TRAVEL_TIME, DISTANCE, CUSTOMER_ID, CUSTOMER_BINDING, KONIKI, MKAD, GUARANTEED_ORDER, REGION_START_ID, REGION_FINISH_ID, LAT_START, LON_START, LAT_FINISH, LON_FINISH, LOADING_TIME, UNLOADING_TIME, PLACE_START_ID, PLACE_FINISH_ID, FEDERAL_DISTRICT_START_ID
-- FROM test_tms_LabIT.dbo.DISTR_ORDER;
-- INSERT INTO distr_order
-- (id, order_id, loading_date, unloading_date, rate, travel_time, distance, customer_id, customer_binding, koniki, mkad, guaranteed_order, region_start_id, region_finish_id, lat_start, lon_start, lat_finish, lon_finish, loading_time, unloading_time, place_start_id, place_finish_id, federal_district_start_id)
-- VALUES(0, ?, '', '', 0, 0, 0, ?, 0, 0, 0, 0, ?, ?, 0, 0, 0, 0, 0, 0, ?, ?, ?);
-- -- end

-- start 
SELECT ID, VEHICLE_ID, ORDER_ID, DATE_S, DATE_F, TIME_DIFF, LAT_S, LON_S, LAT_F, LON_F, FLAG
FROM test_tms_LabIT.dbo.DISTR_ORDER_WORK;
INSERT INTO distr_order_work
(id, vehicle_id, order_id, date_s, date_f, time_diff, lat_s, lon_s, lat_f, lon_f, flag)
VALUES(0, ?, ?, '', '', 0, 0, 0, 0, 0, 0);
-- end

-- start 
SELECT ID, CUSTOMER_ID
FROM test_tms_LabIT.dbo.DISTR_SPECIAL_CUSTOMERS;
INSERT INTO distr_special_customers(id, customer_id) VALUES(0, ?);
-- end

-- start 
SELECT ID, VEHICLE_ID, FLAG, LAT, LON, [DATE], TRAILER_TYPE_ID, KONIKI, MKAD, BINDING
FROM test_tms_LabIT.dbo.DISTR_VEHICLE;
INSERT INTO distr_vehicle
(id, vehicle_id, flag, lat, lon, "date", trailer_type_id, koniki, mkad, binding)
VALUES(0, ?, 0, 0, 0, '', ?, 0, 0, 0);
-- end

-- start 
SELECT ID, VEHICLE_ID, ORDER_ID, CUR_VEHICLE_LAT, CUR_VEHICLE_LON, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, CUR_VEHICLE_DATE, DISTANCE, REGION_START_ID, FEDERAL_DISTRICT_START_ID
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_AND_ORDER;
INSERT INTO distr_vehicle_and_order
(id, vehicle_id, order_id, cur_vehicle_lat, cur_vehicle_lon, order_place_start_lat, order_place_start_lon, cur_vehicle_date, distance, region_start_id, federal_district_start_id)
VALUES(0, ?, ?, 0, 0, 0, 0, '', 0, ?, ?);
-- end

-- start 
SELECT ID, VEHICLE_ID, ORDER_ID, CUR_VEHICLE_LAT, CUR_VEHICLE_LON, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, CUR_VEHICLE_DATE, DISTANCE, REGION_START_ID, FEDERAL_DISTRICT_START_ID
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_AND_ORDER_CUSTOMERS;
INSERT INTO distr_vehicle_and_order_custom_column
(id, vehicle_id, order_id, cur_vehicle_lat, cur_vehicle_lon, order_place_start_lat, order_place_start_lon, cur_vehicle_date, distance, region_start_id, federal_district_start_id)
VALUES(0, ?, ?, 0, 0, 0, 0, '', 0, ?, ?);
-- end

-- start 
SELECT ID, VEHICLE_ID, ORDER_ID, CUR_VEHICLE_LAT, CUR_VEHICLE_LON, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, CUR_VEHICLE_DATE, DISTANCE, REGION_START_ID, FEDERAL_DISTRICT_START_ID
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_AND_ORDER_CUSTOM_COLUMN;
INSERT INTO distr_vehicle_and_order_customers
(id, vehicle_id, order_id, cur_vehicle_lat, cur_vehicle_lon, order_place_start_lat, order_place_start_lon, cur_vehicle_date, distance, region_start_id, federal_district_start_id)
VALUES(0, ?, ?, 0, 0, 0, 0, '', 0, ?, ?);
-- end

-- start 
SELECT ID, VEHICLE_ID, ORDER_ID, CUR_VEHICLE_LAT, CUR_VEHICLE_LON, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, CUR_VEHICLE_DATE, DISTANCE, REGION_START_ID, FEDERAL_DISTRICT_START_ID
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_AND_ORDER_DATE_DIFF;
INSERT INTO distr_vehicle_and_order_date_diff
(id, vehicle_id, order_id, cur_vehicle_lat, cur_vehicle_lon, order_place_start_lat, order_place_start_lon, cur_vehicle_date, distance, region_start_id, federal_district_start_id)
VALUES(0, ?, ?, 0, 0, 0, 0, '', 0, ?, ?);
-- end

-- start 
SELECT ID, VEHICLE_ID, ORDER_ID, CUR_VEHICLE_LAT, CUR_VEHICLE_LON, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, CUR_VEHICLE_DATE, DISTANCE, TRAVEL_TIME, REGION_START_ID, VEHICLE_TASK_ID, TASK_ID, DATE_TO_REACH_DESTINATION, FEDERAL_DISTRICT_START_ID
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_AND_ORDER_FINAL;
INSERT INTO distr_vehicle_and_order_final
(id, vehicle_id, order_id, cur_vehicle_lat, cur_vehicle_lon, order_place_start_lat, order_place_start_lon, cur_vehicle_date, distance, travel_time, region_start_id, vehicle_task_id, task_id, date_to_reach_destination, federal_district_start_id)
VALUES(0, ?, ?, 0, 0, 0, 0, '', 0, 0, ?, ?, 0, '', ?);
-- end

-- start 
SELECT ID, VEHICLE_ID, ORDER_ID, CUR_VEHICLE_LAT, CUR_VEHICLE_LON, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, CUR_VEHICLE_DATE, DISTANCE, REGION_START_ID, FEDERAL_DISTRICT_START_ID
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_AND_ORDER_KONIKI;
INSERT INTO distr_vehicle_and_order_koniki
(id, vehicle_id, order_id, cur_vehicle_lat, cur_vehicle_lon, order_place_start_lat, order_place_start_lon, cur_vehicle_date, distance, region_start_id, federal_district_start_id)
VALUES(0, ?, ?, 0, 0, 0, 0, '', 0, ?, ?);
-- end

-- start 
SELECT ID, VEHICLE_ID, ORDER_ID, CUR_VEHICLE_LAT, CUR_VEHICLE_LON, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, CUR_VEHICLE_DATE, DISTANCE, REGION_START_ID, FEDERAL_DISTRICT_START_ID
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_AND_ORDER_MKAD;
INSERT INTO distr_vehicle_and_order_mkad
(id, vehicle_id, order_id, cur_vehicle_lat, cur_vehicle_lon, order_place_start_lat, order_place_start_lon, cur_vehicle_date, distance, region_start_id, federal_district_start_id)
VALUES(0, ?, ?, 0, 0, 0, 0, '', 0, ?, ?);
-- end

-- start 
SELECT ID, VEHICLE_ID, ORDER_ID, CUR_VEHICLE_LAT, CUR_VEHICLE_LON, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, CUR_VEHICLE_DATE, DISTANCE, REGION_START_ID, FEDERAL_DISTRICT_START_ID
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_AND_ORDER_ORDER_CANCEL_HISTORY;
INSERT INTO distr_vehicle_and_order_order_cancel_history
(id, vehicle_id, order_id, cur_vehicle_lat, cur_vehicle_lon, order_place_start_lat, order_place_start_lon, cur_vehicle_date, distance, region_start_id, federal_district_start_id)
VALUES(0, ?, ?, 0, 0, 0, 0, '', 0, ?, ?);
-- end

-- start 
SELECT ID, VEHICLE_ID, ORDER_ID, CUR_VEHICLE_LAT, CUR_VEHICLE_LON, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, CUR_VEHICLE_DATE, DISTANCE, REGION_START_ID, FEDERAL_DISTRICT_START_ID
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_AND_ORDER_RATE_PER_KM;
INSERT INTO distr_vehicle_and_order_rate_per_km
(id, vehicle_id, order_id, cur_vehicle_lat, cur_vehicle_lon, order_place_start_lat, order_place_start_lon, cur_vehicle_date, distance, region_start_id, federal_district_start_id)
VALUES(0, ?, ?, 0, 0, 0, 0, '', 0, ?, ?);
-- end

-- start 
SELECT ID, VEHICLE_ID, ORDER_ID, CUR_VEHICLE_LAT, CUR_VEHICLE_LON, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, CUR_VEHICLE_DATE, DISTANCE, REGION_START_ID, FEDERAL_DISTRICT_START_ID
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_AND_ORDER_RENT;
INSERT INTO distr_vehicle_and_order_rent
(id, vehicle_id, order_id, cur_vehicle_lat, cur_vehicle_lon, order_place_start_lat, order_place_start_lon, cur_vehicle_date, distance, region_start_id, federal_district_start_id)
VALUES(0, ?, ?, 0, 0, 0, 0, '', 0, ?, ?);
-- end

-- start 
SELECT ID, VEHICLE_ID, ORDER_ID, CUR_VEHICLE_LAT, CUR_VEHICLE_LON, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, CUR_VEHICLE_DATE, DISTANCE, REGION_START_ID, FEDERAL_DISTRICT_START_ID
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_AND_ORDER_TRAILER_TYPE;
INSERT INTO distr_vehicle_and_order_trailer_type
(id, vehicle_id, order_id, cur_vehicle_lat, cur_vehicle_lon, order_place_start_lat, order_place_start_lon, cur_vehicle_date, distance, region_start_id, federal_district_start_id)
VALUES(0, ?, ?, 0, 0, 0, 0, '', 0, ?, ?);
-- end

-- start 
SELECT ID, VEHICLE_ID, VEHICLE_TASK_ID, PLACE_FACT_ID, PLACE_FACT_LAT, PLACE_FACT_LON, ORDER_ID, CUR_VEHICLE_LAT, CUR_VEHICLE_LON, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, ORDER_PLACE_FINISH_LAT, ORDER_PLACE_FINISH_LON, CUR_VEHICLE_DATE, DISTANCE_TO_FINISH_PLACE, REGION_START_ID, TYPE_, DISTANCE_TO_PLACE_FACT, VERSION_, DATE_TO_REACH_PLACE_FACT, DATE_TO_REACH_PLACE_FINISH, GEOROUTE_UUID, TRAVEL_TIME_TO_PLACE_FACT, DATE_START_TASK, TRAVEL_TIME_TO_PLACE_FINISH, PLACE_START_ID, PLACE_FINISH_ID
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_AND_ORDER_VEHICLE_TASK;
INSERT INTO distr_vehicle_and_order_vehicle_task
(id, vehicle_id, vehicle_task_id, place_fact_id, place_fact_lat, place_fact_lon, order_id, cur_vehicle_lat, cur_vehicle_lon, order_place_start_lat, order_place_start_lon, order_place_finish_lat, order_place_finish_lon, cur_vehicle_date, distance_to_finish_place, region_start_id, type_, distance_to_place_fact, version_, date_to_reach_place_fact, date_to_reach_place_finish, georoute_uuid, travel_time_to_place_fact, date_start_task, travel_time_to_place_finish, place_start_id, place_finish_id)
VALUES(0, ?, ?, ?, 0, 0, ?, 0, 0, 0, 0, 0, 0, '', 0, ?, '', 0, 0, '', '', ?, 0, '', 0, ?, ?);
-- end

-- start
SELECT ID, VEHICLE_ID, DATE_S, DATE_F, TIME_DIFF, LAT_S, LON_S, LAT_F, LON_F, FLAG
FROM test_tms_LabIT.dbo.DISTR_VEHICLE_FREE_INTERVAL;
INSERT INTO distr_vehicle_free_integererval
(id, vehicle_id, date_s, date_f, time_diff, lat_s, lon_s, lat_f, lon_f, flag)
VALUES(0, ?, '', '', 0, 0, 0, 0, 0, 0);
-- end

-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, CODE, CHECK_TYPE, OPERATION_TYPE, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROOVY_SCRIPT, FILTER_XML, IS_ACTIVE, GROUP_ID
FROM test_tms_LabIT.dbo.SEC_CONSTRAINT;
INSERT INTO sec_constraint
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, code, check_type, operation_type, entity_name, join_clause, where_clause, groovy_script, filter_xml, is_active, group_id)
VALUES(?, '', '', 1, '', '', '', '', '', '', 'db'::character varying, 'read'::character varying, '', '', '', '', '', true, ?);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, EVENT_TS, USER_ID, CHANGE_TYPE, ENTITY, ENTITY_INSTANCE_NAME, ENTITY_ID, STRING_ENTITY_ID, INT_ENTITY_ID, LONG_ENTITY_ID, CHANGES
FROM test_tms_LabIT.dbo.SEC_ENTITY_LOG;
INSERT INTO sec_entity_log
(id, create_ts, created_by, sys_tenant_id, event_ts, user_id, change_type, entity, entity_instance_name, entity_id, string_entity_id, int_entity_id, long_entity_id, changes)
VALUES(?, '', '', '', '', ?, '', '', '', ?, '', 0, 0, '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, COMPONENT, NAME, CODE, [XML], USER_ID, GLOBAL_DEFAULT
FROM test_tms_LabIT.dbo.SEC_FILTER;
INSERT INTO sec_filter
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, component, "name", code, "xml", user_id, global_default)
VALUES(?, '', '', 1, '', '', '', '', '', '', '', '', '', ?, false);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, PARENT_ID
FROM test_tms_LabIT.dbo.SEC_GROUP;
INSERT INTO sec_group
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, "name", parent_id)
VALUES(?, '', '', 1, '', '', '', '', '', '', ?);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, GROUP_ID, PARENT_ID, HIERARCHY_LEVEL
FROM test_tms_LabIT.dbo.SEC_GROUP_HIERARCHY;
INSERT INTO sec_group_hierarchy
(id, create_ts, created_by, sys_tenant_id, group_id, parent_id, hierarchy_level)
VALUES(?, '', '', '', ?, ?, 0);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ENTITY_NAME, OPERATION_TYPE, VALUES_
FROM test_tms_LabIT.dbo.SEC_LOCALIZED_CONSTRAINT_MSG;
INSERT INTO sec_localized_constraint_msg
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, entity_name, operation_type, values_)
VALUES(?, '', '', 1, '', '', '', '', '', '', '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, ENTITY_ID, NAME
FROM test_tms_LabIT.dbo.SEC_LOGGED_ATTR;
INSERT INTO sec_logged_attr
(id, create_ts, created_by, entity_id, "name")
VALUES(?, '', '', ?, '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, NAME, AUTO, MANUAL
FROM test_tms_LabIT.dbo.SEC_LOGGED_ENTITY;
INSERT INTO sec_logged_entity
(id, create_ts, created_by, "name", auto, manual)
VALUES(?, '', '', '', false, false);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID
FROM test_tms_LabIT.dbo.SEC_PERMISSION;
INSERT INTO sec_permission
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, permission_type, target, value_, role_id)
VALUES(?, '', '', 1, '', '', '', '', 0, '', 0, ?);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, COMPONENT, NAME, [XML], USER_ID, IS_AUTO_SAVE
FROM test_tms_LabIT.dbo.SEC_PRESENTATION;
INSERT INTO sec_presentation
(id, create_ts, created_by, update_ts, updated_by, sys_tenant_id, component, "name", "xml", user_id, is_auto_save)
VALUES(?, '', '', '', '', '', '', '', '', ?, false);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, USER_ID, TOKEN
FROM test_tms_LabIT.dbo.SEC_REMEMBER_ME;
INSERT INTO sec_remember_me
(id, create_ts, created_by, "version", user_id, "token")
VALUES(?, '', '', 1, ?, '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, LOC_NAME, DESCRIPTION, IS_DEFAULT_ROLE, ROLE_TYPE
FROM test_tms_LabIT.dbo.SEC_ROLE;
INSERT INTO sec_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, "name", loc_name, description, is_default_role, role_type, security_scope)
VALUES(?, '', '', 1, '', '', '', '', '', '', '', '', false, 0, '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, USER_ID, CAPTION, URL, ENTITY_ID, SUBSTITUTED_USER_ID
FROM test_tms_LabIT.dbo.SEC_SCREEN_HISTORY;
INSERT INTO sec_screen_history
(id, create_ts, created_by, sys_tenant_id, user_id, caption, url, entity_id, string_entity_id, int_entity_id, long_entity_id, substituted_user_id)
VALUES(?, '', '', '', ?, '', '', ?, '', 0, 0, ?);
-- end
-- start 
SELECT FOLDER_ID, FILTER_COMPONENT, FILTER_XML, USER_ID, PRESENTATION_ID, APPLY_DEFAULT, IS_SET, ENTITY_TYPE
FROM test_tms_LabIT.dbo.SEC_SEARCH_FOLDER;
INSERT INTO sec_search_folder
(folder_id, filter_component, filter_xml, user_id, presentation_id, apply_default, is_set, entity_type)
VALUES(?, '', '', ?, ?, false, false, '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, STR_VALUE, DATATYPE, GROUP_ID
FROM test_tms_LabIT.dbo.SEC_SESSION_ATTR;
INSERT INTO sec_session_attr
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, "name", str_value, "datatype", group_id)
VALUES(?, '', '', 1, '', '', '', '', '', '', '', '', ?);
-- end
-- start 
SELECT ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, SESSION_ID, USER_ID, SUBSTITUTED_USER_ID, USER_DATA, LAST_ACTION, CLIENT_INFO, CLIENT_TYPE, ADDRESS, STARTED_TS, FINISHED_TS, SERVER_ID
FROM test_tms_LabIT.dbo.SEC_SESSION_LOG;
INSERT INTO sec_session_log
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, session_id, user_id, substituted_user_id, user_data, last_action, client_info, client_type, address, started_ts, finished_ts, server_id)
VALUES(?, 1, '', '', '', '', '', '', '', ?, ?, ?, '', 0, '', '', '', '', '', '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, [LOGIN], LOGIN_LC, PASSWORD, NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, POSITION_, EMAIL, LANGUAGE_, TIME_ZONE, TIME_ZONE_AUTO, ACTIVE, GROUP_ID, IP_MASK, CHANGE_PASSWORD_AT_LOGON
FROM test_tms_LabIT.dbo.SEC_USER;
INSERT INTO sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active, group_id, group_names, ip_mask, change_password_at_logon)
VALUES(?, '', '', 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', false, false, ?, '', '', false);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, USER_ID, ROLE_ID
FROM test_tms_LabIT.dbo.SEC_USER_ROLE;
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, user_id, role_id, role_name)
VALUES(?, '', '', 1, '', '', '', '', ?, ?, '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, USER_ID, CLIENT_TYPE, NAME, VALUE_
FROM test_tms_LabIT.dbo.SEC_USER_SETTING;
INSERT INTO sec_user_setting
(id, create_ts, created_by, user_id, client_type, "name", value_)
VALUES(?, '', '', ?, '', '', '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, USER_ID, SUBSTITUTED_USER_ID, START_DATE, END_DATE
FROM test_tms_LabIT.dbo.SEC_USER_SUBSTITUTION;
INSERT INTO sec_user_substitution
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, user_id, substituted_user_id, start_date, end_date)
VALUES(?, '', '', 1, '', '', '', '', '', ?, ?, '', '');
-- end
-- start 
SELECT ID, CREATE_TS, TOKEN_VALUE, TOKEN_BYTES, AUTHENTICATION_KEY, AUTHENTICATION_BYTES, EXPIRY, USER_LOGIN, LOCALE, REFRESH_TOKEN_VALUE
FROM test_tms_LabIT.dbo.SYS_ACCESS_TOKEN;
INSERT INTO sys_access_token
(id, create_ts, token_value, token_bytes, authentication_key, authentication_bytes, expiry, user_login, locale, refresh_token_value)
VALUES(?, '', '', ?, '', ?, '', '', '', '');
-- end
-- start 
SELECT FOLDER_ID, FILTER_COMPONENT, FILTER_XML, VISIBILITY_SCRIPT, QUANTITY_SCRIPT, APPLY_DEFAULT
FROM test_tms_LabIT.dbo.SYS_APP_FOLDER;
INSERT INTO sys_app_folder
(folder_id, filter_component, filter_xml, visibility_script, quantity_script, apply_default)
VALUES(?, '', '', '', '', false);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, CATEGORY_ATTR_ID, ENTITY_ID, STRING_ENTITY_ID, INT_ENTITY_ID, LONG_ENTITY_ID, STRING_VALUE, INTEGER_VALUE, DOUBLE_VALUE, DATE_VALUE, BOOLEAN_VALUE, ENTITY_VALUE, STRING_ENTITY_VALUE, INT_ENTITY_VALUE, LONG_ENTITY_VALUE, CODE, PARENT_ID
FROM test_tms_LabIT.dbo.SYS_ATTR_VALUE;
INSERT INTO sys_attr_value
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, category_attr_id, code, entity_id, string_entity_id, int_entity_id, long_entity_id, string_value, integer_value, double_value, decimal_value, date_value, date_wo_time_value, boolean_value, entity_value, string_entity_value, int_entity_value, long_entity_value, parent_id)
VALUES(?, '', '', 1, '', '', '', '', ?, '', ?, '', 0, 0, '', 0, 0, 0, '', '', false, ?, '', 0, 0, ?);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, SPECIAL, ENTITY_TYPE, IS_DEFAULT, DISCRIMINATOR, LOCALE_NAMES
FROM test_tms_LabIT.dbo.SYS_CATEGORY;
INSERT INTO sys_category
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", special, entity_type, is_default, discriminator, locale_names)
VALUES(?, '', '', 1, '', '', '', '', '', '', '', false, 0, '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, CATEGORY_ENTITY_TYPE, NAME, CODE, CATEGORY_ID, ENTITY_CLASS, DATA_TYPE, DEFAULT_STRING, DEFAULT_INT, DEFAULT_DOUBLE, DEFAULT_DATE, DEFAULT_DATE_IS_CURRENT, DEFAULT_BOOLEAN, DEFAULT_ENTITY_VALUE, DEFAULT_STR_ENTITY_VALUE, DEFAULT_INT_ENTITY_VALUE, DEFAULT_LONG_ENTITY_VALUE, ENUMERATION, ORDER_NO, SCREEN, REQUIRED, LOOKUP, TARGET_SCREENS, WIDTH, ROWS_COUNT, IS_COLLECTION, JOIN_CLAUSE, WHERE_CLAUSE, FILTER_XML, LOCALE_NAMES, ENUMERATION_LOCALES
FROM test_tms_LabIT.dbo.SYS_CATEGORY_ATTR;
INSERT INTO sys_category_attr
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, category_entity_type, "name", code, description, category_id, entity_class, data_type, default_string, default_int, default_double, default_decimal, default_date, default_date_wo_time, default_date_is_current, default_boolean, default_entity_value, default_str_entity_value, default_int_entity_value, default_long_entity_value, enumeration, order_no, screen, required, lookup, target_screens, width, rows_count, is_collection, join_clause, where_clause, filter_xml, locale_names, locale_descriptions, enumeration_locales, attribute_configuration_json)
VALUES(?, '', '', 1, '', '', '', '', '', '', '', '', ?, '', '', '', 0, 0, 0, '', '', false, false, ?, '', 0, 0, '', 0, '', false, false, '', '', 0, false, '', '', '', '', '', '', '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, NAME, VALUE_
FROM test_tms_LabIT.dbo.SYS_CONFIG;
INSERT INTO sys_config
(id, create_ts, created_by, "version", update_ts, updated_by, "name", value_)
VALUES(?, '', '', 1, '', '', '', '');
-- end
-- start 
SELECT SCRIPT_NAME, CREATE_TS, IS_INIT
FROM test_tms_LabIT.dbo.SYS_DB_CHANGELOG;
INSERT INTO sys_db_changelog
(script_name, create_ts, is_init)
VALUES('', CURRENT_TIMESTAMP, 0);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, ENTITY_META_CLASS, ENTITY_ID, STRING_ENTITY_ID, INT_ENTITY_ID, LONG_ENTITY_ID, AUTHOR_ID, VIEW_XML, SNAPSHOT_XML, SNAPSHOT_DATE
FROM test_tms_LabIT.dbo.SYS_ENTITY_SNAPSHOT;
INSERT INTO sys_entity_snapshot
(id, create_ts, created_by, sys_tenant_id, entity_meta_class, entity_id, string_entity_id, int_entity_id, long_entity_id, author_id, view_xml, snapshot_xml, snapshot_date)
VALUES(?, '', '', '', '', ?, '', 0, 0, ?, '', '', '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, NAME, INSTANCE_COUNT, FETCH_UI, MAX_FETCH_UI, LAZY_COLLECTION_THRESHOLD, LOOKUP_SCREEN_THRESHOLD
FROM test_tms_LabIT.dbo.SYS_ENTITY_STATISTICS;
INSERT INTO sys_entity_statistics
(id, create_ts, created_by, update_ts, updated_by, "name", instance_count, fetch_ui, max_fetch_ui, lazy_collection_threshold, lookup_screen_threshold)
VALUES(?, '', '', '', '', '', 0, 0, 0, 0, 0);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, EXT, FILE_SIZE, CREATE_DATE
FROM test_tms_LabIT.dbo.SYS_FILE;
INSERT INTO sys_file
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, "name", ext, file_size, create_date)
VALUES(?, '', '', 1, '', '', '', '', '', '', '', 0, '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, FOLDER_TYPE, PARENT_ID, NAME, TAB_NAME, SORT_ORDER
FROM test_tms_LabIT.dbo.SYS_FOLDER;
INSERT INTO sys_folder
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, folder_type, parent_id, "name", tab_name, sort_order)
VALUES(?, '', '', 1, '', '', '', '', '', '', ?, '', '', 0);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, ENTITY_ID, STRING_ENTITY_ID, INT_ENTITY_ID, LONG_ENTITY_ID, ENTITY_NAME, CHANGE_TYPE, SOURCE_HOST, INDEXING_HOST, FAKE
FROM test_tms_LabIT.dbo.SYS_FTS_QUEUE;
INSERT INTO sys_fts_queue
(id, create_ts, created_by, entity_id, string_entity_id, int_entity_id, long_entity_id, entity_name, change_type, source_host, indexing_host, fake)
VALUES(?, '', '', ?, '', 0, 0, '', '', '', '', false);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NODE_NAME, ADDRESS, [LOGIN], PASSWORD
FROM test_tms_LabIT.dbo.SYS_JMX_INSTANCE;
INSERT INTO sys_jmx_instance
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, node_name, address, login, "password")
VALUES(?, '', '', 1, '', '', '', '', '', '', '', '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, NAME, TIMEOUT_SEC
FROM test_tms_LabIT.dbo.SYS_LOCK_CONFIG;
INSERT INTO sys_lock_config
(id, create_ts, created_by, "name", timeout_sec)
VALUES(?, '', '', '', 0);
-- end
-- start 
SELECT ID, SESSION_ID, QUERY_KEY, ENTITY_ID, STRING_ENTITY_ID, INT_ENTITY_ID, LONG_ENTITY_ID
FROM test_tms_LabIT.dbo.SYS_QUERY_RESULT;
INSERT INTO sys_query_result
(session_id, query_key, entity_id, string_entity_id, int_entity_id, long_entity_id)
VALUES(?, 0, ?, '', 0, 0);
-- end
-- start 
SELECT ID, CREATE_TS, TOKEN_VALUE, TOKEN_BYTES, AUTHENTICATION_BYTES, EXPIRY, USER_LOGIN
FROM test_tms_LabIT.dbo.SYS_REFRESH_TOKEN;
INSERT INTO sys_refresh_token
(id, create_ts, token_value, token_bytes, authentication_bytes, expiry, user_login)
VALUES(?, '', '', ?, ?, '', '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, TASK_ID, SERVER, START_TIME, FINISH_TIME, [RESULT]
FROM test_tms_LabIT.dbo.SYS_SCHEDULED_EXECUTION;
INSERT INTO sys_scheduled_execution
(id, create_ts, created_by, sys_tenant_id, task_id, "server", start_time, finish_time, "result")
VALUES(?, '', '', '', ?, '', '', '', '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, DEFINED_BY, CLASS_NAME, SCRIPT_NAME, BEAN_NAME, METHOD_NAME, METHOD_PARAMS, USER_NAME, IS_SINGLETON, IS_ACTIVE, PERIOD, TIMEOUT, START_DATE, TIME_FRAME, START_DELAY, PERMITTED_SERVERS, LOG_START, LOG_FINISH, LAST_START_TIME, LAST_START_SERVER, DESCRIPTION, CRON, SCHEDULING_TYPE
FROM test_tms_LabIT.dbo.SYS_SCHEDULED_TASK;
INSERT INTO sys_scheduled_task
(id, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, defined_by, class_name, script_name, bean_name, method_name, method_params, user_name, is_singleton, is_active, period_, timeout, start_date, time_frame, start_delay, permitted_servers, log_start, log_finish, last_start_time, last_start_server, description, cron, scheduling_type)
VALUES(?, '', '', '', '', '', '', '', 'B'::character varying, '', '', '', '', '', '', false, false, 0, 0, '', 0, 0, '', false, false, '', '', '', '', 'P'::character varying);
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, MESSAGE_ID, CONTENT, CONTENT_FILE_ID, CONTENT_ID, NAME, DISPOSITION, TEXT_ENCODING
FROM test_tms_LabIT.dbo.SYS_SENDING_ATTACHMENT;
INSERT INTO sys_sending_attachment
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, message_id, "content", content_file_id, content_id, "name", disposition, text_encoding)
VALUES(?, '', '', 1, '', '', '', '', '', ?, ?, ?, '', '', '', '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ADDRESS_TO, ADDRESS_FROM, CAPTION, EMAIL_HEADERS, CONTENT_TEXT, CONTENT_TEXT_FILE_ID, DEADLINE, STATUS, DATE_SENT, ATTEMPTS_COUNT, ATTEMPTS_MADE, ATTACHMENTS_NAME, BODY_CONTENT_TYPE
FROM test_tms_LabIT.dbo.SYS_SENDING_MESSAGE;
INSERT INTO sys_sending_message
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, address_to, address_cc, address_bcc, address_from, caption, email_headers, content_text, content_text_file_id, deadline, status, date_sent, attempts_count, attempts_made, attachments_name, body_content_type)
VALUES(?, '', '', 1, '', '', '', '', '', '', '', '', '', '', '', '', ?, '', 0, '', 0, 0, '', '');
-- end
-- start 
SELECT ID, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, NAME, IS_RUNNING, [DATA]
FROM test_tms_LabIT.dbo.SYS_SERVER;
INSERT INTO sys_server
(id, create_ts, created_by, update_ts, updated_by, "name", is_running, "data")
VALUES(?, '', '', '', '', '', false, '');
-- end

-- start 
SELECT ID, ORDER_ID, VEHICLE_ID, CHECK_DISTRIBUTION_TEXT, CAN_DISTRIBUTE, OPERATION_NAME, VEHICLE_LATITUDE, VEHICLE_LONGITUDE, ORDER_PLACE_START_LAT, ORDER_PLACE_START_LON, ORDER_PLACE_FINISH_LAT, ORDER_PLACE_FINISH_LON, ORDER_DISTANCE, ORDER_TRAVEL_TIME, VEHICLE_TO_ORDER_DISTANCE, VEHICLE_TO_ORDER_TRAVEL_TIME, VEHICLE_COORDINATES_DATE, CUR_ORDER_LATITUDE, CUR_ORDER_LONGITUDE, CUR_ORDER_UNLOADING_DATE, NEXT_ORDER_LATITUDE, NEXT_ORDER_LONGITUDE, NEXT_ORDER_DATE, ORDER_TRAVEL_TIME_RELAX, VEHICLE_GOVERNMENT_NUMBER
FROM test_tms_LabIT.dbo.TMS_AUTO_DISTRIBUTION_CHECK_HISTORY;
INSERT INTO tms_auto_distribution_check_history
(id, operation_name, vehicle_id, vehicle_government_number, check_distribution_text, can_distribute, vehicle_latitude, vehicle_longitude, vehicle_coordinates_date, cur_order_latitude, cur_order_longitude, cur_order_unloading_date, next_order_latitude, next_order_longitude, next_order_date, order_place_start_lat, order_place_start_lon, order_place_finish_lat, order_place_finish_lon, order_distance, order_travel_time, order_travel_time_relax, vehicle_to_order_distance, vehicle_to_order_travel_time, order_id)
VALUES(?, '', ?, '', '', false, 0, 0, '', 0, 0, '', 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, ?);
-- end
-- start 
SELECT ID, ORDER_ID, CUR_VEHICLE_ID, PREV_VEHICLE_ID, USER_ID, DATE_
FROM test_tms_LabIT.dbo.TMS_CHANGE_VEHICLE_ORDER_HISTORY;
INSERT INTO tms_change_vehicle_order_history
(id, order_id, cur_vehicle_id, prev_vehicle_id, user_id, date_)
VALUES(?, ?, ?, ?, ?, '');
-- end
-- start 
SELECT ID, COUNTRY_NAME, EXTERNAL_ID, EXTERNAL_UUID
FROM test_tms_LabIT.dbo.TMS_COUNTRY;
INSERT INTO tms_country
(id, country_name, external_id, external_uuid)
VALUES(?, '', '', '');
-- end
-- start 
SELECT ID, UPDATE_TS, UPDATED_BY, CREATE_TS, CREATED_BY, VERSION, EXTERNAL_ID, ADDITIONAL_EXTERNAL_ID, NAME, INN, LOADING_TIME, UNLOADING_TIME, EXTERNAL_UUID, EXTERNAL_, TYPE_, NOT_COMPLETE_ORDER, COUNTRY_ID, BINDING, ALLOW_TO_OUTSIDER, GUARANTEED_CUSTOMER, NOT_ALLOW_TO_AUTO_DISTRIBUTION
FROM test_tms_LabIT.dbo.TMS_CUSTOMER;
INSERT INTO tms_customer
(id, update_ts, updated_by, create_ts, created_by, "version", country_id, external_id, external_uuid, additional_external_id, "name", inn, type_, loading_time, unloading_time, external_, not_complete_order, binding, allow_to_outsider, guaranteed_customer, not_allow_to_auto_distribution)
VALUES(?, '', '', '', '', 0, ?, '', '', '', '', '', '', 0, 0, '', false, false, false, false, false);
-- end
-- start 
SELECT ID, UPDATE_TS, UPDATED_BY, CREATE_TS, CREATED_BY, VERSION, PLACE_ID, CUSTOMER_ID
FROM test_tms_LabIT.dbo.TMS_CUSTOMER_PLACES;
INSERT INTO tms_customer_places
(id, update_ts, updated_by, create_ts, created_by, "version", place_id, customer_id)
VALUES(?, '', '', '', '', 0, ?, ?);
-- end
-- start 
SELECT ID, CUSTOMER_ID, PLACE_START_ID, PLACE_FINISH_ID, QTY, YEAR_
FROM test_tms_LabIT.dbo.TMS_CUSTOMER_STATISTICS;
INSERT INTO tms_customer_statistics
(id, year_, customer_id, place_start_id, place_finish_id, qty)
VALUES(?, '', ?, ?, ?, 0);
-- end
-- start 
SELECT ID, NAME, CHECK_DISTRIBUTION, NOTIFICATION
FROM test_tms_LabIT.dbo.TMS_CUSTOM_COLUMN;
INSERT INTO tms_custom_column
(id, "name", check_distribution, notification)
VALUES(?, '', false, '');
-- end
-- start 
SELECT ID, NAME_ID, REGION_ID
FROM test_tms_LabIT.dbo.TMS_CUSTOM_COLUMN_REGION;
INSERT INTO tms_custom_column_region
(id, name_id, region_id)
VALUES(?, ?, ?);
-- end
-- start 
SELECT ID, UPDATE_TS, UPDATED_BY, CREATE_TS, CREATED_BY, VERSION, NAME, USER_ID, MANAGER_ID, FEDERAL_DISTRICT_ID, IS_ACTIVE
FROM test_tms_LabIT.dbo.TMS_DIRECTION;
INSERT INTO tms_direction
(id, update_ts, updated_by, create_ts, created_by, "version", "name", user_id, manager_id, federal_district_id, is_active)
VALUES(?, '', '', '', '', 0, '', ?, ?, ?, false);
-- end
-- start 
SELECT ID, DIRECTION_ID, FEDERAL_DISTRICT_ID
FROM test_tms_LabIT.dbo.TMS_DIRECTION_FEDERAL_DISTRICT;
INSERT INTO tms_direction_federal_district
(id, direction_id, federal_district_id)
VALUES(?, ?, ?);
-- end
-- start 
SELECT ID, UPDATE_TS, UPDATED_BY, CREATE_TS, CREATED_BY, VERSION, NUMBER_, DATE_, VEHICLE_ID, EXTERNAL_ID, ADDITIONAL_EXTERNAL_ID, LOADING_DATE, UNLOADING_DATE, LOADING_ADDRESS, LOADING_LATITUDE, LOADING_LONGITUDE, LOADING_REGION_ID, UPLOADING_ADDRESS, UPLOADING_LATITUDE, UPLOADING_LONGITUDE, UPLOADING_REGION_ID, STATUS, AUTOR_ID, ROUTE, TRAVEL_TIME, TRAVEL_TIME_STRING, DISTANCE, COMMENT_
FROM test_tms_LabIT.dbo.TMS_EMPTY_ORDER;
INSERT INTO tms_empty_order
(id, update_ts, updated_by, create_ts, created_by, "version", number_, date_, vehicle_id, external_id, additional_external_id, loading_date, unloading_date, loading_address, loading_latitude, loading_longitude, loading_region_id, uploading_address, uploading_latitude, uploading_longitude, uploading_region_id, status, autor_id, route, travel_time, travel_time_string, distance, comment_)
VALUES(?, '', '', '', '', 0, 0, '', ?, '', '', '', '', '', 0, 0, ?, '', 0, 0, ?, '', ?, ?, 0, '', 0, '');
-- end
-- start 
SELECT ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, NAME, USER_ID, EXTERNAL_UUID
FROM test_tms_LabIT.dbo.TMS_EXT_USER;
INSERT INTO tms_ext_user
(id, "version", create_ts, created_by, update_ts, updated_by, "name", external_uuid, user_id)
VALUES(?, 0, '', '', '', '', '', '', ?);
-- end
-- start 
SELECT ID, NAME, KOD, LAT_MAX, LAT_MIN, LON_MAX, LON_MIN, KOD_KLADR, TIME_START, TIME_FINISH
FROM test_tms_LabIT.dbo.TMS_FEDERAL_DISTRICT;
INSERT INTO tms_federal_district
(id, "name", kod, kod_kladr, lat_max, lat_min, lon_max, lon_min, time_start, time_finish)
VALUES(?, '', '', '', 0, 0, 0, 0, '', '');
-- end
-- start 
SELECT ID, FEDERAL_DISTRICT_ID
FROM test_tms_LabIT.dbo.TMS_FEDERAL_DISTRICT_LINES;
INSERT INTO tms_federal_district_lines
(id, federal_district_id)
VALUES(?, ?);
-- end
-- start 
SELECT ID, FEDERAL_DISTRICT_LINES_ID, INDEX_, LAT, LON
FROM test_tms_LabIT.dbo.TMS_FEDERAL_DISTRICT_SUB_LINES;
INSERT INTO tms_federal_district_sub_lines
(id, federal_district_lines_id, index_, lat, lon)
VALUES(?, ?, 0, 0, 0);
-- end
-- start 
SELECT ID, DIRECTION_ID, DATA_START, DATA_FINISH, SUM_NETTO, PRICE, SALARY, PLATON, REPAIRS, TRAVEL_EXPENSES
FROM test_tms_LabIT.dbo.TMS_FIN_PLAN;
INSERT INTO tms_fin_plan
(id, direction_id, data_start, data_finish, sum_netto, price, salary, platon, repairs, travel_expenses)
VALUES(?, ?, '', '', 0, 0, 0, 0, 0, 0);
-- end
-- start 
SELECT ID, UPDATE_TS, UPDATED_BY, CREATE_TS, CREATED_BY, VERSION, NAME, ADDRESS, LATITUDE, LONGITUDE, EXTERNAL_UUID, EXTERNAL_
FROM test_tms_LabIT.dbo.TMS_GARAGE;
INSERT INTO tms_garage
(id, update_ts, updated_by, create_ts, created_by, "version", external_uuid, "name", address, latitude, longitude, external_)
VALUES(?, '', '', '', '', 0, '', '', '', 0, 0, '');
-- end
-- start 
SELECT ID, KEY_ID, USED_QTY, TYPE_
FROM test_tms_LabIT.dbo.TMS_MAP_KEYS;
INSERT INTO tms_map_keys
(id, key_id, used_qty, type_)
VALUES(?, '', 0, '');
-- end
-- start 
SELECT ID, DATE_, RESULT_, MESSAGE, MESSAGE_ERROR, ORDER_ID
FROM test_tms_LabIT.dbo.TMS_ONE_S_CANCEL_ORDER_HISTORY;
INSERT INTO tms_one_s_cancel_order_history
(id, date_, order_id, result_, message, message_error)
VALUES(?, '', ?, '', '', '');
-- end
-- start 
SELECT ID, DATE_, RESULT_, MESSAGE, MESSAGE_ERROR
FROM test_tms_LabIT.dbo.TMS_ONE_S_ORDER_HISTORY;
INSERT INTO tms_one_s_order_history
(id, date_, result_, message, message_error)
VALUES(?, '', '', '', '');
-- end
-- start 
SELECT ID, DATE_, MESSAGE_ID, ORDER_ID, POINT_ID, STATUS, DATE_MESSAGE, RESULT_, MESSAGE_ERROR
FROM test_tms_LabIT.dbo.TMS_ONE_S_STATUS_HISTORY;
INSERT INTO tms_one_s_status_history
(id, date_, message_id, order_id, point_id, status, date_message, result_, message_error)
VALUES(?, '', '', ?, ?, '', '', '', '');
-- end
-- start 
SELECT ID, UPDATE_TS, UPDATED_BY, CREATE_TS, CREATED_BY, VERSION, NUMBER_, DATE_, EXTERNAL_ID, ADDITIONAL_EXTERNAL_ID, STATUS, CUSTOMER_ID, LOADING_DATE, UNLOADING_DATE, RATE, VOLUME, WEIGHT, COMMENT_, LOADING_TIME, UNLOADING_TIME, TRAVEL_TIME, DISTANCE, TRAILER_VIEW, AUTHOR_ID, TYPE_CREATE, TRAVEL_TIME_STRING, PLACE_START_ID, PLACE_FINISH_ID, KONIKI, MKAD, GUARANTEED_ORDER, PARENT_ORDER_ID, FLOAT_LOADING_DATE, FLOAT_UNLOADING_DATE, LOADING_DATE_START, UNLOADING_DATE_START, LOADING_DATE_FINISH, UNLOADING_DATE_FINISH, ORDER_REASON_HISTORY_ID, OUTSIDER_ORDER, ALLOW_TO_OUTSIDER, ORDER_TEMPLATE_ID, POLYLINE, OZON_WB, RESERVATION, DATE_END_RESERVATION, RESERVATION_USER_ID
FROM test_tms_LabIT.dbo.TMS_ORDER;
INSERT INTO tms_order
(id, update_ts, updated_by, create_ts, created_by, "version", outsider_order, number_, date_, external_id, additional_external_id, status, customer_id, loading_date, unloading_date, rate, trailer_view, volume, weight, comment_, loading_time, unloading_time, travel_time, travel_time_string, distance, place_start_id, place_finish_id, author_id, type_create, koniki, mkad, guaranteed_order, parent_order_id, float_loading_date, float_unloading_date, loading_date_start, loading_date_finish, unloading_date_start, unloading_date_finish, order_reason_history_id, allow_to_outsider, order_template_id, polyline, ozon_wb, reservation, reservation_user_id, date_end_reservation)
VALUES(?, '', '', '', '', 0, false, 0, '', '', '', '', ?, '', '', 0, '', 0, 0, '', 0, 0, 0, '', 0, ?, ?, ?, '', false, false, false, ?, false, false, '', '', '', '', ?, false, ?, '', false, false, ?, '');
-- end
-- start 
SELECT ID, ORDER_ID, DATE_, DATE_CANCEL, EXTERNAL_, REQUEST, RESPONSE, RESULT_, USER_ID
FROM test_tms_LabIT.dbo.TMS_ORDER_CANCEL_HISTORY;
INSERT INTO tms_order_cancel_history
(id, order_id, user_id, date_, date_cancel, external_, request, response, result_)
VALUES(?, ?, ?, '', '', '', '', '', '');
-- end
-- start 
SELECT ID, REASON, DESCRIPTION, COMMENTARY, ANSWER, RECALCULATE, CHANGE_VEHICLE_STATUS, VEHICLE_STATUS, DONT_SHOW
FROM test_tms_LabIT.dbo.TMS_ORDER_CANCEL_REASON;
INSERT INTO tms_order_cancel_reason
(id, reason, answer, description, commentary, recalculate, change_vehicle_status, vehicle_status, dont_show)
VALUES(?, '', '', '', false, false, false, '', false);
-- end
-- start 
SELECT ID, ORDER_ID, VEHICLE_ID, DATE_, USER_ID, STATUS
FROM test_tms_LabIT.dbo.TMS_ORDER_COMPLETE_STATUS_HISTORY;
INSERT INTO tms_order_complete_status_history
(id, order_id, vehicle_id, date_, user_id, status)
VALUES(?, ?, ?, '', ?, '');
-- end
-- start 
SELECT ID, ORDER_ID, CUSTOMER_ID, RESULT_, EXTERNAL_, DATE_, DATE_EXCHANGE, MESSAGE, REQUEST, RESPONSE
FROM test_tms_LabIT.dbo.TMS_ORDER_DEBT;
INSERT INTO tms_order_debt
(id, order_id, customer_id, result_, external_, date_, date_exchange, message, request, response)
VALUES(?, ?, ?, '', '', '', '', '', '', '');
-- end
-- start 
SELECT ID, UPDATE_TS, UPDATED_BY, CREATE_TS, CREATED_BY, VERSION, ORDER_ID, EVENT_TYPE, FLAG
FROM test_tms_LabIT.dbo.TMS_ORDER_EVENT;
INSERT INTO tms_order_event
(id, update_ts, updated_by, create_ts, created_by, "version", order_id, event_type, flag)
VALUES(?, '', '', '', '', 0, ?, '', '');
-- end
-- start 
SELECT ID, ORDER_ID, VEHICLE_ID, RESULT_, EXTERNAL_, DATE_, DATE_EXCENGE, MESSAGE, REQUEST, RESPONSE
FROM test_tms_LabIT.dbo.TMS_ORDER_EXCANGE;
INSERT INTO tms_order_excange
(id, order_id, vehicle_id, result_, external_, date_, date_excenge, message, request, response)
VALUES(?, ?, ?, '', '', '', '', '', '', '');
-- end
-- start 
SELECT ID, ORDER_ID, USER_ID, DATE_
FROM test_tms_LabIT.dbo.TMS_ORDER_NOT_ACTUAL_HISTORY;
INSERT INTO tms_order_not_actual_history
(id, order_id, user_id, date_)
VALUES(?, ?, ?, '');
-- end
-- start 
SELECT ID, UPDATE_TS, UPDATED_BY, CREATE_TS, CREATED_BY, VERSION, ORDER_ID, SORT_NUMBER, PLACE_ID, DATE_, ROUTE
FROM test_tms_LabIT.dbo.TMS_ORDER_PLACES;
INSERT INTO tms_order_places
(id, update_ts, updated_by, create_ts, created_by, "version", order_id, sort_number, place_id, date_, route)
VALUES(?, '', '', '', '', 0, ?, 0, ?, '', ?);
-- end
-- start 
SELECT ID, ORDER_ID, STATUS, USER_ID
FROM test_tms_LabIT.dbo.TMS_ORDER_STATUS_HISTORY;
INSERT INTO tms_order_status_history
(id, order_id, status, user_id)
VALUES(?, ?, '', ?);
-- end
-- start 
SELECT ID, NAME, ORDER_ID, OZON_WB
FROM test_tms_LabIT.dbo.TMS_ORDER_TEMPLATE;
INSERT INTO tms_order_template
(id, "name", order_id, ozon_wb)
VALUES(?, '', ?, false);
-- end
-- start 
SELECT ID, UPDATE_TS, UPDATED_BY, CREATE_TS, CREATED_BY, VERSION, TRAILER_TYPE_ID, ORDER_ID
FROM test_tms_LabIT.dbo.TMS_ORDER_TRAILER_TYPES;
INSERT INTO tms_order_trailer_types
(id, update_ts, updated_by, create_ts, created_by, "version", trailer_type_id, order_id)
VALUES(?, '', '', '', '', 0, ?, ?);
-- end
-- start 
SELECT ID, ORDER_ID, VEHICLE_TYPE_ID
FROM test_tms_LabIT.dbo.TMS_ORDER_VEHICLE_TYPE;
INSERT INTO tms_order_vehicle_type
(id, order_id, vehicle_type_id)
VALUES(?, ?, ?);
-- end
-- start 
SELECT ID, UPDATE_TS, UPDATED_BY, CREATE_TS, CREATED_BY, VERSION, EXTERNAL_ID, ADDITIONAL_EXTERNAL_ID, NAME, TYPE_, ADDRESS, LATITUDE, LONGITUDE, EXTERNAL_UUID, EXTERNAL_, REGION_ID, INFO, HIDE
FROM test_tms_LabIT.dbo.TMS_PLACE;
INSERT INTO tms_place
(id, update_ts, updated_by, create_ts, created_by, "version", external_id, external_uuid, additional_external_id, "name", type_, address, latitude, longitude, region_id, external_, info, hide)
VALUES(?, '', '', '', '', 0, '', '', '', '', '', '', 0, 0, ?, '', '', false);
-- end
-- start 
SELECT ID, DATE_, LAT, LON, QTY, PLACE_ID
FROM test_tms_LabIT.dbo.TMS_PLACE_STATISTIC;
INSERT INTO tms_place_statistic
(id, date_, place_id, lat, lon, qty)
VALUES(?, '', ?, 0, 0, 0);
-- end
-- start 
SELECT ID, FUEL_TYPE, PRICE
FROM test_tms_LabIT.dbo.TMS_PRICE_FUEL;
INSERT INTO tms_price_fuel
(id, fuel_type, price)
VALUES(?, '', 0);
-- end
-- start 
SELECT ID, NAME, STATUS, DESC_
FROM test_tms_LabIT.dbo.TMS_PROCESS_LOCK;
INSERT INTO tms_process_lock
(id, "name", status, desc_)
VALUES(?, '', 0, '');
-- end
-- start 
SELECT ID, NAME, KOD, FEDERAL_DISTRICT_ID, LAT_MAX, LAT_MIN, LON_MAX, LON_MIN, KOD_KLADR, DATE_START, DATE_FINISH, MIN_COUNT_VEHICLE, EXCESS_PERCENTAGE
FROM test_tms_LabIT.dbo.TMS_REGION;
INSERT INTO tms_region
(id, "name", kod, kod_kladr, federal_district_id, lat_max, lat_min, lon_max, lon_min, date_start, date_finish, min_count_vehicle, excess_percentage)
VALUES(?, '', '', '', ?, 0, 0, 0, 0, '', '', 0, 0);
-- end
-- start 
SELECT ID, REGION_ID
FROM test_tms_LabIT.dbo.TMS_REGION_LINES;
INSERT INTO tms_region_lines
(id, region_id)
VALUES(?, ?);
-- end
-- start 
SELECT ID, REGION_LINES_ID, INDEX_, LAT, LON
FROM test_tms_LabIT.dbo.TMS_REGION_SUB_LINES;
INSERT INTO tms_region_sub_lines
(id, region_lines_id, index_, lat, lon)
VALUES(?, ?, 0, 0, 0);
-- end
-- start 
SELECT ID, USER_ID, PERMISSION
FROM test_tms_LabIT.dbo.TMS_RESERVATION_USERS;
INSERT INTO tms_reservation_users
(id, user_id, "permission")
VALUES(?, ?, false);
-- end
-- start 
SELECT ID, DATE_, LATITUDE_START, LONGITUDE_START, LATITUDE_FINISH, LONGITUDE_FINISH, DISTANCE, TIME_
FROM test_tms_LabIT.dbo.TMS_ROUTE_CACHE;
INSERT INTO tms_route_cache
(id, date_, latitude_start, longitude_start, latitude_finish, longitude_finish, distance, time_)
VALUES(?, '', 0, 0, 0, 0, 0, 0);
-- end
-- start 
SELECT ID, ROUTE_ID, LATITUDE, LONGITUDE, INDEX_
FROM test_tms_LabIT.dbo.TMS_ROUTE_LINE_CACHE;
INSERT INTO tms_route_line_cache
(id, route_id, latitude, longitude, index_)
VALUES(?, ?, 0, 0, 0);
-- end
-- start 
SELECT ID, NAME, VALUE_, IDENTIFIER
FROM test_tms_LabIT.dbo.TMS_SCORES;
INSERT INTO tms_scores
(id, "name", identifier, value_)
VALUES(?, '', '', '');
-- end
-- start 
SELECT ID
FROM test_tms_LabIT.dbo.TMS_TASK_PLACE;
INSERT INTO tms_task_place
(id)
VALUES(?);
-- end
-- start 
SELECT ID, TASK_PLACE_ID, PLACE_ID
FROM test_tms_LabIT.dbo.TMS_TASK_PLACE_PLACE;
INSERT INTO tms_task_place_place
(id, task_place_id, place_id)
VALUES(?, ?, ?);
-- end
-- start 
SELECT ID, UPDATE_TS, UPDATED_BY, CREATE_TS, CREATED_BY, VERSION, EXTERNAL_ID, EXTERNAL_UUID, ADDITIONAL_EXTERNAL_ID, NAME, MAX_VALUME, MAX_WEIGHT, TRAILER_VIEW, PRIORITY, EXTERNAL_, SHORT_NAME, NAME_TYPE
FROM test_tms_LabIT.dbo.TMS_TRAILER_TYPE;
INSERT INTO tms_trailer_type
(id, update_ts, updated_by, create_ts, created_by, "version", external_id, external_uuid, additional_external_id, "name", short_name, name_type, max_valume, max_weight, trailer_view, priority, external_)
VALUES(?, '', '', '', '', 0, '', '', '', '', '', '', 0, 0, '', 0, '');
-- end
-- start 
SELECT ID, UPDATE_TS, UPDATED_BY, CREATE_TS, CREATED_BY, VERSION, GOVERNMENT_NUMBER, GOVERNMENT_NUMBER_TRAILER, EXTERNAL_ID, EXTERNAL_UUID, ADDITIONAL_EXTERNAL_ID, STATUS, TRAILER_TYPE_ID, FUEL_TYPE, DIRECTION_ID, GARAGE_ID, EXTERNAL_, FUEL_CONSUMPTION, FUEL_PRICE, COSTS, COSTS_TRAILER, MKAD, KOIKI, OUTSIDER, NO_COORDINATES, NKNH, BINDING, RENT, VEHICLE_STATUS_ADD, REGION_ID, NOT_ALLOW_TO_AUTO_DISTRIBUTION, VEHICLE_TYPE_ID, VEHICLE_TASK_ID, INTERNATIONAL
FROM test_tms_LabIT.dbo.TMS_VEHICLE;
INSERT INTO tms_vehicle
(id, update_ts, updated_by, create_ts, created_by, "version", government_number, government_number_trailer, external_id, external_uuid, additional_external_id, fuel_consumption, fuel_price, costs, costs_trailer, trailer_type_id, fuel_type, direction_id, garage_id, status, external_, mkad, koiki, outsider, no_coordinates, nknh, binding, rent, vehicle_status_add, region_id, not_allow_to_auto_distribution, vehicle_type_id, vehicle_task_id, international)
VALUES(?, '', '', '', '', 0, '', '', '', '', '', 0, 0, 0, 0, ?, '', ?, ?, '', '', false, false, false, false, false, false, false, '', ?, false, ?, ?, false);
-- end
-- start 
SELECT ID, ORDER_ID, PLACE_START_ID, PLACE_FINISH_ID, VEHICLE_ID, AUTOR_ID, DATE_, LAT, LON, STATUS, SUM_FUEL, SUM_SALARY, SUM_PLATON, SUM_REPAIRS, FIRST_WORK, DATE_START, DATE_FINISH, VEHICLE_START_LON, VEHICLE_START_LAT, TIME_EMPTY, DIST_EMPTY, PERCENT_EMPTY, TIME_EMPTY_STR, DIST_EMPTY_STR, LAST_WORK, VEHICLE_TASK_ID, EMPTY_ORDER_ID, REGION_USER_ID, IS_TASK
FROM test_tms_LabIT.dbo.TMS_VEHICLE_AND_ORDER;
INSERT INTO tms_vehicle_and_order
(id, order_id, place_start_id, place_finish_id, vehicle_id, autor_id, sum_fuel, sum_salary, sum_platon, sum_repairs, date_, date_start, date_finish, lat, lon, status, first_work, last_work, vehicle_start_lon, vehicle_start_lat, time_empty, time_empty_str, dist_empty, dist_empty_str, percent_empty, vehicle_task_id, empty_order_id, region_user_id, is_task)
VALUES(?, ?, ?, ?, ?, ?, 0, 0, 0, 0, '', '', '', 0, 0, '', '', '', 0, 0, 0, '', 0, '', 0, ?, ?, ?, false);
-- end
-- start 
SELECT ID, ORDER_ID, DATE_, VEHICLE_ID, COMMENTARY, REASON_ID, CUSTOMER_ID, START_PLACE_ID, FINISH_PLACE_ID, USER_, USER_NOT_LOGIST_ID
FROM test_tms_LabIT.dbo.TMS_VEHICLE_AND_ORDER_REASON_CANCEL_HISTORY;
INSERT INTO tms_vehicle_and_order_reason_cancel_history
(id, order_id, customer_id, start_place_id, finish_place_id, reason_id, commentary, date_, user_, vehicle_id, user_not_logist_id)
VALUES(?, ?, ?, ?, ?, ?, '', '', '', ?, ?);
-- end
-- start 
SELECT ID, LATITUDE, LONGITUDE, VEHICLE_ID, DATE_, REGION_ID
FROM test_tms_LabIT.dbo.TMS_VEHICLE_COORDINATES;
INSERT INTO tms_vehicle_coordinates
(id, latitude, longitude, vehicle_id, region_id, date_)
VALUES(?, 0, 0, ?, ?, '');
-- end
-- start 
SELECT ID, LATITUDE, LONGITUDE, VEHICLE_ID, DATE_
FROM test_tms_LabIT.dbo.TMS_VEHICLE_COORDINATES_HISTORY;
INSERT INTO tms_vehicle_coordinates_history
(id, latitude, longitude, vehicle_id, date_)
VALUES(?, 0, 0, ?, '');
-- end
-- start 
SELECT ID, CUSTOMER_ID, VEHICLE_ID
FROM test_tms_LabIT.dbo.TMS_VEHICLE_CUSTOMERS;
INSERT INTO tms_vehicle_customers
(id, customer_id, vehicle_id)
VALUES(?, ?, ?);
-- end
-- start 
SELECT ID, VEHICLE_ID, CUSTOMER_ID, DATE_, FINISH_RENT_DATE, START_RENT_DATE
FROM test_tms_LabIT.dbo.TMS_VEHICLE_CUSTOMER_RENT;
INSERT INTO tms_vehicle_customer_rent
(id, vehicle_id, customer_id, date_, start_rent_date, finish_rent_date)
VALUES(?, ?, ?, '', '', '');
-- end
-- start 
SELECT ID, VEHICLE_ID, CUSTOM_COLUMN_ID
FROM test_tms_LabIT.dbo.TMS_VEHICLE_CUSTOM_COLUMN;
INSERT INTO tms_vehicle_custom_column
(id, vehicle_id, custom_column_id)
VALUES(?, ?, ?);
-- end
-- start 
SELECT ID, VEHICLE_ID, EVENT_TYPE, FLAG
FROM test_tms_LabIT.dbo.TMS_VEHICLE_EVENT;
INSERT INTO tms_vehicle_event
(id, vehicle_id, event_type, flag)
VALUES(?, ?, '', '');
-- end
-- start 
SELECT ID, VEHICLE_ID, RATE_PER_KM, DATE_, SUM_ORDERS_RATE, SUM_EMPTY_DIST, SUM_ORDERS_DIST, ORDER_RATE_1, ORDER_RATE_2, ORDER_RATE_3, ORDER_RATE_4, ORDER_EMPTY_DIST_1, ORDER_EMPTY_DIST_2, ORDER_EMPTY_DIST_3, ORDER_EMPTY_DIST_4, ORDER_DIST_1, ORDER_DIST_2, ORDER_DIST_3, ORDER_DIST_4
FROM test_tms_LabIT.dbo.TMS_VEHICLE_RATE_PER_KM;
INSERT INTO tms_vehicle_rate_per_km
(id, vehicle_id, rate_per_km, date_, sum_orders_rate, sum_empty_dist, sum_orders_dist, order_rate_1, order_rate_2, order_rate_3, order_rate_4, order_empty_dist_1, order_empty_dist_2, order_empty_dist_3, order_empty_dist_4, order_dist_1, order_dist_2, order_dist_3, order_dist_4)
VALUES(?, ?, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- end
-- start 
SELECT ID, VEHICLE_ID, COST, DIST, DATE_
FROM test_tms_LabIT.dbo.TMS_VEHICLE_STATISTIC;
INSERT INTO tms_vehicle_statistic
(id, vehicle_id, "cost", dist, date_)
VALUES(?, ?, 0, 0, '');
-- end
-- start 
SELECT ID, VEHICLE_ID, STATUS
FROM test_tms_LabIT.dbo.TMS_VEHICLE_STATUS_HISTORY;
INSERT INTO tms_vehicle_status_history
(id, vehicle_id, status)
VALUES(?, ?, '');
-- end
-- start 
SELECT ID, NUMBER_, DATE_, VEHICLE_ID, TASK_TYPE_ID, NOT_ALLOW_VEHICLE_WITH_CARGO, VEHICLE_TASK_TIME_TYPE_ID, OPERATION_DATE, FLOAT_OPERATION_DATE, OPERATION_DATE_START, OPERATION_DATE_FINISH, INDEFINITE_DURATION, OPERATION_TIME_IN_HOURS, PLACE_FACT_ID, OPERATION_DATE_FACT, OPERATION_DATE_START_FACT, OPERATION_DATE_FINISH_FACT, COMMENTARY, RESPONSIBLE_USER_ID, VEHICLE_AND_ORDER_ID, STATUS, VEHICLE_TASK_ADD_ID, DATE_CLOSE_TASK, USER_CLOSE_TASK_ID
FROM test_tms_LabIT.dbo.TMS_VEHICLE_TASK;
INSERT INTO tms_vehicle_task
(id, number_, vehicle_and_order_id, date_, vehicle_id, task_type_id, status, not_allow_vehicle_with_cargo, vehicle_task_time_type_id, operation_date, float_operation_date, operation_date_start, operation_date_finish, indefinite_duration, operation_time_in_hours, place_fact_id, operation_date_fact, operation_date_start_fact, operation_date_finish_fact, commentary, responsible_user_id, vehicle_task_add_id, date_close_task, user_close_task_id)
VALUES(?, 0, ?, '', ?, ?, '', false, ?, '', false, '', '', false, 0, ?, '', '', '', '', ?, ?, '', ?);
-- end
-- start 
SELECT ID, VEHICLE_TASK_ID, SORT_NUMBER, PLACE_ID, DATE_, ROUTE
FROM test_tms_LabIT.dbo.TMS_VEHICLE_TASKS_PLACES;
INSERT INTO tms_vehicle_tasks_places
(id, vehicle_task_id, sort_number, place_id, date_, route)
VALUES(?, ?, 0, ?, '', ?);
-- end
-- start 
SELECT ID, TYPE_, DISTANCE_TO_PLACE_FACT, TIME_TO_PLACE_FACT, DATE_TO_PLACE_FACT, DISTANCE_TO_PLACE_FINISH, TIME_TO_PLACE_FINISH, DATE_TO_PLACE_FINISH, DATE_START_TASK, PLACE_FACT_ID, PLACE_FACT_LAT, PLACE_FACT_LON, PLACE_FINISH_ID, PLACE_FINISH_LAT, PLACE_FINISH_LON, PLACE_START_ID, PLACE_START_LAT, PLACE_START_LON, DATE_START, DATE_FINISH_TASK
FROM test_tms_LabIT.dbo.TMS_VEHICLE_TASK_ADD;
INSERT INTO tms_vehicle_task_add
(id, type_, distance_to_place_fact, time_to_place_fact, date_to_place_fact, distance_to_place_finish, time_to_place_finish, date_to_place_finish, date_start_task, date_start, date_finish_task, place_fact_id, place_fact_lat, place_fact_lon, place_finish_id, place_finish_lat, place_finish_lon, place_start_id, place_start_lat, place_start_lon)
VALUES(?, '', 0, 0, '', 0, 0, '', '', '', '', ?, 0, 0, ?, 0, 0, ?, 0, 0);
-- end
-- start 
SELECT ID, VEHICLE_TASK_ID, DATE_, USER_ID, COMMENTARY
FROM test_tms_LabIT.dbo.TMS_VEHICLE_TASK_HISTORY;
INSERT INTO tms_vehicle_task_history
(id, vehicle_task_id, date_, user_id, commentary)
VALUES(?, ?, '', ?, '');
-- end
-- start 
SELECT ID, NAME, DESCRIPTION, VEHICLE_TASK_ID
FROM test_tms_LabIT.dbo.TMS_VEHICLE_TASK_OPERATION;
INSERT INTO tms_vehicle_task_operation
(id, "name", description, vehicle_task_id)
VALUES(?, '', '', ?);
-- end
-- start 
SELECT ID, VEHICLE_TASK_ID, VEHICLE_TASK_OPERATION_ID
FROM test_tms_LabIT.dbo.TMS_VEHICLE_TASK_TASK_OPERATION;
INSERT INTO tms_vehicle_task_task_operation
(id, vehicle_task_id, vehicle_task_operation_id)
VALUES(?, ?, ?);
-- end
-- start 
SELECT ID, NAME, DESCRIPTION
FROM test_tms_LabIT.dbo.TMS_VEHICLE_TASK_TIME_TYPE;
INSERT INTO tms_vehicle_task_time_type
(id, "name", description)
VALUES(?, '', '');
-- end
-- start 
SELECT ID, NAME, DESCRIPTION
FROM test_tms_LabIT.dbo.TMS_VEHICLE_TASK_TYPE;
INSERT INTO tms_vehicle_task_type
(id, "name", description)
VALUES(?, '', '');
-- end
-- start 
SELECT ID, NAME, DESCRIPTION
FROM test_tms_LabIT.dbo.TMS_VEHICLE_TYPE;
INSERT INTO tms_vehicle_type
(id, "name", description)
VALUES(?, '', '');
-- end
-- start 
SELECT ID, VAHICLE_ID, ORDER_ID, DATA_START, DATA_START_FACT, DATA_FINISH, DATA_FINISH_FACT, LAT_START, LON_START, LAT_FINISH, LON_FINISH, DISTANCE, TIME_, TYPE_, STATUS, ROUTE, PLACE_FINISH_ID, PLACE_START_ID, TIME_STRING, NEXT_WORK, VEHICLE_TASK_ID
FROM test_tms_LabIT.dbo.TMS_VEHICLE_WORK;
INSERT INTO tms_vehicle_work
(id, vahicle_id, order_id, place_finish_id, place_start_id, data_start, data_start_fact, data_finish, data_finish_fact, lat_start, lon_start, lat_finish, lon_finish, distance, time_, time_string, type_, status, route, next_work, vehicle_task_id)
VALUES(?, ?, ?, ?, ?, '', '', '', '', 0, 0, 0, 0, 0, 0, '', '', '', ?, '', ?);
-- end