-- E-TİCARET SATIŞ ANALİZİ VERİTABANI
-- Proje 2: E-Ticaret Satış Analizi

-- =============================================
-- 1. MÜŞTERİLER TABLOSU
-- =============================================
CREATE TABLE Musteriler (
    musteri_id INT PRIMARY KEY AUTO_INCREMENT,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    sehir VARCHAR(50),
    ulke VARCHAR(50),
    kayit_tarihi DATE
);

-- =============================================
-- 2. ÜRÜNLER TABLOSU
-- =============================================
CREATE TABLE Urunler (
    urun_id INT PRIMARY KEY AUTO_INCREMENT,
    urun_adi VARCHAR(100) NOT NULL,
    kategori_id INT,
    alis_fiyati DECIMAL(10,2),
    satis_fiyati DECIMAL(10,2),
    stok INT DEFAULT 0
);

-- =============================================
-- 3. SİPARİŞLER TABLOSU
-- =============================================
CREATE TABLE Siparisler (
    siparis_id INT PRIMARY KEY AUTO_INCREMENT,
    musteri_id INT,
    siparis_tarihi DATE NOT NULL,
    kargo_firmasi VARCHAR(50),
    durum VARCHAR(20),
    FOREIGN KEY (musteri_id) REFERENCES Musteriler(musteri_id)
);

-- =============================================
-- 4. SİPARİŞ DETAY TABLOSU
-- =============================================
CREATE TABLE Siparis_Detay (
    detay_id INT PRIMARY KEY AUTO_INCREMENT,
    siparis_id INT,
    urun_id INT,
    miktar INT NOT NULL,
    birim_fiyat DECIMAL(10,2) NOT NULL,
    indirim DECIMAL(5,2) DEFAULT 0,
    FOREIGN KEY (siparis_id) REFERENCES Siparisler(siparis_id),
    FOREIGN KEY (urun_id) REFERENCES Urunler(urun_id)
);

-- =============================================
-- ÖRNEK VERİLER - MÜŞTERİLER
-- =============================================
INSERT INTO Musteriler (ad, soyad, email, sehir, ulke, kayit_tarihi) VALUES
('Ahmet', 'Yılmaz', 'ahmet.yilmaz@email.com', 'İstanbul', 'Türkiye', '2023-01-15'),
('Ayşe', 'Demir', 'ayse.demir@email.com', 'Ankara', 'Türkiye', '2023-02-20'),
('Mehmet', 'Kaya', 'mehmet.kaya@email.com', 'İzmir', 'Türkiye', '2023-03-10'),
('Fatma', 'Şahin', 'fatma.sahin@email.com', 'Bursa', 'Türkiye', '2023-04-05'),
('Ali', 'Çelik', 'ali.celik@email.com', 'Antalya', 'Türkiye', '2023-05-12'),
('Zeynep', 'Arslan', 'zeynep.arslan@email.com', 'Adana', 'Türkiye', '2023-06-18'),
('Mustafa', 'Öztürk', 'mustafa.ozturk@email.com', 'Konya', 'Türkiye', '2023-07-22'),
('Elif', 'Yıldız', 'elif.yildiz@email.com', 'Gaziantep', 'Türkiye', '2023-08-30'),
('Emre', 'Aydın', 'emre.aydin@email.com', 'İstanbul', 'Türkiye', '2023-09-14'),
('Selin', 'Kurt', 'selin.kurt@email.com', 'Ankara', 'Türkiye', '2023-10-05');

-- =============================================
-- ÖRNEK VERİLER - ÜRÜNLER
-- =============================================
INSERT INTO Urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
-- Elektronik (kategori_id: 1)
('iPhone 15 Pro', 1, 35000.00, 45000.00, 50),
('Samsung Galaxy S24', 1, 28000.00, 38000.00, 45),
('MacBook Air M2', 1, 42000.00, 55000.00, 30),
('iPad Pro', 1, 25000.00, 32000.00, 40),
('AirPods Pro', 1, 6000.00, 8500.00, 100),

-- Giyim (kategori_id: 2)
('Nike Air Max', 2, 2500.00, 4000.00, 80),
('Adidas Tişört', 2, 300.00, 600.00, 150),
('Levi\'s Kot Pantolon', 2, 800.00, 1500.00, 70),
('Zara Ceket', 2, 1200.00, 2200.00, 60),
('H&M Elbise', 2, 400.00, 800.00, 90),

-- Ev & Yaşam (kategori_id: 3)
('Dyson Süpürge', 3, 8000.00, 12000.00, 25),
('Tefal Tencere Seti', 3, 1500.00, 2500.00, 40),
('Philips Kahve Makinesi', 3, 2000.00, 3500.00, 35),
('Xiaomi Robot Süpürge', 3, 5000.00, 7500.00, 20),
('Karaca Çay Seti', 3, 500.00, 1000.00, 100),

-- Kitap & Kırtasiye (kategori_id: 4)
('Python Programlama Kitabı', 4, 150.00, 300.00, 200),
('Moleskine Defter', 4, 200.00, 400.00, 150),
('Faber Castell Kalem Seti', 4, 100.00, 250.00, 180),
('İnce Memed Kitabı', 4, 80.00, 150.00, 120),
('A4 Kağıt Paketi', 4, 50.00, 100.00, 300);

-- =============================================
-- ÖRNEK VERİLER - SİPARİŞLER
-- =============================================
INSERT INTO Siparisler (musteri_id, siparis_tarihi, kargo_firmasi, durum) VALUES
(1, '2024-01-15', 'Aras Kargo', 'Teslim Edildi'),
(2, '2024-01-18', 'Yurtiçi Kargo', 'Teslim Edildi'),
(3, '2024-02-05', 'MNG Kargo', 'Teslim Edildi'),
(1, '2024-02-12', 'Aras Kargo', 'Teslim Edildi'),
(4, '2024-02-20', 'PTT Kargo', 'Teslim Edildi'),
(5, '2024-03-01', 'Yurtiçi Kargo', 'Teslim Edildi'),
(2, '2024-03-10', 'MNG Kargo', 'Teslim Edildi'),
(6, '2024-03-15', 'Aras Kargo', 'Teslim Edildi'),
(7, '2024-04-02', 'PTT Kargo', 'Teslim Edildi'),
(3, '2024-04-10', 'Yurtiçi Kargo', 'Teslim Edildi'),
(8, '2024-04-18', 'Aras Kargo', 'Teslim Edildi'),
(9, '2024-05-05', 'MNG Kargo', 'Teslim Edildi'),
(4, '2024-05-12', 'Yurtiçi Kargo', 'Teslim Edildi'),
(10, '2024-05-20', 'PTT Kargo', 'Teslim Edildi'),
(5, '2024-06-01', 'Aras Kargo', 'Teslim Edildi'),
(1, '2024-06-10', 'MNG Kargo', 'Teslim Edildi'),
(6, '2024-06-18', 'Yurtiçi Kargo', 'Teslim Edildi'),
(7, '2024-07-02', 'Aras Kargo', 'Teslim Edildi'),
(2, '2024-07-12', 'PTT Kargo', 'Kargoda'),
(8, '2024-07-20', 'MNG Kargo', 'Hazırlanıyor');

-- =============================================
-- ÖRNEK VERİLER - SİPARİŞ DETAY
-- =============================================
INSERT INTO Siparis_Detay (siparis_id, urun_id, miktar, birim_fiyat, indirim) VALUES
-- Sipariş 1
(1, 1, 1, 45000.00, 5.00),
(1, 5, 1, 8500.00, 0.00),

-- Sipariş 2
(2, 3, 1, 55000.00, 10.00),

-- Sipariş 3
(3, 6, 2, 4000.00, 0.00),
(3, 7, 3, 600.00, 0.00),

-- Sipariş 4
(4, 11, 1, 12000.00, 15.00),

-- Sipariş 5
(5, 8, 1, 1500.00, 0.00),
(5, 9, 1, 2200.00, 5.00),

-- Sipariş 6
(6, 2, 1, 38000.00, 0.00),
(6, 5, 2, 8500.00, 10.00),

-- Sipariş 7
(7, 13, 1, 3500.00, 0.00),
(7, 15, 2, 1000.00, 0.00),

-- Sipariş 8
(8, 4, 1, 32000.00, 5.00),

-- Sipariş 9
(9, 16, 5, 300.00, 0.00),
(9, 17, 3, 400.00, 0.00),

-- Sipariş 10
(10, 6, 1, 4000.00, 0.00),
(10, 10, 2, 800.00, 0.00),

-- Sipariş 11
(11, 14, 1, 7500.00, 10.00),

-- Sipariş 12
(12, 1, 1, 45000.00, 0.00),
(12, 5, 1, 8500.00, 0.00),

-- Sipariş 13
(13, 7, 4, 600.00, 5.00),
(13, 18, 2, 250.00, 0.00),

-- Sipariş 14
(14, 12, 1, 2500.00, 0.00),

-- Sipariş 15
(15, 3, 1, 55000.00, 15.00),

-- Sipariş 16
(16, 19, 10, 150.00, 0.00),
(16, 20, 5, 100.00, 0.00),

-- Sipariş 17
(17, 6, 2, 4000.00, 10.00),

-- Sipariş 18
(18, 2, 1, 38000.00, 5.00),

-- Sipariş 19
(19, 11, 1, 12000.00, 0.00),

-- Sipariş 20
(20, 8, 2, 1500.00, 0.00);

-- =============================================
-- ANALİZ İÇİN KULLANIŞLI VIEW'LAR
-- =============================================

-- Satış Özeti View
CREATE VIEW Satis_Ozeti AS
SELECT 
    s.siparis_id,
    s.siparis_tarihi,
    m.ad,
    m.soyad,
    m.sehir,
    u.urun_adi,
    u.kategori_id,
    sd.miktar,
    sd.birim_fiyat,
    sd.indirim,
    (sd.miktar * sd.birim_fiyat * (1 - sd.indirim/100)) AS toplam_tutar,
    (sd.miktar * sd.birim_fiyat * (1 - sd.indirim/100)) - (sd.miktar * u.alis_fiyati) AS kar
FROM Siparisler s
JOIN Musteriler m ON s.musteri_id = m.musteri_id
JOIN Siparis_Detay sd ON s.siparis_id = sd.siparis_id
JOIN Urunler u ON sd.urun_id = u.urun_id;

-- Kategori Bazlı Satış View
CREATE VIEW Kategori_Satis AS
SELECT 
    u.kategori_id,
    CASE u.kategori_id
        WHEN 1 THEN 'Elektronik'
        WHEN 2 THEN 'Giyim'
        WHEN 3 THEN 'Ev & Yaşam'
        WHEN 4 THEN 'Kitap & Kırtasiye'
    END AS kategori_adi,
    COUNT(DISTINCT s.siparis_id) AS siparis_sayisi,
    SUM(sd.miktar) AS toplam_adet,
    SUM(sd.miktar * sd.birim_fiyat * (1 - sd.indirim/100)) AS toplam_ciro,
    SUM((sd.miktar * sd.birim_fiyat * (1 - sd.indirim/100)) - (sd.miktar * u.alis_fiyati)) AS toplam_kar
FROM Urunler u
JOIN Siparis_Detay sd ON u.urun_id = sd.urun_id
JOIN Siparisler s ON sd.siparis_id = s.siparis_id
GROUP BY u.kategori_id;

-- Müşteri Analizi View
CREATE VIEW Musteri_Analizi AS
SELECT 
    m.musteri_id,
    CONCAT(m.ad, ' ', m.soyad) AS musteri_adi,
    m.sehir,
    COUNT(DISTINCT s.siparis_id) AS siparis_sayisi,
    SUM(sd.miktar * sd.birim_fiyat * (1 - sd.indirim/100)) AS toplam_harcama,
    AVG(sd.miktar * sd.birim_fiyat * (1 - sd.indirim/100)) AS ortalama_sepet_tutari
FROM Musteriler m
LEFT JOIN Siparisler s ON m.musteri_id = s.musteri_id
LEFT JOIN Siparis_Detay sd ON s.siparis_id = sd.siparis_id
GROUP BY m.musteri_id, m.ad, m.soyad, m.sehir;