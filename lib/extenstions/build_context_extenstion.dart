import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension ContextExtenstion on BuildContext {
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
  AppLocalizations? get locals => AppLocalizations.of(this);
}
