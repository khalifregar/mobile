import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/home/pages/payment/fake_payment_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<GlobalKey> _keys = List.generate(4, (_) => GlobalKey());
  double _indicatorWidth = 0.0;
  double _indicatorLeft = 0.0;

  final double _horizontalIndicatorPadding = 15.w;
  final double _itemHeight = 24.w + (10.h * 2);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateIndicatorPosition(widget.selectedIndex);
    });
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      _updateIndicatorPosition(widget.selectedIndex);
    }
  }

  void _updateIndicatorPosition(int index) {
    if (_keys[index].currentContext != null) {
      final RenderBox renderBoxItem =
          _keys[index].currentContext!.findRenderObject() as RenderBox;
      final RenderBox? renderBoxRow = context.findRenderObject() as RenderBox?;

      if (renderBoxRow != null) {
        final Offset itemPositionInRow = renderBoxRow.globalToLocal(
          renderBoxItem.localToGlobal(Offset.zero),
        );

        setState(() {
          _indicatorWidth =
              renderBoxItem.size.width - (2 * _horizontalIndicatorPadding);
          _indicatorLeft = itemPositionInRow.dx + _horizontalIndicatorPadding;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        bottom: 20.h + MediaQuery.of(context).padding.bottom,
        top: 10.h,
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          if (_indicatorWidth > 0)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: _indicatorLeft,
              width: _indicatorWidth,
              height: _itemHeight,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFADEED9),
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              return _buildNavItem(
                context,
                key: _keys[index],
                icon: _getIconForIndex(index, false),
                selectedIcon: _getIconForIndex(index, true),
                index: index,
              );
            }),
          ),
        ],
      ),
    );
  }

  IconData _getIconForIndex(int index, bool isSelected) {
    switch (index) {
      case 0:
        return isSelected ? Icons.home : Icons.home_outlined;
      case 1:
        return isSelected ? Icons.favorite : Icons.favorite_border;
      case 2:
        return Icons.search; // Tetap sama karena tidak berubah
      case 3:
        return isSelected ? Icons.person : Icons.person_outline;
      default:
        return Icons.error;
    }
  }

  Widget _buildNavItem(
    BuildContext context, {
    required Key key,
    required IconData icon,
    required IconData selectedIcon,
    required int index,
  }) {
    final bool isSelected = index == widget.selectedIndex;

    return Expanded(
      child: InkWell(
        key: key,
        onTap: () {
          if (index == 2) {
            // Push ke halaman FakePayment langsung
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FakePaymentPage()),
            );
            return;
          }

          widget.onItemTapped(index);
          _updateIndicatorPosition(index);
        },
        customBorder: const StadiumBorder(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Icon(
              isSelected ? selectedIcon : icon,
              key: ValueKey<int>(index),
              color: isSelected ? Colors.white : Colors.black54,
              size: 24.w,
            ),
          ),
        ),
      ),
    );
  }
}
