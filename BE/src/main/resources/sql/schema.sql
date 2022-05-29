-- drop all tables if exists
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS wish;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS room_review;
DROP TABLE IF EXISTS room_charge_policy;
DROP TABLE IF EXISTS room_image;
DROP TABLE IF EXISTS charge_policy;
DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS member;
SET FOREIGN_KEY_CHECKS = 1;

-- member Table Create SQL
CREATE TABLE member
(
    `id`                BIGINT      NOT NULL AUTO_INCREMENT COMMENT '회원 ID',
    `name`              VARCHAR(20) NOT NULL COMMENT '이름',
    `email`             VARCHAR(50) NOT NULL COMMENT '이메일',
    `password`          VARCHAR(20) NOT NULL COMMENT '비밀번호',
    `type`              VARCHAR(5)  NOT NULL COMMENT '회원타입(G: 일반, H: 호스트)',
    `profile_image_url` VARCHAR(255) NULL COMMENT '회원 프로필 사진 URL',
    `created_at`        TIMESTAMP   NOT NULL DEFAULT NOW() COMMENT '생성일시',
    `updated_at`        TIMESTAMP   NOT NULL DEFAULT NOW() COMMENT '수정일시',
    PRIMARY KEY (id)
);

ALTER TABLE member COMMENT '회원';


-- room Table Create SQL
CREATE TABLE room
(
    `id`             BIGINT         NOT NULL AUTO_INCREMENT COMMENT '숙소 ID',
    `host_id`        BIGINT         NOT NULL COMMENT '호스트 ID',
    `title`          VARCHAR(100)   NOT NULL COMMENT '숙소 이름',
    `description`    VARCHAR(10000) NOT NULL COMMENT '숙소 설명',
    `latitude`       DECIMAL(9, 6) NULL COMMENT '위도',
    `longitude`      DECIMAL(9, 6) NULL COMMENT '경도',
    `country`        VARCHAR(50) NULL COMMENT '나라',
    `city`           VARCHAR(50) NULL COMMENT '도시',
    `state`          VARCHAR(50) NULL COMMENT '시/도',
    `street`         VARCHAR(50) NULL COMMENT '거리',
    `detail_address` VARCHAR(50) NULL COMMENT '상세 주소',
    `room_type`      VARCHAR(20)    NOT NULL COMMENT '숙소 타입',
    `max_capacity`   INT            NOT NULL COMMENT '최대 수용 인원',
    `bedroom_count`  INT            NOT NULL COMMENT '침실수',
    `bed_count`      INT            NOT NULL COMMENT '침대수',
    `bathroom_count` INT            NOT NULL COMMENT '화장실수',
    `charge`         INT            NOT NULL COMMENT '기본요금(1박당)',
    `review_count`   INT NULL COMMENT '리뷰수',
    `average_rate`   DECIMAL(3, 2) NULL COMMENT '평균 별점',
    `created_at`     TIMESTAMP      NOT NULL DEFAULT NOW() COMMENT '생성일시',
    `updated_at`     TIMESTAMP      NOT NULL DEFAULT NOW() COMMENT '수정일시',
    PRIMARY KEY (id)
);

ALTER TABLE room COMMENT '숙소';

ALTER TABLE room
    ADD CONSTRAINT FK_room_host_id_member_id FOREIGN KEY (host_id)
        REFERENCES member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- charge_policy Table Create SQL
CREATE TABLE charge_policy
(
    `id`        BIGINT      NOT NULL AUTO_INCREMENT COMMENT '요금 정책 ID',
    `name`      VARCHAR(50) NOT NULL COMMENT '정책명',
    `is_active` BOOLEAN     NOT NULL COMMENT '활성화여부',
    PRIMARY KEY (id)
);

ALTER TABLE charge_policy COMMENT '요금 정책';

CREATE UNIQUE INDEX UQ_charge_policy_1
    ON charge_policy (name);


-- room_image Table Create SQL
CREATE TABLE room_image
(
    `id`            BIGINT       NOT NULL AUTO_INCREMENT COMMENT '숙소 사진 ID',
    `room_id`       BIGINT       NOT NULL COMMENT '숙소 ID',
    `url`           VARCHAR(255) NOT NULL COMMENT '이미지 경로',
    `is_main_image` BOOLEAN      NOT NULL COMMENT '대표이미지여부',
    `sequence`      INT          NOT NULL COMMENT '이미지 순서',
    PRIMARY KEY (id)
);

ALTER TABLE room_image COMMENT '숙소 사진';

ALTER TABLE room_image
    ADD CONSTRAINT FK_room_image_room_id_room_id FOREIGN KEY (room_id)
        REFERENCES room (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- room_charge_policy Table Create SQL
CREATE TABLE room_charge_policy
(
    `id`               BIGINT NOT NULL AUTO_INCREMENT COMMENT '숙소 요금 정책 ID',
    `room_id`          BIGINT NOT NULL COMMENT '숙소 ID',
    `charge_policy_id` BIGINT NOT NULL COMMENT '요금 정책 ID',
    PRIMARY KEY (id)
);

ALTER TABLE room_charge_policy COMMENT '숙소 요금 정책';

ALTER TABLE room_charge_policy
    ADD CONSTRAINT FK_room_charge_policy_room_id_room_id FOREIGN KEY (room_id)
        REFERENCES room (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE room_charge_policy
    ADD CONSTRAINT FK_room_charge_policy_charge_policy_id_charge_policy_id FOREIGN KEY (charge_policy_id)
        REFERENCES charge_policy (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- room_review Table Create SQL
CREATE TABLE room_review
(
    `id`         BIGINT        NOT NULL AUTO_INCREMENT COMMENT '숙소 후기 ID',
    `room_id`    BIGINT        NOT NULL COMMENT '숙소 ID',
    `member_id`  BIGINT        NOT NULL COMMENT '회원 ID',
    `rate`       DECIMAL(3, 2) NOT NULL COMMENT '별점',
    `content`    VARCHAR(255) NULL COMMENT '내용',
    `created_at` TIMESTAMP     NOT NULL DEFAULT NOW() COMMENT '생성일시',
    `updated_at` TIMESTAMP     NOT NULL DEFAULT NOW() COMMENT '수정일시',
    PRIMARY KEY (id)
);

ALTER TABLE room_review COMMENT '숙소 후기';

ALTER TABLE room_review
    ADD CONSTRAINT FK_room_review_room_id_room_id FOREIGN KEY (room_id)
        REFERENCES room (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE room_review
    ADD CONSTRAINT FK_room_review_member_id_member_id FOREIGN KEY (member_id)
        REFERENCES member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- reservation Table Create SQL
CREATE TABLE reservation
(
    `id`           BIGINT    NOT NULL AUTO_INCREMENT COMMENT '예약 ID',
    `room_id`      BIGINT    NOT NULL COMMENT '숙소 ID',
    `member_id`    BIGINT    NOT NULL COMMENT '회원 ID',
    `check_in`     TIMESTAMP NOT NULL COMMENT '체크인',
    `check_out`    TIMESTAMP NOT NULL COMMENT '체크아웃',
    `headcount`    INT       NOT NULL COMMENT '인원',
    `total_charge` INT       NOT NULL COMMENT '총액',
    `is_deleted`   BOOLEAN   NOT NULL DEFAULT FALSE COMMENT '삭제여부',
    `created_at`   TIMESTAMP NOT NULL DEFAULT NOW() COMMENT '생성일시',
    `updated_at`   TIMESTAMP NOT NULL DEFAULT NOW() COMMENT '수정일시',
    PRIMARY KEY (id)
);

ALTER TABLE reservation COMMENT '예약';

ALTER TABLE reservation
    ADD CONSTRAINT FK_reservation_room_id_room_id FOREIGN KEY (room_id)
        REFERENCES room (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE reservation
    ADD CONSTRAINT FK_reservation_member_id_member_id FOREIGN KEY (member_id)
        REFERENCES member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- wish Table Create SQL
CREATE TABLE wish
(
    `id`        BIGINT NOT NULL AUTO_INCREMENT COMMENT '위시리스트 ID',
    `room_id`   BIGINT NOT NULL COMMENT '숙소 ID',
    `member_id` BIGINT NOT NULL COMMENT '회원 ID',
    PRIMARY KEY (id)
);

ALTER TABLE wish COMMENT '위시리스트';

ALTER TABLE wish
    ADD CONSTRAINT FK_wish_room_id_room_id FOREIGN KEY (room_id)
        REFERENCES room (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE wish
    ADD CONSTRAINT FK_wish_member_id_member_id FOREIGN KEY (member_id)
        REFERENCES member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


