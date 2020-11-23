DROP DATABASE IF EXISTS thuc_tap;
CREATE DATABASE thuc_tap;
USE thuc_tap;
DROP TABLE IF EXISTS giang_vien;
CREATE TABLE giang_vien(
	ma_gv			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ho_ten			VARCHAR(100) NOT NULL,
    luong			INT UNSIGNED
);
DROP TABLE IF EXISTS sinh_vien;
CREATE TABLE sinh_vien(
	ma_sv			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ho_ten			VARCHAR(100) NOT NULL,
    nam_sinh		YEAR,
    que_quan		VARCHAR(200)
);
DROP TABLE IF EXISTS de_tai;
CREATE TABLE de_tai(
	ma_dt 			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ten_dt			VARCHAR(100),
    kinh_phi		INT UNSIGNED,
    noi_thuc_tap	VARCHAR(100)
);
DROP TABLE IF EXISTS huong_dan;
CREATE TABLE huong_dan(
	id				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ma_sv			SMALLINT UNSIGNED,
    ma_dt			SMALLINT UNSIGNED,
    ma_gv			TINYINT UNSIGNED,
    ket_qua			VARCHAR (100),
    FOREIGN KEY (ma_sv) REFERENCES sinh_vien(ma_sv),
	FOREIGN KEY (ma_dt) REFERENCES de_tai(ma_dt),
	FOREIGN KEY (ma_gv) REFERENCES giang_vien(ma_gv) 
    );
    INSERT INTO giang_vien 	( ho_ten		,	luong)
    VALUES					('Nguyen_Van_A'	,	100),
							('Nguyen_Van_B'	,	200),
                            ('Nguyen_Van_C'	,	150);
	INSERT INTO sinh_vien	(ho_ten			,		nam_sinh	,		que_quan)
    VALUES					('Tran_Tuan_Manh'	,	'1995',		'Nam_Dinh'),
							('Nguyen_Thuy_Quynh',	'1998',		'Ha_Noi'),
                            ('Nguyen_Trung_Hieu',	'1994',		'Ha_Noi'),
                            ('Nguyen_Trong_Hieu',	'1992',		'Binh_Duong');
	INSERT INTO de_tai		(ten_dt		,			kinh_phi	,		noi_thuc_tap)
	VALUES					('A'		,				300		,		'Ca_Mau'),
							('CONG NGHE SINH HOC'	,	400		,		'Da_Nang'),
                            ('C'		,				10000	,		'Ha_Noi');
	INSERT INTO huong_dan	(ma_sv,	ma_dt, ma_gv, ket_qua)
	VALUES					(1	,	2	,	3	, 'KHA'),
							(2	,	3	,	1	,'GIOI'),
                            (3	,	1	,	2	,'XUAT_SAC');
                            
	-- Q2:
    -- a) lấy ra tât cả sinh viên chưa có đề tài hướng dẫn
    SELECT *
    FROM sinh_vien LEFT JOIN huong_dan USING (ma_sv)
 	WHERE ma_dt IS NULL;
    -- b) lấy ra số SV làm đề tài "CONG NGHE SINH HOC"
    SELECT sv.ho_ten, sv.que_quan, sv.nam_sinh,COUNT(hd.ma_dt)AS so_luong
    FROM huong_dan hd	JOIN sinh_vien sv USING (ma_sv)
						JOIN de_tai dt USING (ma_dt) 
	WHERE dt.ten_dt = 'CONG NGHE SINH HOC';
     -- Q3:
	DROP VIEW IF EXISTS sinh_vien_info;
	CREATE OR REPLACE VIEW sinh_vien_info AS
	SELECT sv.ma_sv,sv.ho_ten,dt.ten_dt 
	FROM sinh_vien sv 
    LEFT JOIN huong_dan hd ON sv.ma_sv = hd.ma_sv
    LEFT JOIN de_tai dt ON hd.ma_dt = dt.ma_dt;
    
  
	SELECT *FROM sinh_vien_info;
	UPDATE sinh_vien_info
    SET ten_dt = 'Chua co'
    WHERE ten_dt IS NULL;
     SELECT *FROM sinh_vien_info;
	-- Q4:
    DROP TRIGGER IF EXISTS sinh_vien_insert;
    DELIMITER $$
    CREATE TRIGGER sinh_vien_insert
	BEFORE INSERT ON sinh_vien
    FOR EACH ROW
    BEGIN
		IF YEAR(nam_sinh) <= 1900 THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'nam_sinh_phai_lon_hon_1900';
		END IF;
	END $$
    DELIMITER ;
    INSERT INTO sinh_vien	(ho_ten			,		nam_sinh	,		que_quan)
    VALUES					('Tran_Tuan_Manh'	,	'1900',		'Nam_Dinh');
    
    -- Q5:
    DROP TRIGGER IF EXISTS before_delete_sinh_vien
    DELIMITER $$
    CREATE TRIGGER before_delete_sinh_vien
    BEFORE DELETE ON sinh_vien
    FOR EACH ROW
    BEGIN
    DECLARE v_ma_sv SMALLINT UNSIGNED;
    SELECT ma_sv INTO v_ma_sv
    FROM sinh_vien
    WHERE ma_sv = OLD.ma_sv;
    UPDATE huong_dan SET ma_sv = NULL WHERE ma_sv = v_ma_sv  ;
    UPDATE huong_dan SET ma_gv = NULL WHERE ma_sv = v_ma_sv;
    UPDATE huong_dan SET ket_qua = NULL WHERE ma_sv = v_ma_sv;
    END$$
    DELIMITER ;
    DELETE FROM sinh_vien
    WHERE ho_ten = 'Nguyen_Thuy_Quynh';
    SELECT *FROM huong_dan ;
    
    