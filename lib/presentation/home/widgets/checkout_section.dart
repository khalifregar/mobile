// lib/widgets/checkout_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/home/widgets/cart_item.dart';

class CheckoutSection extends StatelessWidget {
  final List<CartItem> cartItems;
  final VoidCallback onBuyNowPressed;

  const CheckoutSection({
    super.key,
    required this.cartItems,
    required this.onBuyNowPressed,
  });

  double _calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in cartItems) {
      if (item.isSelected && item.inStock) {
        totalPrice += item.price * item.quantity;
      }
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = _calculateTotalPrice();

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.discount_outlined, color: Colors.orange, size: 20.w),
              SizedBox(width: 6.w),
              Text(
                'Voucher',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                'Use Code',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12.w,
                color: Colors.grey[600],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 120.w,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: onBuyNowPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}