-- start
SELECT ID, DATE_, RESULT_, MESSAGE, MESSAGE_ERROR, ORDER_ID
FROM test_tms_LabIT.dbo.TMS_ONE_S_CANCEL_ORDER_HISTORY;
INSERT INTO tms_one_s_cancel_order_history (id, date_, result_, message, message_error, order_id)
VALUES (?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, DATE_, RESULT_, MESSAGE, MESSAGE_ERROR
FROM test_tms_LabIT.dbo.TMS_ONE_S_ORDER_HISTORY;
INSERT INTO tms_one_s_order_history (id, date_, result_, message, message_error)
VALUES (?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, VAHICLE_ID, ORDER_ID, DATA_START, DATA_START_FACT, DATA_FINISH, DATA_FINISH_FACT, LAT_START, LON_START, LAT_FINISH, LON_FINISH, DISTANCE, TIME_, TYPE_, STATUS, ROUTE, PLACE_FINISH_ID, PLACE_START_ID, TIME_STRING, NEXT_WORK, VEHICLE_TASK_ID
FROM test_tms_LabIT.dbo.TMS_VEHICLE_WORK;
INSERT INTO tms_vehicle_work
(id, vahicle_id, order_id, place_finish_id, place_start_id, data_start, data_start_fact, data_finish, data_finish_fact, lat_start, lon_start, lat_finish, lon_finish, distance, time_, time_string, type_, status, route, next_work, vehicle_task_id)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, ORDER_ID, PLACE_START_ID, PLACE_FINISH_ID, VEHICLE_ID, AUTOR_ID, DATE_, LAT, LON, STATUS, SUM_FUEL, SUM_SALARY, SUM_PLATON, SUM_REPAIRS, FIRST_WORK, DATE_START, DATE_FINISH, VEHICLE_START_LON, VEHICLE_START_LAT, TIME_EMPTY, DIST_EMPTY, PERCENT_EMPTY, TIME_EMPTY_STR, DIST_EMPTY_STR, LAST_WORK, VEHICLE_TASK_ID, EMPTY_ORDER_ID, REGION_USER_ID, IS_TASK
FROM test_tms_LabIT.dbo.TMS_VEHICLE_AND_ORDER;
INSERT INTO tms_vehicle_and_order
(id, order_id, place_start_id, place_finish_id, vehicle_id, autor_id, sum_fuel, sum_salary, sum_platon, sum_repairs, date_, date_start, date_finish, lat, lon, status, first_work, last_work, vehicle_start_lon, vehicle_start_lat, time_empty, time_empty_str, dist_empty, dist_empty_str, percent_empty, vehicle_task_id, empty_order_id, region_user_id, is_task)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, ORDER_ID, DATE_, VEHICLE_ID, COMMENTARY, REASON_ID, CUSTOMER_ID, START_PLACE_ID, FINISH_PLACE_ID, USER_, USER_NOT_LOGIST_ID
FROM test_tms_LabIT.dbo.TMS_VEHICLE_AND_ORDER_REASON_CANCEL_HISTORY;
INSERT INTO tms_vehicle_and_order_reason_cancel_history
(id, order_id, customer_id, start_place_id, finish_place_id, reason_id, commentary, date_, user_, vehicle_id, user_not_logist_id)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, LATITUDE, LONGITUDE, VEHICLE_ID, DATE_
FROM test_tms_LabIT.dbo.TMS_VEHICLE_COORDINATES_HISTORY;
INSERT INTO tms_vehicle_coordinates_history
(id, latitude, longitude, vehicle_id, date_)
VALUES(?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, DATE_, LATITUDE_START, LONGITUDE_START, LATITUDE_FINISH, LONGITUDE_FINISH, DISTANCE, TIME_
FROM test_tms_LabIT.dbo.TMS_ROUTE_CACHE;
INSERT INTO tms_route_cache
(id, date_, latitude_start, longitude_start, latitude_finish, longitude_finish, distance, time_)
VALUES(?, ?, ?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, ROUTE_ID, LATITUDE, LONGITUDE, INDEX_
FROM test_tms_LabIT.dbo.TMS_ROUTE_LINE_CACHE;
INSERT INTO tms_route_line_cache
(id, route_id, latitude, longitude, index_)
VALUES(?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, DATE_, MESSAGE_ID, ORDER_ID, POINT_ID, STATUS, DATE_MESSAGE, RESULT_, MESSAGE_ERROR
FROM test_tms_LabIT.dbo.TMS_ONE_S_STATUS_HISTORY;
INSERT INTO tms_one_s_status_history
(id, date_, message_id, order_id, point_id, status, date_message, result_, message_error)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);
-- end