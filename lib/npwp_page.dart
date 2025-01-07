import 'package:flutter/material.dart';
import 'package:pajak_yaomink/widgets/chat_popout.dart';

class NPWPPage extends StatelessWidget {
  const NPWPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layanan NPWP'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0C0060),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCard(
            context,
            title: 'Cek NPWP',
            description:
                'Cek Status NPWP dan status SPT wajib pajak. Khusus NPWP yang sudah terdaftar.',
            footer: '2x Pengecekan Sukses Per Hari',
            isVerified: true,
          ),
          _buildCard(
            context,
            title: 'Cek NPWP dengan NIK & KK',
            description:
                'Cek Status NPWP dan KK wajib pajak. Khusus NPWP yang sudah terdaftar.',
            footer: 'Melalui Web Direktorat Jenderal Pajak',
          ),
          _buildCard(
            context,
            title: 'Pendaftaran NPWP',
            description:
                'Pendaftaran NPWP Baru. Khusus untuk wajib pajak yang belum memiliki NPWP',
            footer: 'Melalui Web Direktorat Jenderal Pajak',
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String title,
      required String description,
      required String footer,
      bool isVerified = false}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        title: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isVerified) ...[
              const SizedBox(width: 4),
              const Icon(
                Icons.verified,
                color: Color(0xFF0C0060),
                size: 20,
              ),
            ],
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 8),
            Text(
              footer,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: isVerified ? () => _showVerifiedDialog(context) : null,
      ),
    );
  }

  void _showVerifiedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ChatKonsultasiDialog(
          title: 'Fitur Wajib Bundling',
          description:
              'Untuk memastikan kemudahan urusan pajak Anda, fitur ini diwajibkan untuk bundling dengan konsultasi pajak',
          buttonText1: 'Batal',
          buttonText2: 'Lanjutkan',
        );
      },
    );
  }
}
