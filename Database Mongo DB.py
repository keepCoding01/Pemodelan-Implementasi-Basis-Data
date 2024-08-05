db.pengguna.insert ([
    {"kode" : "231112518", "nama":"Tasya Syafriza", "alamat" : "Jl.Eka Suka","nomor_telepon" : 085765247899,"status_pengguna" :"pelanggan"},
    {"kode" :"231112747", "nama":"M.Dhani Irvansyah", "alamat" : "Jl.Karya Bakti","nomor_telepon" : 081265340291, "status_pengguna" :"pemilik"},
    {"kode" :"231111254", "nama":"Delarosa Butar Butar", "alamat" : "Jl.Tanjung","nomor_telepon" :085287659981, "status_pengguna" :"supir"},
    {"kode" :"231110569", "nama":"Arya Ghuna Faturrahman","alamat" : "Jl.Berastagi","nomor_telepon" : 081254809911,"status_pengguna" : "pelanggan"},
    {"kode" :"231111619", "nama":"Raihan Azhari Lubis","alamat" : "Jl.Pinang","nomor_telepon" : 081267982543, "status_pengguna" :"pelanggan"}
]);

db.pemilik.insert([
    {"kode" : "231112518","NPWP" :"09.123.321.3-407.000"},
    {"kode": "231111254","NPWP" :"09.123.231.1-432.000"},
    {"kode":"231112747","NPWP" :"09.345.543.2-231.000"},
    {"kode":"231110569","NPWP" :"09.456.654.3-333.000"},
    {"kode":"231111619","NPWP" :"09.567.765.4-222.000"}
]);

db.pelanggan.insert([
    {"kode": "231112518","no_KTP" : "127660300041112"},
    {"kode":"231111254","no_KTP" :"123654234543275"},
    {"kode":"231112747","no_KTP" :"234765364589654"},
    {"kode":"231110569","no_KTP" :"986741294856284"},
    {"kode":"231111619","no_KTP" :"572981537924568"}
]);

db.supir.insert([
    {"kode" : "231112518","no_SIM" : "1222-9209-000363"},
    {"kode" :"231111254","no_SIM" : ""},
    {"kode" :"231112747","no_SIM" : "6522-8426-136274"},
    {"kode" :"231110569","no_SIM" : "9847-1847-195738"},
    {"kode" :"231111619","no_SIM" : "7364-9137-146893"}
]);

db.truk.insert([
    {"kode" : "BK2342ABA","kode_pemilik" : "231112518","model": "pickup","lisensi" :"sim b","kapasitas_ton": 2,"status_truk": "dipakai","lokasi" : "Jl.Medan","deskripsi": "aman"},
    {"kode" :"BK432EAA","kode_pemilik" :"231111254","model": "fuso","lisensi" :"sim b","kapasitas_ton":3,"status_truk":"pemeliharaan","lokasi" :"Jl.johor","deskripsi":"bagus"},
    {"kode" :"BK534AWW","kode_pemilik" :"231112747","model": "hino","lisensi" :"sim b","kapasitas_ton":4,"status_truk":"tersedia","lokasi" :"Jl.Tanjung","deskripsi":"aman"},
    {"kode" :"BK654EWW","kode_pemilik" :"231110569","model": "tronton","lisensi" :"sim b","kapasitas_ton":7,"status_truk":"tersedia","lokasi" :"Jl.perbaungan","deskripsi":"terpercaya"},
    {"kode" :"BK769AJR","kode_pemilik" :"231111619","model": "wingbox","lisensi" :"sim b","kapasitas_ton":9,"status_truk":"tersedia","lokasi" :"Jl.pakam","deskripsi":"mantap"}
]);

db.booking.insert([
    {"kode": "A11045428","kode_pelanggan": "231112518","kode_truk": "BK2342ABA","kode_supir": "231112518","tanggal_booking": new Date("2024-02-12T00:00:00Z"),"tanggal_angkut": new Date("2024-02-14T00:00:00Z"),"status_booking": "pending"},
    {"kode":"B73648290","kode_pelanggan":"231111254","kode_truk":"BK432EAA","kode_supir":"231111254","tanggal_booking": new Date("2024-03-01T00:00:00Z"),"tanggal_angkut":new Date("2024-03-04T00:00:00Z"),"status_booking": "proses"},
    {"kode":"C39485726","kode_pelanggan":"231112747","kode_truk":"BK534AWW","kode_supir":"231112747","tanggal_booking":new Date("2024-10-20T00:00:00Z"),"tanggal_angkut":new Date("2024-10-30T00:00:00Z"),"status_booking": "selesai"},
    {"kode":"D76859432","kode_pelanggan":"231110569","kode_truk":"BK654EWW","kode_supir":"231110569","tanggal_booking":new Date("2024-12-15T00:00:00Z"),"tanggal_angkut":new Date("2024-12-20T00:00:00Z"),"status_booking": "batal"},
    {"kode":"E75849675","kode_pelanggan":"231111619","kode_truk":"BK769AJR","kode_supir":"231111619","tanggal_booking":new Date("2024-04-07T00:00:00Z"),"tanggal_angkut":new Date("2024-04-20T00:00:00Z"),"status_booking": "proses"}
]);

db.rute.insert([
    {"kode": "JKT488594","kode_booking": "A11045428","lokasi_awal": "Medan","lokasi_akhir": "Jakarta","jarak_km": 10,"estimasi_waktu_menit": new Date("2024-04-07T13:45:39Z")},
    {"kode":"MDN546372","kode_booking":"B73648290","lokasi_awal":"Jakarta","lokasi_akhir":"Medan","jarak_km":12,"estimasi_waktu_menit":new Date("2024-04-07T15:31:12Z")},
    {"kode":"BDG564738","kode_booking":"C39485726","lokasi_awal":"Bali","lokasi_akhir":"Bandung","jarak_km":14,"estimasi_waktu_menit":new Date("2024-04-07T01:12:32Z")},
    {"kode":"SBY392093","kode_booking":"D76859432","lokasi_awal":"Papua","lokasi_akhir":"Surabaya","jarak_km":16,"estimasi_waktu_menit":new Date("2024-04-07T22:45:23Z")},
    {"kode":"SMG754839","kode_booking":"E75849675","lokasi_awal":"Medan","lokasi_akhir":"Semarang","jarak_km":18,"estimasi_waktu_menit":new Date("2024-04-07T15:25:56Z")}
]);



db.pembayaran.insert([
    {"kode": "039485279","kode_booking": "A11045428","jumlah":"2","tanggal_pembayaran":new Date("2024-02-12T00:00:00Z") ,"metode": "kartu kredit"},
    {"kode":"758493657","kode_booking":"B73648290","jumlah":"1","tanggal_pembayaran":new Date("2024-03-01T00:00:00Z"),"metode": "tunai"},
    {"kode":"574839205","kode_booking":"C39485726","jumlah":"2","tanggal_pembayaran":new Date("2024-10-20T00:00:00Z"),"metode": "Qris"},
    {"kode":"324156245","kode_booking":"D76859432","jumlah":"1","tanggal_pembayaran":new Date("2024-12-15T00:00:00Z"),"metode": "tunai"},
    {"kode":"980786756","kode_booking":"E75849675","jumlah":"1","tanggal_pembayaran":new Date("2024-04-07T00:00:00Z"),"metode": "kartu kredit"}
]);

db.pemeliharaan_truk.insert([
    {"kode": "SIBIRU123","kode_truk": "BK2342ABA","tanggal":new Date("2024-04-23T00:00:00Z"), "deskripsi": "Ban bocor","biaya_juta": 5},
    {"kode":"SIHIJAU56","kode_truk": "BK432EAA","tanggal":new Date("2024-06-23T00:00:00Z"),"deskripsi": "Ganti oli","biaya_juta":6},
    {"kode":"SIMERAH52","kode_truk": "BK534AWW","tanggal":new Date("2024-09-21T00:00:00Z"),"deskripsi": "Servis","biaya_juta":8},
    {"kode":"SIPUTIH07","kode_truk": "BK654EWW","tanggal":new Date("2024-12-09T00:00:00Z"),"deskripsi": "ganti sepatu rem","biaya_juta":3},
    {"kode":"SIHITAM12","kode_truk": "BK769AJR","tanggal":new Date("2024-06-25T00:00:00Z"),"deskripsi": "Radiator bocor","biaya_juta":9}
]);

db.review.insert([
    {"kode": "574389275","kode_booking": "A11045428","kode_pelanggan": "231112518","nilai_rating": 5,"komentar": "Pelayanannya bagus","tanggal_review":new Date("2024-02-15T00:00:00Z") },
    {"kode":"152653647","kode_booking":"B73648290","kode_pelanggan":"231111254","nilai_rating":4,"komentar":"barang cepat sampai","tanggal_review":new Date("2024-03-05T00:00:00Z")},
    {"kode":"758690367","kode_booking":"C39485726","kode_pelanggan":"231112747","nilai_rating":5,"komentar":"terpercaya","tanggal_review":new Date("2024-10-31T00:00:00Z")},
    {"kode":"275648390","kode_booking":"D76859432","kode_pelanggan":"231110569","nilai_rating":3,"komentar":"lambat","tanggal_review":new Date("2024-12-21T00:00:00Z")},
    {"kode":"678308475","kode_booking":"E75849675","kode_pelanggan":"231111619","nilai_rating":2,"komentar":"barang rusak","tanggal_review":new Date("2024-04-11T00:00:00Z")}
]);






