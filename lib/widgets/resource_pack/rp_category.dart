import '../../l10n/app_localizations.dart';

String rpCategoryLabel(AppLocalizations l, String key) => switch (key) {
  'realism' => l.rpCategoryRealism,
  'faithful' => l.rpCategoryFaithful,
  'pvp' => l.rpCategoryPvp,
  'cartoon' => l.rpCategoryCartoon,
  'dark' => l.rpCategoryDark,
  'medieval' => l.rpCategoryMedieval,
  'nature' => l.rpCategoryNature,
  'themed' => l.rpCategoryThemed,
  'other' => l.rpCategoryOther,
  _ => key.isEmpty ? key : key[0].toUpperCase() + key.substring(1),
};
