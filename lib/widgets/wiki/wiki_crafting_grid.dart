import 'package:flutter/material.dart';
import '../../screens/wiki_detail_screen.dart';
import '../../theme/app_theme.dart';

class WikiCraftingGrid extends StatelessWidget {
  final WikiCraftingRecipe recipe;
  const WikiCraftingGrid({super.key, required this.recipe});

  static const _cellSize = 46.0;
  static const _gap = 3.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF141C24),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _row(['A1', 'B1', 'C1']),
              const SizedBox(height: _gap),
              _row(['A2', 'B2', 'C2']),
              const SizedBox(height: _gap),
              _row(['A3', 'B3', 'C3']),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: AppTheme.textMuted,
              size: 20,
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              _cell(recipe.output),
              if (recipe.outputCount > 1)
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: Text(
                    '${recipe.outputCount}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(List<String> positions) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (int i = 0; i < positions.length; i++) ...[
        if (i > 0) const SizedBox(width: _gap),
        _cell(recipe.grid[positions[i]]),
      ],
    ],
  );

  Widget _cell(String? item) {
    return Container(
      width: _cellSize,
      height: _cellSize,
      decoration: BoxDecoration(
        color: const Color(0xFF2D3A4A),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF1A2530), width: 1.5),
      ),
      child: item != null && item.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(4),
              child: Image.network(
                'https://minecraft.wiki/images/Invicon_${item.replaceAll(' ', '_')}.png',
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      item.length > 12 ? '${item.substring(0, 11)}…' : item,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 7.5,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
