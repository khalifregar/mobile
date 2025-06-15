import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/models/dtos/stores/properties_dto.dart';
import 'package:propedia/presentation/home/cubit/property_cubit.dart';
import 'package:propedia/presentation/home/cubit/property_state.dart';
import 'package:propedia/presentation/home/pages/payment/payment_gateway.dart';
import 'package:shimmer/shimmer.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<PropertyDto> selectedItems = [];

  @override
  void initState() {
    super.initState();
    context.read<PropertyCubit>().fetchAllProperties('pembeli');
  }

  void toggleItem(PropertyDto item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  String formatWithDot(int? number) {
    if (number == null) return '0';
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTotal = selectedItems.fold<int>(
      0,
      (sum, item) => sum + (item.harga ?? 0),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18.w),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack( // Menggunakan Stack untuk menumpuk konten dan fixed bottom bar
        children: [
          BlocBuilder<PropertyCubit, PropertyState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(bottom: 120.h), // Memberi padding bawah agar tidak tertutup bottom bar
                child: state.when(
                  initial: () => const Center(child: Text("Belum ada data")),
                  loading:
                      () => ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 12.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(12.w),
                                  title: Container(
                                    width: 100.w,
                                    height: 12.h,
                                    color: Colors.white,
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8.h),
                                      Container(
                                        width: 150.w,
                                        height: 12.h,
                                        color: Colors.white,
                                      ),
                                      SizedBox(height: 6.h),
                                      Container(
                                        width: 100.w,
                                        height: 12.h,
                                        color: Colors.white,
                                      ),
                                      SizedBox(height: 6.h),
                                      Container(
                                        width: double.infinity,
                                        height: 12.h,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                  success: (properties) {
                    if (properties.isEmpty) {
                      return const Center(child: Text("Keranjang kosong"));
                    }
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      itemCount: properties.length,
                      itemBuilder: (context, index) {
                        final item = properties[index];
                        final isSelected = selectedItems.contains(item);
                        return GestureDetector(
                          onTap: () => toggleItem(item),
                          child: Card(
                            color: Colors.white,
                            margin: EdgeInsets.only(bottom: 12.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                            elevation: 2,
                            child: Padding(
                              padding: EdgeInsets.all(12.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                      value: isSelected,
                                      onChanged: (bool? newValue) {
                                        toggleItem(item);
                                      },
                                      activeColor: Colors.orange,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Container(
                                    width: 70.w,
                                    height: 70.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8.r),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://placehold.co/70x70/E0E0E0/000000?text=Prop',
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
                                        Text(item.namaRumah ?? 'Tanpa Nama', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp)),
                                        SizedBox(height: 2.h),
                                        Text('Rp ${formatWithDot(item.harga)}', style: TextStyle(fontSize: 13.sp)),
                                        SizedBox(height: 2.h),
                                        Row(
                                          children: [
                                            Text('${item.tipeRumah ?? "-"}', style: TextStyle(color: Colors.grey.shade600, fontSize: 11.sp)),
                                            SizedBox(width: 8.w),
                                          ],
                                        ),
                                        SizedBox(height: 2.h),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_outlined, size: 12.sp, color: Colors.grey),
                                            SizedBox(width: 2.w),
                                            Expanded(
                                              child: Text(
                                                '${item.kelurahan}, ${item.kecamatan}, ${item.kabupaten}, ${item.provinsi}',
                                                style: TextStyle(fontSize: 10.5.sp, color: Colors.grey.shade600),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8.h),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  error: (msg) => Center(child: Text("❌ $msg")),
                  detail: (_) => const SizedBox(),
                  created: (_) => const SizedBox(),
                  updated: () => const SizedBox(),
                  deleted: () => const SizedBox(),
                ),
              );
            },
          ),
          // Bagian fixed di bawah layar untuk Voucher, Price, dan Buy Now
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h, bottom: 20.h), // Sesuaikan padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, -3), // Shadows upwards
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Penting agar Column tidak mengambil semua tinggi
                children: [
                  // Bagian Voucher
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.discount_outlined, color: Colors.orange, size: 20.w),
                          SizedBox(width: 8.w),
                          Text(
                            'Voucher',
                            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Fitur 'Use Code' belum diimplementasikan.")),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'Use Code',
                              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey.shade600, size: 14.w),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h), // Spasi antara Voucher dan Price/Buy Now

                  // Bagian Price dan Tombol Beli Sekarang
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price', style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600)),
                          Text(
                            'Rp ${formatWithDot(currentTotal)}',
                            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          // Jika ada harga asli dicoret:
                          // Text(
                          //   'Rp ${formatWithDot(320000000)}', // Contoh harga asli
                          //   style: TextStyle(
                          //     fontSize: 14.sp,
                          //     color: Colors.grey,
                          //     decoration: TextDecoration.lineThrough,
                          //   ),
                          // ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: selectedItems.isEmpty
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentGateway(
                                      selectedItems: selectedItems,
                                    ),
                                  ),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(130.w, 45.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.r),
                          ),
                        ),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}