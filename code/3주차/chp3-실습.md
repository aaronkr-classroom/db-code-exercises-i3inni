## **동아리 관리 시스템 설계 문서**

### **1. 요구사항 정의**

#### **[사용자 권한]**

- **관리자 (회장/운영진):** 동아리 부원을 등록/삭제하고, 새로운 활동(정기 모임, 행사)을 생성 및 관리합니다.
- **일반 부원:** 본인의 정보를 관리하고, 생성된 동아리 활동 내역을 조회합니다.

#### **[주요 기능]**

1.  **부원 정보 관리:** 신규 부원의 이름, 학번, 연락처 등을 등록하고 관리해야 한다.
2.  **활동 일정 등록:** 동아리 정기 모임이나 특별 행사의 일시, 장소, 내용을 등록할 수 있어야 한다.
3.  **부원 상태 추적:** 각 부원의 활동 상태(활동 중, 휴학, 졸업 등)를 구분하여 관리해야 한다.
4.  **활동 포인트 부여:** 각 활동마다 배정된 점수(포인트)를 통해 부원의 기여도를 기록해야 한다.
5.  **활동 이력 조회:** 특정 기간 내에 진행된 모든 동아리 활동 리스트를 조회할 수 있어야 한다.

---

### **2. 데이터 설계**

#### **[Entities]**

- **Member** (동아리 부원)
- **Activity** (동아리 활동)

#### **[Properties]**

| 엔티티       | 속성명         | 타입 | 설명                            |
| :----------- | :------------- | :--- | :------------------------------ |
| **Member**   | id             | INT  | 식별자 (기본키)                 |
|              | name           | TEXT | 성명                            |
|              | student_number | TEXT | 학번                            |
|              | department     | TEXT | 학과                            |
|              | phone          | TEXT | 연락처                          |
|              | status         | TEXT | 활동 상태 (Active, Inactive 등) |
|              | join_date      | DATE | 가입일                          |
| **Activity** | id             | INT  | 식별자 (기본키)                 |
|              | title          | TEXT | 활동 명칭                       |
|              | description    | TEXT | 상세 내용                       |
|              | location       | TEXT | 장소                            |
|              | points         | INT  | 부여 포인트                     |
|              | activity_date  | DATE | 활동 일자                       |

---

### **3. SQL 구현**

```sql
/* 테이블 생성 (제약조건 제외)
*/

-- 1. Member (동아리 부원) 테이블 생성
CREATE TABLE Member (
    id INT,
    name TEXT,
    student_number TEXT,
    department TEXT,
    phone TEXT,
    status TEXT,
    join_date DATE
);

-- 2. Activity (동아리 활동) 테이블 생성
CREATE TABLE Activity (
    id INT,
    title TEXT,
    description TEXT,
    location TEXT,
    points INT,
    activity_date DATE
);

/* 데이터(행) 삽입 (각 5개씩)
*/

-- 1. Member 데이터 추가
INSERT INTO Member (id, name, student_number, department, phone, status, join_date) VALUES
(1, '김철수', '20230001', '컴퓨터공학과', '010-1111-2222', 'Active', '2025-03-02'),
(2, '이영희', '20230005', '디자인학과', '010-3333-4444', 'Active', '2025-03-05'),
(3, '박지성', '20220123', '체육학과', '010-5555-6666', 'Inactive', '2024-09-01'),
(4, '최수지', '20240012', '경영학과', '010-7777-8888', 'Active', '2026-03-10'),
(5, '정민준', '20210567', '전자공학과', '010-9999-0000', 'Graduated', '2023-03-02');

-- 2. Activity 데이터 추가
INSERT INTO Activity (id, title, description, location, points, activity_date) VALUES
(1, '신입생 환영회', '동아리 신입 부원 소개 및 친목 도모', '학생회관 2층', 10, '2026-03-15'),
(2, '정기 학술 세미나', '전공 분야 최신 트렌드 발표', '공학관 101호', 20, '2026-03-20'),
(3, '춘계 체육대회', '근처 공원에서 축구 및 배드민턴', '중앙공원', 15, '2026-04-05'),
(4, '중간고사 간식나눔', '시험 기간 응원을 위한 간식 배부', '과사무실 앞', 5, '2026-04-20'),
(5, '연합 MT', '타 대학 동아리와 함께하는 MT', '대성리', 30, '2026-05-01');

/* 데이터 조회 (ORDER BY 활용)
*/

-- 가입일이 가장 최근인 순서(내림차순)로 부원 목록 조회
SELECT * FROM Member
ORDER BY join_date DESC;

-- 활동 일자가 가장 가까운 순서(오름차순)로 활동 목록 조회
SELECT * FROM Activity
ORDER BY activity_date ASC;
```

---
