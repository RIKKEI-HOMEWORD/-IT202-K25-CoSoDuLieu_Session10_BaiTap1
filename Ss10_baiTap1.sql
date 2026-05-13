-- =====================================================
-- TẠO DATABASE
-- =====================================================
CREATE DATABASE IF NOT EXISTS hospital_management_db;
USE hospital_management_db;

-- =====================================================
-- TẠO BẢNG PATIENTS
-- =====================================================

CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Full_Name VARCHAR(100),
    Age INT,
    Room_Number INT,
    HIV_Status VARCHAR(50),
    Mental_Health_History VARCHAR(255)
);
-- =====================================================
-- CHÈN DỮ LIỆU MẪU
-- =====================================================
INSERT INTO Patients (
    Patient_ID,
    Full_Name,
    Age,
    Room_Number,
    HIV_Status,
    Mental_Health_History
)
VALUES
(1, 'Minh Thu', 30, 101, 'Negative', 'None'),
(2, 'Hồng Vân', 40, 102, 'Positive', 'Anxiety'),
(3, 'Cao Cường', 25, 103, 'Negative', 'None');
-- =====================================================
-- KIỂM TRA DỮ LIỆU GỐC
-- =====================================================
SELECT * FROM Patients;
-- =====================================================
-- TẠO VIEW BẢO MẬT
-- =====================================================
CREATE VIEW Reception_Patient_View AS
SELECT
    Patient_ID,
    Full_Name,
    Age,
    Room_Number
FROM Patients
WHERE Age >= 0
WITH CHECK OPTION;
-- =====================================================
-- TRUY VẤN DỮ LIỆU QUA VIEW
-- =====================================================
SELECT * 
FROM Reception_Patient_View;
-- =====================================================
-- CẬP NHẬT DỮ LIỆU HỢP LỆ
-- =====================================================
-- Cập nhật tuổi bệnh nhân thành 35.
-- =====================================================
UPDATE Reception_Patient_View
SET Age = 35
WHERE Patient_ID = 1;
-- =====================================================
-- KIỂM TRA KẾT QUẢ SAU UPDATE
-- =====================================================
SELECT * 
FROM Reception_Patient_View
WHERE Patient_ID = 1;
-- =====================================================
-- THỬ CẬP NHẬT DỮ LIỆU KHÔNG HỢP LỆ
-- =====================================================
UPDATE Reception_Patient_View
SET Age = -5
WHERE Patient_ID = 2;
-- =====================================================
-- KIỂM TRA LẠI DỮ LIỆU GỐC
-- =====================================================
SELECT * 
FROM Patients;