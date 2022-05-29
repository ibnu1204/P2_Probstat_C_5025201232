# P2_Probstat_C_5025201232
|NRP|Nama|
|--------------|--------------|
|5025201232|Ahmad Ibnu Malik Rahman|

## Soal 1
![1](https://user-images.githubusercontent.com/81419886/170877636-07c0f79e-db28-4bfe-8804-96a3af439739.png)
### 1a
Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

Masukkan data yang ada pada tabel ke sebuah variabel
```
n = 9
Responden = c(seq(1:9))
x = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)
Data = data.frame(Responden, x, y)
```
Cari standar deviasinya
```
diff = Data$y - Data$x
standardev = sd(diff)
standardev
```
![standardev](https://user-images.githubusercontent.com/81419886/170878015-10b7b529-f180-4215-b461-a0bbb9cfd5d2.png)

### 1b
Carilah nilai t (p-value)
Menggunakan fungsi `t.test` untuk mencari nilai t (p-value)
```
t.test(x, y, alternative = "greater", var.equal = FALSE)
```
![pvalue](https://user-images.githubusercontent.com/81419886/170878462-9843bc2c-9544-48aa-907e-4ca2f297d747.png)

### 1c
Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika
dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan
aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada
pengaruh yang signifikan secara statistika dalam hal kadar saturasi
oksigen, sebelum dan sesudah melakukan aktivitas 𝐴”
```
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE)
```
![1c](https://user-images.githubusercontent.com/81419886/170878959-98fc9cea-d076-41f8-8435-5247a75e2d07.png)
Nilai mean dan convidence = 1b, nilai yang berbeda adalah p-value dan df. Sehingga tidak ada pengaruh yang signifikan secara statistika

## Soal 2
### 2a
Apakah Anda setuju dengan klaim tersebut?
`Ya, setuju`

### 2b
Jelaskan maksud dari output yang dihasilkan!
![2b](https://user-images.githubusercontent.com/81419886/170879295-bb8e27e0-a307-4d5c-b58a-93834c635ae0.png)
Nilai n = 100, rata-rata = 23500, dan standar deviasi = 3900. Null hipotesis adalah `H0 : μ = 20000`

### 2c
Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
Kesimpulan yang didapatkan adalah H0 (mobil dikemudikan rata-rata) > 20.000km/tahun

## Soal 3
![3](https://user-images.githubusercontent.com/81419886/170880438-5953c376-7e02-4c69-963a-d4136801a52f.png)
```
n_bdg = 19
n_bl = 27
mu_bdg = 3.64
mu_bl = 2.79
standardev_bdg = 1.67
standardev_bl = 1.32
```

### 3a
H0 dan H1
![3a](https://user-images.githubusercontent.com/81419886/170880215-6d18f767-1543-4df9-bb1c-19ac5ebb1ab9.png)
```
H0 = 9.50
H1 = 10.98
```

### 3b
Hitung Sampel Statistik
```
tsum.test(n.x = n_bdg, mean.x = mean_bdg, s.x = standardev_bdg,
          n.y = n_bl, mean.y = mean_bl, s.y = standardev_bl,
          alternative = "greater", var.equal = TRUE)
```
![3b](https://user-images.githubusercontent.com/81419886/170880370-9dd527c2-a2f5-4369-b421-353960cfa4f1.png)

### 3c
Lakukan Uji Statistik (df =2)
```
plotDist(dist = 't', df = 2)
```
![3c](https://user-images.githubusercontent.com/81419886/170880545-a277505d-f2da-4366-92c9-0562efa5df0f.png)

### 3d
Nilai Kritikal
```
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```
![3d](https://user-images.githubusercontent.com/81419886/170880622-177ee4d2-712b-4b46-9db4-213100614b2d.png)

### 3e
Keputusan
Aksinya adalah: `({a}_{a∈A})` 
Kemungkinan konsekuensi: `({c}_{c∈C})` (tergantung pada keadaan dan tindakan) 
Keputusan dapat dibuat dengan `t.test`

### 3f
Kesimpulan
Dari uji statistik, tidak ada selisih dari rata-rata. Jika dipengaruhi nilai kritikal, akan terjadi perubahan walaupun tidak signifikan

## Soal 4
Mengambil data dari link
```
dataset  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dim(dataset)
head(dataset)
attach(dataset)
```

### 4a
Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

Membuat dataset menajadi group dan bagi menjadi 3 bagian dalam ke 3 group
```
dataset$V1 <- as.factor(dataset$V1)
dataset$V1 = factor(dataset$V1, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih", "Kucing Oren"))

class(dataset$V1)
group1 <- subset(dataset, V1 == "Kucing Oren")
group2 <- subset(dataset, V1 == "Kucing Hitam")
group3 <- subset(dataset, V1 == "Kucing Putih")
```

### 4b
Carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?
```
bartlett.test(Length~V1, data = dataset)
```
Nilai p-value = 0.8054 dan df = 2

### 4c
Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.
```
qqnorm(group1$Length)
qqline(group1$Length)
```
![4c](https://user-images.githubusercontent.com/81419886/170883088-9b95ac5a-1c6b-4ab9-b882-ff3e30742eb1.png)

### 4d
Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?

`Nilai p-value = 0.8054`

### 4e
Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan
```
model1 <- lm(Length~Group, data=dataset)
anova(model1)
TukeyHSD(aov(model1))
```

### 4f
Visualisasikan data dengan ggplot2
```
library(ggplot2)
ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + 
  scale_x_discrete() + xlab("Treatment Group") +  ylab("Length (cm)")
```

## Soal 5
### 5a
Buatlah plot sederhana untuk visualisasi data

Membaca file `GTL.csv` dan melakukan observasi data. Kemudian visualisasikan data dengan simple plot
```
GTL <- read_csv("GTL.csv")
head(GTL)
str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) + 
      facet_grid(.~Glass, labeller = label_both)
```
![5a_1](https://user-images.githubusercontent.com/81419886/170881423-28d91fca-0aa0-4da6-b0ca-4a0842c70619.png)
![5a_2](https://user-images.githubusercontent.com/81419886/170881469-a3da23bd-30c7-4153-91c2-b462b1b281ca.png)

### 5b
Lakukan uji ANOVA dua arah
```
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova_test <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova_test)
```
![5b](https://user-images.githubusercontent.com/81419886/170881704-c2dad7e0-a397-410c-9930-eaaefee668b2.png)

### 5c
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

Gunakan `group_by` dan `summarise` sesuai mean dan standar deviasi yang berlaku
```
data_table <- group_by(GTL, Glass, Temp) %>% summarise(mean = mean(Light), 
            sd = sd(Light)) %>% arrange(desc(mean))
print(data_table)
```
![5c](https://user-images.githubusercontent.com/81419886/170881831-50f76e9c-705a-4f50-bb21-6fd8b6272aec.png)

### 5d
Lakukan uji Tukey

Gunakan fungsi `TukeyHSD` 
```
tukey_test <- TukeyHSD(anova_test)
print(tukey_test)
```
![5d](https://user-images.githubusercontent.com/81419886/170881931-2f02e681-7214-403c-8be8-f4a4889c0e7d.png)

### 5e
Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey
```
tukey_test.cldData <- multcompLetters4(anova_test, tukey_test)
print(tukey_test.cldData)

cld <- as.data.frame.list(tukey_test.cldData$`Glass:Temp_Factor`)
data_table$tukey_test <- cld$Letters
print(data_table)

write.csv("GTL_summary.csv")
```
![5e](https://user-images.githubusercontent.com/81419886/170882011-f9ffb797-3b92-4fe4-9f11-5aeebf28f47c.png)

