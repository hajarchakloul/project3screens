import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:project3screens/widgets/test.dart';

class Reportsscreen extends StatefulWidget {
  const Reportsscreen({super.key});

  @override
  State<Reportsscreen> createState() => _ReportsscreenState();
}

class _ReportsscreenState extends State<Reportsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text('Reports'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // بطاقات التقرير
            _buildReportCard(
              icon: Icons.arrow_downward,
              title: 'إجمالي الدخل',
              amount: '12,000 ر.م',
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            _buildReportCard(
              icon: Icons.arrow_upward,
              title: 'إجمالي المصاريف',
              amount: '7,500 ر.م',
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            _buildReportCard(
              icon: Icons.attach_money,
              title: 'صافي الربح',
              amount: '4,500 ر.م',
              color: Colors.blue,
            ),
            const SizedBox(height: 24),

            // رسم بياني شهري مغلف داخل بطاقة
            _buildSectionHeader('الإحصائيات الشهرية'),
            const SizedBox(height: 12),
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                height: 240,
                child: const MonthlyBarChart(),
              ),
            ),

            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // تحميل PDF
              },
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('تحميل تقرير PDF'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        currentIndex: 2,
        context: context,
      ),
      floatingActionButton: MainFloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildReportCard({
    required IconData icon,
    required String title,
    required String amount,
    required Color color,
  }) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'لشهر الحالي',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        trailing: Text(
          amount,
          style: TextStyle(
              fontSize: 18, color: color, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class MonthlyBarChart extends StatelessWidget {
  const MonthlyBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 15000,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (val, meta) {
                const months = ['ينا', 'فبر', 'مار', 'أبر', 'ماي', 'يون'];
                return Text(months[val.toInt()],
                    style: const TextStyle(fontSize: 10));
              },
              interval: 1,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: [
          makeGroupData(0, 12000, 8000),
          makeGroupData(1, 10000, 7000),
          makeGroupData(2, 13000, 9500),
          makeGroupData(3, 9000, 6000),
          makeGroupData(4, 11000, 7000),
          makeGroupData(5, 14000, 10000),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double income, double expense) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(toY: income, color: Colors.green, width: 8),
      BarChartRodData(toY: expense, color: Colors.red, width: 8),
    ]);
  }
}
