import 'package:flutter/material.dart';
import 'package:pajak_yaomink/npwp_page.dart';
import 'package:pajak_yaomink/kurs.page.dart';
import 'package:pajak_yaomink/yao_sp.dart';

import 'widgets/chat_popout.dart';

class PajakHomePage extends StatelessWidget {
  const PajakHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/pajakblue.png',
          height: 60,
          fit: BoxFit.cover,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SplashScreen()));
            },
            icon: Icon(
              Icons.logout,
              color: Colors.orange[400],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 60),
            _buildMenuGrid(context),
            _buildRewardsButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        Image.asset(
          'assets/images/banner.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const SizedBox(height: 24),

        // Balance card
        Positioned(
          bottom: -50,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  color: Color(0xFF1A1B4B),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp 1.000.000',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '500.000 points',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.qr_code_scanner_rounded,
                            color: Color(0xFF0C0060)),
                        Text('Pay', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 24),
                    Column(
                      children: [
                        Icon(Icons.add_box_outlined, color: Color(0xFF0C0060)),
                        Text('Top Up', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],

      // Main text content
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': Icons.chat_bubble_outline,
        'label': 'Chat Konsultasi',
        'action': () => _showChatDialog(context)
      },
      {
        'icon': Icons.phone_outlined,
        'label': 'Telp Konsultasi',
        'action': () => _showTelpDialog(context)
      },
      {
        'icon': Icons.calendar_today_outlined,
        'label': 'Janji Konsultasi',
        'action': () {}
      },
      {
        'icon': Icons.document_scanner_outlined,
        'label': 'NPWP',
        'action': () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NPWPPage(),
              ),
            ),
      },
      {
        'icon': Icons.book_outlined,
        'label': 'Peraturan Terbaru',
        'action': () {}
      },
      {
        'icon': Icons.school_outlined,
        'label': 'Kurs Pajak',
        'action': () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const KursPajakPage(),
              ),
            ),
      },
      {
        'icon': Icons.calculate_outlined,
        'label': 'Kalkulator Pajak',
        'action': () {}
      },
      {'icon': Icons.grid_view, 'label': 'More', 'action': () {}},
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: menuItems[index]['action'],
            child: Column(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Stack(
                    fit: StackFit.loose,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 53,
                          height: 53,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1B4B),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        left: -10,
                        child: Icon(
                          menuItems[index]['icon'],
                          color: Colors.yellow[700],
                          size: 44,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  menuItems[index]['label'],
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showChatDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ChatKonsultasiDialog(
          title: 'Chat Konsultasi',
          description:
              'Untuk memastikan kemudahan urusan pajak Anda, pilihlah sesuai dengan keperluan anda',
          buttonText1: 'Perorangan',
          buttonText2: 'Badan Usaha',
        );
      },
    );
  }

  void _showTelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ChatKonsultasiDialog(
          title: 'Telp Konsultasi',
          description:
              'Untuk memastikan kemudahan urusan pajak Anda, pilihlah sesuai dengan keperluan anda',
          buttonText1: 'Perorangan',
          buttonText2: 'Badan Usaha',
        );
      },
    );
  }

  Widget _buildRewardsButton() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1B4B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Swipe Here to get Daily Rewards',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Discount up to 40%',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward,
              size: 30,
              color: Color(0xffFFC107),
            ),
          ],
        ),
      ),
    );
  }
}
