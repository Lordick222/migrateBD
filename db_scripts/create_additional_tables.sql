create table distr_order
(
    ID                        bigint,
    ORDER_ID                  UUID,
    LOADING_DATE              timestamp,
    UNLOADING_DATE            timestamp,
    RATE                      integer,
    TRAVEL_TIME               integer,
    DISTANCE                  integer,
    CUSTOMER_ID               UUID,
    CUSTOMER_BINDING          integer,
    KONIKI                    integer,
    MKAD                      integer,
    GUARANTEED_ORDER          integer,
    REGION_START_ID           UUID,
    REGION_FINISH_ID          UUID,
    LAT_START                 integer,
    LON_START                 integer,
    LAT_FINISH                integer,
    LON_FINISH                integer,
    LOADING_TIME              integer,
    UNLOADING_TIME            integer,
    PLACE_START_ID            UUID,
    PLACE_FINISH_ID           UUID,
    FEDERAL_DISTRICT_START_ID UUID
);

create table distr_order_work
(
    ID         bigint,
    VEHICLE_ID UUID,
    ORDER_ID   UUID,
    DATE_S     timestamp,
    DATE_F     timestamp,
    TIME_DIFF  bigint,
    LAT_S      integer,
    LON_S      integer,
    LAT_F      integer,
    LON_F      integer,
    FLAG       integer
);

create table distr_special_customers
(
    ID          bigint,
    CUSTOMER_ID UUID
);

create table distr_vehicle
(
    ID              bigint,
    VEHICLE_ID      UUID,
    FLAG            integer,
    LAT             decimal(18, 5),
    LON             decimal(18, 5),
    DATE            timestamp,
    TRAILER_TYPE_ID UUID,
    KONIKI          integer,
    MKAD            integer,
    BINDING         integer
);

create table distr_vehicle_and_order
(
    ID                        bigint,
    VEHICLE_ID                UUID,
    ORDER_ID                  UUID,
    CUR_VEHICLE_LAT           integer,
    CUR_VEHICLE_LON           integer,
    ORDER_PLACE_START_LAT     integer,
    ORDER_PLACE_START_LON     integer,
    CUR_VEHICLE_DATE          timestamp,
    DISTANCE                  integer,
    REGION_START_ID           UUID,
    FEDERAL_DISTRICT_START_ID UUID
);

create table distr_vehicle_and_order_customers
(
    ID                        bigint,
    VEHICLE_ID                UUID,
    ORDER_ID                  UUID,
    CUR_VEHICLE_LAT           integer,
    CUR_VEHICLE_LON           integer,
    ORDER_PLACE_START_LAT     integer,
    ORDER_PLACE_START_LON     integer,
    CUR_VEHICLE_DATE          timestamp,
    DISTANCE                  integer,
    REGION_START_ID           UUID,
    FEDERAL_DISTRICT_START_ID UUID
);

create table distr_vehicle_and_order_custom_column
(
    ID                        bigint,
    VEHICLE_ID                UUID,
    ORDER_ID                  UUID,
    CUR_VEHICLE_LAT           integer,
    CUR_VEHICLE_LON           integer,
    ORDER_PLACE_START_LAT     integer,
    ORDER_PLACE_START_LON     integer,
    CUR_VEHICLE_DATE          timestamp,
    DISTANCE                  integer,
    REGION_START_ID           UUID,
    FEDERAL_DISTRICT_START_ID UUID
);

create table distr_vehicle_and_order_date_diff
(
    ID                        bigint,
    VEHICLE_ID                UUID,
    ORDER_ID                  UUID,
    CUR_VEHICLE_LAT           integer,
    CUR_VEHICLE_LON           integer,
    ORDER_PLACE_START_LAT     integer,
    ORDER_PLACE_START_LON     integer,
    CUR_VEHICLE_DATE          timestamp,
    DISTANCE                  integer,
    REGION_START_ID           UUID,
    FEDERAL_DISTRICT_START_ID UUID
);

create table distr_vehicle_and_order_final
(
    ID                        bigint,
    VEHICLE_ID                UUID,
    ORDER_ID                  UUID,
    CUR_VEHICLE_LAT           integer,
    CUR_VEHICLE_LON           integer,
    ORDER_PLACE_START_LAT     integer,
    ORDER_PLACE_START_LON     integer,
    CUR_VEHICLE_DATE          timestamp,
    DISTANCE                  integer,
    TRAVEL_TIME               integer,
    REGION_START_ID           UUID,
    VEHICLE_TASK_ID           UUID,
    TASK_ID                   bigint,
    DATE_TO_REACH_DESTINATION timestamp,
    FEDERAL_DISTRICT_START_ID UUID
);

create table distr_vehicle_and_order_koniki
(
    ID                        bigint,
    VEHICLE_ID                UUID,
    ORDER_ID                  UUID,
    CUR_VEHICLE_LAT           integer,
    CUR_VEHICLE_LON           integer,
    ORDER_PLACE_START_LAT     integer,
    ORDER_PLACE_START_LON     integer,
    CUR_VEHICLE_DATE          timestamp,
    DISTANCE                  integer,
    REGION_START_ID           UUID,
    FEDERAL_DISTRICT_START_ID UUID
);

create table distr_vehicle_and_order_mkad
(
    ID                        bigint,
    VEHICLE_ID                UUID,
    ORDER_ID                  UUID,
    CUR_VEHICLE_LAT           integer,
    CUR_VEHICLE_LON           integer,
    ORDER_PLACE_START_LAT     integer,
    ORDER_PLACE_START_LON     integer,
    CUR_VEHICLE_DATE          timestamp,
    DISTANCE                  integer,
    REGION_START_ID           UUID,
    FEDERAL_DISTRICT_START_ID UUID
);

create table distr_vehicle_and_order_order_cancel_history
(
    ID                        bigint,
    VEHICLE_ID                UUID,
    ORDER_ID                  UUID,
    CUR_VEHICLE_LAT           integer,
    CUR_VEHICLE_LON           integer,
    ORDER_PLACE_START_LAT     integer,
    ORDER_PLACE_START_LON     integer,
    CUR_VEHICLE_DATE          timestamp,
    DISTANCE                  integer,
    REGION_START_ID           UUID,
    FEDERAL_DISTRICT_START_ID UUID
);

create table distr_vehicle_and_order_rate_per_km
(
    ID                        bigint,
    VEHICLE_ID                UUID,
    ORDER_ID                  UUID,
    CUR_VEHICLE_LAT           integer,
    CUR_VEHICLE_LON           integer,
    ORDER_PLACE_START_LAT     integer,
    ORDER_PLACE_START_LON     integer,
    CUR_VEHICLE_DATE          timestamp,
    DISTANCE                  integer,
    REGION_START_ID           UUID,
    FEDERAL_DISTRICT_START_ID UUID
);

create table distr_vehicle_and_order_rent
(
    ID                        bigint,
    VEHICLE_ID                UUID,
    ORDER_ID                  UUID,
    CUR_VEHICLE_LAT           integer,
    CUR_VEHICLE_LON           integer,
    ORDER_PLACE_START_LAT     integer,
    ORDER_PLACE_START_LON     integer,
    CUR_VEHICLE_DATE          timestamp,
    DISTANCE                  integer,
    REGION_START_ID           UUID,
    FEDERAL_DISTRICT_START_ID UUID
);

create table distr_vehicle_and_order_trailer_type
(
    ID                        bigint,
    VEHICLE_ID                UUID,
    ORDER_ID                  UUID,
    CUR_VEHICLE_LAT           integer,
    CUR_VEHICLE_LON           integer,
    ORDER_PLACE_START_LAT     integer,
    ORDER_PLACE_START_LON     integer,
    CUR_VEHICLE_DATE          timestamp,
    DISTANCE                  integer,
    REGION_START_ID           UUID,
    FEDERAL_DISTRICT_START_ID UUID
);

create table distr_vehicle_and_order_vehicle_task
(
    ID                          bigint,
    VEHICLE_ID                  UUID,
    VEHICLE_TASK_ID             UUID,
    PLACE_FACT_ID               UUID,
    PLACE_FACT_LAT              integer,
    PLACE_FACT_LON              integer,
    ORDER_ID                    UUID,
    CUR_VEHICLE_LAT             integer,
    CUR_VEHICLE_LON             integer,
    ORDER_PLACE_START_LAT       integer,
    ORDER_PLACE_START_LON       integer,
    ORDER_PLACE_FINISH_LAT      integer,
    ORDER_PLACE_FINISH_LON      integer,
    CUR_VEHICLE_DATE            timestamp,
    DISTANCE_TO_FINISH_PLACE    integer,
    REGION_START_ID             UUID,
    TYPE_                       varchar(10),
    DISTANCE_TO_PLACE_FACT      integer,
    VERSION_                    integer,
    DATE_TO_REACH_PLACE_FACT    timestamp,
    DATE_TO_REACH_PLACE_FINISH  timestamp,
    GEOROUTE_UUID               UUID,
    TRAVEL_TIME_TO_PLACE_FACT   integer,
    DATE_START_TASK             timestamp,
    TRAVEL_TIME_TO_PLACE_FINISH integer,
    PLACE_START_ID              UUID,
    PLACE_FINISH_ID             UUID
);

create table distr_vehicle_free_integererval
(
    ID         bigint,
    VEHICLE_ID UUID,
    DATE_S     timestamp,
    DATE_F     timestamp,
    TIME_DIFF  bigint,
    LAT_S      integer,
    LON_S      integer,
    LAT_F      integer,
    LON_F      integer,
    FLAG       integer
);
