import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatefulWidget {
  final String imagePath;
  final String label;
  final VoidCallback? onTap;
  final double size;
  final double labelBottom;

  const CategoryItem({
    super.key,
    required this.imagePath,
    required this.label,
    this.onTap,
    this.size = 80,
    this.labelBottom = 22,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> with SingleTickerProviderStateMixin {
  Offset _dragOffset = Offset.zero;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    _controller.addListener(() {
      setState(() {
        _dragOffset = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runSpringAnimation() {
    _animation = Tween<Offset>(
      begin: _dragOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onPanUpdate: (details) {
        setState(() {
          _dragOffset += details.delta;
        });
      },
      onPanEnd: (details) {
        _runSpringAnimation();
      },
      child: Transform.translate(
        offset: _dragOffset,
        child: SizedBox(
          width: widget.size + 25,
          height: widget.size + 40,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Outer Yellow Halo (Layer 1)
              SvgPicture.asset(
                'assets/svgs/ongoing_animation_background_yellow.svg',
                width: widget.size + 20,
                height: widget.size + 20,
                fit: BoxFit.contain,
              ),
              // White Inner Shape with Border (Layer 2)
              Positioned(
                top: 10,
                child: SvgPicture.asset(
                  'assets/svgs/orders_ongoing_animation_background.svg',
                  width: widget.size,
                  height: widget.size,
                  fit: BoxFit.contain,
                ),
              ),
              // Icon
              Positioned(
                top: widget.size * 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    widget.imagePath,
                    width: widget.size * 0.55,
                    height: widget.size * 0.55,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.fastfood,
                        size: widget.size * 0.4,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
              ),
              // Floating Label Capsule
              Positioned(
                bottom: widget.labelBottom,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  constraints: BoxConstraints(maxWidth: widget.size + 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFEF9F09),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    widget.label,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'GlovoMedium',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
