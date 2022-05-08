-- start
SELECT ID, DATE_, RESULT_, MESSAGE, MESSAGE_ERROR, ORDER_ID
FROM tms.dbo.TMS_ONE_S_CANCEL_ORDER_HISTORY;
INSERT INTO tms_one_s_cancel_order_history (id, date_, result_, message, message_error, order_id) VALUES(?, ?, ?, ?, ?, ?);
-- end
-- start
SELECT ID, ROUTE_ID, LATITUDE, LONGITUDE, INDEX_
FROM tms.dbo.TMS_ROUTE_LINE_CACHE;
INSERT INTO tms_route_line_cache
(id, route_id, latitude, longitude, index_)
VALUES(?, ?, ?, ?, ?);
-- end
