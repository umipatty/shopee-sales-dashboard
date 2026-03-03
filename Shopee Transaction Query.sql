SELECT
    no_pesanan,
    nama_produk,
    kota_kabupaten,
    status_pesanan,
    alasan_dibatalkan,
    
    DATE(waktu_pesanan_dibuat) AS order_date,
    DATE_TRUNC('month', waktu_pesanan_dibuat)::date AS order_month,
    EXTRACT(YEAR FROM waktu_pesanan_dibuat) AS order_year,
    
    jumlah AS qty,
    returned_quantity,
    
    total_harga_produk AS gross_sales,
    
    (
        total_harga_produk
        - diskon_dari_penjual
        - voucher_ditanggung_penjual
        - paket_diskon_dari_penjual
    ) AS net_sales,
    
    (
        diskon_dari_penjual
        + voucher_ditanggung_penjual
        + paket_diskon_dari_penjual
    ) AS total_discount

FROM shopee_transaction;