import 'dart:async';
import 'package:flutter/material.dart';
import 'package:propedia/presentation/home/pages/content/content_page.dart';

class DashboardLogic {
  final VoidCallback onUpdate;
  final Function(Widget page) onNavigate;

  DashboardLogic({required this.onUpdate, required this.onNavigate});

  int _selectedIndex = 0;
  bool _isLoadingHomePage = true;

  late DateTime _currentFlashSaleEndTime;
  final Duration _flashSaleDuration = const Duration(seconds: 15);
  final Duration _interFlashSaleDelay = const Duration(minutes: 1);

  Duration _countdownRemaining = Duration.zero;
  String _flashSaleStatusText = '';
  Timer? _countdownTimer;

  final List<String> bannerImages = [
    'assets/images/onboarding_1.jpeg',
    'assets/images/onboarding_1.jpeg',
    'assets/images/onboarding_1.jpeg',
  ];

  // 👉 Ini dibuat public
  final List<Map<String, dynamic>> dummyHousesData = [
    {
      'imageUrl': 'assets/images/house_1.jpg',
      'title': 'Rumah Minimalis Modern',
      'description':
          'Rumah nyaman di pusat kota Bandung dengan 3 kamar tidur, 2 kamar mandi, dan taman pribadi.',
      'tipeRumah': 'rumah',
      'harga': 1500000000.0,
      'lokasi': 'Bandung, Jawa Barat',
    },
    {
      'imageUrl': 'assets/images/house_2.jpg',
      'title': 'Apartemen Mewah Pusat Kota',
      'description':
          'Apartemen studio modern dengan pemandangan kota Jakarta yang menakjubkan.',
      'tipeRumah': 'apartemen',
      'harga': 2200000000.0,
      'lokasi': 'Jakarta, DKI Jakarta',
    },
    {
      'imageUrl': 'assets/images/house_3.jpg',
      'title': 'Villa dengan Pemandangan Danau',
      'description':
          'Villa dua lantai yang luas dengan kolam renang pribadi dan pemandangan langsung ke danau.',
      'tipeRumah': 'villa',
      'harga': 3800000000.0,
      'lokasi': 'Bogor, Jawa Barat',
    },
  ];

  final List<Map<String, dynamic>> allMenuItems = [
    {
      'icon': Icons.home_outlined,
      'title': 'Rumah',
      'iconColor': Colors.blue,
      'backgroundColor': Colors.blue.shade50,
      'type': 'house',
    },
    {
      'icon': Icons.landscape_outlined,
      'title': 'Tanah',
      'iconColor': Colors.green,
      'backgroundColor': Colors.green.shade50,
      'type': 'land',
    },
    {
      'icon': Icons.restaurant_menu_outlined,
      'title': 'Kuliner',
      'iconColor': Colors.orange,
      'backgroundColor': Colors.orange.shade50,
      'type': 'culinary',
    },
    {
      'icon': Icons.delivery_dining_outlined,
      'title': 'Pengiriman',
      'iconColor': Colors.red,
      'backgroundColor': Colors.red.shade50,
      'type': 'delivery',
    },
    {
      'icon': Icons.category_outlined,
      'title': 'Lainnya',
      'iconColor': Colors.purple,
      'backgroundColor': Colors.purple.shade50,
      'type': 'other',
    },
  ];

  int get selectedIndex => _selectedIndex;
  bool get isLoadingHomePage => _isLoadingHomePage;

  void init() {
    _loadHomePageContent();
    _startFlashSaleCycle();
  }

  void dispose() {
    _countdownTimer?.cancel();
  }

  void _loadHomePageContent() {
    _isLoadingHomePage = true;
    onUpdate();
    Future.delayed(const Duration(seconds: 2), () {
      _isLoadingHomePage = false;
      onUpdate();
    });
  }

  void _startFlashSaleCycle() {
    _currentFlashSaleEndTime = DateTime.now().add(_flashSaleDuration);

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();

      if (_currentFlashSaleEndTime.isAfter(now)) {
        _countdownRemaining = _currentFlashSaleEndTime.difference(now);
        _flashSaleStatusText = 'Dimulai';
      } else {
        if (_flashSaleStatusText == 'Dimulai') {
          _countdownRemaining = Duration.zero;
          _flashSaleStatusText = 'Berakhir';
          _currentFlashSaleEndTime = now.add(_interFlashSaleDelay);
        } else {
          if (_currentFlashSaleEndTime.isAfter(now)) {
            _countdownRemaining = _currentFlashSaleEndTime.difference(now);
            _flashSaleStatusText = 'Bersiap';
          } else {
            _currentFlashSaleEndTime = now.add(_flashSaleDuration);
            _flashSaleStatusText = 'Dimulai';
            _countdownRemaining = _flashSaleDuration;
          }
        }
      }
      onUpdate();
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning!';
    } else if (hour < 18) {
      return 'Good Afternoon!';
    } else {
      return 'Good Evening!';
    }
  }

  void navigateToFilterPage() {
    debugPrint('Navigating to Filter Page');
  }

  void onMenuItemTapped(BuildContext context, int index) {
    onUpdate();
  }

  void onItemTapped(int index) {
    _selectedIndex = index;
    if (index == 0) {
      _loadHomePageContent();
    }
    onUpdate();
  }

  Color getCountdownBackgroundColor() {
    if (_flashSaleStatusText == 'Berakhir') {
      return Colors.grey.shade600;
    } else if (_flashSaleStatusText == 'Bersiap') {
      return Colors.blue.shade600;
    } else {
      return Colors.red.shade700;
    }
  }

  String getCountdownDisplayText() {
    if (_flashSaleStatusText == 'Berakhir') {
      return 'Berakhir';
    } else {
      return 'Dimulai ${formatDuration(_countdownRemaining)}';
    }
  }

  Color getCountdownTextColor() => Colors.white;
}
