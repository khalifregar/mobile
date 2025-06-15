import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HouseCard extends StatelessWidget {
  final String title;
  final String price;
  final String location;
  final VoidCallback? onTap;

  const HouseCard({
    Key? key,
    required this.title,
    required this.price,
    required this.location,
    this.onTap,
  }) : super(key: key);

  String _formatPrice(String price) {
    try {
      final number = int.tryParse(price.replaceAll('.', '')) ?? 0;
      return number.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => '.',
      );
    } catch (_) {
      return price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
              child: Image.asset(
                'assets/images/onboarding_1.jpeg',
                width: double.infinity,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Rp ${_formatPrice(price)}',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xFFFF6B00),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14.w, color: Colors.grey),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[700],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
