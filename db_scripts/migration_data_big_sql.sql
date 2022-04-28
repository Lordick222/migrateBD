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