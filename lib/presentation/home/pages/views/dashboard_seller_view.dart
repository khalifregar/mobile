import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/auth/pages/profiles/profile_page.dart';
import 'package:propedia/presentation/home/pages/chats/chat_pages.dart';
import 'package:propedia/presentation/home/pages/logic/dashboard_logic.dart';
import 'package:propedia/presentation/home/pages/seller/property_list.dart';
import 'package:propedia/presentation/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:propedia/presentation/home/widgets/menu_section.dart';
import 'package:propedia/presentation/home/pages/seller/post.dart';
import 'package:propedia/presentation/home/widgets/penjual/discover_new.dart';
import 'package:propedia/presentation/home/widgets/penjual/post_card.dart';
import 'package:propedia/presentation/home/widgets/penjual/post_feeds.dart';
import 'package:propedia/presentation/home/widgets/snack_item_shimmer.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DashboardPenjualView extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userRole;
  final DashboardLogic dashboardLogic;

  const DashboardPenjualView({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userRole,
    required this.dashboardLogic,
  });

  @override
  State<DashboardPenjualView> createState() => _DashboardPenjualViewState();
}

class _DashboardPenjualViewState extends State<DashboardPenjualView> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  bool _isRefreshingData = false;

  Future<void> _handleRefresh() async {
    debugPrint('Refreshing data (DashboardPenjualView)...');

    setState(() {
      _isRefreshingData = true;
    });

    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() {
      _isRefreshingData = false;
    });
    debugPrint('Refresh complete (DashboardPenjualView)!');
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomePageContent(context),
      const Center(child: Text('Activity Page Content')),
      const Center(child: Text('Payment Page Content')),
      const ChatPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[widget.dashboardLogic.selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: widget.dashboardLogic.selectedIndex,
        onItemTapped: widget.dashboardLogic.onItemTapped,
      ),
    );
  }

  Widget _buildHomePageContent(BuildContext context) {
    final String defaultProfileImageUrl =
        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';

    bool showShimmer =
        _isRefreshingData || widget.dashboardLogic.isLoadingHomePage;

    return SafeArea(
      child: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        // UBAH WARNA REFRESH SESUAI PERMINTAAN: 4DA8DA
        color: const Color(0xFF4DA8DA), // Warna liquid indicator diubah menjadi 4DA8DA
        backgroundColor: Colors.white,
        height: 100,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ProfilePage(
                                      userName: widget.userName,
                                      userEmail: widget.userEmail,
                                      userRole: widget.userRole,
                                    ),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 25.w,
                            backgroundImage: NetworkImage(
                              defaultProfileImageUrl,
                            ),
                            onBackgroundImageError: (exception, stackTrace) {
                              debugPrint(
                                'Error loading profile image: $exception',
                              );
                            },
                            child:
                                defaultProfileImageUrl.isEmpty
                                    ? Icon(
                                        Icons.person,
                                        size: 25.w,
                                        color: Colors.white,
                                      )
                                    : null,
                            backgroundColor:
                                defaultProfileImageUrl.isEmpty
                                    ? Colors.grey[300]
                                    : null,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.dashboardLogic.getGreeting(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(
                              widget.userName,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        size: 28.w,
                        color: Colors.grey[700],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 10.h),
              showShimmer
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: const MenuSectionShimmer(),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: MenuSection(
                        allMenuItems: widget.dashboardLogic.allMenuItems,
                        onItemTap: (index) {
                          widget.dashboardLogic.onMenuItemTapped(context, index);
                        },
                      ),
                    ),
              SizedBox(height: 10.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PropertyListPage(),
                            ),
                          );
                        },
                        child: _buildActionButton(
                          Icons.add_box_outlined,
                          'Buat Postingan\nBaru',
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DiscoverNewPage(),
                            ),
                          );
                        },
                        child: _buildActionButton(
                          Icons.lightbulb_outline,
                          'Discover\nNew Deals!',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),

              showShimmer
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: const SnackItemShimmer(),
                          ),
                        ),
                      ),
                    )
                  : const PostCardFeeds(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 30.w, color: const Color(0xFFFF6B00)),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
