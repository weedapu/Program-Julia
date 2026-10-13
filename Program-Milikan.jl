using Statistics

# DATA PERCOBAAN MILIKAN
Tegangan = [480, 550]
Waktu = [9.212, 6.885]

# HITUNG DATA
URata = mean(Tegangan)
tRata = mean(Waktu)

pembilang = sum((Tegangan .- URata) .* (Waktu .- tRata))
penyebut = sum((Tegangan .- URata).^2)

b = pembilang / penyebut

a = URata - b * tRata

println("Gradien b = ", b)
println("Intersep a = ", a)
println("Persamaan garis:")
println("x = ", a, " + ", b, "t")