# 📊 E-Ticaret Satış Analizi Projesi

![Dashboard Önizleme](E%20ticaret%20satış%20analizi.png)

Bu proje, bir e-ticaret işletmesinin satış verilerini uçtan uca analiz etmek amacıyla geliştirilmiştir. Veri hazırlığı aşamasında **SQL** kullanılmış, görselleştirme ve derinlemesine analiz aşamalarında ise **Power BI** tercih edilmiştir.

## 🚀 Proje Kapsamı
Proje, ham verilerin işlenmesinden başlayarak işletmenin temel performans göstergelerini (KPI) ve satış trendlerini görselleştiren etkileşimli bir dashboard sunar.

### 🛠️ Teknik Süreç
* **Veri Hazırlığı (SQL):** Ham veriler PostgreSQL üzerinde temizlendi, tablolar arası ilişkiler kuruldu ve analiz için gerekli görünümler (views) oluşturuldu.
* **Veri Modelleme:** Power BI üzerinde "Star Schema" mantığına uygun bir veri modeli inşa edildi.
* **DAX Analizleri:** Ortalama sepet tutarı, kâr marjı ve ürün başına satış gibi metrikler DAX formülleri ile hesaplandı.

## 📈 Dashboard İçeriği
Dashboard üzerinde aşağıdaki analizlere anlık olarak ulaşılabilmektedir:
* **Temel Metrikler (KPI):** Toplam Ciro, Toplam Kâr, Kâr Marjı % ve Sipariş Sayısı.
* **Satış Trendi:** Zaman çizelgesi üzerinde sipariş tarihlerine göre ciro değişimi.
* **Ürün ve Kategori Analizi:** En çok satan ilk 10 ürün ve kategorilerin kârlılık dağılımı.
* **Sepet Analizi:** Ortalama sepet tutarı ve sepet başına düşen ürün sayısı.
* **Coğrafi Dağılım:** Şehir bazlı satış yoğunluğunu gösteren etkileşimli harita.

## 📂 Dosya Yapısı
* `eticaretsatisanalizi.sql`: Veri tabanı şablonu ve hazırlık sorguları.
* `E_Ticaret_Satis_Analizi.pbix`: Power BI dashboard dosyası.
* `E Ticaret Satış Analizi .png`: Dashboard'un önizleme görseli.
