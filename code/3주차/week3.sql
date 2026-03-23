-- 1. 테이블 생성
CREATE TABLE user_table (
    id SERIAL,
    email VARCHAR(255),
    password VARCHAR(255),
    name VARCHAR(100),
    address VARCHAR(255),
    created_at DATE  -- YYYY-MM--DD
);

-- 2. 데이터 삽입
INSERT INTO user_table (email, password, name, address, created_at) VALUES
('user1@test.com', 'pass1', '김철수', '서울', '2026-03-01'),
('user2@test.com', 'pass2', '이영희', '부산', '2026-03-02'),
('user3@test.com', 'pass3', '박민수', '대구', '2026-03-03'),
('user4@test.com', 'pass4', '최지영', '인천', '2026-03-04'),
('user5@test.com', 'pass5', '정우성', '광주', '2026-03-05');

-- 전체 조회
SELECT * FROM user_table;

-- 정렬 [생성일 내림차순으로 정리]

SELECT * FROM user_table ORDER BY created_at DESC;

-- 조건 검색 [ 서울인 user만 검색]
SELECT * FROM user_table WHERE address = '서울';