TABLE users;
TABLE user_items;
TABLE games;
TABLE plays;

SELECT user_level FROM users;

-- 1 : CHECK 유저 레벨은 1~100만 가능하다.
ALTER TABLE users
ADD CONSTRAINT chk_user_level
CHECK (user_level >= 1 AND user_level <= 100);

UPDATE users
SET user_level = 100
WHERE user_id = 1;


-- 접속 상태는 online 또는 offline만 가능
alter table users
add constraint chk_user_status
check(status in ('online', 'connecting', 'offline'));

update users
set status = 'sleeping'
where user_id = 2;

-- 3: 아이템 가격은 0원 이상이어야 한다
select * from items;

alter table items
add constraint chk_item_price
check (price >= 0);

update items
set price = -10
where item_id = 1001;

-- 4: 아이템 등급을 정해진 값만 가능하다 (S, A, B, C, D, E, F)
alter table items
add constraint chk_grade
check(grade in ('S', 'A', 'B', 'C', 'D', 'E', 'F'));

-- 5: 닉네임은 중복되면 안된다.
alter table users
add constraint uq_users_nickname
unique (nickname);

insert into users VALUES
(6, '홍길동', 'DragonKing', 10, '2026-05-18', 'home@home.com', 'offline');

select CONSTRAINT_NAME, TABLE_NAME
FROM information_schema.table_constraints
where constraint_type = 'FOREIGN KEY'
    AND TABLE_NAME = 'plays';

select CONSTRAINT_NAME, TABLE_NAME
FROM information_schema.table_constraints
where constraint_type = 'FOREIGN KEY'
    AND TABLE_NAME = 'user_items';

    -- plays_user_id_fkey
-- plays_game_id_fkey
-- user_items_user_id_fkey
-- user_items_item_id_fkey
ALTER table plays
drop constraint plays_user_id_fkey;
ALTER table plays
drop constraint plays_game_id_fkey;
ALTER table user_items
drop constraint user_items_user_id_fkey;
ALTER table user_items
drop constraint user_items_item_id_fkey;

-- 새 FK 추가
-- 1: 유저가 삭제되면 플레이 기록도 삭제되게 하기
ALTER Table plays
add constraint fk_plays_users
foreign key (user_id)
REFERENCES users(user_id)
on delete CASCADE;

-- 2: 게임은 플레이 기록이 있으면 삭제하지 못하게 하기
ALTER Table plays
add constraint fk_plays_gmaes
foreign key (game_id)
REFERENCES games(game_id)
on delete RESTRICT;

-- 3: 유저가 삭제되면 보유 아이템 기록도 삭제되게 하기
ALTER Table user_items
add constraint fk_user_items_users
foreign key (user_id)
REFERENCES users(user_id)
on delete CASCADE;

-- 4: 아이템 누군가 보유 중이면 삭제하지 못하게 하기

ALTER table user_items
drop constraint fk_user_items_items;

ALTER Table user_items
add constraint fk_user_items_items
foreign key (item_id)
REFERENCES items(item_id)
on delete RESTRICT;

-- CASCADE 테스트
SELECT * from plays where user_id = 1;
SELECT * from user_items where user_id = 1;

DELETE FROM users where user_id = 1;

-- RESTRICT 테스트
TABLE games

DELETE FROM games where game_id = 101;
DELETE FROM items WHERE item_id = 1004;

