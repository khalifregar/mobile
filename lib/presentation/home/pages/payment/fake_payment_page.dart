import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';

class FakePaymentPage extends StatefulWidget {
  const FakePaymentPage({super.key});

  @override
  State<FakePaymentPage> createState() => _FakePaymentPageState();
}

class _FakePaymentPageState extends State<FakePaymentPage> {
  String? selectedMethod;
  bool _showCardDetails = false;

  final List<String> indonesianBanks = [
    'Bank Central Asia (BCA)',
    'Bank Rakyat Indonesia (BRI)',
    'Bank Mandiri',
    'Bank Negara Indonesia (BNI)',
    'Bank Syariah Indonesia (BSI)',
    'CIMB Niaga',
    'Bank Danamon',
    'Bank OCBC NISP',
    'Bank Permata',
    'Bank BTN',
    'PaninBank',
    'Bank Mega',
    'Bank Bukopin',
    'Bank HSBC Indonesia',
    'Bank Maybank Indonesia',
    'Standard Chartered Bank',
    'DBS Bank Indonesia',
    'Bank UOB Indonesia',
    'Bank Commonwealth',
    'Bank Sinarmas',
    'Bank Jateng',
    'Bank Jabar Banten (BJB)',
    'Bank DKI',
    'Bank Jatim',
    'Bank Sumut',
    'Bank BPD Bali',
    'Bank Kalsel',
    'Bank Sulselbar',
    'Bank Nagari',
    'Bank Papua',
    'Bank NTB Syariah',
    'Bank Aceh Syariah',
    'Bank Kalteng',
    'Bank Kalbar',
    'Bank Sultra',
  ];

  final List<String> eWalletMethods = [
    'GoPay',
    'OVO',
    'Dana',
    'LinkAja',
    'ShopeePay',
  ];

  void simulatePayment() async {}

  void _showCreditCardBottomSheet(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    List<String> filteredBanks = List.from(indonesianBanks);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext bc) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateInBottomSheet) {
              void filterBanks(String query) {
                setStateInBottomSheet(() {
                  if (query.isEmpty) {
                    filteredBanks = List.from(indonesianBanks);
                  } else {
                    filteredBanks =
                        indonesianBanks
                            .where(
                              (bank) => bank.toLowerCase().contains(
                                query.toLowerCase(),
                              ),
                            )
                            .toList();
                  }
                });
              }

              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(bc).viewInsets.bottom,
                  left: 16.w,
                  right: 16.w,
                  top: 20.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 5.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2.5.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Select transfer method',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Select your preferred transfer method to add your\nmoney into Loop account',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Card(
                      elevation: 1,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: BorderSide(color: Colors.grey[300]!, width: 1.0),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: filterBanks,
                        decoration: InputDecoration(
                          hintText: 'Search for banks',
                          prefixIcon: Icon(Icons.search, size: 20.w),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 16.w,
                          ),
                        ),
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredBanks.length,
                        itemBuilder: (context, index) {
                          final bankName = filteredBanks[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Card(
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                side: BorderSide(
                                  color: Colors.grey[300]!,
                                  width: 1.0,
                                ),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                leading: Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.account_balance,
                                      color: Colors.black,
                                      size: 24.w,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  bankName,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.w,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  Navigator.pop(bc);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showEwalletBottomSheet(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    List<String> filteredEWallets = List.from(eWalletMethods);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext bc) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateInBottomSheet) {
              void filterEWallets(String query) {
                setStateInBottomSheet(() {
                  if (query.isEmpty) {
                    filteredEWallets = List.from(eWalletMethods);
                  } else {
                    filteredEWallets =
                        eWalletMethods
                            .where(
                              (eWallet) => eWallet.toLowerCase().contains(
                                query.toLowerCase(),
                              ),
                            )
                            .toList();
                  }
                });
              }

              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(bc).viewInsets.bottom,
                  left: 16.w,
                  right: 16.w,
                  top: 20.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 5.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2.5.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Select E-wallet',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Choose your preferred e-wallet for payment',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Card(
                      elevation: 1,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: BorderSide(color: Colors.grey[300]!, width: 1.0),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: filterEWallets,
                        decoration: InputDecoration(
                          hintText: 'Search for e-wallets',
                          prefixIcon: Icon(Icons.search, size: 20.w),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 16.w,
                          ),
                        ),
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredEWallets.length,
                        itemBuilder: (context, index) {
                          final eWalletName = filteredEWallets[index];
                          IconData iconData;
                          Color iconColor;
                          Color containerColor;

                          switch (eWalletName) {
                            case 'GoPay':
                              iconData = Icons.payments;
                              iconColor = Colors.green;
                              containerColor = Colors.green[100]!;
                              break;
                            case 'OVO':
                              iconData = Icons.account_balance_wallet;
                              iconColor = Colors.purple;
                              containerColor = Colors.purple[100]!;
                              break;
                            case 'Dana':
                              iconData = Icons.money;
                              iconColor = Colors.blue;
                              containerColor = Colors.blue[100]!;
                              break;
                            case 'LinkAja':
                              iconData = Icons.mobile_friendly;
                              iconColor = Colors.red;
                              containerColor = Colors.red[100]!;
                              break;
                            case 'ShopeePay':
                              iconData = Icons.shopping_bag;
                              iconColor = Colors.orange;
                              containerColor = Colors.orange[100]!;
                              break;
                            default:
                              iconData = Icons.wallet;
                              iconColor = Colors.grey;
                              containerColor = Colors.grey[100]!;
                          }

                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Card(
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                side: BorderSide(
                                  color: Colors.grey[300]!,
                                  width: 1.0,
                                ),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                leading: Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: containerColor,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      iconData,
                                      color: iconColor,
                                      size: 24.w,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  eWalletName,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.w,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  Navigator.pop(bc);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ),
            title: Text(
              'Payment Method',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 70.h,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 16.h,
                bottom: 16.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DottedBorder(
                    color: Colors.black,
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12.r),
                    padding: EdgeInsets.all(0),
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Harga',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'RP 2.490',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            _buildDetailRow('Nama:', '[Nama Anda]'),
                            SizedBox(height: 5.h),
                            _buildDetailRow('Lokasi:', '[Lokasi Properti]'),
                            SizedBox(height: 5.h),
                            _buildDetailRow('Tipe Rumah:', '[Tipe Rumah]'),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  Text(
                    'Bayar Pake E-Wallet',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          leading: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.account_balance_wallet,
                                color: Colors.green,
                                size: 20.w,
                              ),
                            ),
                          ),
                          title: Text(
                            'E-wallet',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black87,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 16.w,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            _showEwalletBottomSheet(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Text(
                    'Bayar Pake Transfer',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          leading: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.credit_card,
                                color: Colors.purple,
                                size: 20.w,
                              ),
                            ),
                          ),
                          title: Text(
                            'Credit Card',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black87,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 16.w,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            _showCreditCardBottomSheet(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Text(
                    'Your cart • 2',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        children: [
                          _buildCartItem(
                            'Essential shirt',
                            'The Essential Shirt is an cosy and elegant everyday button-up tailored through the shoulders and sleeves and relaxed through the body.',
                            'RP 75.00',
                            '1 in basket',
                            'https://placehold.co/100x100/A0A0A0/FFFFFF?text=Shirt',
                          ),
                          Divider(
                            height: 30.h,
                            thickness: 1,
                            color: Colors.grey[200],
                          ),
                          _buildCartItem(
                            'Ribbed Pencil Skirt',
                            'A refined slimming staple crafted from our heavyweight stretch rib. Easily dressed up or down for work to the weekend. its tone-on-tone',
                            'RP 68.00',
                            '1 in basket',
                            'https://placehold.co/100x100/A0A0A0/FFFFFF?text=Skirt',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 10.h,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1E8C31),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            minimumSize: Size(double.infinity, 30.h),
            padding: EdgeInsets.symmetric(vertical: 0.h),
          ),
          child: Text(
            'Tambah',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 14.sp, color: Colors.black87)),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem(
    String title,
    String description,
    String price,
    String quantity,
    String imageUrl,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.network(
            imageUrl,
            width: 80.w,
            height: 80.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 80.w,
                height: 80.h,
                color: Colors.grey[300],
                child: Icon(
                  Icons.image_not_supported,
                  size: 40.w,
                  color: Colors.grey[600],
                ),
              );
            },
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                description,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    quantity,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
