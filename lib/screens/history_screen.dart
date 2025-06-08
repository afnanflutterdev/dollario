import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/conversion_history.dart';
import '../services/history_service.dart';
import '../widgets/responsive_layout.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryService? _historyService;
  List<ConversionHistory> _history = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _historyService = HistoryService(prefs);
      });
      _loadHistory();
    });
  }

  Future<void> _loadHistory() async {
    if (_historyService == null) return;
    setState(() => _isLoading = true);
    try {
      final history = await _historyService!.getHistory();
      setState(() {
        _history = history;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading history: $e', style: GoogleFonts.inter())),
        );
      }
    }
  }

  Future<void> _deleteHistory(ConversionHistory item) async {
    if (_historyService == null) return;
    try {
      await _historyService!.deleteFromHistory(item.id);
      await _loadHistory();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('History item deleted', style: GoogleFonts.inter())),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting history: $e', style: GoogleFonts.inter())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF0A0A0A),
            const Color(0xFF1A1A1A),
            const Color(0xFF2A2A2A).withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
            ).createShader(bounds),
            child: Text(
              'Conversion History',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            if (_history.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.delete_sweep, color: Colors.white),
                onPressed: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: const Color(0xFF1A1A1A),
                      title: Text('Clear History', style: GoogleFonts.inter(color: Colors.white)),
                      content: Text('Are you sure you want to delete all history items?', style: GoogleFonts.inter(color: Colors.white70)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text('Cancel', style: GoogleFonts.inter(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text('Delete', style: GoogleFonts.inter(color: const Color(0xFFFF6B6B))),
                        ),
                      ],
                    ),
                  );
                  if (confirmed == true && _historyService != null) {
                    try {
                      await _historyService!.clearHistory();
                      await _loadHistory();
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('History cleared', style: GoogleFonts.inter())),
                        );
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error clearing history: $e', style: GoogleFonts.inter())),
                        );
                      }
                    }
                  }
                },
              ),
          ],
        ),
        body: ResponsiveLayout(
          mobile: _buildContent(),
          tablet: Center(
            child: SizedBox(
              width: 600,
              child: _buildContent(),
            ),
          ),
          desktop: Center(
            child: SizedBox(
              width: 800,
              child: _buildContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_history.isEmpty) {
      return Center(
        child: Text(
          'No conversion history yet',
          style: GoogleFonts.inter(color: Colors.white70, fontSize: 18),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: _history.length,
      itemBuilder: (context, index) {
        final item = _history[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(20),
            title: Text(
              '${item.result.originalAmount} USD to ${item.result.currencyPair.to.code}',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.account_balance_wallet_rounded, color: Color(0xFF00D4FF), size: 18),
                    const SizedBox(width: 8),
                    Text('Platform: ', style: GoogleFonts.inter(color: Colors.white70)),
                    Text(item.result.platform.platform, style: GoogleFonts.inter(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded, color: Color(0xFF6C5CE7), size: 18),
                    const SizedBox(width: 8),
                    Text('Date: ', style: GoogleFonts.inter(color: Colors.white70)),
                    Text(item.timestamp.toString(), style: GoogleFonts.inter(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.savings_rounded, color: Color(0xFF44A08D), size: 18),
                    const SizedBox(width: 8),
                    Text('Net Amount: ', style: GoogleFonts.inter(color: Colors.white70)),
                    Text('${item.result.netAmount} ${item.result.currencyPair.to.code}', style: GoogleFonts.inter(color: Colors.white)),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Color(0xFFFF6B6B)),
              onPressed: () => _deleteHistory(item),
              tooltip: 'Delete',
            ),
          ),
        );
      },
    );
  }
} 