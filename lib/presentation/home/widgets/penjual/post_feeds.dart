import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:propedia/presentation/home/cubit/property_cubit.dart';
import 'package:propedia/presentation/home/cubit/property_state.dart';
import 'package:propedia/presentation/home/pages/content/content_page.dart';

class PostFeed extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String provinsi;
  final String kabupaten;
  final String kecamatan;
  final String kelurahan;

  const PostFeed({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.provinsi,
    required this.kabupaten,
    required this.kecamatan,
    required this.kelurahan,
  }) : super(key: key);

  String _formatCurrency(double amount) {
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return formatCurrency.format(amount);
  }

  String _formatLocation() {
    final parts = [kelurahan, kecamatan, kabupaten, provinsi]
        .where((e) => e.isNotEmpty)
        .join(', ');
    return parts.isEmpty ? 'Lokasi tidak diketahui' : parts;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ContentPage()));
      },
      child: Container(
        width: 280.w,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(10.r)),
            SizedBox(height: 10.h),
            Text(
              title,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black87),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: Text(
                description,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              _formatCurrency(price),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFF6B00),
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 14.sp, color: Colors.grey[600]),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    _formatLocation(),
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PostCardFeeds extends StatelessWidget {
  const PostCardFeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyCubit, PropertyState>(
      builder: (context, state) {
        final properties = context.read<PropertyCubit>().userPostedProperties;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Text(
                'Postingan kamu',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(
              height: 360.h,
              child: properties.isEmpty
                  ? Center(child: Text("Belum ada data", style: TextStyle(fontSize: 14.sp)))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: properties.length,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemBuilder: (context, index) {
                        final p = properties[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: PostFeed(
                            title: p.namaRumah ?? 'Tanpa Judul',
                            description: p.deskripsi ?? 'Tidak ada deskripsi',
                            price: (p.harga ?? 0).toDouble(),
                            provinsi: p.provinsi ?? '',
                            kabupaten: p.kabupaten ?? '',
                            kecamatan: p.kecamatan ?? '',
                            kelurahan: p.kelurahan ?? '',
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
