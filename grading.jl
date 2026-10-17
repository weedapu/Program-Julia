using Statistics
using XLSX
using DataFrames

# PROGRAM DAN IDENTITAS
println("=================================")
println("PROGRAM GRADING")
println("=================================")
println("Nama: MUHAMMMAD GOTZONE DAVU QUINN")
println("NIM: 1306625022")

# ALGORITMA
file = raw"C:\Users\user\Desktop\MyJulia\DataNilai.xlsx"

df = DataFrame(XLSX.readtable(file, "Data-nilai"))

println("Ukuran data: ", size(df))
println("Nama kolom: ", names(df))
println(eltype.(eachcol(df)))

rename!(df, [
    "Mahasiswa",
    "Gender",
    "NilaiLain",
    "NilaiUTS",
    "NilaiUAS"
])

function tentukan_grade(nilai)
    if ismissing(nilai)
        return missing
    elseif nilai < 0 || nilai > 100
        return "Nilai tidak valid"
    elseif nilai >= 86
        return "A"
    elseif nilai >= 81
        return "A-"
    elseif nilai >= 76
        return "B+"
    elseif nilai >= 71
        return "B"
    elseif nilai >= 66
        return "B-"
    elseif nilai >= 61
        return "C+"
    elseif nilai >= 56
        return "C"
    else
        return "TL"
    end
end

df.NilaiAkhir =
    0.30 .* df.NilaiLain .+
    0.35 .* df.NilaiUTS .+
    0.35 .* df.NilaiUAS


df.Grade = tentukan_grade.(df.NilaiAkhir)
println(df)

jumlah_grade = combine(
    groupby(df, :Grade),
    nrow => :JumlahMahasiswa
)
println(jumlah_grade)
println("Selesai")