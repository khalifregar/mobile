// lib/widgets/cart_item_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/home/widgets/cart_item.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final ValueChanged<bool?>? onCheckboxChanged;
  final ValueChanged<int>? onQuantityChanged;

  const CartItemCard({
    super.key,
    required this.item,
    this.onCheckboxChanged,
    this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: item.isSelected
            ? Border.all(color: const Color(0xFFFF6B00), width: 1.5.w)
            : Border.all(color: Colors.transparent, width: 0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Checkbox(
              value: item.isSelected,
              onChanged: onCheckboxChanged,
              activeColor: const Color(0xFFFF6B00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
          SizedBox(width: 6.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              item.imagePath,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 70.w,
                  height: 70.h,
                  color: Colors.white,
                  child: Icon(
                    Icons.broken_image,
                    size: 30.w,
                    color: Colors.grey[500],
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF6B00),
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text(
                      item.color,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 14.w,
                      color: Colors.grey[700],
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      item.inStock ? 'In Stock' : 'Out of Stock',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: item.inStock ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 18.w,
                      color: Colors.grey[600],
                    ),
                    const Spacer(),
                    _buildQuantitySelector(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: Colors.grey[300]!, width: 1.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 28.w,
            height: 28.h,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.remove, size: 16.w, color: Colors.black),
              onPressed: item.inStock && item.quantity > 0
                  ? () {
                      onQuantityChanged?.call(item.quantity - 1);
                    }
                  : null,
            ),
          ),
          Text(
            item.quantity.toString(),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 28.w,
            height: 28.h,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add, size: 16.w, color: Colors.black),
              onPressed: item.inStock
                  ? () {
                      onQuantityChanged?.call(item.quantity + 1);
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}