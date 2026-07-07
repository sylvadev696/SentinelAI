import 'package:flutter/material.dart';

class SecurityGauge extends StatefulWidget {
  final double score;

  const SecurityGauge({
    super.key,
    required this.score,
  });

  @override
  State<SecurityGauge> createState() => _SecurityGaugeState();
}

class _SecurityGaugeState extends State<SecurityGauge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.score,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get gaugeColor {
    if (widget.score >= 90) return Colors.green;
    if (widget.score >= 70) return Colors.orange;
    return Colors.red;
  }

  String get status {
    if (widget.score >= 90) return "Excellent";
    if (widget.score >= 70) return "Warning";
    return "Critical";
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Column(
          children: [
            SizedBox(
              width: 190,
              height: 190,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 170,
                    height: 170,
                    child: CircularProgressIndicator(
                      value: _animation.value / 100,
                      strokeWidth: 12,
                      backgroundColor: Colors.grey.shade300,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(gaugeColor),
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shield,
                        size: 40,
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "${_animation.value.toInt()}%",
                        style: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        status,
                        style: TextStyle(
                          color: gaugeColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}