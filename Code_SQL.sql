use Map_Pacific_Singapore;

-- 1. Tìm số tiền đầu tư vào mỗi tỉnh trong năm và tỉnh nào được đầu tư nhiều nhất
-- Số tiền đầu tư vào mỗi tỉnh trong năm
SELECT Tỉnh, Năm, SUM(`Đầu tư`) AS Tổng_Đầu_Tư
FROM dau_tu
GROUP BY Tỉnh, Năm;

-- Tỉnh nào được đầu tư nhiều nhất trong năm
SELECT Tỉnh, Năm, SUM(`Đầu tư`) AS Tổng_Đầu_Tư
FROM dau_tu
GROUP BY Tỉnh, Năm
ORDER BY Tổng_Đầu_Tư DESC
LIMIT 1;

-- 2. Tìm Doanh thu sinh ra từ mỗi tỉnh trong năm
SELECT Tỉnh, Năm, SUM(`Doanh thu`) AS Tổng_Doanh_Thu
FROM doanh_thu
GROUP BY Tỉnh, Năm;

-- 3. Tìm số ROI của mỗi tỉnh theo từng tháng, năm
SELECT dt.Tỉnh, dt.Năm, dt.Tháng,
       SUM(dt.`Đầu tư`) AS Tổng_Đầu_Tư,
       COALESCE(SUM(d.`Doanh thu`), 0) AS Tổng_Doanh_Thu,
       (COALESCE(SUM(d.`Doanh thu`), 0) - SUM(dt.`Đầu tư`)) / NULLIF(SUM(dt.`Đầu tư`), 0) AS ROI
FROM dau_tu dt
LEFT JOIN doanh_thu d
ON dt.Tỉnh = d.Tỉnh AND dt.Năm = d.Năm AND dt.Tháng = d.Tháng
GROUP BY dt.Tỉnh, dt.Năm, dt.Tháng;

-- 4. Tìm số tiền đầu tư vào mỗi Khách hàng cấp 1 và doanh thu được tạo ra trong năm
SELECT dt.`Khách Hàng C1`, dt.Năm,
       SUM(dt.`Đầu tư`) AS Tổng_Đầu_Tư,
       COALESCE(SUM(d.`Doanh thu`), 0) AS Tổng_Doanh_Thu
FROM dau_tu dt
LEFT JOIN doanh_thu d
ON dt.`Khách Hàng C1` = d.`Khách hàng C1` AND dt.Năm = d.Năm
GROUP BY dt.`Khách Hàng C1`, dt.Năm; 


-- 5. Tìm số lượng nông dân trong hệ thống của mỗi Khách hàng cấp 2 và khách hàng nào có số nông dân cao nhất
-- Số lượng nông dân theo từng Khách hàng C2
SELECT `Khách hàng C2`, SUM(`SL Nông Dân`) AS Tổng_SL_Nong_Dan
FROM dau_tu
GROUP BY `Khách hàng C2`;

-- Khách hàng C2 nào có số nông dân cao nhất
SELECT `Khách hàng C2`, SUM(`SL Nông Dân`) AS Tổng_SL_Nong_Dan
FROM dau_tu
GROUP BY `Khách hàng C2`
ORDER BY Tổng_SL_Nong_Dan DESC
LIMIT 1;

-- 6. Có bao nhiêu khách hàng mà công ty đầu tư nhưng không tạo ra doanh thu trong năm?
SELECT COUNT(DISTINCT dt.`Khách hàng C2`) AS Khach_Hang_Khong_Doanh_Thu
FROM dau_tu dt
LEFT JOIN doanh_thu d
ON dt.`Khách hàng C2` = d.`Khách hàng C2` AND dt.Năm = d.Năm
WHERE d.`Doanh thu` IS NULL;




