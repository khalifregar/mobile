import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Import this package if you've added it to your pubspec.yaml
import 'package:dotted_border/dotted_border.dart'; // Diaktifkan kembali

class FakePaymentPage extends StatefulWidget {
  const FakePaymentPage({super.key});

  @override
  State<FakePaymentPage> createState() => _FakePaymentPageState();
}

class _FakePaymentPageState extends State<FakePaymentPage> {
  String? selectedMethod;
  bool _showCardDetails = false;

  // List of Indonesian Banks
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

  // List of E-wallet methods
  final List<String> eWalletMethods = [
    'GoPay',
    'OVO',
    'Dana',
    'LinkAja', // Added LinkAja as an example for Roku
    'ShopeePay',
  ];


  void simulatePayment() async {
    // Logic removed as per previous request
  }

  void _showCreditCardBottomSheet(BuildContext context) {
    // Controller for the search input
    final TextEditingController searchController = TextEditingController();
    // Filtered list of banks, initially all banks
    List<String> filteredBanks = List.from(indonesianBanks);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to take full height if needed
      backgroundColor: Colors.white, // Set bottom sheet background to white
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext bc) {
        return FractionallySizedBox( // Controls the maximum height of the bottom sheet
          heightFactor: 0.7, // Increased height factor slightly to accommodate search bar
          child: StatefulBuilder( // Use StatefulBuilder to manage state within the bottom sheet
            builder: (BuildContext context, StateSetter setStateInBottomSheet) {
              // Function to filter banks based on search query
              void filterBanks(String query) {
                setStateInBottomSheet(() {
                  if (query.isEmpty) {
                    filteredBanks = List.from(indonesianBanks);
                  } else {
                    filteredBanks = indonesianBanks
                        .where((bank) =>
                            bank.toLowerCase().contains(query.toLowerCase()))
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
                  mainAxisSize: MainAxisSize.min, // Make column only take necessary space
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
                    // Search Bar
                    Card( // Wrap TextField in Card for shadow and white background
                      elevation: 1, // Reduced shadow
                      color: Colors.white, // Set background to white
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: BorderSide(color: Colors.grey[300]!, width: 1.0), // Add a subtle border
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: filterBanks, // Call filterBanks on text change
                        decoration: InputDecoration(
                          hintText: 'Search for banks',
                          prefixIcon: Icon(Icons.search, size: 20.w),
                          border: OutlineInputBorder( // Use OutlineInputBorder for visible border
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none, // Hide default border of TextField within Card
                          ),
                          enabledBorder: OutlineInputBorder( // Define border for enabled state
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none, // Hide default border of TextField within Card
                          ),
                          focusedBorder: OutlineInputBorder( // Define border for focused state
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none, // Hide default border of TextField within Card
                          ),
                          filled: true,
                          fillColor: Colors.white, // Explicitly set fill color to white
                          contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w), // Add horizontal padding
                        ),
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(height: 20.h), // Spacing below search bar
                    // Dynamic list of Indonesian Banks
                    Expanded( // Use Expanded to allow the ListView to take available space within the FractionallySizedBox
                      child: ListView.builder(
                        itemCount: filteredBanks.length, // Use filteredBanks
                        itemBuilder: (context, index) {
                          final bankName = filteredBanks[index]; // Use filteredBanks
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h), // Spacing between bank cards
                            child: Card(
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                side: BorderSide(color: Colors.grey[300]!, width: 1.0),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                leading: Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.account_balance, color: Colors.black, size: 24.w),
                                  ),
                                ),
                                title: Text(
                                  bankName,
                                  style: TextStyle(fontSize: 16.sp, color: Colors.black87, fontWeight: FontWeight.bold),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios, size: 16.w, color: Colors.grey),
                                onTap: () {
                                  Navigator.pop(bc); // Close the bottom sheet
                                  // Handle bank selection
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.h), // Added some bottom padding for the sheet content
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
          heightFactor: 0.7, // Adjusted height factor to accommodate search bar
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateInBottomSheet) {
              void filterEWallets(String query) {
                setStateInBottomSheet(() {
                  if (query.isEmpty) {
                    filteredEWallets = List.from(eWalletMethods);
                  } else {
                    filteredEWallets = eWalletMethods
                        .where((eWallet) =>
                            eWallet.toLowerCase().contains(query.toLowerCase()))
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
                    // Search Bar for E-wallet
                    Card(
                      elevation: 1, // Reduced shadow
                      color: Colors.white, // Set background to white
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: BorderSide(color: Colors.grey[300]!, width: 1.0), // Add a subtle border
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: filterEWallets, // Call filterEWallets on text change
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
                          contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                        ),
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(height: 20.h), // Spacing below search bar
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredEWallets.length, // Use filteredEWallets
                        itemBuilder: (context, index) {
                          final eWalletName = filteredEWallets[index];
                          IconData iconData;
                          Color iconColor;
                          Color containerColor;

                          switch (eWalletName) {
                            case 'GoPay':
                              iconData = Icons.payments; // Placeholder for GoPay
                              iconColor = Colors.green;
                              containerColor = Colors.green[100]!;
                              break;
                            case 'OVO':
                              iconData = Icons.account_balance_wallet; // Placeholder for OVO
                              iconColor = Colors.purple;
                              containerColor = Colors.purple[100]!;
                              break;
                            case 'Dana':
                              iconData = Icons.money; // Placeholder for Dana
                              iconColor = Colors.blue;
                              containerColor = Colors.blue[100]!;
                              break;
                            case 'LinkAja': // Assuming Roku is replaced by LinkAja for a real-world example
                              iconData = Icons.mobile_friendly; // Placeholder for LinkAja
                              iconColor = Colors.red;
                              containerColor = Colors.red[100]!;
                              break;
                            case 'ShopeePay':
                              iconData = Icons.shopping_bag; // Placeholder for ShopeePay
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
                                side: BorderSide(color: Colors.grey[300]!, width: 1.0),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                leading: Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: containerColor,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Icon(iconData, color: iconColor, size: 24.w),
                                  ),
                                ),
                                title: Text(
                                  eWalletName,
                                  style: TextStyle(fontSize: 16.sp, color: Colors.black87, fontWeight: FontWeight.bold),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios, size: 16.w, color: Colors.grey),
                                onTap: () {
                                  Navigator.pop(bc); // Close the bottom sheet
                                  // Handle e-wallet selection
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
      backgroundColor: Colors.white, // Set Scaffold background to white
      body: CustomScrollView( // Changed to CustomScrollView
        slivers: [
          SliverAppBar(
            pinned: true, // AppBar will stay at the top
            leading: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200], // Background color for the circle
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    // Handle back button press
                  },
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
            centerTitle: true, // Center the title as per the image
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 70.h, // Adjust height if needed
          ),
          SliverToBoxAdapter( // Use SliverToBoxAdapter for content that doesn't need to be a list
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 16.h, // Initial top padding
                bottom: 16.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Total Bill Card and Property Details combined
                  // Dotted border applied here
                  // Requires 'package:dotted_border/dotted_border.dart'
                  // If not using the package, 'side' property of RoundedRectangleBorder
                  // does not support dotted lines directly.
                  DottedBorder( // Diaktifkan kembali
                    color: Colors.black,
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12.r),
                    padding: EdgeInsets.all(0),
                    child:
                    Card( // This Card no longer has the side property, DottedBorder provides it.
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        // side: const BorderSide(color: Colors.black, width: 1.0), // Dihapus karena DottedBorder menanganinya
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
                                  'RP 2.490', // Only show one price
                                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h), // Spacing between total bill and property details
                            _buildDetailRow('Nama:', '[Nama Anda]'),
                            SizedBox(height: 5.h),
                            _buildDetailRow('Lokasi:', '[Lokasi Properti]'),
                            SizedBox(height: 5.h),
                            _buildDetailRow('Tipe Rumah:', '[Tipe Rumah]'),
                          ],
                        ),
                      ),
                    ),
                  ), // Closing tag for DottedBorder

                  SizedBox(height: 20.h),

                  // Pay by UPI Section
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
                        // E-wallet (formerly GPay)
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                          leading: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Icon(Icons.account_balance_wallet, color: Colors.green, size: 20.w),
                            ),
                          ),
                          title: Text(
                            'E-wallet',
                            style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16.w, color: Colors.grey),
                          onTap: () {
                            _showEwalletBottomSheet(context); // Call the new e-wallet bottom sheet
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Pay by Card Section
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
                        // Credit Card - Opens Bottom Sheet
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                          leading: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(Icons.credit_card, color: Colors.purple, size: 20.w),
                            ),
                          ),
                          title: Text(
                            'Credit Card',
                            style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 16.w,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            _showCreditCardBottomSheet(context); // Show bottom sheet on tap
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // New UI for "Your cart" section
                  Text(
                    'Your cart • 2', // Hardcoded for now, can be dynamic later
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
                          // Item 1: Essential shirt
                          _buildCartItem(
                            'Essential shirt',
                            'The Essential Shirt is an cosy and elegant everyday button-up tailored through the shoulders and sleeves and relaxed through the body.',
                            'RP 75.00', // Changed to RP as per previous conversations
                            '1 in basket',
                            'https://placehold.co/100x100/A0A0A0/FFFFFF?text=Shirt', // Placeholder image URL
                          ),
                          Divider(height: 30.h, thickness: 1, color: Colors.grey[200]),
                          // Item 2: Ribbed Pencil Skirt
                          _buildCartItem(
                            'Ribbed Pencil Skirt',
                            'A refined slimming staple crafted from our heavyweight stretch rib. Easily dressed up or down for work to the weekend. its tone-on-tone',
                            'RP 68.00', // Changed to RP
                            '1 in basket',
                            'https://placehold.co/100x100/A0A0A0/FFFFFF?text=Skirt', // Placeholder image URL
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h), // Added spacing at the bottom of the scrollable content
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background putih untuk area tombol
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, -3), // Bayangan ke atas
            ),
          ],
        ),
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h, bottom: MediaQuery.of(context).padding.bottom + 10.h), // Adjusted top and bottom padding
        child: ElevatedButton(
          onPressed: () {
            // Handle ketika tombol "Tambah" ditekan
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1E8C31), // Warna hijau gelap seperti di gambar
            foregroundColor: Colors.white, // Warna teks putih
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r), // Sudut membulat
            ),
            minimumSize: Size(double.infinity, 30.h), // Lebar penuh, tinggi disesuaikan menjadi 30.h
            padding: EdgeInsets.symmetric(vertical: 0.h), // Reduced vertical padding inside button
          ),
          child: Text(
            'Tambah',
            style: TextStyle(
              fontSize: 16.sp, // Reduced font size slightly to fit
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build a detail row with aligned text
  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, color: Colors.black87),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 14.sp, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Helper method to build a single cart item
  Widget _buildCartItem(String title, String description, String price, String quantity, String imageUrl) {
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
                child: Icon(Icons.image_not_supported, size: 40.w, color: Colors.grey[600]),
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
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
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
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black),
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
