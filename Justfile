drop:
    sqlx database drop

create:
    sqlx database create

schema name:
    sqlx migrate add {{name}}

migrate:
    sqlx migrate run
