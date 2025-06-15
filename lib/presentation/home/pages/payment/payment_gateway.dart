import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/models/dtos/stores/properties_dto.dart';
import 'package:propedia/presentation/home/widgets/services/notification_service.dart';

class PaymentGateway extends StatefulWidget {
  final List<PropertyDto> selectedItems;

  const PaymentGateway({super.key, required this.selectedItems});

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  bool _paymentSuccess = false;
  String? _selectedPaymentMethod; // State untuk metode pembayaran utama yang dipilih
  String? _selectedSubPaymentMethod; // State untuk metode pembayaran spesifik (contoh: GoPay, BCA)

  // Daftar E-Wallet
  final List<String> eWallets = [
    'GoPay',
    'OVO',
    'DANA',
    'ShopeePay',
    'LinkAja',
    'iSaku',
    'Blu BCA',
    'Jenius',
  ];

  // Daftar Bank Transfer (minimal 25 bank)
  final List<String> bankTransfers = [
    'BCA Virtual Account',
    'Mandiri Virtual Account',
    'BRI Virtual Account',
    'BNI Virtual Account',
    'CIMB Niaga Virtual Account',
    'PermataBank Virtual Account',
    'Danamon Virtual Account',
    'OCBC NISP Virtual Account',
    'BTN Virtual Account',
    'BTPN Virtual Account',
    'PaninBank Virtual Account',
    'Maybank Virtual Account',
    'Bank Mega Virtual Account',
    'Bank Syariah Indonesia Virtual Account',
    'Bank Nagari Virtual Account',
    'Bank Jabar Banten (BJB) Virtual Account',
    'Bank Jateng Virtual Account',
    'Bank Jatim Virtual Account',
    'Bank BPD Bali Virtual Account',
    'Bank Sulselbar Virtual Account',
    'Bank Sumut Virtual Account',
    'Bank Lampung Virtual Account',
    'Bank Kalsel Virtual Account',
    'Bank Kalteng Virtual Account',
    'Bank Kaltim Virtual Account',
    'Bank NTB Syariah Virtual Account',
    'Bank Papua Virtual Account',
    'Bank Riau Kepri Virtual Account',
    'Bank Sultra Virtual Account',
    'Bank Maluku Malut Virtual Account',
  ];


  String formatWithDot(int? number) {
    if (number == null) return '0';
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  int get subtotal => widget.selectedItems.fold<int>(0, (sum, item) => sum + (item.harga ?? 0));
  int _discount = 0; // Placeholder untuk diskon, bisa disesuaikan nanti
  int get total => subtotal - _discount;

  void _handlePayment() {
    if (_selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mohon pilih metode pembayaran terlebih dahulu.")),
      );
      return;
    }

    if (_selectedPaymentMethod == 'E-Wallet' && _selectedSubPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mohon pilih jenis E-Wallet.")),
      );
      return;
    }

    if (_selectedPaymentMethod == 'Bank Transfer' && _selectedSubPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mohon pilih Bank untuk Transfer.")),
      );
      return;
    }

    // Simulasi proses pembayaran
    Future.delayed(Duration(seconds: 2), () {
      setState(() => _paymentSuccess = true);

      NotificationService.showNotification(
        title: 'Pembayaran Berhasil',
        body: 'Properti senilai Rp ${formatWithDot(total)} telah dibeli melalui $_selectedPaymentMethod${_selectedSubPaymentMethod != null ? ' ($_selectedSubPaymentMethod)' : ''}.',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Memastikan latar belakang Scaffold putih
      appBar: AppBar(
        title: Text(_paymentSuccess ? 'Pembayaran Berhasil' : 'Pembayaran'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _paymentSuccess
          ? _buildSuccessContent()
          : Column( // Menggunakan Column untuk menumpuk bagian-bagian form pembayaran
              children: [
                Expanded(
                  child: SingleChildScrollView( // Agar konten bisa discroll jika terlalu panjang
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDeliveryAddress(), // Bagian alamat pengiriman baru
                        SizedBox(height: 20.h), // Spasi setelah alamat
                        _buildOrderSummary(), // Bagian ringkasan pesanan
                        SizedBox(height: 20.h),
                        _buildPaymentDetails(), // Bagian rincian pembayaran
                        SizedBox(height: 20.h),
                        _buildPaymentMethods(), // Bagian metode pembayaran
                      ],
                    ),
                  ),
                ),
                _buildTotalAndPayButton(), // Bagian total dan tombol bayar (fixed di bawah)
              ],
            ),
    );
  }

  Widget _buildDeliveryAddress() {
    // Mengambil alamat dari item pertama, atau placeholder jika kosong
    final PropertyDto? firstItem = widget.selectedItems.isNotEmpty ? widget.selectedItems.first : null;
    final String fullAddress = firstItem != null
        ? '${firstItem.kelurahan}, ${firstItem.kecamatan}, ${firstItem.kabupaten}, ${firstItem.provinsi}'
        : 'Alamat tidak tersedia. Pilih properti di keranjang.';

    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero, // Tidak ada margin tambahan
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      elevation: 1,
      child: InkWell( // Membuat Card bisa diklik
        onTap: () {
          // TODO: Implementasi logika untuk mengubah alamat, misal navigasi ke halaman pemilihan alamat
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Fitur ganti alamat belum diimplementasikan."))
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded( // Menggunakan Expanded agar teks alamat tidak melebihi batas
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.grey.shade600, size: 18.w),
                        SizedBox(width: 8.w),
                        Text(
                          'Delivery Address',
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      fullAddress,
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                      maxLines: 2, // Batasi jumlah baris
                      overflow: TextOverflow.ellipsis, // Tambahkan ellipsis jika teks terlalu panjang
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey.shade600, size: 16.w), // Ikon panah
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detail Properti yang Dibeli',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.selectedItems.length,
          itemBuilder: (context, index) {
            final item = widget.selectedItems[index];
            return Card(
              color: Colors.white, // Menjamin Card ini putih
              margin: EdgeInsets.only(bottom: 12.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              elevation: 1,
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Row(
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://placehold.co/60x60/E0E0E0/000000?text=Prop',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.namaRumah ?? 'Tanpa Nama',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Rp ${formatWithDot(item.harga)}',
                            style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            '${item.kelurahan}, ${item.kabupaten}',
                            style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPaymentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rincian Pembayaran',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        _buildDetailRow('Subtotal', 'Rp ${formatWithDot(subtotal)}'),
        _buildDetailRow('Diskon', '- Rp ${formatWithDot(_discount)}', color: Colors.red),
        Divider(thickness: 1, height: 20.h),
        _buildDetailRow(
          'Total Pembayaran',
          'Rp ${formatWithDot(total)}',
          isTotal: true,
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? color, bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16.sp : 14.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey.shade700,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 16.sp : 14.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: color ?? (isTotal ? Colors.orange : Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pilih Metode Pembayaran',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        _buildPaymentMethodTile('Credit Card', Icons.credit_card),
        _buildPaymentMethodTile('Bank Transfer', Icons.account_balance),
        _buildPaymentMethodTile('E-Wallet', Icons.wallet_outlined),
        // Menampilkan metode pembayaran spesifik yang dipilih jika ada
        if (_selectedSubPaymentMethod != null && (_selectedPaymentMethod == 'E-Wallet' || _selectedPaymentMethod == 'Bank Transfer'))
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 8.h),
            child: Text(
              'Metode Terpilih: $_selectedSubPaymentMethod',
              style: TextStyle(fontSize: 13.sp, color: Colors.orange),
            ),
          ),
      ],
    );
  }

  Widget _buildPaymentMethodTile(String title, IconData icon) {
    bool isMainSelected = _selectedPaymentMethod == title;
    bool hasSubOptions = (title == 'E-Wallet' || title == 'Bank Transfer');
    String displayTitle = title;

    if (hasSubOptions && _selectedPaymentMethod == title && _selectedSubPaymentMethod != null) {
      displayTitle = '$title - $_selectedSubPaymentMethod'; // Tampilkan sub-pilihan jika sudah dipilih
    }

    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 8.h),
      elevation: isMainSelected ? 2 : 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: isMainSelected
            ? BorderSide(color: Colors.orange, width: 2)
            : BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      child: ListTile(
        leading: Icon(icon, color: isMainSelected ? Colors.orange : Colors.grey.shade700),
        title: Text(displayTitle, style: TextStyle(fontSize: 14.sp)),
        trailing: hasSubOptions
            ? Icon(Icons.arrow_forward_ios, color: Colors.grey.shade600, size: 16.w) // Panah jika ada sub-opsi
            : (isMainSelected ? Icon(Icons.check_circle, color: Colors.orange) : null), // Checkmark jika tidak ada sub-opsi dan terpilih
        onTap: () {
          setState(() {
            _selectedPaymentMethod = title;
            // Reset sub-metode jika metode utama berubah, kecuali jika ini adalah sub-metode yang sedang dipilih
            if (!hasSubOptions) {
              _selectedSubPaymentMethod = null;
            }
          });

          if (title == 'E-Wallet') {
            _showEWalletSelectionSheet(context);
          } else if (title == 'Bank Transfer') {
            _showBankTransferSelectionSheet(context);
          } else {
            setState(() {
              _selectedSubPaymentMethod = null;
            });
          }
        },
      ),
    );
  }

  void _showEWalletSelectionSheet(BuildContext context) {
    // Hitung tinggi setengah layar
    final double screenHeight = MediaQuery.of(context).size.height;
    final double desiredHeight = screenHeight * 0.5; // Setengah dari tinggi layar

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return SizedBox( // Menggunakan SizedBox untuk mengatur tinggi
          height: desiredHeight, // Tinggi yang diinginkan (setengah layar)
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 20.h,
              left: 16.w,
              right: 16.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Penting agar Column tidak mengambil semua ruang jika konten kecil
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
                Text(
                  'Pilih E-Wallet',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.h),
                Expanded( // Expanded agar ListView mengambil sisa ruang dan bisa discroll
                  child: ListView.builder(
                    itemCount: eWallets.length,
                    itemBuilder: (context, index) {
                      final eWallet = eWallets[index];
                      return _buildSubOptionTileWithIcon(eWallet, Icons.account_balance_wallet);
                    },
                  ),
                ),
                // Tidak perlu SizedBox(height: 20.h) di akhir jika Expanded digunakan
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBankTransferSelectionSheet(BuildContext context) {
    // Hitung tinggi setengah layar
    final double screenHeight = MediaQuery.of(context).size.height;
    final double desiredHeight = screenHeight * 0.5; // Setengah dari tinggi layar

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return SizedBox( // Menggunakan SizedBox untuk mengatur tinggi
          height: desiredHeight, // Tinggi yang diinginkan (setengah layar)
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 20.h,
              left: 16.w,
              right: 16.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Penting agar Column tidak mengambil semua ruang jika konten kecil
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
                Text(
                  'Pilih Bank Transfer',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.h),
                Expanded( // Expanded agar ListView mengambil sisa ruang dan bisa discroll
                  child: ListView.builder(
                    itemCount: bankTransfers.length,
                    itemBuilder: (context, index) {
                      final bank = bankTransfers[index];
                      return _buildSubOptionTileWithIcon(bank, Icons.account_balance);
                    },
                  ),
                ),
                // Tidak perlu SizedBox(height: 20.h) di akhir jika Expanded digunakan
              ],
            ),
          ),
        );
      },
    );
  }

  // Mengubah nama fungsi ini agar lebih jelas bahwa ini menggunakan ikon
  Widget _buildSubOptionTileWithIcon(String option, IconData icon) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 15.r,
            backgroundColor: Colors.grey.shade200, // Warna latar belakang untuk lingkaran ikon
            child: Icon(icon, color: Colors.black54, size: 18.w), // Menggunakan ikon generik
          ),
          title: Text(option, style: TextStyle(fontSize: 14.sp)),
          trailing: _selectedSubPaymentMethod == option
              ? Icon(Icons.check_circle, color: Colors.orange)
              : null,
          onTap: () {
            setState(() {
              _selectedSubPaymentMethod = option;
            });
            Navigator.pop(context); // Tutup bottom sheet setelah memilih
          },
        ),
        Divider(height: 1.h, indent: 16.w, endIndent: 16.w), // Divider antar pilihan
      ],
    );
  }

  Widget _buildTotalAndPayButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white, // Menjamin container ini putih
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              Text(
                'Rp ${formatWithDot(total)}',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: _handlePayment,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(double.infinity, 48.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            ),
            child: Text(
              'Bayar Sekarang',
              style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.check_circle_outline, color: Colors.green, size: 80.w),
        SizedBox(height: 20.h),
        Text('Pembayaran Berhasil!', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        Text(
          'Terima kasih telah membeli properti. Detail transaksi akan dikirimkan ke email Anda.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
        ),
        SizedBox(height: 20.h),
        Text(
          'Total Pembayaran: Rp ${formatWithDot(total)}',
          style: TextStyle(fontSize: 16.sp, color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30.h),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            minimumSize: Size(180.w, 45.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          ),
          child: const Text('Kembali ke Keranjang', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}